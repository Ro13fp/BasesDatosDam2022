CREATE TABLE departamento (
	id 			NUMBER (3) PRIMARY KEY,
	nombre 		VARCHAR2(50),
	ubicacion	VARCHAR2(50)
	);
	
CREATE TABLE empleado (
	id			NUMBER(3) PRIMARY KEY,
	dni			CHAR(9) UNIQUE,
	nombre		VARCHAR2(50),
	salario		NUMBER(6,2),
	telefono	CHAR(9),
	IdDep		NUMBER(3) REFERENCES departamento (id)
	);
	
CREATE TABLE jefe (
	id			NUMBER(3) PRIMARY KEY,
	dni			CHAR(9)	UNIQUE,
	nombre		VARCHAR2(50),
	salario		NUMBER (6,2),
	telefono	CHAR(9),
	IdDep		NUMBER(3) REFERENCES departamento (id)
	);
