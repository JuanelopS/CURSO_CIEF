-- Ejercicio 6 -> Comprobar letra DNI. Enviar a un procedimiento el número del DNI.

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DROP TABLE IF EXISTS dni;
CREATE TABLE dni(
	resto int primary key,
    letra char(1)
);

SELECT * FROM dni;
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('0', 'T');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('1', 'R');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('2', 'W');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('3', 'A');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('4', 'G');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('5', 'M');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('6', 'Y');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('7', 'F');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('8', 'P');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('9', 'D');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('10', 'X');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('11', 'B');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('12', 'N');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('13', 'J');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('14', 'Z');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('15', 'S');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('16', 'Q');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('17', 'V');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('18', 'H');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('19', 'L');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('20', 'C');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('21', 'K');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('22', 'E');

DELIMITER //

CREATE PROCEDURE comprueba_dni(IN dni VARCHAR(9))
BEGIN
	SET @dni_nums = substr(dni, 1, 8);
    SET @dni_letra = substr(dni, 9, 1);
    SET @resto = @dni_nums % 23;
    -- SELECT @dni_nums, @dni_letra;
	
    IF @dni_letra = (SELECT letra FROM dni WHERE @resto = resto) THEN
		SELECT "Dni correcto" AS "resultado";
	ELSE
		SELECT concat("La letra correcta para", @dni_nums, " es ", (SELECT letra FROM dni WHERE @resto = resto)) AS "resultado";
	END IF;	
END //

CALL comprueba_dni("75767753A");