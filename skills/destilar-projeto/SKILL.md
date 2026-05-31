---
name: destilar-projeto
description: Lê os documentos do projeto (CLAUDE.md local, README.md, CONTEXT.md), a transcrição da sessão atual (priorizando trechos marcados com "marca isso" ou similar) e o código sob demanda para propor destilações concretas — atualizações, gaps a preencher, contradições a resolver. Pedro cura, Claude escreve. Use quando Pedro pedir para destilar, revisar, atualizar ou curar a documentação do projeto, ou disser "destilar-projeto".
---

# destilar-projeto

Pedro quer Claude magro: o mínimo de informação carregada para performar a sessão atual e estar disponível para a próxima. A documentação canônica vive no projeto (arquivos do repositório) e fora dele (Notion, CLAUDE.md global). Esta skill cuida do **dentro do repositório**.

A divisão de trabalho é fixa:

- **Pedro decide o que merece destilação.** Só ele tem o critério.
- **Claude propõe destino e conteúdo concreto.** Claude carrega a taxonomia.
- **Pedro aprova, redireciona ou recusa.** Claude escreve.

Claude não dispara destilações por conta própria fora desta skill.

## Fluxo

### 1. Ler os docs do projeto

Ler, na entrada, os arquivos curtos que existem na raiz do projeto:

- `CLAUDE.md` — instruções para Claude no projeto
- `README.md` — apresentação do projeto
- `CONTEXT.md` — estado operacional, decisões em curso

Se algum não existir, anote — pode virar proposta de criação. Não criar nada ainda.

### 2. Ler a transcrição da sessão atual

Os docs mostram o estado fixo. A sessão mostra **o que está em movimento** — descobertas, decisões e mudanças de direção que ainda não chegaram aos docs. Sem esse input, a destilação fica restrita ao que já está cristalizado.

Localizar a transcrição em `.claude/sessions/` (arquivo modificado mais recentemente) ou usar a sessão em curso quando disponível. Ler com foco em:

- **Trechos marcados.** Pedro deixa migalhas durante a sessão com frases naturais tipo "marca isso", "registra isso", "isso vale guardar". A frase em si não dispara nada quando dita — é só um marcador na transcrição. Buscar por essas frases (case-insensitive) com `Grep` e ler ~20 linhas ao redor de cada ocorrência. Esse é o sinal mais forte sobre o que destilar.
- **Decisões e mudanças de direção.** Mesmo sem marcação explícita, momentos onde Pedro disse "muda o plano", "vamos por outro caminho", "fechou", "aprovo" — geralmente valem destilação.
- **Trajeto, não só conclusão.** A sessão registra o caminho percorrido: hipóteses descartadas, tentativas, "ah, entendi agora". Esse trajeto é matéria-prima para retrospectivas e blog posts futuros — preservar quando for relevante para um destino que pede narrativa (ex: README de quem entra pela primeira vez no projeto), não só para o destino técnico mínimo.

### 3. Apresentar mapa inicial

Em uma resposta curta, dizer:

- O que cada doc existente afirma hoje, em uma linha.
- O que ficou claro na sessão (especialmente nos trechos marcados) que ainda **não** está refletido nos docs.
- Primeira impressão de gaps ou contradições — entre docs, ou entre docs e sessão.

Não propor mudanças ainda. O objetivo aqui é dar a Pedro um ponto de partida para escolher por onde ir.

### 4. Dialogar

Pedro aponta por onde quer ir. Para verificar algo específico no código, usar `Glob`/`Grep`/`Read` sob demanda. Não ler o codebase inteiro de cara — isso pesa e quase sempre é desnecessário.

Uma proposta por vez. Sem listas longas de mudanças sugeridas em bloco.

### 5. Propor mudança concreta

Cada proposta tem três partes:

- **Onde** — qual arquivo, qual seção.
- **Por quê** — o gap ou desalinhamento que motiva a mudança. Citar o trecho da sessão (e o marcador, se houver) que sustenta a proposta.
- **O quê** — o trecho exato a adicionar, substituir ou remover.

Se a proposta criar um arquivo que não existe (ex: primeiro `CONTEXT.md`), explicitar isso.

### 6. Pedro aprova ou redireciona

Se aprovou, escrever (`Edit` ou `Write`). Se redirecionou, refazer a proposta. Se recusou, seguir para a próxima.

## O que esta skill não faz

- **Não destila para fora do repositório.** Notion, CLAUDE.md global e `.claude/memory/` ficam fora — eles têm outro mecanismo (ainda por definir).
- **Não decide o que merece ser destilado.** Esse julgamento é de Pedro.
- **Não roda automaticamente.** Só quando Pedro invoca.
