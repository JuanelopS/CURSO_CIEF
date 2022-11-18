-- Ejemplo: imprimir todos los números impares del uno al diez

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE impares()
BEGIN
-- INICIALIZACIÓN
	SET @i = 1; -- = DECLARE INT DEFAULT 1;

-- COMPARACIÓN
	WHILE @i <= 10 DO 
		IF @i % 2 != 0 THEN
			SELECT @i;
		END IF;
        SET @i = @i + 1; -- ACTUALIZACIÓN
	END WHILE;
END //

CALL impares();