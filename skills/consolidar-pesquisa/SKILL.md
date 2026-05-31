---
name: consolidar-pesquisa
description: Consolida o resultado bruto de uma pesquisa externa (ex: Deep
  Research) num research.md estruturado — a segunda metade do bloco
  Investigar. Pedro cola o briefing (saída da skill investigar) e o dump bruto;
  a skill reorganiza fielmente nas cinco seções e salva em .claude/research/.
  Use quando Pedro volta com o resultado de uma pesquisa externa e quer
  transformá-lo no artefato research.md que alimenta os blocos Aprender e
  Construir. NÃO é pra formular o que pesquisar (isso é a skill investigar) nem
  pra pesquisar (isso é externo).
---

# Consolidar pesquisa

Pega o dump bruto de uma pesquisa externa e o briefing que a originou, e os
consolida no `research.md` — o artefato que o bloco Investigar entrega pros
consumidores **Aprender** e **Construir**. A skill **não pesquisa nem
decide**: ela reorganiza o que já foi pesquisado numa forma navegável.

## O contrato

- **Consome:** o briefing (saída da `investigar` — Tema / Por quê / Ângulos /
  Restrições) + o dump bruto da pesquisa, ambos colados no chat.
- **Produz:** `.claude/research/<slug>.md`, com as cinco seções abaixo.
- **Papel:** Claude reorganiza; Pedro cura.

## A régua — o conteúdo nunca é do Claude

O dump vem de ferramenta que alucina. Se a skill, ao reorganizar, *adicionar*
conhecimento de cabeça, empilha uma segunda camada de alucinação sobre a
primeira — e aí o `research.md` deixa de ser auditável. Então:

- Só entra no doc o que está no dump (ou no briefing). Nada de completar com
  conhecimento próprio, por mais óbvio que pareça.
- Seção que o dump não cobriu **não se preenche** — vira lacuna explícita na
  §5.

É a irmã da regra de corte (§3, abaixo): lá a *decisão* nunca é do Claude;
aqui o *conteúdo* nunca é. Mesma desconfiança, dois alvos.

## Como conduzir

1. **Reconheça as entradas.** O briefing tem estrutura conhecida (Tema / Por
   quê / Ângulos / Restrições); o resto do que Pedro colou é o dump.
2. **Rascunhe fiel.** Distribua nas cinco seções: §1 herda do briefing; §2–§4
   saem do dump; toda lacuna vai pra §5; §3 segue a regra de corte.
3. **Uma rodada de corte.** Mostre o rascunho inteiro. Pedro corta e ajusta de
   uma vez — não vá seção a seção, não entreviste.
4. **Trave e salve.** Escreva em `.claude/research/<slug>.md`; proponha o slug
   a partir do título e confirme antes de salvar.

## As cinco seções

Cada seção é **autocontida** — os dois consumidores têm fomes diferentes
(Aprender quer entender o espaço; Construir quer decidir) e devem poder pular
direto pra sua parte sem ler o resto. Os marcadores `⟶` dizem a quem cada
seção serve; mantenha-os.

```markdown
# Research: <pergunta-título>

## 1. Pergunta / escopo
Herda do briefing.
- **Dentro:** o que esta pesquisa cobre.
- **Fora:** o que ficou deliberadamente de fora.

## 2. Mapa do território   ⟶ Aprender
Descritivo — o lay of the land: conceitos-chave, atores, como o espaço se
organiza. Cada conceito explicado em uma linha na primeira aparição.

## 3. Abordagens + trade-offs   ⟶ Construir
Decisório — para cada abordagem candidata:
- **O que é** (uma linha)
- **A favor / contra** como FATOS observados ("a fonte achou X"), nunca
  veredito.
Regra de corte: nada aqui ranqueia nem diz "escolha Y". A decisão é do Pedro,
no Construir.

## 4. Fontes
Proveniência rastreável: cada afirmação forte ligável a uma origem. Sem rastro
o doc não se audita — e o dump alucina.

## 5. Perguntas em aberto
- O que a pesquisa não resolveu ou deixou ambíguo.
- As lacunas das seções acima (o que o dump não cobriu).
- As decisões que cabem ao Pedro — handoff explícito.
```

A fronteira §2/§3, quando elas ameaçarem contar a mesma história: **§2 é
descritivo** (como o espaço é), **§3 é decisório** (o que dá pra fazer).
Separe pela função, não pelo conteúdo.
