DROP SCHEMA TEST;
CREATE SCHEMA TEST;
USE TEST;

-- Procedimiento: función que es llamada y ejecuta su bloque de código.
-- Puede recibir y devolver datos.

DROP PROCEDURE IF EXISTS mayor_edad;
DELIMITER //
CREATE PROCEDURE mayor_edad()
BEGIN
	-- Comprobar si eres mayor de edad.
	-- Declarar y trabajar con variables de sesión @ (se pierden al reiniciarse el server sql).
    -- Las variables de sesión no necesitan tipado.
	SET @edad = 22;
	IF @edad < 18 THEN 
		SELECT "Eres menor de edad";
	ELSE
		SELECT "Eres mayor de edad";
	END IF;
END //

DELIMITER ;

-- CALL PARA LLAMAR EL SCRIPT
CALL mayor_edad();


