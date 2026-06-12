# inbox/ — buffer de captura projeto→hub

Candidatos de **feedback-de-método** capturados automaticamente no fim de cada
sessão de trabalho (hook `SessionEnd` → `hooks/capturar-feedback-metodo.sh`).
Um arquivo por sessão: `<timestamp>-<projeto>.md`.

- **Quem escreve:** só o hook. Se a sessão não teve feedback de método, nada é
  escrito — o inbox acumula só sinal.
- **Quem drena:** a skill `destilar-transversal` (Pedro invoca). Cada candidato
  é proposto, Pedro cura, e o arquivo processado é apagado.
- **Não versionado:** o conteúdo é buffer transitório por-máquina (ver
  `.gitignore`). Só este README entra no git.

"Esquecer de destilar" atrasa a destilação; não perde mais o sinal.
