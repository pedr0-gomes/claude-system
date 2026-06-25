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
- **▶ Retomar a partir de C6 Bank.** Faltam ~21: resto do BR ecosystem (C6 Bank,
  QuintoAndar, iFood, Tecnoblog, Canaltech, TechTudo, Olhar Digital, TecMundo) +
  Founder-watching *inteiro* (10) + F1 (@F1, Charles Leclerc) + Filmes (Netflix Brasil).

**YouTube — ✅ completo (2026-06-24):** 16 canais inscritos numa sessão, sem bloqueio
(confirma que o teto era específico do X). A ambiguidade do "Chase AI" → @Chase-H-AI
(137K, Claude Code/agentes/n8n) foi **confirmada por Pedro** como o canal certo.

---

## Prompt de continuação — pronto pra colar (a partir de C6 Bank)

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
> **Ecossistema tech/startup BR (resto)** (buscar conta oficial por nome): C6 Bank,
> QuintoAndar, iFood; Tecnoblog, Canaltech, TechTudo, Olhar Digital, TecMundo
>
> **Founder-watching — hábitos & lições de operação** (buscar por nome; priorizar quem
> posta sobre *como opera*): Tim Cook, Satya Nadella, Sundar Pichai, Andy Jassy,
> Mark Zuckerberg, Mary Barra, Michael Dell, Patrick Collison, Brian Chesky,
> Henrique Dubugras
>
> **F1 (âncora pessoal):** @F1, Charles Leclerc
>
> **Filmes (âncora pessoal, leve):** buscar e seguir Netflix Brasil
>
> **Ao terminar (ou ao parar por limite):** me diga quais contas seguiu, quais não
> encontrou, e se alguma busca por nome ficou ambígua — pra eu decidir.

~21 contas restantes ÷ teto ~14/janela ⇒ provavelmente **1-2 janelas** pra fechar o X.

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
