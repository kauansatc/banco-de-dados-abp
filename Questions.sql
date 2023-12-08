-- Quais clientes mais compraram em 2023?
WITH Rascun AS (
    SELECT COUNT(cpf) AS qtd, cpf AS cpf
    FROM pedido
	WHERE YEAR(hora_pedido) = 2023
    GROUP BY cpf
)
SELECT nome, qtd
FROM Rascun AS R
INNER JOIN cliente AS C ON C.cpf = R.cpf
ORDER BY qtd DESC
GO

-- Quais os itens do menu mais consumidos em 2023?
WITH Rascun AS (
SELECT COUNT(cod_item_menu) AS qtd, cod_item_menu AS Menu FROM pedido_menu WHERE cod_pedido IN (SELECT cod_pedido FROM pedido WHERE YEAR(hora_pedido) = 2023)
GROUP BY cod_item_menu
)
SELECT M.nome, qtd
FROM Rascun AS R
INNER JOIN Menu AS M ON M.cod_item_menu = R.Menu
ORDER BY qtd DESC
GO

-- Qual o produto mais usado (repetido) nas receitas
WITH Rascun AS (
SELECT COUNT(cod_produto)AS qtd, cod_produto AS cd FROM receita_item_menu
GROUP BY cod_produto
)
SELECT P.nome AS Produto, qtd AS 'Vezes usado'
FROM Rascun AS R
INNER JOIN produto AS P ON P.cod_produto = R.cd
ORDER BY qtd DESC
GO
