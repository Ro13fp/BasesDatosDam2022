CREATE TABLE region(
	CodRegion 		NUMBER(5) PRIMARY KEY,
	nombre			VARCHAR2(40));
	
CREATE TABLE provincia(
	CodProvincia 	NUMBER(5) PRIMARY KEY,
	nombre			VARCHAR2(40),
	CodRegion		NUMBER(5) REFERENCES region (CodRegion)
	);
	
CREATE TABLE localidad(
	CodLocalidad	NUMBER(5) PRIMARY KEY,
	nombre			VARCHAR2(40),
	CodProvincia 	NUMBER(5) REFERENCES provincia (CodProvincia)
	);
	
CREATE TABLE empleado (
	id				NUMBER(3) PRIMARY KEY,
	dni				CHAR(9) UNIQUE,
	nombre			VARCHAR2(40),
	FechaNac		DATE,
	telefono		CHAR(9),
	salario			NUMBER(6, 2),
	CodLocalidad	NUMBER(5) REFERENCES localidad (CodLocalidad)
	);
	