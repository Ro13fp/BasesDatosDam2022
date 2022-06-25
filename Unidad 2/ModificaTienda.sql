--EJERCICIO2

--APARTADO A

--AÑADIR A LA TABLA STOCK:
--Una columna de tipo fecha llamada FechaUltimaEntrada que por defecto tome el valor de la fecha actual.

ALTER TABLE STOCK ADD FECHA_ULTIMA_ENTRADA DATE DEFAULT SYSDATE;

--Una columna llamada Beneficio que contendrá el tipo de porcentaje de beneficio que esa tienda aplica en ese producto.
--Se debe controlar que el valor que almacene sea 1,2, 3, 4 o 5.

ALTER TABLE STOCK ADD BENEFICIO NUMBER(1);
ALTER TABLE STOCK ADD CONSTRAINT CK_STOCK_BENEFICIO
CHECK (BENEFICIO IN ('1', '2', '3', '4', '5'));

--EN LA TABLA PRODUCTO:
--Eliminar de la tabla producto la columna Descripción.

ALTER TABLE PRODUCTO DROP COLUMN DESCRIPCION;

--Añadir una columna llamada perecedero que únicamente acepte los valores: S o N.

ALTER TABLE PRODUCTO ADD PERECEDERO CHAR(1);
ALTER TABLE PRODUCTO ADD CONSTRAINT CK_PRODUCTO_PERECEDERO
CHECK (PERECEDERO IN ('S', 'N'));

--Modificar el tamaño de la columna Denoproducto a 50.

ALTER TABLE PRODUCTO MODIFY DENOPRODUCTO VARCHAR2(50);

--EN LA TABLA FAMILIA
--Añadir una columna llamada IVA, que represente el porcentaje de IVA 
--y únicamente pueda contener los valores 21,10,ó 4.

ALTER TABLE FAMILIA ADD IVA NUMBER(2);
ALTER TABLE FAMILIA ADD CONSTRAINT CK_FAMILIA_IVA
CHECK (IVA IN('21', '10', '4'));

--EN LA TABLA TIENDA
--La empresa desea restringir el número de tiendas con las que trabaja, de forma que no pueda haber más de una tienda en una misma zona
--(la zona se identifica por el código postal). Definir mediante DDL las restricciones necesarias para que se cumpla en el campo correspondiente.

ALTER TABLE TIENDA DROP CONSTRAINT PK_TIENDA CASCADE;
ALTER TABLE TIENDA ADD CONSTRAINT PK_TIENDA
PRIMARY KEY(CODTIENDA, CODIGOPOSTAL);

--APARTADO B
--Renombra la tabla STOCK por PRODXTIENDAS.

RENAME STOCK TO PRODXTIENDAS;

--APARTADO C
--Elimina la tabla FAMILIA y su contenido si lo tuviera.

TRUNCATE TABLE FAMILIA;
DROP TABLE FAMILIA CASCADE CONSTRAINTS;

--APARTADO D
--Crea un usuario llamado C##INVITADO siguiendo los pasos de la unidad 1 y dale 
--todos los privilegios sobre la tabla PRODUCTO.

CREATE USER C##INVITADO IDENTIFIED BY 123;
GRANT ALL ON PRODUCTO TO C##INVITADO;

--APARTADO E
--Retira los permisos de modificar la estructura de la tabla
--y borrar contenido de la tabla PRODUCTO al usuario anterior.

REVOKE ALTER, DELETE ON PRODUCTO FROM C##INVITADO;















