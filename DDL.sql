-- CRIA TABELA MENU
CREATE TABLE menu (
  codigo_menu INT NOT NULL,
  descricao VARCHAR(MAX) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  preco NUMERIC(5,2) NOT NULL,
  CONSTRAINT codigo_menu_pk PRIMARY KEY CLUSTERED(codigo_menu ASC)
)
GO
-- CRIA TABELA PEDIDO
CREATE TABLE pedido (
  codigo_pedido INT NOT NULL,
  data_hora_pedido DATE NOT NULL,
  preco_total INT NOT NULL,
  CONSTRAINT codigo_pedido_pk PRIMARY KEY CLUSTERED(codigo_pedido ASC)
)
GO
-- CRIA TABELA ITEM
CREATE TABLE item (
  nome VARCHAR(MAX) NOT NULL,
  preco NUMERIC(5,2) NOT NULL,
  codigo_item INT NOT NULL
  CONSTRAINT codigo_item_fk PRIMARY KEY CLUSTERED(codigo_item ASC)
)
GO
-- CRIA TABELA CLIENTE
CREATE TABLE cliente (
  codigo_cliente INT NOT NULL,
  codigo_cartao INT NOT NULL,
  nome_cliente VARCHAR(100) NOT NULL,
  data_criacao DATE NOT NULL,
  porcentagem_beneficio NUMERIC(5,2)
  CONSTRAINT codigo_cliente_fk PRIMARY KEY CLUSTERED(codigo_cliente ASC)
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
  data_hora_pagamento DATE NOT NULL,
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
  data_hora_avaliacao DATE NOT NULL,
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
