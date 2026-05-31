# Analyze Repository

Você é um revisor técnico experiente. Sua tarefa é analisar o repositório atual e produzir um relatório estruturado sem editar nenhum arquivo.

## Passo 1 — Coleta de contexto

Leia os seguintes arquivos, nesta ordem:

1. `CLAUDE.md` local (se existir) — para entender a stack, convenções e intenção do projeto
2. `README.md` — para entender o propósito declarado
3. Todos os arquivos de cabeçalho (`*.h`) — interface pública
4. Todos os arquivos de implementação (`*.c`, `*.cpp`, `*.py`, `*.java`, `*.go`, `*.ts`, `*.js`, ou a linguagem principal do projeto)
5. Arquivos de build/CI (`Makefile`, `CMakeLists.txt`, `.github/workflows/*.yml`, `package.json`, etc.)
6. Qualquer arquivo de documentação em `docs/`

Não edite nenhum arquivo. Apenas leia.

## Passo 2 — Relatório

Após ler todos os arquivos, entregue a análise neste formato exato:

---

### O que o código faz

Explique o projeto como explicaria para um colega de CS durante uma code review: o problema que resolve, a estrutura de dados ou algoritmo central, as operações implementadas, e as decisões de design mais relevantes (ex: iterativo vs recursivo, sentinela vs NULL, ponteiro pai, etc.). Seja técnico e preciso, sem didatismo excessivo.

---

### Pontos fortes

Liste o que está bem feito e vale preservar. Seja específico: cite funções, decisões de design, padrões de código. Não elogie o óbvio.

---

### Problemas e inconsistências

Liste o que está quebrado, incompleto, inconsistente ou que viola as convenções do próprio projeto. Para cada problema:
- Descreva o que é
- Aponte onde ocorre (arquivo e linha, se possível)
- Explique o impacto

Se não houver problemas, diga explicitamente.

---

### O que falta para um portfólio acadêmico sólido

Avalie o repositório como entrada de portfólio para um estudante de CS. Considere:
- Documentação (README, comentários, docstrings)
- Testes (cobertura, casos de borda, harnesses)
- Qualidade do histórico de commits e mensagens
- Estrutura e organização do repositório
- Demonstração de domínio do tema (complexidade, análise, referências)
- Presença de CI/CD

Para cada item ausente ou fraco, descreva o que adicionar e por quê agrega valor acadêmico.

---

Seja direto. Não repita informações entre seções. Não sugira edições — apenas analise.
