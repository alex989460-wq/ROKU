ZENIX PLAYER v3.6.1 - DETAIL REDESIGN

- Tela de detalhes refeita no estilo TV premium.
- Remove textos técnicos do TMDB.
- Botões próprios Zenix (sem botão padrão branco da Roku).
- Filmes/séries semelhantes navegáveis na parte inferior.
- Fallback com poster à direita quando ainda não existe backdrop.
- Antes do TMDB, consulta get_vod_info/get_series_info do Xtream para obter tmdb_id e metadados mais precisos.
- Endpoint TMDB aceita API Key v3 ou Read Access Token v4.
- Match por tmdb_id quando o provedor fornece esse campo; fallback por título + ano.
