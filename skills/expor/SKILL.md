---
name: expor
description: Transforma um destilado interno + a jornada bruta (transcrição,
  marcadores "marca isso") num post público, por uma esteira Dossiê → Arco →
  Escrita+crítica. A voz é de Pedro; o Claude faz andaime de prosa substituível
  e critica SEM reescrever. Use quando Pedro quer escrever um post, virar um
  aprendizado/decisão em texto público, ou disser "expor", "escrever sobre
  isso", "vira um post". NÃO é pra documentação interna (isso é destilar-*) nem
  pra decidir conteúdo no lugar de Pedro — o conteúdo nunca é do Claude.
---

# Expor

Pega um **destilado interno** (a decisão/tema já arrumado) mais a **jornada
bruta** (transcrição + marcadores "marca isso") e, por esteira, vira um post
público. O destilado é a **âncora** (o quê); a jornada é o **como/por quê** que
o destilado descarta de propósito — é ela que dá vida ao texto.

A skill é o **motor**: gera volume escrevendo. **Audiência** e **portfólio** são
curadorias *a jusante*, sobre o corpo de posts já publicados — não trilhas que
rodam por-post (servir os três de cara mataria a frequência).

## A régua

- **A voz é de Pedro.** O Claude entrega a primeira prosa como **andaime
  substituível** — pra tirar Pedro da página em branco, não pra escrever por
  ele. Pedro reescreve na voz dele; o Claude então **critica sem reescrever**.
- **O conteúdo nunca é do Claude.** A jornada verdadeira — o que aconteceu, em
  que ordem, por quê — é de Pedro. O Claude apresenta a evidência do destilado,
  mas **pergunta o encadeamento, não deduz**.
- O andaime **pega onde há voz, não onde há fato.** Parágrafo factual (descreve
  o problema, o mecanismo) passa quase intacto e tudo bem; é nos parágrafos de
  reflexão/jornada que a voz mora — é lá que o andaime não pode sequestrar.

## Carregar primeiro

1. **Âncora** — o destilado interno do tema (decisão, aprendizado). Arruma a
   ordem real; é o esqueleto factual.
2. **Jornada** — transcrição da(s) sessão(ões) + marcadores "marca isso". É o
   como/por quê, a matéria-prima da voz.
3. **Destino** — a linha editorial de onde o post vai viver (ex.: blog pra
   estudantes de CC, eixo: fundamento de CC escondido na jornada técnica real).
   Entra como **parâmetro de contexto**, não como gerador — quem gera é o motor.

**Racionar contexto entre posts da mesma série** *(2026-06-26)*: um projeto-fonte
costuma alimentar vários posts (3–4). Cada post revela **só a fatia de contexto
que a sua tese precisa** — despejar todo o contexto do projeto satura o leitor e
mata o frescor dos próximos. Contexto é recurso a **racionar entre a série**, não
a gastar de uma vez.

**Onde os artefatos vivem:** no **Notion**, sob "Sistema de gestão → ✍️ Expor".
**Nunca no repo** — o raciocínio expositivo é privado; só o post final e o
código vão a público.

**De onde cada fase roda** *(2026-06-30)*: o artefato vive no Notion, mas
**produção** e **cura** tiram insumo de lugares diferentes — de propósito. A
**produção** roda *dentro do repo do projeto*: lá estão o código real e o
CONTEXT que aterram o post no que aconteceu (fatia técnica certa, exemplos
reais). A **cura de coerência com os valores** roda no *hub* (`claude-system`),
onde vivem perfil, critérios (Coesão·Coerência·Legibilidade) e método. O repo dá
o contexto técnico; o hub dá os valores. Fluxo: **sessão-no-repo → cura-no-hub →
artefato-no-Notion**. Não fere "nunca no repo": o artefato segue no Notion; muda
só de onde cada fase tira insumo.

## A esteira: Dossiê → Arco → Escrita+crítica

### Dossiê — Claude monta, Pedro aprova o tema

O Claude junta a matéria bruta (marcadores + destilado) e propõe o tema. **Pedro
escolhe/aprova.** Régua dupla:

- **Apresenta a evidência, pergunta o encadeamento.** O destilado mostra *o
  quê*; a causa e a ordem da jornada são de Pedro — não as deduza.
- **Critério de curadoria do destino:** "este destilado toca um fundamento
  ensinável ao público do destino?" Se não toca, não é tema pra esse destino.

### Arco — Claude propõe, Pedro aprova

Esqueleto narrativo `tensão → virada → lição`. **A lição pode mudar no meio da
Escrita** — escrever revela qual era o ponto real. Quando isso acontecer, o loop
volta pra cá: re-proponha o arco **sem sequestrar a voz**. É o *pensar
escrevendo* funcionando, não um erro.

### Escrita+crítica — Pedro escreve, Claude faz andaime + critica

1. Claude entrega a **1ª prosa como andaime substituível**.
2. Pedro reescreve na voz dele.
3. Claude **critica sem reescrever** — ver "A crítica" abaixo.

## A crítica — onde mirar

As edições de Pedro tendem a **remover voz, não adicionar** (achado
contra-intuitivo): ao editar por cima onde "soa natural", ele achata pro
genérico e desliza pro explainer. A crítica existe pra vigiar isso. Regras:

- **Molde, não frase.** Dá o *molde* da frase-tese — o sujeito é Pedro
  descobrindo, não o leitor instruído ("foi só quando... que eu entendi") — e
  **nunca a frase pronta**. Recusa reescrever a tese mesmo sob pedido: é o ponto
  onde a voz é mais fácil de sequestrar.
- **Vigia o achatamento, sem reescrever.** Aponta onde a edição apagou a voz
  (trocou o concreto pelo genérico, virou ordem ao leitor) — Pedro restaura
  sozinho. Vigia, não conserta.
- **Autoridade aterrada vs. flutuante** — não o pronome. "Você" não é gênero B.
  O eixo é se a lição **conduz pela experiência/mecanismo** (aterrada, ok) ou
  **decreta regra do nada** (flutuante, é o explainer). Mira a lição flutuante.
- **Gênero A: âncora no caso real.** Fechar no conceito empurra pro explainer
  genérico; a âncora no caso concreto (o problema real, a jornada) é o que
  segura o A. Cada ajuste de altitude (mais conceito ↔ mais jornada) move a peça
  nesse eixo — vigia.
- **Fonte visual reforça; tabela de referência não.** Um post denso de texto
  pede um respiro visual — mas ele só vale se **reforça a tese e ancora nos
  exemplos reais** (ex.: diagrama do custo, acesso direto × percorrer). Uma
  **tabela de referência** (pergunta→estrutura genérica) é gênero B: decreta um
  mapeamento pra decorar (autoridade flutuante) e precisa de casos que Pedro não
  viveu → o conteúdo vira do Claude. O visual certo dramatiza o que Pedro
  descobriu; o errado é cola de consulta.
- **Ordenação bottom-up.** Evidência antes da reflexão — também no
  sequenciamento dos parágrafos (o código/artefato antes do parágrafo que
  reflete sobre ele). Não gasta o takeaway da tese antes da hora.

## Quando parar

Pare quando o post estiver publicável na voz de Pedro — não quando "ficou
bom pro Claude". O critério é a voz dele aguentar de pé, não a prosa estar
polida.

## Saída

**Post publicável** (no Notion, sob ✍️ Expor), pronto pra ir à plataforma do
destino.

**Todo post fecha com um convite ao repo de origem** — link pro repositório de
onde os exemplos saíram. Prova que o código é real (reforça o gênero A) e
materializa o "nasce público". A frase do convite é **andaime substituível** (a
voz é de Pedro). Antes de publicar: repo **público** e **pushado** (o código no
GitHub bate com o post).

A jusante, sobre o corpo de posts já publicados (não por-post):

- **Destaque** (audiência) — Claude sugere, Pedro decide.
- **Seleção** (portfólio) — Claude propõe os melhores, Pedro cura.
