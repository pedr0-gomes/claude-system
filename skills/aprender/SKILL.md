---
name: aprender
description: Conduz Pedro a entender um tema — sempre a serviço de um projeto
  ou de uma cadeira (aprendizado situado, nunca curiosidade solta) —, montando
  material com NotebookLM e fechando uma nota-sombra
  inspecionável pela recontagem dele nas próprias palavras, grelhada contra as
  fontes. Recebe o redirect do investigar quando a intenção é entender/ganhar capacidade (não decidir).
  Use quando Pedro disser "quero entender X", "aprender X", "explica X a fundo",
  ou trouxer um research.md pra estudar. NÃO é pra pesquisar algo pra agir ou
  decidir — isso é o bloco Investigar.
---

# Aprender

Pega uma dúvida just-in-time ou um `research.md` (do Investigar) e conduz Pedro
a entender o tema de verdade — não a *sentir* que entendeu. A skill **não
ensina despejando**: ela monta o material com a ferramenta externa e faz Pedro
produzir a evidência de que aprendeu.

O Aprender é **sempre situado** *(decidido 2026-06-19)*: só roda a serviço de
um projeto (`~/dev/projects`) ou de uma cadeira (`~/dev/uni`). Curiosidade
solta, sem mestre, **não é movimento legítimo** — todo aprendizado do Pedro é
*by doing*, sob demanda. A fronteira com o Investigar é **entender-vs-decidir**
(Aprender ganha capacidade; Investigar pesquisa pra decidir), não mais
curiosidade-vs-ação.

O Aprender é um **bloco-sink**: o output real é intangível — capacidade interna.
Por isso precisa deixar uma **sombra inspecionável** (a nota). Sem ela, não se
distingue "aprendi" de "senti que aprendi", e não sobra âncora pro Expor. O
bloco não obriga um próximo; opcionalmente a nota vira âncora do Expor.

## A régua

Duas, entrelaçadas — são o coração da skill:

1. **A ferramenta entrega o material, Pedro produz a nota.** O NotebookLM (ou
   o Claude) entrega o bruto; a nota é de Pedro. Onde o output é estado interno,
   o Claude anda em volta e **não entrega o aprendizado pronto** — igual
   Investigar e Expor.

2. **Comprimir certo *é* a evidência.** Coverage não é aprendizado (régua do
   teach): uma nota descritiva que "cobre" o tema não prova nada. A evidência é
   Pedro **recontar os conceitos nas próprias palavras**, tight. E o Claude
   **grelha a recontagem contra as fontes do passo 1 — nunca contra o
   conhecimento paramétrico dele.** Se grelhar contra o que o Claude "sabe",
   vira autoridade do tema e alucina correção, quebrando "o conteúdo nunca é do
   Claude". A bitola são as fontes (espelha o investigar, onde a bitola é o
   contexto). Consequência load-bearing: **as fontes do passo 1 têm que
   sobreviver acessíveis até o fim** — sem fonte rastreável não há contra o quê
   grelhar.

## A esteira

```
fontes (Pedro+Claude) → diagnóstico do formato (Claude grelha) →
instruções (Pedro aprova) → NotebookLM entrega material →
recontagem-grelhada peça-a-peça → nota consolidada
```

1. **Seleção de fontes** — co-pilotagem: alimenta o NotebookLM *e* dá contexto
   ao Claude pra instruir bem. Se a entrada é um `research.md` cuja bibliografia
   não veio junto, decida aqui se recupera as fontes primárias — senão a régua
   "grelhar contra as fontes" fica frouxa (uma síntese não-auditada não é
   bitola). **Curadoria importa: uma fonte densa demais sequestra o material** e
   enviesa o que o NotebookLM gera. Equilibre o *peso entre* fontes — mas
   **corte no prompt, nunca ampute a fonte.** Aparar uma fonte a priori ("só
   as seções úteis") é aposta cega: introduz viés de confirmação e quebra
   "grelhar contra a fonte". O corte no prompt é reversível (curadoria
   just-in-time); a amputação da fonte não.

2. **Diagnóstico do formato** — **grelhe** Pedro pra decidir qual *tipo* de
   material o NotebookLM gera agora pra esse assunto (`generate report` aceita
   `briefing-doc`/`study-guide`/`blog-post`/`custom`, e todo `generate` aceita
   descrição em linguagem natural). Não assuma o formato.

3. **Instruções** — o Claude traduz a vontade em prompt; **Pedro aprova antes
   de ir.** Mas o portão não é só aprovar o texto: **cheque a cobertura da
   intenção.** Se Pedro pediu "conceitos + mapa de atores" e o prompt escopou só
   conceitos, o estreitamento passa *dentro* do prompt aprovado e o portão não
   pega — é o Claude moldando em silêncio *o que* se aprende. Confirme que o
   prompt cobre tudo que Pedro pediu, não só que está bem escrito.

4. **Material + recontagem-grelhada** — o NotebookLM entrega; Pedro itera tirando
   dúvidas (`notebooklm ask` continua a conversa). A **camada de evidência roda
   aqui, no chat**, peça a peça: o Claude explica → Pedro reconta nas próprias
   palavras → o Claude grelha a recontagem contra as fontes. Não é glossário
   digitado dentro do NotebookLM — *isso foi o desenho original e nunca rodou
   (n=2: codebase + externa); a nota quer viver fora da ferramenta.*

5. **Consolidação** — o Claude **registra as definições tight nas palavras de
   Pedro** num arquivo local (`.md`), uma por peça, cada uma já grelhada contra
   as fontes. Essa é a nota-sombra. **Forma segue o material como orientação,
   não obrigação:** prosa é o default barato; se o aprendido for fortemente
   **relacional** (hierarquia, modelo de domínio), externalize em Excalidraw
   em vez de/além da nota.

## Como conduzir

- Uma peça por vez. Reconte → grelhe → próxima. Não despeje o tema inteiro.
- Quando Pedro responde *"por quê"* repetindo *"o quê"* (resposta circular),
  aperte pelo **contraste**: o que essa peça **não** faz, o que ela substitui.
- **Quando o material vier denso/acadêmico e travar Pedro, intervenha:**
  re-explique simples, com exemplo concreto do domínio. A régra "a ferramenta
  entrega, Pedro produz" não significa deixar Pedro afogado — material denso
  demais trava o sink (quando Pedro trava, o Claude intervém).
- **O método é andaime invisível.** Não despeje o vocabulário do bloco
  ("camada de evidência", "grelhar", "recontagem") no aprendiz — sobrecarrega.
  Conduza; não narre a mecânica.

## Quando parar

Pare quando cada peça do trajeto foi recontada por Pedro e aguentou o grelho
contra as fontes — não quando o material foi "coberto". O critério é a
recontagem firme, não a leitura completa.

## Saída — a nota-sombra

Quando fechar, a sombra inspecionável é o `.md` consolidado: as definições
tight nas palavras de Pedro, uma por peça, ancoradas nas fontes. Borda
**mapa→Expor**: a condição load-bearing é o Claude conseguir extrair essa nota
(e, se o material veio do NotebookLM, recuperá-lo via `notebooklm history` /
`download`) — não ter um formato específico no repo.
