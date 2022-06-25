-- sentencia que modifique el crédito de aquellos usuarios que tienen una partida creada
--y cuyo estado es 1. El valor del crédito que se les asigna es el valor más alto de los
--créditos de todos los usuarios.


UPDATE usuarios
SET credito = (SELECT MAX(credito)
				FROM usuarios)
WHERE login IN (SELECT cod_creador
				FROM partidas
				where estado =1);
				