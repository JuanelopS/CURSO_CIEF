
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE cod_access(
	id int primary key auto_increment,
    nombre varchar(45),
    codigo int);

INSERT INTO cod_access VALUE(default, "Código 1", 1111);
INSERT INTO cod_access VALUE(default, "Código 2", 2222);
INSERT INTO cod_access VALUE(default, "Código 3", 3333);
    
CREATE TABLE cod_access_log(
	id int primary key auto_increment,
	usuario varchar(255),
	fecha datetime default CURRENT_TIMESTAMP,
	nombre varchar(45),
	codigo_old INT,
	codigo_new INT);


DROP TRIGGER IF EXISTS cod_user_log;
DELIMITER //
CREATE TRIGGER cod_user_log BEFORE UPDATE ON cod_access
FOR EACH ROW 
BEGIN
	INSERT INTO cod_access_log VALUES (
		default,
        current_user(),
        default,
        old.nombre,
        old.codigo,
        new.codigo);
END //
DELIMITER ;

UPDATE cod_access SET codigo = 1112 WHERE id = 1;
SELECT * FROM cod_access_log;


