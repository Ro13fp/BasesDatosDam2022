CREATE TABLE cliente(
	nif			CHAR(9) PRIMARY KEY,
	nombre		VARCHAR2(50),
	direccion	VARCHAR2(50),
	telefono	CHAR(9)
	);
	
CREATE TABLE ModeloDormitorio(
	cod 		CHAR(3) PRIMARY KEY,
	);
	
CREATE TABLE montador(
	nif			CHAR(9) PRIMARY KEY,
	nombre		VARCHAR2(50),
	direccion	VARCHAR2(60),
	telefono	CHAR(9)
	);
	
CREATE TABLE compra(
	nif_c		CHAR(9) 	REFERENCES cliente (nif),
	modelo		CHAR(3) 	REFERENCES ModeloDormitorio (cod),
	FechaCompra	DATE,
	PRIMARY KEY (nif_c, modelo, FechaCompra)
	);
	
CREATE TABLE monta(
	modelo			CHAR(3) 	REFERENCES ModeloDormitorio (cod),
	nif_m			CHAR(9)		REFERENCES montador (nif),	
	FechaMontaje	DATE,
	PRIMARY KEY (modelo, nif_m, FechaMontaje)
	);
