ZENIX PLAYER Roku v3.5.0 — Premium Search + Pages + Loading

Base: v3.4.1 compile fix
Painel/API: https://painel.ativaapps.shop

Correções desta versão:
1. Topo do catálogo
   - Remove o Button padrão que aparecia como bolinha + "I...".
   - Retorno para a Home permanece pelo botão BACK do controle.
   - Para Filmes/Séries, o topo passa a exibir paginação numérica real quando houver mais de uma página.
   - Janela de páginas: < 1 2 3 4 5 >, com página atual destacada.

2. Paginação Filmes/Séries
   - Mantém grade 4x2 (8 itens por página).
   - Página atual e total continuam no cabeçalho.
   - Números ficam no topo, dentro da safe area da TV, evitando corte por overscan.
   - Cima/baixo entre grade e paginação foi ajustado.
   - Ao voltar da tela de detalhes, os números da página são reconstruídos corretamente.

3. Entrada de Filmes/Séries
   - Ao abrir Filmes ou Séries, carrega automaticamente "Adicionados Recentemente", como na referência.
   - A tela deixa de abrir vazia esperando o primeiro clique de categoria.

4. Busca premium
   - Remove o StandardKeyboardDialog na busca de canais.
   - Filmes, Séries e Ao Vivo usam agora a mesma busca premium integrada.
   - Teclado lateral em 6 colunas com modos abc / ABC / #+-.
   - Resultados aparecem na grade 4x2 à direita.
   - Busca atualiza enquanto o usuário digita.
   - BACK retorna ao catálogo.
   - Ao selecionar um resultado de canal, volta ao Ao Vivo e abre o preview.

5. Loading no estilo da referência
   - Tela cheia escura com logo Zenix e spinner vermelho/dourado.
   - Usada ao recuperar categorias, itens e adicionados recentemente.

6. Versão
   - Manifest: 3.5.0
   - Config/API User-Agent: 3.5.0

Observação:
- O botão BACK do controle remoto é a forma oficial de voltar do catálogo/busca.
- A paginação só aparece quando a lista possui mais de 8 itens.
