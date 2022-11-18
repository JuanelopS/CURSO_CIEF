-- Ejercicio 7 -> Enviar a un procedimiento un día, mes, año (numéricos). Comprobar que sean correctos.

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE fecha(IN dia INT, IN mes INT, IN anyo INT)
BEGIN
	IF (dia > 0 && dia < 32) AND (mes > 0 && mes < 13) AND (anyo < 2023) THEN
		SELECT concat("La fecha ", dia, "/", mes, "/", anyo, " es correcta") as "FECHA";
	ELSE 
		SELECT concat("La fecha ", dia, "/", mes, "/", anyo, " es incorrecta") as "FECHA";
	END IF;
END //

CALL fecha(13,2,1983);