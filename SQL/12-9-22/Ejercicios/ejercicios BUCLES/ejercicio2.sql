-- Ejercicio 2: Enviar a un procedimiento dos números (base, exponente). Mostrar la potencia.

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE potencia(IN base INT, IN exponente INT)
BEGIN
	SET @temp_exponente = exponente;
    SET @temp_base = base;
    
	WHILE @temp_exponente > 1 DO
		SET @temp_base = @temp_base * base;
		SET @temp_exponente = @temp_exponente - 1;
	END WHILE;
	SELECT @temp_base;
END //

CALL potencia(2,3);