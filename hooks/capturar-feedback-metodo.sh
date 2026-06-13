#!/usr/bin/env bash
# Capturar (ambiente) — hook SessionEnd, registrado no ~/.claude/settings.json
# da máquina (ver README "Ativar o hook do Capturar"). Roda fora/depois da
# sessão, em qualquer projeto: lê a transcrição da sessão que acabou e, se um
# Claude headless achar candidatos de feedback-de-método, escreve UMA nota em
# ~/claude-system/inbox/<timestamp>-<projeto>.md. Sem candidato → não escreve
# nada (auto-filtro: o inbox só acumula sinal).
set -euo pipefail

# Anti-recursão: o `claude -p` abaixo também dispara SessionEnd ao terminar.
# A env var chega ao hook do filho por herança de ambiente e corta o loop.
[ -n "${CAPTURAR_HEADLESS:-}" ] && exit 0

repo="${CLAUDE_SYSTEM_DIR:-$HOME/claude-system}"

# Auto-teste opcional. Com CAPTURAR_DEBUG setado, o hook loga cada ponto de
# decisão (early-exits, exit code + stderr do `claude -p`, veredito) em
# hooks/capturar-debug.log — FORA do inbox, pra não virar candidato. Motivo: o
# `|| exit 0` que protege contra ruído também mascara quebra silenciosa (os dois
# giros live de 2026-06-13 deram "inbox vazio" sem distinguir auto-filtro de
# falha). Com o log, "vazio" deixa de ser ambíguo. Sem a env var, dbg() é no-op.
dbglog="$repo/hooks/capturar-debug.log"
dbg() {
  [ -n "${CAPTURAR_DEBUG:-}" ] || return 0
  printf '%s [%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$$" "$*" >>"$dbglog" 2>/dev/null || true
}
dbg "--- hook SessionEnd disparou ---"

command -v jq >/dev/null 2>&1 || { dbg "abort: jq ausente"; exit 0; }
command -v claude >/dev/null 2>&1 || { dbg "abort: claude ausente"; exit 0; }

input=$(cat)
transcript=$(jq -r '.transcript_path // empty' <<<"$input")
cwd=$(jq -r '.cwd // empty' <<<"$input")
reason=$(jq -r '.reason // empty' <<<"$input")
dbg "reason=$reason cwd=$cwd transcript=$transcript"

# resume: a mesma transcrição continua depois — capturar agora duplicaria
[ "$reason" = "resume" ] && { dbg "skip: reason=resume"; exit 0; }
{ [ -n "$transcript" ] && [ -f "$transcript" ]; } || { dbg "abort: transcript ausente/inacessível"; exit 0; }

# Sessões no próprio hub não precisam de transporte (o destilar já roda lá)
case "$cwd" in "$repo"*) dbg "skip: cwd no hub"; exit 0 ;; esac

prompt_file="$repo/hooks/capturar-prompt.md"
[ -f "$prompt_file" ] || { dbg "abort: prompt_file ausente"; exit 0; }

# Pré-filtro: extrai só a prosa de conversa (turnos user/assistant em texto) e
# descarta o ruído operacional (tool_result, thinking, tool_use, metadados).
# Motivo (giro live 2026-06-13): o transcript real é grande (centenas de KB) e
# o `Read` do headless recusa >256KB — o modelo então improvisava com Bash e
# morria no teardown da sessão antes de decidir. Filtrar aqui no shell deixa o
# material pequeno (~5% do original): o headless analisa texto inline, rápido,
# sem abrir arquivo. Uma linha JSONL malformada aborta o jq → `|| exit 0` (sem
# captura nessa sessão, consistente com o auto-filtro conservador).
conversa=$(jq -r '
  if .type=="user" then
    (.message.content as $c
     | if ($c|type)=="string" then "## USER\n" + $c
       elif ($c|type)=="array" then
         ($c | map(select(.type=="text") | .text) | select(length>0) | "## USER\n" + join("\n"))
       else empty end)
  elif .type=="assistant" then
    (.message.content | map(select(.type=="text") | .text) | select(length>0) | "## ASSISTANT\n" + join("\n"))
  else empty end
' "$transcript" 2>/dev/null) || { dbg "abort: jq falhou no transcript (JSONL malformado?)"; exit 0; }

# Sessão sem prosa de conversa → nada a analisar
[ -n "$conversa" ] || { dbg "skip: sessão sem prosa de conversa"; exit 0; }

# Prompt + conversa filtrada vão por STDIN do `claude -p` (nesta versão do CLI
# um prompt grande no argv não é lido). Materializo num arquivo temporário
# porque o trabalho roda destacado (abaixo) e precisa de uma fonte de stdin
# estável — não um pipe do processo do hook, que já vai morrer.
tmp_prompt=$(mktemp "${TMPDIR:-/tmp}/capturar-XXXXXX") || { dbg "abort: mktemp falhou"; exit 0; }
printf '%s\n\n--- CONVERSA DA SESSÃO (já filtrada) ---\n\n%s\n' \
  "$(cat "$prompt_file")" "$conversa" >"$tmp_prompt"

mkdir -p "$repo/inbox"
# timestamp+projeto no nome: um arquivo por sessão, sem race entre paralelas
out="$repo/inbox/$(date +%Y%m%d-%H%M%S)-$(basename "${cwd:-desconhecido}").md"
dbg "headless lançado (setsid) → $out"

# Destaca o headless do processo da sessão. O `claude -p` (sonnet — não economizar
# no julgamento, é o ponto frágil do desenho) leva ~40s, e o SessionEnd derruba o
# filho ao fechar a sessão (giro live 2026-06-13: runs mortos aos ~34s sem
# veredito). `setsid` o move pra um process group próprio, imune ao teardown; o
# hook retorna na hora. O worker lê o prompt do temp, apaga-o, e só escreve a
# nota se houver candidato (vazio/SEM_CANDIDATO → não escreve, auto-filtro).
# 4º arg = dbglog só em modo debug (${CAPTURAR_DEBUG:+...}): o worker registra
# o exit code + stderr do claude e qual desfecho ocorreu — é aqui que a quebra
# silenciosa morava, então é aqui que o auto-teste mais importa.
setsid bash -c '
  prompt="$1"; out="$2"; dbglog="$3"
  log() { [ -n "$dbglog" ] && printf "%s [%s] %s\n" "$(date "+%Y-%m-%d %H:%M:%S")" "$$" "$*" >>"$dbglog" 2>/dev/null || true; }
  err=$(mktemp "${TMPDIR:-/tmp}/capturar-err-XXXXXX" 2>/dev/null) || err=/dev/null
  log "worker início (claude -p sonnet)"
  nota=$(CAPTURAR_HEADLESS=1 claude -p --model sonnet --allowedTools "Read" <"$prompt" 2>"$err"); rc=$?
  rm -f "$prompt"
  if [ "$rc" -ne 0 ]; then
    log "QUEBRA: claude rc=$rc stderr=[$(tr "\n" " " <"$err" 2>/dev/null)]"
    rm -f "$err"; exit 0
  fi
  rm -f "$err"
  case "$nota" in
    "") log "auto-filtro: veredito vazio"; exit 0 ;;
    *SEM_CANDIDATO*) log "auto-filtro: SEM_CANDIDATO"; exit 0 ;;
  esac
  printf "%s\n" "$nota" >"$out"
  log "candidato escrito → $out"
' _ "$tmp_prompt" "$out" "${CAPTURAR_DEBUG:+$dbglog}" >/dev/null 2>&1 </dev/null &

exit 0
