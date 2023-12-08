CREATE TABLE menu (
  cod_item_menu INT IDENTITY(1,1) NOT NULL,
  descricao VARCHAR(MAX) NOT NULL,
  preco NUMERIC(5,2) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  CONSTRAINT cod_item_menu_pk PRIMARY KEY CLUSTERED(cod_item_menu ASC)
)
GO

CREATE TABLE cliente (
  cpf CHAR(11) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  CONSTRAINT cpf_pk PRIMARY KEY CLUSTERED(cpf ASC)
)
GO

CREATE TABLE pedido (
  cod_pedido INT IDENTITY(1,1) NOT NULL,
  hora_pedido DATETIME NOT NULL,
  preco_total NUMERIC(5,2) NOT NULL,
  cpf char(11)
  CONSTRAINT cod_pedido_pk PRIMARY KEY CLUSTERED(cod_pedido ASC)
)
GO

ALTER TABLE pedido
ADD CONSTRAINT cpf_fk FOREIGN KEY (cpf)
REFERENCES cliente (cpf)
GO

CREATE TABLE pedido_menu (
  cod_pedido INT NOT NULL,
  cod_item_menu INT NOT NULL,
  quantidade INT NOT NULL
)
GO

ALTER TABLE pedido_menu
ADD CONSTRAINT pm_cod_pedido_fk FOREIGN KEY (cod_pedido)
REFERENCES pedido (cod_pedido)
GO

ALTER TABLE pedido_menu
ADD CONSTRAINT pm_cod_item_menu_fk FOREIGN KEY (cod_item_menu)
REFERENCES menu (cod_item_menu)
GO

CREATE TABLE pagamento (
  cod_pagamento INT IDENTITY(1,1) NOT NULL,
  cod_pedido INT NOT NULL,
  hora_pagamento DATETIME NOT NULL,
  forma_pagamento CHAR(1) CONSTRAINT chk_forma_pagamento CHECK (forma_pagamento IN ('C','D'))
  CONSTRAINT cod_pagamento_pk PRIMARY KEY CLUSTERED(cod_pagamento ASC)
)
GO

ALTER TABLE pagamento
ADD CONSTRAINT p_cod_pedido_fk FOREIGN KEY (cod_pedido)
REFERENCES pedido (cod_pedido)
GO

CREATE TABLE avaliacao (
  cod_avaliacao INT NOT NULL,
  hora_avaliacao DATETIME NOT NULL,
  valor_pontuacao INT NULL,
  comentario VARCHAR(MAX) NULL,
  cod_pagamento INT
  CONSTRAINT cod_avaliacao_pk PRIMARY KEY CLUSTERED(cod_avaliacao ASC)
)
GO

ALTER TABLE avaliacao
ADD CONSTRAINT cod_pagamento_fk FOREIGN KEY (cod_pagamento)
REFERENCES pagamento (cod_pagamento)
GO

CREATE TABLE produto (
  cod_produto INT IDENTITY(1,1) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  estoque NUMERIC(5,2) NOT NULL,
  CONSTRAINT cod_produto_pk PRIMARY KEY CLUSTERED(cod_produto ASC)
)
GO

CREATE TABLE receita_item_menu (
  cod_item_menu INT NOT NULL,
  cod_produto INT NOT NULL,
  quantidade_produto NUMERIC(5,2) NOT NULL,
)
GO

ALTER TABLE receita_item_menu
ADD CONSTRAINT rim_cod_item_menu_fk FOREIGN KEY (cod_item_menu)
REFERENCES menu (cod_item_menu)
GO

ALTER TABLE receita_item_menu
ADD CONSTRAINT cod_produto_fk FOREIGN KEY (cod_produto)
REFERENCES produto (cod_produto)
GO
