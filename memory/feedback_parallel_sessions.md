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

**How to apply:** funciona bem quando os dois fios são fracamente acoplados (problema procedural ≠ estudo independente). Ponto cego: sessões não compartilham estado — se as conclusões de uma deveriam mudar o rumo da outra, quem reconcilia é o Pedro de cabeça, no momento.

**Evidência até agora (n=1, caso fácil):** na sessão de 2026-06-12 os dois fios rodaram totalmente independentes, não se cruzaram. Logo o ponto cego ainda NÃO foi exercitado — há evidência pra assuntos desacoplados, não pra método geral. Antes de virar lei de método no Notion via [[destilar-transversal]], falta o teste difícil: rodar paralelo com fios que se cruzam e ver se a reconciliação de cabeça aguenta ou se pede um artefato de costura entre sessões.
