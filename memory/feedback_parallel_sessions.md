---
name: feedback-parallel-sessions
description: "Pedro gosta de rodar sessões paralelas — uma executa código, outra ensina/grelha um tema — e quer praticar mais esse padrão"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 37e5ef58-a960-41f6-99ee-863f58215175
---

Pedro validou (2026-06-12, ao concluir o organograma) rodar **sessões em paralelo com papéis distintos**: uma trabalhando no código/resolvendo problema procedural, outra ensinando e grelhando ele sobre um tema (ex.: deploy e banco de dados). Achou a experiência muito boa e quer desenvolvê-la e repeti-la.

**Why:** combina os dois contextos de uso dele ([[user-profile]]) numa janela só — avança a construção enquanto aprende o que precisa pra ela. Maximiza tempo e mantém o "aprender construindo".

**How to apply:** funciona bem quando os dois fios são fracamente acoplados (problema procedural ≠ estudo independente). Dois pontos cegos:
- **Semântico:** sessões não compartilham estado — se as conclusões de uma deveriam mudar o rumo da outra, quem reconcilia é o Pedro de cabeça, no momento.
- **Mecânico (working tree compartilhado):** as duas frentes editam o **mesmo repo**, então ao commitar a Frente A o artefato da Frente B aparece staged/untracked junto. Hoje resolvido **ad hoc** — o Claude lê `git status` + contexto e exclui o que é da outra frente. Sem régua: branch por frente? commit é responsabilidade da sessão que gerou o artefato? Não decidir ainda — n baixo.

**Evidência até agora (n=2):** (1) sessão de 2026-06-12 (organograma) — dois fios totalmente independentes, não se cruzaram (caso fácil, ponto cego semântico NÃO exercitado). (2) `health-tech-discovery` 2026-06-18 — Frente A (`/aprender`) e Frente B (validação/fake-door) em janelas simultâneas no mesmo repo; ao commitar a A, `validacao/` (da B) estava no working tree e foi excluído na mão. Expôs o ponto cego **mecânico**, não o semântico (os fios ainda eram desacoplados). Antes de virar lei de método no Notion via [[destilar-transversal]], faltam os dois testes difíceis: o semântico (fios que se cruzam, ver se a reconciliação de cabeça aguenta) e o mecânico (se paralelo-no-mesmo-repo virar padrão, decidir branch-por-frente vs. commit-da-sessão).
