CREATE PROCEDURE pr_cria_pedido (@menu INT, @quantidade INT, @pedido INT OUTPUT) AS
BEGIN
	INSERT INTO pedido VALUES (GETDATE(), 0, NULL);
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
	
CREATE PROCEDURE pr_deleta_pedido (@pedido INT) AS
BEGIN
	DELETE FROM pedido_menu WHERE codigo_pedido = @pedido;
	DELETE FROM pedido WHERE codigo_pedido = @pedido;
END
GO
