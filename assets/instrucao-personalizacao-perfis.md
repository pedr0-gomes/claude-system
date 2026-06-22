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
4. **Ritmo humano, devagar.** O Google já bloqueou por criar contas em sequência
   rápida; follows em massa por bot numa conta nova disparam anti-spam do X. Seguir
   **em ritmo pausado**, com intervalos, não tudo em minutos.

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

## Reuso pras outras redes (ordem: X → YouTube/Reddit → FB/LinkedIn/IG)

Mesma lógica, trocando "seguir contas" por:
- **YouTube** — inscrever nos canais. Lista do recon por cluster: ByteByteGo, NeetCode,
  Core Dumped, CS50 (CC) · Greg Isenberg, Marc Lou, Y Combinator, Starter Story
  (solo-founder) · AI Engineer, Matt Pocock, Chase AI, Karpathy (AI eng) · Jeff Su
  (PKM) · David Perell (writing) · FORMULA 1 (F1) · trailers Netflix/Paramount (filmes).
  Saúde fora (cultivo manual), futebol/Copa e investing fora (cortados).
- **Reddit** — entrar nos subs por cluster (o Pedro define quais; agente não decide).

Saúde, futebol/Copa e markets/investing **sempre fora** do agente, em todas as redes.
