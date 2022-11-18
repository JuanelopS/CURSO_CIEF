DROP SCHEMA TEST;
CREATE SCHEMA TEST;
USE TEST;

-- Procedimiento: función que es llamada y ejecuta su bloque de código.
-- Puede recibir y devolver datos.

DROP PROCEDURE IF EXISTS mayor_edad;
DELIMITER //
-- IN -> parámetro de entrada OUT --> parámetro de salida
CREATE PROCEDURE mayor_edad(IN edad INT, OUT x INT)
BEGIN
	-- Comprobar si eres mayor de edad.
	-- Declarar y trabajar con variables de sesión (se pierden al reiniciarse el server sql).
	IF edad < 18 THEN 
		SELECT "Eres menor de edad";
	ELSE
		SELECT "Eres mayor de edad";
	END IF;
END //

DELIMITER ;

-- CALL PARA LLAMAR EL SCRIPT
CALL mayor_edad(14);

-- OTRA MANERA DE DECLARAR VARIABLES

DROP PROCEDURE IF EXISTS variables;
DELIMITER $$
CREATE PROCEDURE VARIABLES()
BEGIN
	DECLARE dato INT DEFAULT 0; -- DEFAULT ES PARA DARLE UN VALOR INT = 0;
    DECLARE nombre VARCHAR(5);
    DECLARE SI BOOLEAN;
    
	
END $$




