-- Ejercicio 4 -> Enviar a un procedimiento un precio a pagar y el dinero disponible y mostrar si le falta dinero, 
-- indicarle cuanto, si le sobra indicar cuánto y si esta justo mostrar gracias por la compra

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE compra(IN precio INT, IN disponible INT)
BEGIN
	IF precio > disponible THEN
		SELECT concat("Faltan ", precio - disponible, " para poder pagar");
	ELSEIF disponible > precio THEN
		SELECT concat("Te sobra ", disponible - precio);
	ELSE 
		SELECT "Gracias por la compra";
	END IF;
END //

CALL compra(5,5);
