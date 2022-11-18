-- Ejercicio 2 -> Enviar a un procedimiento un número. Mostrar si es par o impar

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DROP PROCEDURE IF EXISTS par_impar;

DELIMITER //

CREATE PROCEDURE par_impar(IN numero INT)
BEGIN
	IF numero % 2 != 0 THEN
		SELECT "Número impar";
	ELSE
		SELECT "Número par";
	END IF;
END //

CALL par_impar(0);