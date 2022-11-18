-- Ejercicio 4: Enviar a un procedimiento un número. Calcular si es primo o no.

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE primo(IN num INT)
BEGIN
	SET @temp_num = num - 1;
    SET @no_primo = FALSE;
    
bucle: WHILE (@temp_num > 1) DO
		IF num % @temp_num = 0 THEN
			SELECT concat(num, " no es primo") AS "RESULTADO";
            SET @no_primo = TRUE;
            LEAVE bucle;
		END IF;
		SET @temp_num = @temp_num - 1;
    END WHILE bucle;
    
    IF @no_primo = FALSE THEN
		SELECT concat(num, " es primo") AS "RESULTADO";
	END IF;
END //

CALL primo(11);