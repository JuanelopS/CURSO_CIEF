DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DROP PROCEDURE IF EXISTS semaforo;

DELIMITER //

-- AL CREAR PROCEDURES SI ES NECESARIO LOS ()
CREATE PROCEDURE semaforo(IN color VARCHAR(5), OUT resultado VARCHAR(20))
BEGIN
	CASE color
		WHEN "rojo" THEN 
			SET resultado = "No puedes pasar";
        WHEN "ambar" THEN 
			SET resultado = "Precaución";
        WHEN "verde" THEN 
			SET resultado = "Puedes pasar";
		ELSE
			SET resultado = "Color incorrecto";
	END CASE;
END //

DELIMITER ;

-- el call no imprime el resultado, es necesario el select
-- NO CASE SENSITIVE -> VERDE == verde
CALL semaforo("rojo", @resultado);

SELECT @resultado;