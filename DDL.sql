-- CRIA TABELA MENU
CREATE TABLE menu (
  codigo_menu INT NOT NULL,
  descricao text
  CONSTRAINT codigo_menu_pk PRIMARY KEY CLUSTERED(codigo_menu ASC)
)
GO
-- CRIA TABELA PEDIDO
CREATE TABLE pedido (
  codigo_pedido INT NOT NULL,
  data_hora_pedido DATE NOT NULL,
  codigo_menu INT NOT NULL,
  CONSTRAINT codigo_pedido_pk PRIMARY KEY CLUSTERED(codigo_pedido ASC)
)
GO
ALTER TABLE pedido
ADD CONSTRAINT codigo_menu_fk FOREIGN KEY (codigo_menu)
REFERENCES menu (codigo_menu)
GO
-- CRIA TABELA ITEM
CREATE TABLE item (
  nome VARCHAR(MAX) NOT NULL,
  preco NUMERIC(5,2) NOT NULL,
  codigo_item INT NOT NULL
  CONSTRAINT codigo_item_fk PRIMARY KEY CLUSTERED(codigo_item ASC)
)
GO
-- CRIA TABELA CARTÃO
CREATE TABLE cartao (
  codigo_cartao INT NOT NULL,
  data_criacao DATE NOT NULL
  CONSTRAINT codigo_cartao_pk PRIMARY KEY CLUSTERED(codigo_cartao ASC)
)
GO
-- CRIA TABELA ITEM PEDIDO
CREATE TABLE item_pedido (
  codigo_item INT NOT NULL,
  quantidade INT NOT NULL,
  descricao VARCHAR(MAX) NOT NULL,
  codigo_menu INT NOT NULL, 
  CONSTRAINT ip_codigo_pedido_pk PRIMARY KEY CLUSTERED(codigo_item ASC)
)
GO
ALTER TABLE item_pedido
ADD CONSTRAINT it_codigo_menu_fk FOREIGN KEY (codigo_menu)
REFERENCES menu (codigo_menu)
GO
-- CRIA TABELA RELAÇÃO MENU PEDIDO
CREATE TABLE menu_item_pedido (
  codigo_menu INT NOT NULL,
  codigo_item INT NOT NULL
)
GO
ALTER TABLE menu_item_pedido
ADD CONSTRAINT mip_codigo_menu_fk FOREIGN KEY (codigo_menu)
REFERENCES menu (codigo_menu)
GO
ALTER TABLE menu_item_pedido
ADD CONSTRAINT mip_codigo_item_fk FOREIGN KEY (codigo_item)
REFERENCES item_pedido (codigo_item)
GO
-- CRIA TABELA BENEFÍCIOS
CREATE TABLE beneficios (
  codigo_cartao INT NOT NULL,
  porcentagem_beneficio NUMERIC(5,2)
)
GO
ALTER TABLE beneficios
ADD CONSTRAINT codigo_cartao_fk FOREIGN KEY (codigo_cartao)
REFERENCES cartao (codigo_cartao)
GO
-- CRIA TABELA PAGAMENTO
CREATE TABLE pagamento (
  codigo_pagamento INT NOT NULL,
  codigo_pedido INT NOT NULL,
  data_hora_pagamento DATE NOT NULL,
  valor_total NUMERIC(10, 2) NOT NULL,
  forma_pagamento CHAR(1) CONSTRAINT chk_forma_pagamento CHECK (forma_pagamento IN ('C','D'))
  CONSTRAINT codigo_pagamento_pk PRIMARY KEY CLUSTERED(codigo_pagamento ASC)
)
GO
ALTER TABLE pagamento
ADD CONSTRAINT codigo_pedido_fk FOREIGN KEY (codigo_pedido)
REFERENCES pedido (codigo_pedido)
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
