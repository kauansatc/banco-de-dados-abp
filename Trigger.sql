CREATE TRIGGER TG_avaliacao_block ON avaliacao AFTER UPDATE AS
BEGIN
IF (UPDATE (data_hora_avaliacao) OR UPDATE (pontuacao))
BEGIN
RAISERROR ('É proibido realizar atualizações na nota da avaliação, apenas no comentário!', 16, 1);
ROLLBACK TRAN
END;
END
GO

CREATE TRIGGER TG_cliente_block ON cliente AFTER UPDATE AS
BEGIN
IF (UPDATE (nome_cliente) OR UPDATE(data_cadastro))
BEGIN
RAISERROR ('É proibido modificar o nome do cliente e data da criação da conta', 16, 1);
ROLLBACK TRAN
END;
END
GO
