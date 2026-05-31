---
name: project-computer-migration
description: "Pedro vai trocar de computador em ~1 semana a partir de 2026-05-28. Pretende migrar tudo (clonar .claude/). Tem semana, sem pressa."
metadata: 
  node_type: memory
  type: project
  originSessionId: 4671a69b-545a-47fb-80db-5806c136cffe
---

Pedro vai **trocar de computador**. Janela: ~1 semana a partir de 2026-05-28 (entrega prevista até ~2026-06-04).

**Plano de migração combinado:**
- Migrar tudo (não recomeçar limpo). Copiar `C:\Users\pedro\.claude\` inteiro pra máquina nova.
- Projetos em `C:\Dev\*` já estão sincronizados com remoto no GitHub.
- Notion, Gmail, Calendar, Drive vivem na nuvem — só re-logar.
- MCPs precisam refazer OAuth na máquina nova (chato, não perde nada).

**Why:** Pedro sinalizou medo de "fazer configurações/integrações neste dispositivo e perder tudo". O medo é resolvido pela escolha de migrar `.claude/` inteiro + trabalhar em camadas portáveis (Notion / git remoto / `.claude/`).

**How to apply:**
- Enquanto o computador novo não chega, **trabalhar preferencialmente em camadas portáveis**: Notion (nuvem) e repos git (com remoto). Coisas criadas em `.claude/` migram junto na cópia.
- **Evitar criar estado fora dessas camadas** (pastas avulsas em `C:\Documentos\`, Desktop, etc.) sem registrar como ponto de migração.
- Se Pedro sinalizar que a máquina chegou, abrir checklist de migração (cópia `.claude/`, re-OAuth dos MCPs, clone dos repos).
- Após a migração concluída, **deletar esta memória** — fica obsoleta.

Relacionado a [[project-learning-system]].
