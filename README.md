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

## Como funciona: symlink, fonte única

O repo mora em `~/claude-system` e é a **única fonte de verdade**. O `~/.claude/`
(onde o Claude Code lê de fato) não guarda cópias — ele **aponta** pro repo via
symlinks. Consequências:

- **Editar no repo = global atualiza sozinho.** Sem copiar de volta.
- **Versionar = `git commit` no repo.** O que está ativo já é o que está versionado.
- Sem drift: não existem "duas versões" pra sincronizar à mão.

**Exceção: `settings.json` é cópia, não symlink.** O Claude Code escreve nele
(tema, toggles de UI) e pode ter campos específicos da máquina — não vale
versionar essas escritas automaticamente.

---

## Instalar numa máquina nova (Linux)

**Pré-requisito:** Claude Code já instalado e logado (`claude` funciona, login feito).
> ⚠️ Não copie `.credentials.json` de outra máquina. O login da máquina nova já gerou a credencial dela.

### 1. Clonar o repo (local permanente — não é staging)

```bash
git clone <URL_DO_REPO> ~/claude-system
cd ~/claude-system
```

### 2. Linkar a camada curada pro ~/.claude (symlinks)

```bash
REPO=~/claude-system
mkdir -p ~/.claude/skills ~/.claude/commands

# leis + mapa
ln -sfn "$REPO/CLAUDE.md"  ~/.claude/CLAUDE.md
ln -sfn "$REPO/CONTEXT.md" ~/.claude/CONTEXT.md

# skills e commands: um symlink por item (não a pasta inteira — assim
# uma skill instalada direto no global no futuro não é destruída)
for s in "$REPO"/skills/*;   do ln -sfn "$s" ~/.claude/skills/$(basename "$s");   done
for c in "$REPO"/commands/*; do ln -sfn "$c" ~/.claude/commands/$(basename "$c"); done

# settings.json: COPIAR (exceção — ver "Como funciona")
cp "$REPO/settings.json" ~/.claude/settings.json
```

Isso não toca em `~/.claude/.credentials.json` nem em nada gerado.

### 3. Linkar as memórias (passo técnico — atenção ao slug)

O Claude Code lê memória de `~/.claude/projects/<SLUG>/memory/`, onde `<SLUG>` é
o **caminho de trabalho** (cwd de onde você abre o `claude`) com `/`, `.` etc.
trocados por `-`. O slug muda conforme o diretório, então a memória só carrega
quando você abre o Claude **daquele** diretório.

```bash
# a) Rode o claude UMA vez a partir de ~/claude-system pra ele criar a pasta do projeto:
cd ~/claude-system && claude   # abra e feche (ex.: digite /exit)

# b) Descubra o slug que ele criou:
ls ~/.claude/projects/

# c) Troque a pasta memory criada por um symlink pro repo (troque <SLUG>):
SLUG=<SLUG>
rmdir ~/.claude/projects/$SLUG/memory 2>/dev/null
ln -sfn ~/claude-system/memory ~/.claude/projects/$SLUG/memory
```

> Como é symlink, a memória que o Claude gravar durante as sessões cai **direto
> no repo** — basta commitar, sem copiar de volta.

### 4. Plugins

`settings.json` deixa habilitados 2 plugins oficiais (`github`, `skill-creator`).
Se não aparecerem, re-adicione o marketplace e instale pelo `/plugin` dentro do claude.

### 5. Verificar

```bash
cd ~/claude-system && claude
```
- `/` deve listar as skills (consolidar-pesquisa, destilar-projeto, etc.)
- Peça pra ele recapitular uma memória (ex.: "quem é Pedro?") — confirma que `memory/` carregou.
- Confirme que o `CLAUDE.md` foi lido (deve responder em português, direto).

---

## Atualizar o repo (no dia a dia)

Como o global é symlink pro repo, **editar leis/mapa/skills/memórias já edita o
repo** — só falta commitar:

```bash
cd ~/claude-system
git add -A && git commit -m "..." && git push
```

**Única exceção — coisas instaladas direto no global** (uma skill via `npx skills`,
ou mudanças no `settings.json`, que é cópia). Elas vivem fora do repo até você
puxá-las pra dentro:

```bash
# skill nova instalada em ~/.claude/skills/<nome>: mover pro repo e re-linkar
mv ~/.claude/skills/<nome> ~/claude-system/skills/<nome>
ln -sfn ~/claude-system/skills/<nome> ~/.claude/skills/<nome>

# settings.json: copiar a versão ativa pro repo quando mudar algo que vale versionar
cp ~/.claude/settings.json ~/claude-system/settings.json
```
