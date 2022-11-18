-- Ejercicio 1: Enviar a un procedimiento un número. Mostrar todos los números pares en formato decreciente.

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE num_pares(IN num INT)
BEGIN
  SET @temp_num = num;
  DROP TEMPORARY TABLE IF EXISTS test_1;
  CREATE TEMPORARY TABLE test_1(num INT);
  WHILE @temp_num > 0 DO
	IF @temp_num % 2 = 0 THEN
		INSERT INTO test_1 VALUES (@temp_num);
	END IF;
    SET @temp_num = @temp_num - 1;
  END WHILE;
  SELECT * FROM test_1;
END //

CALL num_pares(21);
