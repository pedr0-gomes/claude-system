# claude-system

Camada curada do meu `.claude/` global — leis, mapa, skills, comandos e memórias.
Versionado pra migrar entre máquinas. **Não contém credenciais nem arquivos gerados** (ver `.gitignore`).

Conteúdo:
- `CLAUDE.md` — leis globais
- `CONTEXT.md` — mapa magro que aponta pro Notion
- `settings.json` — config do harness
- `skills/` — skills vivas
- `commands/` — slash commands custom
- `memory/` — memória persistente (perfil, feedback, projetos)

---

## Instalar numa máquina nova (Linux)

**Pré-requisito:** Claude Code já instalado e logado (`claude` funciona, login feito).
> ⚠️ Não copie `.credentials.json` de outra máquina. O login da máquina nova já gerou a credencial dela.

### 1. Clonar o repo (fora do ~/.claude, em staging)

```bash
git clone <URL_DO_REPO> ~/claude-system
cd ~/claude-system
```

### 2. Copiar a camada curada pro ~/.claude

```bash
mkdir -p ~/.claude/skills ~/.claude/commands
cp CLAUDE.md CONTEXT.md settings.json ~/.claude/
cp -r skills/.    ~/.claude/skills/
cp -r commands/.  ~/.claude/commands/
```

Isso não toca em `~/.claude/.credentials.json` nem em nada gerado.

### 3. Restaurar as memórias (passo técnico)

O Claude Code guarda memória em `~/.claude/projects/<SLUG>/memory/`, onde `<SLUG>` é
o caminho de trabalho com `/`, `.` etc. trocados por `-`. O slug **muda** de máquina
pra máquina, então não dá pra chutar — melhor deixar o Claude criar a pasta e copiar pra ela:

```bash
# a) Rode o claude UMA vez a partir de ~/.claude pra ele criar a pasta do projeto:
cd ~/.claude && claude   # abra e feche (ex.: digite /exit)

# b) Descubra o slug que ele criou:
ls ~/.claude/projects/

# c) Copie as memórias pra dentro dele (troque <SLUG> pelo que apareceu):
mkdir -p ~/.claude/projects/<SLUG>/memory
cp ~/claude-system/memory/. ~/.claude/projects/<SLUG>/memory/ -r
```

### 4. Plugins

`settings.json` deixa habilitados 2 plugins oficiais (`github`, `skill-creator`).
Se não aparecerem, re-adicione o marketplace e instale pelo `/plugin` dentro do claude.

### 5. Verificar

```bash
cd ~/.claude && claude
```
- `/` deve listar as skills (consolidar-pesquisa, destilar-projeto, etc.)
- Peça pra ele recapitular uma memória (ex.: "quem é Pedro?") — confirma que `memory/` carregou.
- Confirme que o `CLAUDE.md` foi lido (deve responder em português, direto).

---

## Atualizar o repo a partir de uma máquina (no futuro)

Quando mudar skills/leis/memórias, copie de volta pro repo e commit:
```bash
cd ~/claude-system
cp ~/.claude/CLAUDE.md ~/.claude/CONTEXT.md ~/.claude/settings.json .
cp -r ~/.claude/skills/. skills/
cp -r ~/.claude/projects/<SLUG>/memory/. memory/
git add -A && git commit -m "sync" && git push
```
