CREATE TRIGGER TG_avaliacao_block ON avaliacao AFTER UPDATE AS
BEGIN
IF (UPDATE (hora_avaliacao) OR UPDATE (valor_pontuacao))
BEGIN
RAISERROR ('É proibido realizar atualizações na nota da avaliação, apenas no comentário!', 16, 1);
ROLLBACK TRAN
END;
END
GO

CREATE TRIGGER TG_cliente_block ON cliente AFTER UPDATE AS
BEGIN
IF (UPDATE (cpf) OR UPDATE(nome))
BEGIN
RAISERROR ('É proibido modificar o nome do cliente ou o CPF da conta', 16, 1);
ROLLBACK TRAN
END;
END
GO
