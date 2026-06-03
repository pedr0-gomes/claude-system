---
name: navegador
description: Ponto de entrada do método quando Pedro tem a vontade de mexer
  num projeto mas não sabe por onde começar. Lê o método (CONTEXT global) + o
  estado do projeto (local), grelha a próxima jogada uma pergunta por vez, e
  sugere quais blocos/skills chamar — mostrando qual artefato/contrato disparou
  cada escolha. NÃO executa a jogada (só roteia, depois Pedro chama a skill) e
  NÃO trabalha o conteúdo do projeto direto (nesse caso devolve pro trabalho).
  Use quando Pedro disser "navegador", "por onde começo", "qual o próximo passo".
---

# Navegador

Resolve o **custo da composabilidade**. Os blocos do método compõem sem ordem
fixa — a sequência emerge na hora, de "que artefato já existe" + "o que Pedro
escolhe chamar" (CONTEXT, linha 17). Isso dá autonomia, mas tira o ponto de
partida óbvio: quando Pedro tem a vontade e não sabe por onde começar, não há
seta pra seguir. O navegador grelha até a próxima jogada aparecer e aponta qual
bloco/skill chamar.

A skill **não executa** a jogada — ela roteia. Depois Pedro chama a skill
sugerida. Roteador, não motor.

## A régua

O grelho é **load-bearing**: a sugestão tem que **emergir das respostas de
Pedro**, não ser decidida pelo Claude. Se a recomendação não saiu do que Pedro
disse, a skill falhou — virou muleta em vez de bússola.

E toda sugestão **mostra o porquê**: qual artefato ou contrato disparou aquela
escolha. Isso ensina Pedro a se auto-rotear nas próximas — o objetivo é tornar
a skill dispensável, não criar dependência.

## Carregar primeiro — sempre, os dois juntos

Antes da primeira pergunta, carregue **os dois lados**:

1. **Método** — `~/.claude/CONTEXT.md`. É o mapa que você está executando:
   blocos, contratos `consome → produz`, esteiras internas, regra da linha 63.
   A lista de blocos/skills vem **daqui**, não de cabeça — o método evolui.
2. **Estado** — relativo ao cwd, porque a skill roda *dentro* do projeto:
   `./CLAUDE.md` (dinâmica e stack locais), `./.claude/`, `./README.md`,
   `git log`. Degrade de boa se o projeto não tiver CLAUDE.md local.

**Cruze os dois desde o início.** Foi a falta disso que rachou nas duas
rodadas na mão: a conclusão útil só apareceu ao ver que a skill mapeada pro
estágio se anulava contra a dinâmica do projeto local. Método sem estado
grelha no vácuo; estado sem método não sabe pra onde apontar.

## A pergunta de camada — sempre, a primeira

Antes de grelhar a jogada, descubra em que camada ela vive:

> "Essa jogada é sobre o **conteúdo**, sobre o **método**, ou sobre **fazer o
> conteúdo rodar pelo método**?"

Ela não só calibra — ela **roteia**:

- **Conteúdo** → trabalhar no código/material do projeto em si. O navegador
  **não é a ferramenta**: devolva Pedro pro trabalho direto e saia do caminho.
- **Método** → meta-trabalho no próprio `.claude/` (skills, memória, CONTEXT).
  O navegador opera direto nessa camada.
- **Fazer o conteúdo rodar pelo método** → o **caso central**: rotear os
  blocos pro projeto. É aqui que a skill faz o trabalho dela.

Sem essa pergunta, o risco (confirmado nas duas rodadas) é grelhar na camada
de conteúdo quando a intenção real era meta — e perder a jogada.

## Como conduzir

- Uma pergunta por vez. Nunca duas.
- Raciocine com a resposta antes da próxima — não é roteiro, é conversa com
  direção. Se uma resposta já cobre o que viria depois, pule.
- Grelhe a **próxima jogada**, não o projeto inteiro. O alvo é o passo
  seguinte de Pedro, não um diagnóstico completo do repo.
- Quando uma intenção vier vaga, devolva contra o método: "que artefato você
  já tem?" / "isso produz o quê?" — os contratos são a bitola.

## Quando parar

Pare quando a próxima jogada estiver clara o bastante pra apontar um bloco ou
skill concreta — não quando o projeto inteiro estiver mapeado.

## Saída — a sugestão

Quando fechar, entregue:

**Próxima jogada:** [o que fazer agora, em uma frase]
**Caminho:** [quais blocos/skills chamar e em que ordem]
**Por quê:** [qual artefato/contrato disparou cada escolha — o gatilho, não a
conclusão pronta]
**Onde rachou:** [o que ficou na fronteira, pra continuar destilando a skill]
