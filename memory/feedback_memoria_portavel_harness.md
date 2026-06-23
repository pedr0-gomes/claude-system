---
name: feedback-memoria-portavel-harness
description: Não gravar fato de método na auto-memória do harness mid-session — é por-cwd e vira órfã; destino se decide só no destilar-transversal
metadata: 
  node_type: memory
  type: feedback
  originSessionId: bef31c0e-d2b4-4fd2-851e-545e27df842f
---

Sobre a lei *"Memória portável não se grava à mão no meio da sessão"* (CLAUDE.md global → seção "Sistema de orquestração").

**Why:** a auto-memória do harness é **por-slug-de-cwd**. Rodando em `~/dev/projects/<x>`, um fato portável de método marcado ("isso vale guardar") e gravado na hora vai parar em `~/.claude/projects/-home-pedro-dev-projects-<x>/memory/` — órfão do lar canônico `~/claude-system/memory/`. É o **mesmo furo per-cwd** que o navegador documenta (CONTEXT global, frente do navegador), por outra porta: lá a memória global não *carrega* em `~/dev/*`; aqui ela *escreve no lugar errado*. Visto no encerramento do `health-tech-discovery` (06-23): o funil-kill foi salvo na memória do projeto HTD e o `destilar-transversal` teve de migrar pro lar canônico.

**How to apply:** marcador de fato portável mid-session → anotar no contexto da sessão e seguir trabalhando; o destino (global / memória / CONTEXT / Notion) se decide **só** no `destilar-transversal`, que roteia sem duplicar (ver [[feedback_funil_kill_vitoria]] como exemplo do fato que disparou isto). Vale sobretudo em `~/dev/*`; dentro de `~/claude-system` o slug coincide com o lar, mas a disciplina é a mesma — destilar não é movimento mid-session.
