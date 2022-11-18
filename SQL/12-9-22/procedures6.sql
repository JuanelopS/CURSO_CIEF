DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DROP PROCEDURE IF EXISTS test;

DELIMITER //

-- AL CREAR PROCEDURES SI ES NECESARIO LOS ()
CREATE PROCEDURE test_fin_semana(IN dia VARCHAR(10))
BEGIN
	CASE TRUE
		WHEN dia = "Sábado" OR dia = "Domingo" THEN
			SELECT "Es fin de semana";
		ELSE
			SELECT "Es entre semana";
	END CASE;
END //

DELIMITER ;

CALL test_fin_semana("Rojo");
