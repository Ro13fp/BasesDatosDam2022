CREATE TABLE sucursal(
	codigo		CHAR(4) CONSTRAINT pk_sucursal PRIMARY KEY,
	direccion	VARCHAR2(40),	
	telefono	CHAR(9)
	);
	

CREATE TABLE periodista(
	dni				CHAR(9) 		CONSTRAINT pk_periodista PRIMARY KEY,
	nombre 			VARCHAR2(50) 	CONSTRAINT nn_nombre NOT NULL,
	direccion		VARCHAR2(40),
	telefono		CHAR(9),	
	especialista	VARCHAR2(40)
	);
	
CREATE TABLE empleado(
	dni			CHAR(9) 		CONSTRAINT pk_empleado PRIMARY KEY,
	nombre		VARCHAR2(50)	CONSTRAINT nn_nombre_empleado NOT NULL,
	direccion	VARCHAR2(40),
	telefono	CHAR(9),
	sucursal	CHAR(4) CONSTRAINT fk_sucursal
		REFERENCES sucursal (codigo)
	);
	
CREATE TABLE revista(
	NumReg			NUMBER(8) CONSTRAINT pk_revista PRIMARY KEY,
	titulo			VARCHAR2(50) CONSTRAINT nn_titulo NOT NULL,
	periodicidad	VARCHAR2(40) DEFAULT 'Mensual',
	tipo			VARCHAR(20),
	sucursal		CHAR(4) CONSTRAINT fk_sucursal_revista
		REFERENCES sucursal (codigo),
	CONSTRAINT ck_periodicidad
		CHECK (periodicidad IN ('Semanal', 'Quincenal', 'Mensual', 'Trimestral', 'Anual'))
	);
	
CREATE TABLE NumRevista(
	NumReg			NUMBER(6),
	numero			NUMBER(6),
	numPaginas		NUMBER(10),	
	fecha			DATE,
	cantVendidas	NUMBER(50),
	CONSTRAINT fk_NumRevista FOREIGN KEY (NumReg)
		REFERENCES revista(NumReg),
	CONSTRAINT pk_NumRevistas PRIMARY KEY (NumReg, numero),
	CONSTRAINT ck_numPaginas CHECK (numPaginas > 0)
	);
	
CREATE TABLE escribe(
	numReg		CHAR(8),
	dni_per		CHAR(8),
	CONSTRAINT fk1_escribe FOREIGN KEY (NumReg)
		REFERENCES revista(NumReg),
	CONSTRAINT fk2_escribe FOREIGN KEY (dni_periodista)
		REFERENCES periodista(dni),
	CONSTRAINT pk_escribe PRIMARY KEY (numReg, dni_per)
	);