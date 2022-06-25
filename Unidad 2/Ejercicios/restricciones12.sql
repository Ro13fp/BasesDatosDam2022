CREATE TABLE EMPLEADO(
	COD_EMP		NUMBER(5),
	NIF			CHAR(9),
	NOMBRE		VARCHAR2(40),
	APELLIDOS	VARCHAR2(40),
	DIRECCION	VARCHAR2(40),
	TELEFONO	CHAR(9),
	FECHA_NAC	DATE,
	SALARIO		NUMBER
	);
	
ALTER TABLE EMPLEADO ADD CONSTRAINT PK_EMPLEADO
	PRIMARY KEY(COD_EMP);
	
CREATE INDEX APELLIDOS_EMP_IDX ON EMPLEADO(APELLIDOS);

CREATE TABLE EMP_CAPACITADO(
	COD_EMP	NUMBER(5)
	);
	
ALTER TABLE EMP_CAPACITADO ADD CONSTRAINT PK_EMP_CAPACITADO
	PRIMARY KEY(COD_EMP);
	
ALTER TABLE EMP_CAPACITADO ADD CONSTRAINT FK_EMP_CAPACITADO
	FOREIGN KEY(COD_EMP)
	REFERENCES EMPLEADO(COD_EMP);
	
CREATE TABLE EMP_NO_CAPACITADO(
	COD_EMP NUMBER(5)
	);
	
ALTER TABLE EMP_NO_CAPACITADO ADD CONSTRAINT PK_EMP_NO
	PRIMARY KEY(COD_EMP);
	
ALTER TABLE EMP_NO_CAPACITADO ADD CONSTRAINT FK_EMP_NO
	FOREIGN KEY(COD_EMP)
	REFERENCES EMPLEADO(COD_EMP);
	
CREATE TABLE CURSO(
	COD_CURSO	NUMBER(3),	
	NOMBRE		VARCHAR2(40),
	DURACION	NUMBER(3),
	COSTE		NUMBER
	);
	
ALTER TABLE CURSO ADD CONSTRAINT PK_CURSO
	PRIMARY KEY(COD_CURSO);
	

CREATE TABLE EDICION(
	COD_CURSO		NUMBER(3),
	FECHA_INICIO	DATE,
	LUGAR			VARCHAR2(40),
	HORARIO			VARCHAR2(40),
	PROFESOR		NUMBER(5)
	);
	
	
ALTER TABLE EDICION ADD CONSTRAINT PK_EDICION
	PRIMARY KEY(COD_CURSO, FECHA_INICIO);
	
ALTER TABLE EDICION ADD CONSTRAINT FK1_EDICION
	FOREIGN KEY(COD_CURSO)
	REFERENCES CURSO(COD_CURSO);
	
ALTER TABLE EDICION ADD CONSTRAINT FK2_EDICION
	FOREIGN KEY(PROFESOR)
	REFERENCES EMP_CAPACITADO(COD_EMP)
	
CREATE INDEX LUGAR_EDICION_IDX ON EDICION(LUGAR);
CREATE INDEX HORARIO_EDICION_IDX ON EDICION(HORARIO);

CREATE TABLE RECIBE(
	COD_EMPLEADO	NUMBER(5),
	COD_CURSO		NUMBER(3),
	FECHA_INICIO	DATE
	);
	
ALTER TABLE RECIBE ADD CONSTRAINT PK_RECIBE
	PRIMARY KEY(COD_EMPLEADO, COD_CURSO, FECHA_INICIO);
	
ALTER TABLE RECIBE ADD CONSTRAINT FK1_RECIBE
	FOREIGN KEY(COD_EMPLEADO)
	REFERENCES EMPLEADO(COD_EMP);
	
ALTER TABLE RECIBE ADD CONSTRAINT FK2_RECIBE
	FOREIGN KEY(COD_CURSO, FECHA_INICIO)
	REFERENCES EDICION(COD_CURSO, FECHA_INICIO);
	

	
CREATE TABLE PRERREQUISITO(
	CURSO_SOLICITADO	NUMBER(3),
	CURSO_PREVIO		NUMBER(3),
	OBLIGATORIO			CHAR(1)
	);
	
ALTER TABLE PRERREQUISITO ADD CONSTRAINT PK_PRERREQUISITO
	PRIMARY KEY(CURSO_SOLICITADO, CURSO_PREVIO);
	
ALTER TABLE PRERREQUISITO ADD CONSTRAINT FK1_PRERREQUISITO
	FOREIGN KEY(CURSO_SOLICITADO)
	REFERENCES CURSO(COD_CURSO);
	
ALTER TABLE PRERREQUISITO ADD CONSTRAINT FK2_PRERREQUISITO
	FOREIGN KEY(CURSO_PREVIO)
	REFERENCES CURSO(COD_CURSO);
	
ALTER TABLE PRERREQUISITO ADD CONSTRAINT CK_OBLIGATORIO
	CHECK (OBLIGATORIO IN ('S', 'N'));