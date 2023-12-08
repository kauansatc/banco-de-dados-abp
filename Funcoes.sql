CREATE FUNCTION fc_visualiza_pedido (@pedido INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        P.cod_pedido,
        M.nome AS nome_item,
        PM.quantidade * M.preco AS preco_total_item
    FROM 
        pedido_menu AS PM
    INNER JOIN 
        menu AS M ON M.cod_item_menu = PM.cod_item_menu
    INNER JOIN 
        pedido AS P ON P.cod_pedido = PM.cod_pedido
    WHERE 
        PM.cod_item_menu = @pedido
);

CREATE FUNCTION fc_visualiza_receita (@menu INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        M.nome AS Menu,
		P.nome AS Produto,
        RM.quantidade_produto AS Quantidade
    FROM 
        receita_item_menu AS RM
    INNER JOIN 
        menu AS M ON M.cod_item_menu = RM.cod_item_menu
    INNER JOIN 
        produto AS P ON P.cod_produto = RM.cod_produto
    WHERE 
        RM.cod_item_menu = @menu
);
