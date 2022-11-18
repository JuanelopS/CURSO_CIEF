-- Ejemplo: REPEAT

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE do_repeat(IN p1 INT)
BEGIN
	SET @x = 0;
    REPEAT 
		SET @x = @x + 1;
	UNTIL @x = p1 END REPEAT;
END //

CALL do_repeat(20);

SELECT @x;
