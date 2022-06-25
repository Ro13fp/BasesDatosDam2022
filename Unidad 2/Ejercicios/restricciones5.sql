CREATE TABLE coche(
	matricula 	CHAR(7) 		CONSTRAINT pk_coche PRIMARY KEY,
	marca		VARCHAR2(50)	CONSTRAINT nn_marca NOT NULL,
	modelo		VARCHAR2(20)	CONSTRAINT nn_modelo NOT NULL,
	color		VARCHAR2(20),
	PrecioHora	NUMBER
	);
	
CREATE TABLE cliente(
	CodCliente	CHAR(4) 		CONSTRAINT pk_cliente PRIMARY KEY,
	dni			CHAR(9) 		CONSTRAINT uk_dni UNIQUE,
	nombre		VARCHAR2(40)	CONSTRAINT nn_nombre NOT NULL,
	dirección	VARCHAR2(40),
	telefono	CHAR(9)
	);
	
CREATE TABLE reserva(
	numero		NUMBER(4)	CONSTRAINT pk_reserva PRIMARY KEY,
	FechaInicio	DATE,
	FechaFin	DATE,
	PrecioTotal	NUMBER,
	CodCliente	CHAR(4)		CONSTRAINT fk_reserva
		REFERENCES cliente (CodCliente)
	);
	
CREATE TABLE avala(
	avalado 	NUMBER(3),  
	avalador	NUMBER(3), 
	CONSTRAINT pk_avala PRIMARY KEY (avalado),
	CONSTRAINT fk1_avala FOREIGN KEY (avalado)
		REFERENCES cliente (CodCliente),
	CONSTRAINT fk2_avala FOREIGN KEY (avalador)
		REFERENCES cliente (CodCliente)
	);
	
CREATE TABLE incluye(
	numero		VARCHAR2(20), 
	matricula	CHAR(7), 	 
	litrosGas	NUMBER,
	CONSTRAINT pk_incluye PRIMARY KEY (numero, matricula),
	CONSTRAINT fk1_incluye FOREIGN KEY (numero)
		REFERENCES reserva (numero),
	CONSTRAINT fk2_incluye FOREIGN KEY (matricula)
		REFERENCES coche (matricula)
	);