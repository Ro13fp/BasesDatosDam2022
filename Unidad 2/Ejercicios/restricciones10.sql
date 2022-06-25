CREATE TABLE FABRICA(
	NUM_FABRICA	NUMBER(2),
	TELEFONO	CHAR(9)
	);
	
ALTER TABLE FABRICA ADD CONSTRAINT PK_FABRICA 
	PRIMARY KEY (NUM_FABRICA);
	
CREATE TABLE ARTICULO(
	NUM_ARTÍCULO	NUMBER(5),
	DESCRIPCION		VARCHAR(100),
	);
	
ALTER TABLE ARTICULO ADD CONSTRAINT PK_ARTICULO
	PRIMARY KEY (NUM_ARTÍCULO);
	
CREATE TABLE CLIENTE(
	NUM_CLIENTE		NUMBER(5),
	SALDO			NUMBER,
	LIM_CREDITO		NUMBER(4),
	DESCUENTO		NUMBER(2)
	);
	
ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
	PRIMARY KEY (NUM_CLIENTE);
	
CREATE TABLE DIRECCION(
	COD_DIRECCION	CHAR(8),
	VIA				VARCHAR2(20),
	NOMBRE_VIA		VARCHAR2(50),
	NUMERO			NUMBER(3),
	PISO			NUMBER(1),
	PORTAL			CHAR(1),
	COD_POSTAL		CHAR(5)
	);
	
ALTER TABLE DIRECCION ADD CONSTRAINT PK_DIRECCION
	PRIMARY KEY (COD_DIRECCION);
	
CREATE TABLE PEDIDO(
	NUM_PEDIDO		NUMBER(5),
	FECHA			DATE,
	NUM_CLIENTE		NUMBER(5),
	COD_DIRECCION	CHAR(8)
	);
	
ALTER TABLE PEDIDO ADD CONSTRAINT PK_PEDIDO
	PRIMARY KEY (NUM_PEDIDO);
	
ALTER TABLE PEDIDO ADD CONSTRAINT FK1_NUM_CLIENTE FOREIGN KEY (NUM_CLIENTE)
	REFERENCES CLIENTE (NUM_CLIENTE);

ALTER TABLE PEDIDO ADD CONSTRAINT FK2_COD_DIRECCION FOREIGN KEY (COD_DIRECCION)
	REFERENCES DIRECCION (COD_DIRECCION);
	
CREATE SEQUENCE	NUM_CLIENTE;
CREATE SEQUENCE NUM_ARTÍCULO;
CREATE SEQUENCE NUM_FABRICA;
CREATE SEQUENCE NUM_PEDIDO;

CREATE TABLE POSEE(
	NUM_CLIENTE		NUMBER(5),
	COD_DIRECCION	CHAR(8)
	);
	
ALTER TABLE POSEE ADD CONSTRAINT PK_POSEE
	PRIMARY KEY (NUM_CLIENTE, COD_DIRECCION);
	
ALTER TABLE POSEE ADD CONSTRAINT FK1_POSEE FOREIGN KEY (NUM_CLIENTE)
	REFERENCES CLIENTE (NUM_CLIENTE);
	
ALTER TABLE POSEE ADD CONSTRAINT FK2_POSEE FOREIGN KEY (COD_DIRECCION)
	REFERENCES DIRECCION (COD_DIRECCION);
	
CREATE TABLE INCLUYE(
	NUM_PEDIDO		NUMBER(5),
	NUM_ARTÍCULO	NUMBER(5),
	CANTIDAD		NUMBER(5)
	);
	
ALTER TABLE INCLUYE ADD CONSTRAINT PK_INCLUYE 
	PRIMARY KEY (NUM_PEDIDO, NUM_ARTÍCULO);
	
ALTER TABLE INCLUYE ADD CONSTRAINT FK1_INCLUYE FOREIGN KEY (NUM_PEDIDO)
	REFERENCES PEDIDO (NUM_PEDIDO);
	
ALTER TABLE INCLUYE ADD CONSTRAINT FK2_INCLUYE FOREIGN KEY (NUM_ARTÍCULO)
	REFERENCES ARTICULO (NUM_ARTÍCULO);
	
CREATE TABLE DISTRIBUYE(
	NUM_ARTÍCULO	NUMBER(2),	
	NUM_FABRICA		NUMBER(5),
	CANT_SUMINISTRO	NUMBER(5),
	EXISTENCIAS		NUMBER(5)
	);
	
ALTER TABLE DISTRIBUYE ADD CONSTRAINT PK_DISTRIBUYE 
	PRIMARY KEY (NUM_ARTÍCULO, NUM_FABRICA);
	
ALTER TABLE DISTRIBUYE ADD CONSTRAINT FK1_DISTRIBUYE FOREIGN KEY (NUM_ARTÍCULO)
	REFERENCES ARTICULO (NUM_ARTÍCULO);
	
ALTER TABLE DISTRIBUYE ADD CONSTRAINT FK2_DISTRIBUYE FOREIGN KEY (NUM_FABRICA)
	REFERENCES FABRICA (NUM_FABRICA);
	
	