-- Ejemplo: imprimir números hasta un límite dado

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE bucle_limite(IN limite INT)
BEGIN
-- INICIALIZACIÓN
	SET @i = 1; -- = DECLARE INT DEFAULT 1;

-- COMPARACIÓN
	WHILE @i < limite DO 
		SELECT @i;
        SET @i = @i + 1; -- ACTUALIZACIÓN
	END WHILE;
END //

CALL bucle_limite(21);
