# Instrução de personalização de perfis — agente de browser

Prompt pra colar num **agente de browser logado na conta NOVA** do Pedro (handle
unificado `@pgsampaioitz`). Objetivo: semear o feed seguindo a **lista-mestre de
interesses** (`lista-mestre-interesses.md`) com contas concretas derivadas do recon.
2ª instância do padrão "agente faz o que o Claude não alcança" (a 1ª foi o recon).

## Travas de design (por que a instrução é como é)

1. **Identidade fica na mão do Pedro, não no agente.** Bio, foto e handle são o rosto
   da conta — ato de credibilidade. O agente **só segue contas**; não mexe em perfil.
2. **O agente executa a lista, não decide quem seguir.** A curadoria é do Pedro
   (decidir antes de agir). Onde a instrução dá nome em vez de @handle, o agente
   **busca e segue**, mas não inventa contas fora da lista.
3. **Saúde fica fora do agente.** É cultivo deliberado, sem contas no consumo real —
   o agente garimpando "health" encheria o feed de ruído aspiracional no cluster mais
   sensível. Pedro semeia saúde **na mão**, curado.
4. **Ritmo humano, devagar — e fatiado em sessões.** O Google já bloqueou por criar
   contas em sequência rápida; follows em massa por bot numa conta nova disparam
   anti-spam do X. **Lição do 1º giro (2026-06-24): ritmo pausado não basta** — conta
   nova tem **teto de follows por janela** (não só por minuto). O agente seguiu 15 e
   levou `HTTP 429` ("Too Many Requests") a partir do @shreyas, mesmo espaçando. O
   gargalo é o teto, não a cadência. Conserto: **fatiar em várias sessões/dias** (1-2
   clusters por vez), não drenar a lista de uma vez; e **não re-testar com o limite
   quente** (cada 429 sustenta o cooldown — ecoa o guard do bloqueio do Google).

---

## Prompt pro agente (plataforma atual: X)

**Contexto:** Você está no meu navegador, logado na minha conta nova do X (handle
`@pgsampaioitz`). Quero que você **siga** as contas da lista abaixo, agrupadas por
tema. Onde eu der o @handle, siga direto; onde eu der só o nome, **busque a conta
oficial e siga**. **Não siga contas fora desta lista** — a curadoria é minha. **Não
toque no meu perfil** (bio/foto/nome). **Siga em ritmo pausado**, com intervalos
entre os follows, para não disparar o anti-spam — não siga tudo de uma vez.

**Fundamentos de CC:**
@bytebytego, @CompSciFact, @TivadarDanka, @QuantaMagazine, @TechWithTimm,
@mattpocockuk, @joelgrus

**Solo-founder / build-in-public / leverage com AI:**
@marclou, @gregisenberg, @startupideaspod, @ycombinator, @snowmaker,
@aaron_epstein, @paulg, @hnshah, @shreyas, @ryancarson, @Av1dlive, @sairahul1

**AI engineering / agentic / Claude:**
@claudeai, @anthropicai, @bcherny, @DarioAmodei, @aiDotEngineer, @latentspacepod,
@steipete, @chaseai__, @karpathy, @jeremyphoward, @fchollet, @ylecun, @GaryMarcus,
@hardmaru, @theneurondaily, @genspark_ai, @mntruell, @ScottWu46, @petergyang

**Vendas / customer discovery:**
@Benioff, @gustavocaetano

**Sistemas de conhecimento / PKM / writing:**
@david_perell

**Ecossistema tech/startup BR** (buscar contas oficiais por nome):
Tallis Gomes, Bruno Nardon, Romero Rodrigues, Lucas Montano, Rafael Milagre (Viver de
IA), Código Fonte TV; Nubank, C6 Bank, QuintoAndar, iFood; Tecnoblog, Canaltech,
TechTudo, Olhar Digital, TecMundo

**Founder-watching — hábitos & lições de operação** (buscar por nome; priorizar quem
posta sobre *como opera*, não só presença):
Tim Cook, Satya Nadella, Sundar Pichai, Andy Jassy, Mark Zuckerberg, Mary Barra,
Michael Dell, Patrick Collison, Brian Chesky, Henrique Dubugras

**F1 (âncora pessoal):**
@F1, Charles Leclerc

**Filmes (âncora pessoal, leve):**
buscar e seguir Netflix Brasil

**Ao terminar:** me diga quais contas seguiu, quais não encontrou, e se alguma
busca por nome ficou ambígua (mais de uma conta plausível) — pra eu decidir.

---

## Estado da execução (atualizar a cada sessão)

**1ª sessão — 2026-06-24:** 15 contas seguidas antes do X bater o teto (`HTTP 429`).
- **Confirmadas (15):** Fundamentos de CC *completo* (@bytebytego, @CompSciFact,
  @TivadarDanka, @QuantaMagazine, @TechWithTimm, @mattpocockuk, @joelgrus) +
  solo-founder *parcial* (@marclou, @gregisenberg, @startupideaspod, @ycombinator,
  @snowmaker, @aaron_epstein, @paulg, @hnshah).

**2ª sessão — 2026-06-24:** 14 follows novos antes do X bater o teto de novo (`HTTP
429` em @GaryMarcus; @shreyas já era seguido, pulado). Guard funcionou — parou no 1º
429 e reportou.
- **Confirmadas (14):** resto do solo-founder (@ryancarson, @Av1dlive, @sairahul1) +
  AI engineering *parcial* (@claudeai, @anthropicai, @bcherny, @DarioAmodei,
  @aiDotEngineer, @latentspacepod, @steipete, @chaseai__, @karpathy, @jeremyphoward,
  @fchollet, @ylecun).
- **▶ Retomar a partir de @GaryMarcus** (o follow NÃO concluiu — botão voltou a
  "Follow"). Faltam: resto do AI engineering (@GaryMarcus, @hardmaru, @theneurondaily,
  @genspark_ai, @mntruell, @ScottWu46, @petergyang) + clusters inteiros Vendas, PKM,
  BR ecosystem, Founder-watching, F1, Filmes.
- **Teto confirmado ~14-15 follows/janela** (15 na 1ª, 14 na 2ª). É **por janela**, não
  por cadência — esperar reset (horas, possivelmente teto diário em conta nova) antes de
  retomar; **não re-testar com o limite quente** (cada 429 sustenta o cooldown).
- **Como retomar:** montar o prompt de continuação a partir do prompt principal acima,
  cortando o que já foi feito, e instruir o agente a **parar no 1º 429 e reportar onde**.

**3ª sessão — 2026-06-25:** 14 follows novos; o agente **parou proativamente** rente
ao teto (não disparou 429 — guard de ritmo funcionou). X agora com **43 contas**.
- **Confirmadas (14):** resto do AI engineering (@GaryMarcus, @hardmaru,
  @theneurondaily, @genspark_ai, @petergyang) + Vendas *completo* (@Benioff,
  @gustavocaetano já era) + PKM *completo* (@david_perell) + BR ecosystem *parcial*
  (@tallisgomes, @brunonardon, @romerorodrigues, @lucas_montano, @RafaelMilagre,
  @codigofontetv, @nubank).
- **Já seguidos (não contaram):** @mntruell, @ScottWu46, @gustavocaetano.
- **Clusters fechados até aqui:** Fundamentos CC, solo-founder, AI engineering,
  Vendas, PKM. **AI engineering ✅ completo.**
- **Ambiguidades reportadas pelo agente (Pedro decide):** (i) *Código Fonte TV* → o
  agente pegou **@codigofontetv** (handle bate com o canal do YouTube); existe um
  @CodigoFonte ("CodigoFonte.net") que é portal **diferente** — picK do agente parece
  certo. (ii) *Rafael Milagre* → **@RafaelMilagre** ("Founder of Live on AI" = nome EN
  de Viver de IA + "AI Mentor at G4business") — provável certo, "Viver de IA" não
  aparece literal na bio.
- **Retomar a partir de C6 Bank** *(consumido na 4ª sessão abaixo).*

**4ª sessão — 2026-06-25:** 14 follows novos; o agente **parou proativamente** rente
ao teto (~14-15), sem disparar 429 (parada precaucionária). X agora com **57 contas**.
- **Confirmadas (14):** Ecossistema BR *completo* (@C6Bank, @quintoandar, @iFood,
  @Tecnoblog, @canaltech, @TechTudo, @olhardigital, @Tec_Mundo) + Founder-watching
  *parcial 6/10* (@tim_cook, @satyanadella, @sundarpichai, @ajassy, @finkd `=Zuckerberg`,
  @mtbarra `=Mary Barra`, parou aqui).
- **Clusters fechados até aqui:** Fundamentos CC, solo-founder, AI engineering, Vendas,
  PKM, **Ecossistema tech/startup BR ✅ completo.**
- **Ambiguidade conferida pelo agente:** TecMundo → @Tec_Mundo (verificado no perfil:
  993K seguidores, links tecmundo.com.br; sem badge no resultado de busca, conferido na mão).
- ~~**▶ Retomar a partir de Michael Dell.** Faltam ~7~~ → consumido na 5ª sessão.

**5ª sessão — 2026-06-26:** 7 follows, **sem 429** (a janela aguentou as 7). X agora
com **64 contas** — **✅ X CONCLUÍDO.**
- **Confirmadas (7):** Founder-watching *completo* (@MichaelDell, @patrickc `=Collison`,
  @bchesky `=Brian Chesky`, @hdubugras `=Henrique Dubugras`) + F1 (@F1, @Charles_Leclerc)
  + Filmes (@NetflixBrasil, selo dourado).
- **Ambiguidade conferida pelo agente:** "Netflix Brasil" tinha fan/paródia logo abaixo
  (Netflix Games Brasil, One Piece Netflix Brasil); seguiu só a oficial @NetflixBrasil.
- **Achado:** a 5ª janela aceitou 7 sem disparar o teto — coerente com "~14-15/janela"
  (folga sobrou). Fim da fila do X, não foi preciso testar o teto de novo.

**YouTube — ✅ completo (2026-06-24):** 16 canais inscritos numa sessão, sem bloqueio
(confirma que o teto era específico do X). A ambiguidade do "Chase AI" → @Chase-H-AI
(137K, Claude Code/agentes/n8n) foi **confirmada por Pedro** como o canal certo.

---

## Prompt de continuação — pronto pra colar (a partir de Michael Dell)

Cola num agente de browser logado em `@pgsampaioitz` quando a janela de follows do X
resetar. Reflete o estado de retomada acima; atualizar conforme avançar.

> **Contexto:** Você está no meu navegador, logado na minha conta do X
> (`@pgsampaioitz`). Continue **seguindo** as contas da lista abaixo, na ordem dada.
> Onde eu der o @handle, siga direto; onde der só o nome, **busque a conta oficial e
> siga**. **Não siga contas fora desta lista** — a curadoria é minha. **Não toque no
> meu perfil** (bio/foto/nome).
>
> **Limite:** esta conta é nova e tem teto de follows por janela (~14-15) — já bateu
> `HTTP 429`. **Vá devagar, com intervalos.** Se aparecer erro de limite (429 / "rate
> limited" / botão de seguir falhando), **pare imediatamente, não insista, e me reporte
> em qual conta parou.** Não re-tente a mesma conta.
>
> **Founder-watching — hábitos & lições de operação** (buscar por nome; priorizar quem
> posta sobre *como opera*): Michael Dell, Patrick Collison, Brian Chesky,
> Henrique Dubugras
>
> **F1 (âncora pessoal):** @F1, Charles Leclerc
>
> **Filmes (âncora pessoal, leve):** buscar e seguir Netflix Brasil
>
> **Ao terminar (ou ao parar por limite):** me diga quais contas seguiu, quais não
> encontrou, e se alguma busca por nome ficou ambígua — pra eu decidir.

~7 contas restantes ⇒ provavelmente **1 janela** pra fechar o X.

---

## Prompt pro agente (Instagram) — adicionado 2026-06-25

**Natureza da rede (por que a lista do IG ≠ a do X).** O Instagram é plataforma *mais
leve*, de **pessoas e imagem**. O Pedro o usa pra acompanhar **pessoas-referência** das
áreas de interesse — gente que **inspira e educa ao divulgar sobre si / como opera**,
não portal de notícia nem conta de marca. Por isso a lista do IG é **curada pra
pessoas**: os **portais** (Tecnoblog, Canaltech, TechTudo, Olhar Digital, TecMundo) e as
**marcas corporativas** (Nubank, C6 Bank, QuintoAndar, iFood, Código Fonte TV) que
faziam sentido no X **saem por padrão** — Pedro restaura caso a caso. Ficam: âncoras
pessoais que são marca de propósito (F1, Netflix) e contas que **educam visualmente**
(ByteByteGo, Quanta).

**Teto de follows — mais rígido que o X.** Conta nova de Instagram tem anti-spam
agressivo: bloqueia a ação ("**Action Blocked**" / "**Try Again Later**" / "We restrict
certain activity") depois de **poucos** follows, sobretudo se rápidos. Vale a trava 4
do X, **reforçada**: começar **bem conservador** (~5-10 follows na 1ª sessão), ritmo
lento com intervalos, e **parar no 1º bloqueio sem insistir** (cada bloqueio sustenta o
cooldown). Fatiar por cluster ao longo de dias. As demais travas valem iguais:
identidade fica na mão (agente só segue), **saúde fora do agente** (cultivo manual), o
agente **executa a lista, não decide quem seguir**.

**Lista curada pra IG (pessoas-primeiro).** Onde há só nome, o agente busca a conta
oficial e segue; se não achar IG ativo (muitos thinkers de CC/AI são X-native), reporta
e segue em frente.

- **Founder-watching — como operam** (núcleo forte no IG; pessoas que mostram a
  operação/bastidor): Tim Cook, Satya Nadella, Sundar Pichai, Mark Zuckerberg,
  Brian Chesky, Patrick Collison, Henrique Dubugras, Andy Jassy, Mary Barra, Michael Dell
- **Solo-founder / build-in-public** (pessoas): Greg Isenberg, Marc Lou, Aaron Epstein,
  Ryan Carson, Rahul (@sairahul1). *X-native, tentar e reportar se sem IG:* Paul Graham,
  Shreyas Doshi, Hiten Shah
- **BR ecossistema — pessoas** (forte no IG BR): Tallis Gomes, Bruno Nardon,
  Romero Rodrigues, Lucas Montano, Rafael Milagre (Viver de IA)
- **AI engineering** (fit fraco no IG; tentar e reportar): Andrej Karpathy, Dario Amodei,
  Yann LeCun, Jeremy Howard. *Marca, opcional (Pedro decide):* @claudeai, @anthropicai
- **CC / educação visual** (entram por educar com imagem): @bytebytego, Quanta Magazine,
  Tech With Tim
- **Vendas:** Marc Benioff, Gustavo Caetano
- **Escrita / PKM:** David Perell
- **F1 (âncora pessoal):** @F1, Charles Leclerc
- **Filmes (âncora pessoal, leve):** Netflix Brasil

### Prompt pronto pra colar (Instagram)

Cola num agente de browser logado em `@pgsampaioitz` no Instagram.

> **Contexto:** Você está no meu navegador, logado na minha conta nova do **Instagram**
> (`@pgsampaioitz`). Quero que você **siga** as pessoas/contas da lista abaixo. Onde eu
> der o @handle, siga direto; onde der só o nome, **busque a conta oficial e siga**.
> **Não siga contas fora desta lista** — a curadoria é minha. **Não toque no meu perfil**
> (bio/foto/nome).
>
> **Limite (importante):** esta conta é **nova** e o Instagram bloqueia ações em massa.
> **Vá bem devagar, com intervalos entre os follows.** Se aparecer qualquer aviso de
> bloqueio ("Action Blocked", "Try Again Later", "We restrict certain activity", ou o
> botão de seguir falhar/voltar pra "Seguir"), **pare imediatamente, não insista, e me
> reporte em qual conta parou.** Não re-tente a mesma conta.
>
> **Founder-watching** (buscar por nome): Tim Cook, Satya Nadella, Sundar Pichai,
> Mark Zuckerberg, Brian Chesky, Patrick Collison, Henrique Dubugras, Andy Jassy,
> Mary Barra, Michael Dell
>
> **Solo-founder / build-in-public** (buscar por nome): Greg Isenberg, Marc Lou,
> Aaron Epstein, Ryan Carson, Rahul Vohra; e tente Paul Graham, Shreyas Doshi, Hiten Shah
> (podem não ter Instagram ativo — se não achar, me avise e siga em frente)
>
> **Referências BR** (buscar por nome): Tallis Gomes, Bruno Nardon, Romero Rodrigues,
> Lucas Montano, Rafael Milagre (Viver de IA)
>
> **AI / tecnologia** (buscar por nome; podem não ter IG ativo): Andrej Karpathy,
> Dario Amodei, Yann LeCun, Jeremy Howard
>
> **Educação visual de tecnologia:** @bytebytego, Quanta Magazine, Tech With Tim
>
> **Vendas:** Marc Benioff, Gustavo Caetano · **Escrita:** David Perell
>
> **F1:** @F1, Charles Leclerc · **Filmes:** Netflix Brasil
>
> **Ao terminar (ou ao parar por bloqueio):** me diga quais contas seguiu, quais não
> encontrou, e se alguma busca por nome ficou ambígua (mais de uma conta plausível) —
> pra eu decidir.

**Estado da execução (Instagram): ✅ CONCLUÍDO 2026-06-25.**

**1ª sessão — 2026-06-25:** lista **inteira numa sessão, 25 follows, SEM nenhum
bloqueio** ("Action Blocked"/"Try Again Later" nunca apareceram). **Derruba a previsão**
"IG mais rígido que o X" (o X travou em ~14-15; o IG fez 25 limpo) — **n=1**, não
generalizar: pode ser que o IG não limite follow de conta verificada do mesmo jeito, ou
que o teto seja por *velocidade* e o ritmo lento do agente o evitou. Vigiar se o IG
bloqueia em sessões futuras antes de relaxar o guard.
- **Seguidas (25):** Founder-watching — @satyanadella (privada, pedido enviado),
  @sundarpichai, @zuck, @bchesky, @patrickcollison, @hdubugras, @ajassy (privada, pedido
  enviado), @michaeldell · Solo-founder — @gregisenberg, @marclouvion, @ryancarson · BR —
  @tallisgomes, @bruno.nardon, @romerorodrigues, @lucasmontano, @rafaelmilagre · Educação
  visual — @bytebytego, @quantamag, @tech_with_tim · Vendas — @benioff, @gustavocaetano ·
  Escrita — @davidperell · F1 — @f1, @charles_leclerc · Filmes — @netflixbrasil.
- **Não encontradas (sem conta oficial/verificada):** Tim Cook (só fakes + "lethimcooktv"
  meme), Mary Barra, Rahul Vohra; Paul Graham, Shreyas Doshi, Hiten Shah (X-native, como
  previsto); **todo o grupo AI** — Karpathy, Dario Amodei, LeCun, Jeremy Howard (sem selo
  verificado, não dava pra confirmar autenticidade). Confirma o fit fraco de CC/AI no IG.
- **Decisão pendente do Pedro:** **Aaron Epstein** — @aaronepstein verificado é um
  *fotógrafo*, não o co-founder do Creative Market; agente não seguiu (pessoa errada).
  Passar o @handle certo se quiser seguir.
- **Ambiguidade resolvida pelo agente:** Romero Rodrigues → **@romerorodrigues** (bio:
  "Fundador do Buscapé, sócio da Headline e Redpoint" = o certo), não @romerorodriguespb.
- **Marcas/opcionais não incluídas neste giro:** @claudeai, @anthropicai (AI eng, marca)
  ficaram de fora — Pedro adiciona na mão se quiser.

---

## Reuso pras outras redes (ordem: X → YouTube/Reddit → FB/LinkedIn/IG)

Mesma lógica, trocando "seguir contas" por:
- **YouTube** — inscrever nos canais. Lista do recon por cluster: ByteByteGo, NeetCode,
  Core Dumped, CS50 (CC) · Greg Isenberg, Marc Lou, Y Combinator, Starter Story
  (solo-founder) · AI Engineer, Matt Pocock, Chase AI, Karpathy (AI eng) · Jeff Su
  (PKM) · David Perell (writing) · FORMULA 1 (F1) · trailers Netflix/Paramount (filmes).
  Saúde fora (cultivo manual), futebol/Copa e investing fora (cortados).
- **Reddit** — entrar nos subs por cluster (o Pedro define quais; agente não decide).

Saúde, futebol/Copa e markets/investing **sempre fora** do agente, em todas as redes.
