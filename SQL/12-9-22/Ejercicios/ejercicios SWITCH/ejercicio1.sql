-- Ejercicio 1: Enviar a un procedimiento el número del día de la semana. Mostrar que día es. 
-- Ejemplo: 1 -> Lunes

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE dia_semana(IN dia INT)
BEGIN
	CASE dia
		WHEN 1 THEN
			SELECT "Lunes" as "Día de la semana";
		WHEN 2 THEN
			SELECT "Martes" as "Día de la semana";
		WHEN 3 THEN
			SELECT "Miércoles" as "Día de la semana";
		WHEN 4 THEN
			SELECT "Jueves" as "Día de la semana";
		WHEN 5 THEN
			SELECT "Viernes" as "Día de la semana";
		WHEN 6 THEN
			SELECT "Sábado" as "Día de la semana";
		WHEN 7 THEN
			SELECT "Domingo" as "Día de la semana";
		ELSE
			SELECT "Día incorrecto" as "Día de la semana";
	END CASE;
END //

CALL dia_semana(4);
