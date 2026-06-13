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

command -v jq >/dev/null 2>&1 || exit 0
command -v claude >/dev/null 2>&1 || exit 0

input=$(cat)
transcript=$(jq -r '.transcript_path // empty' <<<"$input")
cwd=$(jq -r '.cwd // empty' <<<"$input")
reason=$(jq -r '.reason // empty' <<<"$input")

# resume: a mesma transcrição continua depois — capturar agora duplicaria
[ "$reason" = "resume" ] && exit 0
{ [ -n "$transcript" ] && [ -f "$transcript" ]; } || exit 0

repo="${CLAUDE_SYSTEM_DIR:-$HOME/claude-system}"

# Sessões no próprio hub não precisam de transporte (o destilar já roda lá)
case "$cwd" in "$repo"*) exit 0 ;; esac

prompt_file="$repo/hooks/capturar-prompt.md"
[ -f "$prompt_file" ] || exit 0

# sonnet: a qualidade da captura é o ponto frágil do desenho — não economizar
# no julgamento; 1 chamada por fim-de-sessão. Trocar por haiku se o custo doer.
# O prompt vai por STDIN, não como argumento: nesta versão do CLI (2.1.160)
# um prompt grande no argumento posicional não é lido por `claude -p` (erra
# "Input must be provided..."); via stdin funciona. Como `input=$(cat)` acima
# já drenou o stdin do hook, alimentamos o prompt por um pipe próprio — que de
# quebra resolve a trava de "no stdin data" do `-p`.
nota=$(printf '%s\n\nTranscrição da sessão (JSONL) a analisar: %s\n' \
  "$(cat "$prompt_file")" "$transcript" \
  | CAPTURAR_HEADLESS=1 claude -p --model sonnet --allowedTools "Read") || exit 0

case "$nota" in ""|*SEM_CANDIDATO*) exit 0 ;; esac

mkdir -p "$repo/inbox"
projeto=$(basename "${cwd:-desconhecido}")
# timestamp+projeto no nome: um arquivo por sessão, sem race entre paralelas
printf '%s\n' "$nota" >"$repo/inbox/$(date +%Y%m%d-%H%M%S)-$projeto.md"
