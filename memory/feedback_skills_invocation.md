---
name: feedback-skills-invocation
description: "Skills no Claude Code são invocadas explicitamente pelo usuário via barra (igual aos slash commands clássicos), não disparam automaticamente — não confundir com auto-invocação contextual."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 08d89154-a278-4d37-b424-1f5822135ef4
---

Skills no Claude Code são invocadas **explicitamente** pelo usuário (digitando `/nome-da-skill`). Não são auto-invocadas por contexto, salvo quando a descrição da própria skill instrui explicitamente uso proativo.

**Why:** Pedro me corrigiu em 2026-05-28 quando eu caracterizei skills como "descobríveis que disparam automaticamente quando contexto bater" — caracterização errada que poderia levá-lo a decisões ruins sobre o que manter/deletar. Funcionalmente, skill e slash command clássico (em `commands/`) são equivalentes do ponto de vista do usuário; a diferença é só formato de armazenamento (skill = pasta com SKILL.md + auxiliares; command = arquivo .md solto).

**How to apply:** ao comparar skill vs command duplicados, não inventar diferença comportamental que não existe. Quando comparar opções, defender com base em critérios reais (padrão atual da plataforma, capacidade de crescer com arquivos auxiliares, consistência com o resto), não em ilusões de auto-invocação. Relacionado a [[feedback-behavior]].
