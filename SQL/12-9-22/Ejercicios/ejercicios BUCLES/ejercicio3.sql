-- Ejercicio 3: Mediante un bucle, guardar en una tabla la tabla de multiplicar de 10 x 10.

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE tabla_multiplicar()
BEGIN
	SET @num1 = 10;
    SET @num2 = 0;
    DROP TEMPORARY TABLE IF EXISTS temp_tabla;
    CREATE TEMPORARY TABLE temp_tabla(num1 INT, num2 INT, mult INT);
    WHILE @num2 <= 10 DO
		SET @mult = @num1 * @num2;
		INSERT INTO temp_tabla VALUES (@num1, @num2, @mult);
		SET @num2 = @num2 + 1;
	END WHILE;
    SELECT * FROM temp_tabla;
END //

CALL tabla_multiplicar();