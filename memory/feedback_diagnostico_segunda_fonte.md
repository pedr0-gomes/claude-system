---
name: feedback-diagnostico-segunda-fonte
description: "Antes de declarar um diagnóstico grave, confirmar com uma 2ª fonte independente"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 22fda90b-2d97-43ba-9be7-7b3ae9b58be2
---

Antes de **declarar uma conclusão grave/alarmante** num diagnóstico (ex.: "os dados se perderam", "o serviço caiu"), confirmar com uma **segunda fonte independente**. Não escalar pra conclusão alarmante a partir de dado único.

**Why:** em sessão de debugging no `organograma-hmsvp` (Supabase + Vercel), o Claude fez 3 hipóteses erradas em sequência — Supabase pausado → projeto deletado/dados perdidos → projeto trocado — cada uma "confirmada" por evidência parcial, chegando a declarar "a notícia ruim provável: os números se foram". Alarme falso, distress desnecessário no Pedro. O que destravou foi testar o DNS em **dois resolvedores** (roteador dizia NXDOMAIN, o 8.8.8.8 resolvia normal): um NXDOMAIN de um resolvedor só não prova nada.

**How to apply:** vale além de DNS — é postura padrão de diagnóstico. Quanto mais grave a conclusão, mais alta a barra de evidência antes de anunciá-la; preferir "ainda investigando" a um veredito alarmante mal-confirmado. Cuidado com a cascata: uma hipótese "confirmada" por evidência parcial vira premissa da próxima e o erro se acumula.
