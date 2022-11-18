-- Ejercicio 3 -> Enviar a un procedimiento 3 números. Indicar si el tercero es la suma de los dos primeros o no.

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //
CREATE PROCEDURE numeros(IN num1 INT, IN num2 INT, IN suma INT)
BEGIN
	IF suma = num1 + num2 THEN
		SELECT concat(suma, " es la suma de ", num1, " y ", num2);
	ELSE 
		SELECT concat(suma, " no es la suma de ", num1, " y ", num2);
	END IF;
END //

CALL numeros(1,2,3);
