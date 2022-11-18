-- Ejercicio 5 -> Enviar a un procedimiento 3 números. Ordenar descendentemente.

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE ordenar(IN num1 INT, IN num2 INT, IN num3 INT)
BEGIN
	IF num1 >= num2 && num2 >= num3 THEN
		SELECT num3, num2, num1;
	ELSEIF num1 >= num2 && num3 >= num2 THEN
		SELECT num2, num3, num1;
	ELSEIF num2 >= num1 && num1 >= num3 THEN
		SELECT num3, num1, num2;
	ELSEIF num2 >= num1 && num3 >= num1 THEN
		SELECT num1, num3, num2;
	ELSEIF num3 >= num1 && num1 >= num2 THEN
		SELECT num2, num1, num3;
	ELSE 
		SELECT num1, num2, num3;
	END IF;
END //

CALL ordenar(5,1,2);