# CONTEXT.md — .claude/ (sistema de orquestração)

Última atualização: 2026-05-30

## O que é este diretório

`.claude/` é o sistema vivo onde Pedro orquestra como ele constrói coisas comigo. Skills, memória, sessões, configurações. Cada projeto em que trabalhamos pode ter seu próprio `.claude/` local — este aqui é o global.

Fonte canônica gorda (para Pedro navegar): página **"Sistema de gestão"** no Notion, com o database **Construções**.

## Princípio operacional

**Notion gordo, Claude magro.** Documentação canônica vive no Notion. Bruto vive na transcrição local. Claude carrega só o mínimo para performar a sessão atual e estar disponível para a próxima.

## Método de gerência: blocos componíveis

Substitui o antigo "fluxo de aprendizado" de 5 etapas sequenciais. **Não é fluxo** (ordem rígida) — é um conjunto de **blocos autônomos** que Pedro invoca em qualquer ordem. A sequência não existe no mapa; ela emerge na hora, da combinação de "que artefato já existe" + "o que Pedro escolhe chamar". Cada problema segue uma composição diferente — é isso que dá autonomia pra explorar possibilidades.

**O que conecta os blocos não é ordem, são artefatos.** Cada bloco tem um contrato `consome → produz`; a saída de um pluga na entrada de outro. É o contrato nas bordas que garante a composabilidade e impede o fluxo de "quebrar".

**Ambiente** (roda sozinho, Pedro não chama):

- **Capturar** → transcrição bruta contínua (`.claude/sessions/`, `history.jsonl`) + marcadores ("marca isso"). Claude não captura ativamente; a destilação acha depois. Implementação futura: hook.

**Blocos** (Pedro invoca):

| Bloco | Consome | Produz | Papéis |
|---|---|---|---|
| **Investigar** | "quero entender X" | artefato de pesquisa (interface p/ Aprender e Construir) | co-pilotagem: Pedro pesquisa, Claude guia sem entregar pronto |
| **Aprender** | dúvida just-in-time **ou** `research.md` (do Investigar) | capacidade interna (+ mapa-de-aprendizado) | Pedro consolida, Claude faz andaime |
| **Construir** | ideia/problema (**ou** `research.md` do Investigar) | código **validado** (+ PRD e Kanban intermediários) | mão de Pedro ou de Claude |
| **Destilar** | transcrição bruta + docs | docs internos (destino = parâmetro: projeto ou transversal) | Pedro cura, Claude propõe + escreve; skill `destilar-projeto` cobre o destino "projeto" |
| **Expor** | destilado interno (âncora) + transcrição/marcadores (jornada) | output público (blog) | motor: Pedro escreve, Claude faz andaime (prosa substituível) + crítica; curadorias: Claude propõe, Pedro cura |

**Implementação:** cada bloco vira um *plugin* (agrupando skills) só quando tiver ≥2 skills com o mesmo contrato; até lá fica como skill única ou só como contrato. O contrato é o que agrupa as skills de um bloco.

**Regra de evolução** (marcada 2026-05-29): daqui pra frente, só *preencher* blocos (definir saídas em aberto, adicionar skills) ou *criar novos* — sempre sem quebrar os contratos já fixados.

**Esteira interna da Construir.** O bloco Construir tem estrutura sequencial por dentro — isso **não** contradiz a linha 17 (*"Não é fluxo"*), que vale no *topo*: os blocos compõem sem ordem fixa; um bloco pode ter esteira interna. Escalas diferentes.

`Idea → (opc) Research [delega ao Investigar → research.md] → (opc) Prototype → PRD → Kanban → Implementation → QA/Code Review`

Bordas-artefato: **PRD** (destino + user stories + notas), **Kanban** (PRD em tickets com relações de bloqueio), **código validado** (saída). Revisão é parte da construção: construir não garante correção, então o QA fecha o loop. Research é ponto de *delegação* ao bloco Investigar, não posse — preserva o Investigar como bloco autônomo. Referência: workshop "AI Engineer" do mattpocock (esteira de onde vieram os artefatos; importamos os artefatos, não as setas).

**Esteira interna do Expor.** *(desenhado 2026-05-29)* Mesma lógica de escala da Construir — esteira interna não contradiz o "não é fluxo" do topo. Pedro invoca. Estrutura: **um motor + duas curadorias.** O motor (*escrever pra pensar/registrar*) gira e gera volume; **audiência** e **portfólio** são curadorias *a jusante* — consequência de publicar com consistência e seleção retrospectiva —, não trilhas paralelas (servir os três de cara inflaria o bloco e mataria a frequência). Matéria-prima: o destilado é a **âncora** (tema/decisão), a transcrição + marcadores "marca isso" dão a **jornada** (o como/por quê que o destilado descarta de propósito); ampliar a entrada com a transcrição adiciona fonte sem mudar a saída — não quebra o contrato.

`Dossiê → Arco → Escrita+crítica → post publicado`

Movimentos: **Dossiê** (*Claude* monta a matéria bruta de um tema a partir dos marcadores + destilado; Pedro escolhe/aprova o tema — e o Claude **apresenta a evidência do destilado mas pergunta o encadeamento/causa, não deduz**: o destilado arruma a ordem real, a jornada verdadeira é do Pedro) → **Arco** (*Claude propõe*, Pedro aprova o esqueleto narrativo tensão→virada→lição) → **Escrita+crítica** (a voz é do Pedro; o *Claude entrega a primeira prosa como andaime substituível* pra tirar o Pedro da página em branco, ele reescreve na voz dele, e o Claude então **critica sem reescrever** as versões dele — preservando o *pensar escrevendo*). *Ajuste 2026-05-30: o contrato original "Claude não entrega prosa" não sobreviveu ao primeiro contato — a página em branco é o gargalo, o andaime destrava sem sequestrar a voz.* Bordas-artefato: **dossiê → arco → post**. *Os artefatos vivem no Notion (sob "Sistema de gestão → Expor"), nunca no repo de código — o raciocínio expositivo é privado; só o post final e o código vão a público (fixado 2026-05-30 ao mover o 1º post pra fora do repo; a futura skill deve escrever no Notion, não em `docs/expor/`).* A jusante, sobre o corpo de posts já publicados (não por-post): **destaque** (audiência — Claude sugere, Pedro decide) e **seleção** (portfólio — Claude propõe os melhores, Pedro cura). Fora do desenho: plataforma do blog e virar skill (ver Frentes abertas).

**Esteira interna do Aprender (realização NotebookLM).** *(desenhado 2026-05-30)* O **Aprender é um bloco-sink**: o output real é intangível (capacidade interna); o artefato é a *sombra inspecionável* dela — o **mapa-de-aprendizado**, externalização consolidada cuja forma segue o material (Excalidraw p/ relacional, prosa p/ sequencial, NotebookLM p/ o central). Não obriga próximo bloco; opcionalmente vira âncora do Expor.

`fontes (Pedro+Claude) → instruções (Claude, Pedro aprova) → NotebookLM entrega material → Pedro consolida → mapa-de-aprendizado`

Movimentos: **seleção de fontes** (co-pilotagem — alimenta o NotebookLM *e* dá contexto ao Claude pra instruir bem) → **instruções** (Claude traduz a vontade do Pedro em prompt; **Pedro aprova antes de ir**, senão o Claude molda em silêncio *o que* se aprende) → **material** (NotebookLM entrega; é insumo, pode ser auto-gerado) → **mapa** (Pedro consolida, Claude só andaime). Régua que costura: **a ferramenta entrega o material, Pedro produz o mapa** — onde o output é estado interno, Claude anda em volta e não entrega (igual Investigar e Expor). Simetria notada: a frente fontes+instruções espelha o *briefing* do Investigar (prep pra ferramenta externa → bruto → consolidação no artefato do bloco); padrão ou coincidência, não mexido agora.

Mapa visual: `assets/metodo-gerencia-v2.excalidraw` (abrir em excalidraw.com → "Open") — altitude "topo magro": 5 blocos + Capturar (ambiente) + Navegador (entrada), conectados por contratos de artefato; esteiras internas ficam só como texto aqui. O `assets/metodo-gerencia-v1.excalidraw` (Expor ainda tracejado, Aprender sem saída definida) e o `assets/fluxo-aprendizado-v1.excalidraw` (esteira sequencial) ficam como registro do "antes".

## Skills vivas

As skills são a implementação dos blocos do método (ver acima). Um bloco com ≥2 skills vira plugin.

**Regra de criação** *(2026-05-29)*: uma skill destila um processo **já exercitado na mão**, não um desenho no papel. Antes de empacotar um fluxo, rodá-lo ad-hoc ao menos uma vez (Claude faz andaime sem skill) e ver onde racha — as skills atuais nasceram assim.

- **`destilar-projeto`** *(bloco **Destilar**, destino `projeto`)* — lê docs do projeto + transcrição da sessão (priorizando marcadores) + código sob demanda; propõe atualizações em CLAUDE.md local, README.md, CONTEXT.md. Pedro cura, Claude escreve.
- **`destilar-transversal`** *(bloco **Destilar**, destino `transversal`)* — irmã da de projeto para tudo **fora** de um repositório: CLAUDE.md global, `memory/`, CONTEXT.md global, Notion. Roteia cada fato pra camada certa sem duplicar. A regra de corte (lei seca no global; memória ancora a lei e dá só Why+How; perfil rico na memória; gordo no Notion) vive na própria skill — por isso não está repetida aqui.
- **`investigar`** *(bloco **Investigar**, primeiro pedaço)* — entrevista uma ideia/intenção de pesquisa no estilo `grill-me`, uma pergunta por vez, e entrega um *briefing* pesquisável. Faz dois trabalhos numa conversa só: entende o contexto (origem/intenção) e grelha os ângulos até ficarem específicos — o contexto é a bitola contra a qual a pesquisa é grelhada. Redireciona pro **Aprender** quando a intenção é curiosidade pura (sem ação/decisão). Cobre a formulação; a consolidação em `research.md` é a skill irmã `consolidar-pesquisa` (abaixo).
- **`consolidar-pesquisa`** *(bloco **Investigar**, segunda metade)* — consome o briefing (da `investigar`) + o dump bruto da pesquisa externa, ambos colados no chat, e os consolida no `research.md` (`.claude/research/<slug>.md`). É o que entrega o "artefato de pesquisa" do contrato (linha 30) aos consumidores Aprender e Construir — enquanto o briefing era só interface pra ferramenta externa, não pros consumidores. Régua: o *conteúdo* nunca é do Claude (irmã da regra de corte "a decisão nunca é do Claude"); dump não coberto vira lacuna explícita na §5, não se preenche de cabeça. Forma detalhada do `research.md` (5 seções, fronteira §2 descritivo / §3 decisório, regra de corte em §3+§5) é dona da própria SKILL.md.
- **`mattpocock/skills`** (instaladas globalmente via `npx skills@latest add mattpocock/skills`) — preenchem a **esteira interna da Construir** (ver linha 41), um estágio por skill:
  - **Idea** → `grill-me` · **Prototype** → `prototype` · **PRD** → `to-prd` · **Kanban** → `to-issues` · **Implementation** → `tdd`
  - **QA** → `improve-codebase-architecture` (deepening de arquitetura) somado às built-in do Claude Code (`code-review`, `verify`, `simplify`, `security-review`)
  - **Research** → vazio de propósito: delega ao bloco **Investigar** (skills `investigar` + `consolidar-pesquisa`)
  - `zoom-out` é transversal (não-estágio). `/setup-matt-pocock-skills` roda uma vez por projeto antes de usá-las (ainda pendente no protótipo dele).
- **Convenção `docs/adr/`** *(decidido 2026-05-29)* — adotada **por-projeto**: ADRs vivem em `docs/adr/` dentro de cada repo de app, alimentando a `improve-codebase-architecture` ao lado do `CONTEXT.md`. **Não no `.claude/` global** — aqui o `CONTEXT.md` já faz o meta-registro. Ativa no primeiro projeto real.
  - **Instalar sem quebrar:** sempre `--global --copy --agent claude-code` e uma flag `--skill` por skill (vírgula não é aceita). Rodar `npx skills add` de *dentro* de `.claude` sem `-g` cria um `.claude/.claude/skills` aninhado; `--copy` (não symlink) garante que migram copiando a pasta.

## Frentes abertas

- **Bloco Destilar → plugin** *(adiado até pós-migração)* — com a `destilar-transversal` criada (2026-05-29), o bloco **Destilar** passou a ter 2 skills → é o primeiro candidato a virar *plugin* pelo método. **Não criar agora:** plugin local exige registrar marketplace local em `plugins/known_marketplaces.json` / `installed_plugins.json` com **caminhos absolutos** (`C:\Users\pedro\...`) — estado frágil que arrisca quebrar na troca de máquina; skills soltas em `skills/` migram copiando a pasta, sem perda funcional. Retomar com a máquina nova estável: `/plugin marketplace add <dir-local>` + `/plugin install`, agrupando as duas skills `destilar-*`.
- **Bloco Construir → plugin** *(decidido 2026-05-29; criar pós-sessão, junto da retomada pós-migração)* — a esteira agora tem 5 skills de estágio (`grill-me`, `prototype`, `to-prd`, `to-issues`, `tdd`). **Tensão a resolver na criação:** o método pede ≥2 skills *próprias* pra virar plugin, mas essas 5 são todas mattpocock (third-party copiadas) — agrupar third-party num plugin "seu" é caso que o método ainda não cobre. A QA mistura built-in do Claude Code (não-empacotáveis) + `improve-codebase-architecture`.
- **Implementar o Expor** — o bloco foi **desenhado 2026-05-29** (papéis + esteira `Dossiê → Arco → Escrita+crítica`, ver "Método de gerência"). Duas pendências com motivos distintos:
  - **Virar skill** — **rodou na mão pela primeira vez em 2026-05-30** (projeto SAEP, post "Construí um sistema sem entender o problema" — artefatos no Notion: [Expor](https://www.notion.so/370ab645e3bb8125abbbf8df517a76ca) → [post](https://www.notion.so/370ab645e3bb816b830bde6af1301465), movidos de `peri-care-companion/docs/expor/` em 2026-05-30 pra fora do repo público). O gatilho da **Regra de criação** está cumprido: a esteira girou inteira (Dossiê→Arco→Escrita+crítica→post) e duas rachaduras já foram destiladas pra cima (o andaime na Escrita; o "perguntar o encadeamento" no Dossiê). **Não** bloqueado pela migração (skill solta em `skills/` migra copiando a pasta, ver frente do plugin Destilar). **Decidido 2026-05-30: rodar mais uma vez antes de empacotar** — n=1, e a 1ª rodada *virou* um contrato central (o "Claude não entrega prosa" → andaime), então o contrato mais novo tem só um contato. A 2ª rodada deve ser num **tema diferente** e testar: (a) se o contrato do andaime aguenta; (b) se o movimento Dossiê funciona com **âncora bagunçada** (a do SAEP teve dois enunciados de problema datados, espinha fácil — pode ter sido sorte); (c) se roda **frio** (a 1ª foi com Claude de contexto profundo no projeto). Só depois destilar em skill.
  - **Plataforma do blog** — onde o output público vive. Implementação pura; decidir quando for publicar de fato.
- **Aprender → virar skill** *(desenho fechado 2026-05-30; gatilho: rodar a esteira na mão uma vez)* — **não** bloqueado pela migração (skill solta em `skills/` migra copiando a pasta). Mesmo bloqueio do Expor: a esteira interna (fontes → instruções → NotebookLM → consolidação → mapa) nunca girou na mão. Quando houver um tema real pra aprender, rodar o fluxo ad-hoc — lendo a "Esteira interna do Aprender" deste arquivo por caminho absoluto, já que o bloco não é global — e só então destilar em skill se valer.
- **Navegador (ponto-de-entrada) → rodou na mão 2x em 2026-05-30; n=2 rachou na mesma fronteira → candidata a skill, núcleo identificado** — Resolve o *custo da composabilidade*: como os blocos compõem sem ordem fixa (linha 17, *"a sequência emerge de 'que artefato existe' + 'o que Pedro escolhe chamar'"*), não há ponto de partida óbvio quando Pedro tem a vontade mas não sabe por onde começar. O navegador lê o **método** (CONTEXT global) + o **estado** do projeto (local), grelha a próxima jogada uma pergunta por vez, e sugere quais blocos/skills chamar mostrando qual artefato/contrato disparou cada escolha. **Não virou skill** — instância da linha 63 (nunca tinha rodado na mão) somada a: o Claude já lê o CONTEXT toda sessão + o grelho já existe, então é prompt ad-hoc, não skill. Régua de design que protege a autonomia: o grelho é *load-bearing* (a sugestão emerge das respostas de Pedro, o Claude não decide) e a sugestão mostra o *porquê* (qual contrato disparou), pra ensinar a auto-rotear em vez de virar muleta. Prompt reusável:
  ```
  Aja como o navegador (hand-run, teste da linha 63).
  0. Primeiro lê C:\Users\pedro\.claude\CONTEXT.md — é o mapa do MÉTODO
     (blocos, contratos, regra da linha 63). É isso que você está executando.
  1. Depois lê o ESTADO deste projeto: .claude local, CLAUDE.md, README, git.
  2. Me grelha uma pergunta por vez até entender minha PRÓXIMA jogada — não o
     projeto inteiro.
  3. Só então sugere o caminho: quais blocos/skills chamar e em que ordem,
     mostrando qual artefato/contrato disparou cada escolha.
  Regras: o grelho é load-bearing — a sugestão tem que emergir das minhas
  respostas, não decida por mim. E me diz onde rachou no fim.
  ```
  **Furo a resolver se um dia virar skill:** o método é global, o estado é local — ela moraria global mas roda local. Previsto na sessão de desenho como primeiro candidato a "onde racha". **Confirmado na 1ª rodada real na mão (2026-05-30, fase1):** rachou exatamente nessa fronteira método↔projeto, com dois sintomas concretos — (a) grelhou na camada de *conteúdo* (o código do exercício) sem captar que a intenção era *meta* (fazer o exercício rodar pelo método): falta uma **pergunta de camada** logo no início ("essa jogada é sobre o conteúdo, sobre o método, ou sobre fazer o conteúdo rodar pelo método?"); (b) a conclusão útil dependeu de **cruzar este CONTEXT com o CLAUDE.md local** pra ver que a skill mapeada pro estágio se anula contra a dinâmica do projeto. Pela linha 63, **n=1 não empacota**: rodar na mão mais uma vez; se a fronteira rachar de novo, a "pergunta de camada" + "carregar os dois docs" viram o núcleo da SKILL.md. **2ª rodada (2026-05-30, projeto `health-plan-authorization`, independente da fase1): rachou igual** — o Claude grelhou jogadas locais (destilar docs, proposta da Etapa 1, reorg por natureza) e a intenção *meta* real ("tornar o projeto compatível com os blocos do método") só emergiu lá no fim, depois de várias jogadas. **n=2 na mesma fronteira → gatilho atingido.** Núcleo da futura SKILL.md: (1) abrir com a **pergunta de camada** ("essa jogada é sobre conteúdo, método, ou fazer o conteúdo rodar pelo método?"); (2) **carregar CONTEXT global + CLAUDE local juntos** desde o início. Nota de evidência: o palpite "navegador é postura, não skill" caiu — a fronteira rachar mesmo com o prompt ad-hoc mostra que o ad-hoc não basta, a skill agrega. Próximo passo: construir a skill (quando é decisão do Pedro).
- **Revisar projetos ativos compatibilizados com o método** *(em andamento desde 2026-05-30)* — Pedro aplicou o prompt-navegador acima nos projetos ativos pra torná-los compatíveis com os blocos; o Claude faz a **revisão/feedback** do estado de cada um contra o método. Entrada: Pedro aponta os projetos. **Como buscar as decisões num projeto:** o *commit de adoção do método* (msg tipo "adopt method blocks") + os docs destilados (CLAUDE/CONTEXT/COLABORACAO locais) vencem as transcrições `.jsonl` cruas — é o destilado que precisa ser lido. **Revisados e ajustados (commits no próprio repo):** `fase1`, `health-plan-authorization`. Pendentes: os que Pedro ainda apontar.
- **Skills hardcodam caminhos de raiz que projetos sobrescrevem** *(achado 2026-05-30, na revisão dos projetos)* — `consolidar-pesquisa` escreve em `.claude/research/<slug>.md` e `to-prd` escreve o PRD na raiz; mas projetos reais põem esses artefatos em `docs/` por natureza (ex.: `health-plan`: `docs/pesquisa/`, `docs/construcao/`). Duas skills, **mesmo desalinhamento** → tratar como **um** fix, não dois soltos: as skills precisam aceitar destino configurável em vez de hardcodar. Trabalho transversal (das skills), não de nenhum projeto. A instância por-projeto fica no CONTEXT local do projeto; aqui mora o padrão.
- **Outras peças da orquestração** que Pedro guardou para trazer depois.
- **Página Notion do mapa** — ✅ criada 2026-05-31: [Método de gerência — blocos componíveis](https://www.notion.so/370ab645e3bb816f9e75d7db2d241b5b), sub-página de "Sistema de gestão", aponta pro `metodo-gerencia-v2.excalidraw`. Pendência residual: embutir o desenho na própria página (hoje só linka o arquivo local).
- **Análise retrospectiva do `history.jsonl`** — 1.129 prompts em `C:\Users\pedro\.claude\history.jsonl` (06/04/2026 → presente). Adiado até o sistema mínimo girar. Quando retomar: copiar pra fora do `.claude/` (editar in-place quebra a up-arrow), definir critérios de filtro juntos, analisar em ondas.

## Construções vivas no Notion

Página raiz: [Sistema de gestão](https://www.notion.so/36eab645e3bb8160969adc118f4bf38d) · database [Construções](https://www.notion.so/0fc713f696674fe3ace03860d22231b3).

- **[Mapeamento bagunçado de ideias de negócio](https://www.notion.so/36eab645e3bb81c7bd18c48860e01b06)** — rascunho. Próxima sessão: brainstorm livre.
