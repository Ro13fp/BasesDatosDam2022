/* APARTADO1.- Si vamos a crear las tablas*/

nombre VARCHAR2(80) NOT NULL, /*En todas las tablas*/

apellido1 VARCHAR2(80) NOT NULL, /*En la tabla Empleados*/

presupuesto DECIMAL NOT NULL, /*en la tabla Departamentos*/

salario DECIMAL NOT NULL, /*En la tabla Historial Salarial*/

salario_min DECIMAL NOT NULL,/*En la tabla Trabajos*/
salario_max DECIMAL NOT NULL,/*En la tabla Trabajos*/

/*Si las tablas ya están creadas*/

ALTER TABLE nombre_tabla MODIFY nombre_campo TIPO NOT NULL;


/*APARTADO2.- El atributo SEXO en EMPLEADOS sólo puede tomar los valores H para hombre y M para Mujer*/

ALTER TABLE empleados
	ADD CONSTRAINT ck_sexo
	CHECK (sexo ='H' OR sexo = 'M') ;
	
/*APARTADO3.- Dos DEPARTAMENTOS no se llaman igual. Dos TRABAJOS tampoco*/

ALTER TABLE departamentos
	ADD CONSTRAINT uk_nombre_dpto
	UNIQUE (nombre_dpto) ;
	
ALTER TABLE trabajos
	ADD CONSTRAINT uk_nombre_trab
	UNIQUE (nombre_trab) ;
	
/*APARTADO4.- Cada empleado tiene un solo salario en cada momento. También cada empleado tendrá asignado un solo trabajo en cada momento*/

ALTER TABLE historial_salarial
	ADD CONSTRAINT pk_historial_salarial
	PRIMARY KEY (empleado_dni, salario, fecha_comienzo) ;
	
ALTER TABLE historial_laboral
	ADD CONSTRAINT pk_historial_laboral
	PRIMARY KEY (empleado_dni, trabajo_cod, fecha_inicio) 
	
/*APARTADO5.- Se ha de mantener la regla de Integridad de Referencia y pensar una clave primaria para cada tabla*/

/*PRIMARY KEY*/

ALTER TABLE empleados
	ADD CONSTRAINT pk_empleados
	PRIMARY KEY (dni) ;
	
ALTER TABLE departamentos	
	ADD CONSTRAINT pk_departamentos
	PRIMARY KEY (dpto_cod) ;
	
ALTER TABLE estudios
	ADD CONSTRAINT pk_estudios
	PRIMARY KEY (empleado_dni, universidad, especialidad) ;
	
ALTER TABLE historial_laboral
	ADD CONSTRAINT pk_historial_laboral
	PRIMARY KEY (empleado_dni, trabajo_cod, fecha_inicio) ;
	
ALTER TABLE univeridades
	ADD CONSTRAINT pk_universidades
	PRIMARY KEY (univ_cod) ;
	
ALTER TABLE historial_salarial
	ADD CONSTRAINT pk_historial_salarial
	PRIMARY KEY (empleado_dni, salario, fecha_comienzo) ;
	
ALTER TABLE trabajos
	ADD CONSTRAINT pk_trabajos
	PRIMARY KEY (trabajo_cod) ;
	
/*FOREIGN KEY*/

ALTER TABLE departamentos
	ADD CONSTRAINT fk_dpto_padre
	FOREIGN KEY (dpto_padre)
	REFERENCES departamentos (dpto_cod) ;
	
ALTER TABLE estudios
	ADD CONSTRAINT fk_esudios_empleado
	FOREIGN KEY (empleado_dni)
	REFERENCES empleados (dni) ;
	
ALTER TABLE estudios
	ADD CONSTRAINT fk_estudios_universidad
	FOREIGN KEY (universidad)
	REFERENCES univeridades (univ_cod) ;
	
ALTER TABLE historial_laboral
	ADD CONSTRAINT fk_historial_laboral_empleado
	FOREIGN KEY (empleado_dni)
	REFERENCES empleados (dni) ;
	
ALTER TABLE historial_laboral
	ADD CONSTRAINT fk_historial_laboral_trabajo
	FOREIGN KEY (trabajo_cod)
	REFERENCES trabajos (trabajo_cod) ;
	
ALTER TABLE historial_laboral
	ADD CONSTRAINT fk_historial_laboral_departamento
	FOREIGN KEY (dpto_cod)
	REFERENCES departamentos (dpto_cod) ;
	
ALTER TABLE historial_laboral
	ADD CONSTRAINT fk_historial_laboral_supervisor
	FOREIGN KEY (supervisor_dni)
	REFERENCES empleado (dni) ;
	
ALTER TABLE historial_salarial
	ADD CONSTRAINT fk_historial_salarial_empleado
	FOREIGN KEY (empleado_dni)
	REFERENCES empleados (dni) ;

	
	


