-- * BUSCAR EL ERROR AL EJECUTARSE :(

-- Un trigger está a nivel de tabla

-- BEFORE/AFTER CREATE/UPDATE/DELETE
-- CREATE/DROP TRIGGER

-- EN LOS TRIGGERS, SI SOLAMENTE HAY UNA INSTRUCCIÓN, PUEDEN AHORRARSE EL BEGIN/END 

-- NEW, SIEMPRE EN LOS INSERT PORQUE NO HAY PASADO AL INSERTAR

-- DELETE -> SIEMPRE OLD

-- EJEMPLO:

-- CREATE TABLE account (acct_num INT, amount DECIMAL(10,2));
-- Query OK, 0 rows affected (0.03 sec)

-- CREATE TRIGGER ins_sum BEFORE INSERT ON account
-- FOR EACH ROW SET @sum = @sum + NEW.amount;


-- Trigger: validar la edad de un usuario: CREATE, UPDATE Y DELETE (no SELECT)
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE usuarios(
	id int primary key auto_increment,
    nombre varchar(45),
    edad int);

DELIMITER //
DROP TRIGGER IF EXISTS valida_edad;

CREATE TRIGGER valida_edad BEFORE INSERT ON usuarios
FOR EACH ROW 
BEGIN
	IF NEW.edad < 18 THEN
		SET NEW.edad = NULL;
	END IF;
END //
DELIMITER ;

INSERT INTO usuarios VALUES (default, "Armando", 42);
SELECT * FROM usuarios;



