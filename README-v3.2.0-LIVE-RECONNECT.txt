Zenix Player Roku v3.2.0 - Live Auto Reconnect

Correção principal:
- Canais ao vivo não voltam mais para categorias quando o stream envia FINISHED por queda de conexão.
- ERROR em conteúdo ao vivo agora agenda reconexão automática do mesmo canal.
- BUFFERING acima de 12 segundos força nova conexão do mesmo canal.
- Backoff de reconexão: 1s, 2s, 3.5s e 6s nas tentativas seguintes.
- Ao voltar a PLAYING, contador de falhas é zerado.
- O usuário só sai do canal ao pressionar Voltar.
- Filmes, séries e episódios mantêm o comportamento normal ao terminar.
