CREATE FUNCTION fc_visualiza_pedido (@pedido INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        P.codigo_pedido,
        M.nome AS nome_item,
        PM.quantidade * M.preco AS preco_total_item
    FROM 
        pedido_menu AS PM
    INNER JOIN 
        menu AS M ON M.codigo_menu = PM.codigo_menu
    INNER JOIN 
        pedido AS P ON P.codigo_pedido = PM.codigo_pedido
    WHERE 
        PM.codigo_pedido = @pedido
);
