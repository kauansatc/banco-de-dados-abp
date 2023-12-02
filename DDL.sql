-- CRIA TABELA MENU
CREATE TABLE menu (
  codigo_menu INT NOT NULL,
  descricao VARCHAR(MAX) NOT NULL,
  preco NUMERIC(5,2) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  CONSTRAINT codigo_menu_pk PRIMARY KEY CLUSTERED(codigo_menu ASC)
)
GO
-- CRIA TABELA PEDIDO
CREATE TABLE pedido (
  codigo_pedido INT NOT NULL,
  data_hora_pedido DATETIME NOT NULL,
  preco_total INT NOT NULL,
  CONSTRAINT codigo_pedido_pk PRIMARY KEY CLUSTERED(codigo_pedido ASC)
)
GO
-- CRIA TABELA CLIENTE
CREATE TABLE cliente (
  codigo_cliente INT NOT NULL,
  data_cadastro DATE NOT NULL,
  nome_cliente VARCHAR(100) NOT NULL,
  porcentagem_beneficio NUMERIC(5,2)
  CONSTRAINT codigo_cliente_pk PRIMARY KEY CLUSTERED(codigo_cliente ASC)
)
GO
-- CRIA TABELA PEDIDO DO MENU
CREATE TABLE pedido_menu (
  codigo_menu INT NOT NULL,
  codigo_pedido INT NOT NULL,
  quantidade INT NOT NULL
)
GO
ALTER TABLE pedido_menu
ADD CONSTRAINT pm_codigo_menu_fk FOREIGN KEY (codigo_menu)
REFERENCES menu (codigo_menu)
GO
ALTER TABLE pedido_menu
ADD CONSTRAINT pm_codigo_pedido_fk FOREIGN KEY (codigo_pedido)
REFERENCES pedido (codigo_pedido)
GO
-- CRIA TABELA PAGAMENTO
CREATE TABLE pagamento (
  codigo_pagamento INT NOT NULL,
  codigo_pedido INT NOT NULL,
  codigo_cliente INT NOT NULL,
  data_hora_pagamento DATETIME NOT NULL,
  valor_total NUMERIC(10, 2) NOT NULL,
  forma_pagamento CHAR(1) CONSTRAINT chk_forma_pagamento CHECK (forma_pagamento IN ('C','D'))
  CONSTRAINT codigo_pagamento_pk PRIMARY KEY CLUSTERED(codigo_pagamento ASC)
)
GO
ALTER TABLE pagamento
ADD CONSTRAINT pg_codigo_pedido_fk FOREIGN KEY (codigo_pedido)
REFERENCES pedido (codigo_pedido)
GO
ALTER TABLE pagamento
ADD CONSTRAINT pg_codigo_cliente_fk FOREIGN KEY (codigo_cliente)
REFERENCES cliente (codigo_cliente)
GO
-- CRIA TABELA AVALIAÇÃO
CREATE TABLE avaliacao (
  codigo_avaliacao INT NOT NULL,
  data_hora_avaliacao DATETIME NOT NULL,
  pontuacao INT NULL,
  comentario VARCHAR(MAX) NULL,
  codigo_pagamento INT
  CONSTRAINT codigo_avaliacao_pk PRIMARY KEY CLUSTERED(codigo_avaliacao ASC)
)
GO
ALTER TABLE avaliacao
ADD CONSTRAINT codigo_pagamento_fk FOREIGN KEY (codigo_pagamento)
REFERENCES pagamento (codigo_pagamento)
GO
-- CRIA TABELA RECEITA
CREATE TABLE produto (
  codigo_produto INT NOT NULL,
  nome_produto INT NOT NULL,
  estoque_produto INT NOT NULL,
  CONSTRAINT codigo_produto_pk PRIMARY KEY CLUSTERED(codigo_produto ASC)
)
GO
-- CRIA TABELA RECEITA
CREATE TABLE receita (
  codigo_menu INT NOT NULL,
  codigo_produto INT NOT NULL,
  quantidade INT NOT NULL,
)
GO
ALTER TABLE receita
ADD CONSTRAINT rc_codigo_menu_fk FOREIGN KEY (codigo_menu)
REFERENCES menu (codigo_menu)
GO
ALTER TABLE receita
ADD CONSTRAINT rc_codigo_produto_fk FOREIGN KEY (codigo_produto)
REFERENCES produto (codigo_produto)
GO
