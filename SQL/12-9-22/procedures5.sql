DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DROP PROCEDURE IF EXISTS test;

DELIMITER //

-- AL CREAR PROCEDURES SI ES NECESARIO LOS ()
CREATE PROCEDURE test_telefono(IN num_tel CHAR(12))
BEGIN
	DECLARE prefijo CHAR(3); -- el + y 2 números
	SET prefijo = substr(num_tel, 1, 3); -- a partir de carácter 1 coge 3 (sql empieza por 1)
    CASE prefijo
		WHEN "+34" THEN
			SELECT "Número correcto";
		ELSE 
			SELECT "Número incorrecto";
    END CASE;
END //

DELIMITER ;

-- el call no imprime el resultado, es necesario el selectmayor_de_dos_nums
-- NO CASE SENSITIVE -> VERDE == verde
CALL test_telefono("+34666555444");
