DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE users(
	email VARCHAR(100) PRIMARY KEY,
    pass VARCHAR(100)
);

CREATE TABLE log_session(
	email VARCHAR(100) PRIMARY KEY,
    fecha datetime
);

INSERT INTO users VALUES("armando@gmail.com", "123456");

DROP PROCEDURE IF EXISTS login;

DELIMITER //

-- AL CREAR PROCEDURES SI ES NECESARIO LOS ()
CREATE PROCEDURE log_session(IN user_email VARCHAR(100), IN user_pass VARCHAR(100))
BEGIN
	-- en un variable que almacena una consulta hay que poner entre paréntesis la consulta
	SET @db_email = (SELECT email FROM users WHERE email = user_email);
    SET @db_pass = (SELECT pass FROM users WHERE pass = user_pass);
    
	IF user_email = @db_email AND user_pass = @db_pass THEN
		INSERT INTO log_session VALUES (user_email, now());
        SELECT "Correcto";
	ELSE
		SELECT "Login Incorrecto";
	END IF;	
END //

DELIMITER ;

CALL log_session("armando@gmail.com", "123456");
