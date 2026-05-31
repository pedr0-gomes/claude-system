---
name: destilar-transversal
description: Destila aprendizados da sessão para fora de qualquer repositório de projeto — o sistema .claude/ global (CLAUDE.md global, memory/, CONTEXT.md) e o Notion. Roteia cada fato para a camada certa sem duplicar, seguindo a regra de corte "lei seca no global, Why+How na memória, canônico gordo no Notion". Pedro cura, Claude propõe e escreve. Use quando Pedro pedir para destilar, atualizar, curar ou organizar o sistema global, a memória, as leis do CLAUDE.md global ou o Notion — ou disser "destilar-transversal". É a irmã da destilar-projeto para tudo que vive fora de um repositório.
---

# destilar-transversal

A `destilar-projeto` cuida do **dentro de um repositório**. Esta cuida de tudo que vive **fora**: o sistema `.claude/` global e o Notion. É o "outro mecanismo" que a `destilar-projeto` declara não ter.

**Fronteira entre as duas:** o `.claude/` global **não é um repositório de projeto** — então tudo nele (inclusive o `CONTEXT.md` global) cai sempre na transversal. A `destilar-projeto` só atua quando há um repo de código com seus próprios docs.

A divisão de trabalho é a mesma:

- **Pedro decide o que merece destilação.** Só ele tem o critério.
- **Claude propõe destino e conteúdo concreto.** Claude carrega a taxonomia de roteamento.
- **Pedro aprova, redireciona ou recusa.** Claude escreve.

Claude não dispara destilações por conta própria fora desta skill.

## O que torna a transversal diferente da de projeto

Um projeto tem poucos docs e o destino quase sempre é óbvio. O transversal tem **quatro camadas que se sobrepõem com facilidade** — o mesmo fato cabe em mais de uma, e a tentação de duplicar é constante. O trabalho central aqui não é só achar o gap; é **rotear sem duplicar**. Por isso a taxonomia abaixo é o coração da skill.

## Taxonomia de roteamento

Princípio operacional do sistema: **Notion gordo, Claude magro.** Canônico extenso vive no Notion; o `.claude/` carrega só o mínimo para performar.

Cada fato mora em **um** lugar canônico. As camadas:

| Camada | Caminho | O que mora aqui |
|---|---|---|
| **CLAUDE.md global** | `C:\Users\pedro\.claude\CLAUDE.md` | **Lei seca + identidade.** Regras de comportamento, princípios, comunicação — na forma imperativa, curta, sem o porquê. Quem Pedro é, em essência. |
| **`.claude/memory/`** | `...\memory\*.md` | **Why das leis + contexto específico + perfil rico + projeto/referências.** Um fato por arquivo, com frontmatter; ponteiro no `MEMORY.md`. |
| **CONTEXT.md global** | `C:\Users\pedro\.claude\CONTEXT.md` | **Mapa magro do sistema de orquestração.** Estado operacional, frentes abertas, blocos do método. Aponta pro Notion, não hospeda o conteúdo gordo. |
| **Notion** | "Sistema de gestão" + database Construções | **Canônico gordo, navegável.** Conteúdo extenso que Pedro lê e cura no Notion, não no terminal. |

## A regra de corte (núcleo)

Validada em sessão: o erro recorrente é **duplicar** a mesma informação entre camadas. A regra que previne isso:

- **A lei mora só no global.** A memória **não re-hospeda** a lei. Ela **ancora** ("sobre a lei X do CLAUDE.md global → seção Y") e entrega só o que o global não tem: o **Why** e o **How to apply**.
- **Perfil rico → memória; identidade/comunicação → global.** O detalhe (matérias, contexto, preferências finas) fica na memória; a essência e as regras de comunicação ficam no global como lei.
- **Canônico gordo → Notion; mapa magro → CONTEXT.md.** O CONTEXT.md aponta; o Notion hospeda.

**Trade-off aceito conscientemente:** ancorar em vez de duplicar cria acoplamento — se a lei for renomeada no global, a âncora da memória aponta pra um texto que mudou. Esse é o preço de não duplicar, e foi a escolha deliberada (a alternativa, memória auto-suficiente, anula a política toda).

**Teste rápido ao propor um destino:** "esse mesmo fato já existe em outra camada?" Se sim, a proposta não é *adicionar* — é *ancorar* ou *mover*, deixando um lugar só como dono.

## Fluxo

### 1. Ler o estado das camadas

Na entrada, ler os arquivos magros do sistema global:

- `CLAUDE.md` global — as leis e a identidade.
- `CONTEXT.md` global — o mapa do sistema e as frentes abertas.
- `MEMORY.md` — o índice das memórias (uma linha por fato).

Ler arquivos individuais de `memory/` sob demanda, quando uma proposta tocar um deles. Notion: consultar via MCP só a página/seção relevante, não varrer tudo — Notion é gordo de propósito.

### 2. Ler a transcrição da sessão atual

Os arquivos mostram o estado fixo; a sessão mostra **o que está em movimento**. Localizar a transcrição em `.claude/sessions/` (mais recente) ou usar a sessão em curso. Focar em:

- **Trechos marcados.** Pedro deixa migalhas com frases naturais ("marca isso", "registra isso", "isso vale guardar"). A frase não dispara nada quando dita — é só marcador. Buscar com `Grep` (case-insensitive) e ler ~20 linhas ao redor. Sinal mais forte do que destilar.
- **Decisões e mudanças de direção** — "fechou", "aprovo", "muda o plano", mesmo sem marcador.

### 3. Apresentar mapa inicial

Em resposta curta:

- O que cada camada afirma hoje sobre o tema em jogo, em uma linha.
- O que ficou claro na sessão e ainda **não** está refletido em nenhuma camada.
- Primeira impressão de **sobreposições** (mesmo fato em duas camadas) e contradições.

Não propor mudanças ainda. Dar a Pedro o ponto de partida.

### 4. Dialogar

Pedro aponta por onde ir. Uma proposta por vez — sem listas longas em bloco.

### 5. Propor mudança concreta

Cada proposta tem quatro partes (uma a mais que a de projeto — o destino é decisão real aqui):

- **Onde** — qual camada e qual seção/arquivo. Justificar a camada pela taxonomia.
- **Por quê** — o gap, a sobreposição ou a contradição. Citar o trecho da sessão (e o marcador, se houver).
- **O quê** — o trecho exato a adicionar, mover, ancorar ou remover.
- **Não-duplica** — confirmar que o fato não fica hospedado em duas camadas. Se já existia em outra, dizer o que acontece com a cópia antiga (vira âncora, é removida, etc.).

Para fatos novos na memória, seguir a convenção: frontmatter (`name`, `description`, `metadata.type` entre `user`/`feedback`/`project`/`reference`), corpo com `**Why:**`/`**How to apply:**` quando for feedback/project, links `[[outra-memoria]]`, e o ponteiro de uma linha no `MEMORY.md`.

### 6. Pedro aprova ou redireciona

Aprovou: escrever (`Edit`/`Write` nos arquivos; MCP do Notion quando o destino for Notion). Redirecionou: refazer. Recusou: próxima.

## O que esta skill não faz

- **Não destila para dentro de um repositório de projeto.** CLAUDE.md local, README, CONTEXT local são da `destilar-projeto`.
- **Não decide o que merece ser destilado.** Julgamento de Pedro.
- **Não duplica entre camadas.** Na dúvida entre dois destinos, ancorar ou mover — nunca hospedar nos dois.
- **Não roda automaticamente.** Só quando Pedro invoca.
