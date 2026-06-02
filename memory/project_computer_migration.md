---
name: project-computer-migration
description: "Migração de computador concluída em 2026-06-02. Windows → Linux. Novo SO instalado, repositórios preservados via GitHub, MCPs reconectados."
metadata: 
  node_type: memory
  type: project
  originSessionId: 4671a69b-545a-47fb-80dc-5806c136cffe
---

**Migração concluída em 2026-06-02.** Windows → Linux (troca forçada por problema no SO).

**O que foi preservado:**
- `claude-system` — intacto (era repositório git)
- Projetos em `Dev/*` — preservados via GitHub remote
- Notion, Gmail, Calendar, Drive — nuvem, só re-logar
- MCPs — reconectados na nova máquina (OAuth refeito)

**O que mudou:**
- SO: Windows → Linux
- Caminhos: `C:\Users\pedro\...` → `/home/pedro/...`
- `dev/` recriada em `/home/pedro/dev/`
- CONTEXT.md e MEMORY.md atualizados com novos caminhos (2026-06-02)
- `~/.claude/settings.json`: settings importantes (model, autoMemory, permissions, plugins) precisam ser aplicados manualmente (bloqueio de segurança impede o Claude de auto-modificar)

**Why:** Problema no SO forçou reinstalação. As perdas foram mínimas porque o trabalho estava em camadas portáveis (git + Notion).

**How to apply:** Memória pode ser mantida como registro histórico da migração. Os caminhos corretos a usar agora são `/home/pedro/...`.
