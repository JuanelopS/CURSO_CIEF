-- Ejercicio 1 -> Enviar a un procedimiento el color del semáforo y mostrar si
-- puede pasar, extremar la precaución o no pasar.

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DROP PROCEDURE IF EXISTS semaforo;

DELIMITER //

CREATE PROCEDURE semaforo(IN color VARCHAR(15))
BEGIN
	IF color = "rojo" THEN 
		SELECT "No puedes pasar";
	ELSEIF color = "ambar" THEN 
		SELECT "Precaucion";
	ELSEIF color = "verde" THEN
		SELECT "Puedes pasar";
	ELSE 
		SELECT "Color incorrecto";
	END IF;
END //

DELIMITER ;

CALL semaforo("rojo");