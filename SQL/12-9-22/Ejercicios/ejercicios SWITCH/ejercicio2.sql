-- Ejercicio 2: Enviar a un procedimiento la edad de una persona. En función de esta mostrar: 
--  - Si tiene 0 -> Acabas de nacer
-- 	- Si tiene más de 0 y menos de 18 -> Eres menor de edad
-- 	- Si tiene 18 o más y menos de 65 -> Eres mayor de edad
-- 	- Si tiene más de 65 -> Ya puedes jubilarte.

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE comprobar_edad(IN edad INT)
BEGIN
	CASE TRUE
		WHEN edad = 0 THEN
			SELECT "Acabas de nacer" AS "EDAD";
		WHEN edad > 0 && edad < 18 THEN
			SELECT "Eres menor de edad" AS "EDAD";
		WHEN edad >= 18 && edad < 65 THEN
			SELECT "Eres mayor de edad" AS "EDAD";
		ELSE
			SELECT "Ya puedes jubilarte" AS "EDAD";
	END CASE;
END //

CALL comprobar_edad(39);