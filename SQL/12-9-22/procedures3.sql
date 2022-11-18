DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DROP PROCEDURE IF EXISTS mayor_de_dos_nums;

DELIMITER //

-- AL CREAR PROCEDURES SI ES NECESARIO LOS ()
CREATE PROCEDURE mayor_de_dos_nums(IN n1 INT, IN n2 INT, OUT resultado VARCHAR(20))
BEGIN
	-- resultado es un parámetro de salida, no una variable
	IF n1 > n2 THEN
		SET resultado = concat(n1, " es mayor que ", n2);
	ELSEIF n2 > n1 THEN
		SET resultado = concat(n2, " es mayor que ", n1);
	ELSE 
		SET resultado = "Son iguales";
	END IF;
END //

DELIMITER ;

-- el call no imprime el resultado, es necesario el selectmayor_de_dos_nums
CALL mayor_de_dos_nums(4,2,@resultado);

SELECT @resultado;