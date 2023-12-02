CREATE PROCEDURE pr_atualiza_valor (@pedido INT) AS
BEGIN
	DECLARE @novoPrecoTotal NUMERIC(5,2);

	SELECT @novoPrecoTotal = SUM(M.preco * PM.quantidade)
	FROM pedido_menu AS PM
	INNER JOIN Menu AS M ON M.codigo_menu = PM.codigo_menu
	WHERE PM.codigo_pedido = @pedido;

	UPDATE pedido
	SET preco_total = ISNULL(@novoPrecoTotal, 0)
	WHERE codigo_pedido = @pedido;
END
GO

CREATE PROCEDURE pr_cria_pedido (@menu INT, @quantidade INT, @pedido INT OUTPUT) AS
BEGIN
	INSERT INTO pedido VALUES (GETDATE(), 0);
	SELECT @pedido = SCOPE_IDENTITY();

	INSERT INTO pedido_menu VALUES (@menu, @pedido, @quantidade);
	EXEC pr_atualiza_valor @pedido;
END
GO

CREATE PROCEDURE pr_adiciona_pedido (@menu INT, @quantidade INT, @pedido INT) AS
BEGIN
	INSERT INTO pedido_menu VALUES (@menu, @pedido, @quantidade);
	EXEC pr_atualiza_valor @pedido;
END
GO

CREATE PROCEDURE pr_remove_pedido (@menu INT, @pedido INT) AS
BEGIN
	DELETE FROM pedido_menu WHERE codigo_menu = @menu AND codigo_pedido = @pedido;
	EXEC pr_atualiza_valor @pedido;
END
GO

CREATE PROCEDURE pr_corrige_pedido (@menu INT, @quantidade INT, @pedido INT) AS
BEGIN
	UPDATE pedido_menu SET quantidade = @quantidade WHERE codigo_pedido = @pedido AND codigo_menu = @menu
	EXEC pr_atualiza_valor @pedido;
END
GO
CREATE PROCEDURE pr_deleta_pedido (@pedido INT) AS
BEGIN
	DELETE FROM pedido_menu WHERE codigo_pedido = @pedido;
	DELETE FROM pedido WHERE codigo_pedido = @pedido;
END
GO
