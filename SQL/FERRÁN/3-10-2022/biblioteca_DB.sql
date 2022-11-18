
DROP SCHEMA IF EXISTS juan_biblioteca;
CREATE DATABASE juan_biblioteca;
USE juan_biblioteca;
SET NAMES utf8mb4;

CREATE TABLE usuarios (
	id_usuario INT(5) AUTO_INCREMENT,
    nombre_usuario VARCHAR(50),
    apellido_usuario VARCHAR(60),
    email_usuario VARCHAR(150),
    num_consultas INT(5) DEFAULT 0,
    num_prestamos INT(5) DEFAULT 0,
    num_dias_falta INT(5) DEFAULT 0,
	fecha_alta DATE,
    bloqueo_usuario BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_usuario)
);

CREATE TABLE prestamos (
	id_prestamo INT(5) AUTO_INCREMENT,
    id_usuario INT(5),
    id_libro INT(5),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    PRIMARY KEY (id_prestamo)
);

CREATE TABLE libros (
	id_libro INT(5) AUTO_INCREMENT,
    id_autor INT(5),
    id_editorial INT(5),
    titulo_libro VARCHAR (100),
    any_edicion YEAR(4),
    descripcion_libro TEXT(100000) DEFAULT NULL,
    FULLTEXT(descripcion_libro),
    PRIMARY KEY (id_libro)
);

CREATE TABLE autores (
	id_autor INT(5) AUTO_INCREMENT,
    nombre_autor VARCHAR(40),
    apellido_autor VARCHAR(60),
    pseudonimo VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (id_autor)
);

CREATE TABLE editoriales (
	id_editorial INT(5) AUTO_INCREMENT,
    id_ciudad INT(5),
    nombre_editorial VARCHAR(50),
    PRIMARY KEY (id_editorial, nombre_editorial)
);

CREATE TABLE ciudades (
	id_ciudad INT(5) AUTO_INCREMENT,
    nombre_ciudad VARCHAR(40),
    PRIMARY KEY (id_ciudad, nombre_ciudad)
);

CREATE TABLE sugerencias (
	id_sugerencia INT(5) PRIMARY KEY AUTO_INCREMENT,
	id_usuario INT(5) NOT NULL,
	titulo_sugerencia VARCHAR(100) NOT NULL,
	rating_sugerencia ENUM('1','2','3','4','5') DEFAULT '1',
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

ALTER TABLE prestamos
ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
ADD FOREIGN KEY (id_libro) REFERENCES libros(id_libro);

ALTER TABLE libros
ADD FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
ADD FOREIGN KEY (id_editorial) REFERENCES editoriales(id_editorial);

ALTER TABLE editoriales
ADD FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad);

-- (id_usuario, nombre_usuario, apellido_usuario, email_usuario, num_consultas, num_prestamos, num_dias_falta, fecha_alta, bloqueo_usuario) 
INSERT INTO usuarios VALUES 
(DEFAULT, 'Juan', 'Gavira', 'contacto@juangavira.me', 3, 2, 5, '1983/02/13', FALSE),
(DEFAULT, 'Pedro', 'Picapiedra', 'pedro@correo.com', 1, 2, 5, '1993/11/22', FALSE),
(DEFAULT, 'Pablo', 'Escobar', 'pablo@correo.com', 1, 5, 3, '1983/02/13', TRUE),
(DEFAULT, 'Michael', 'Jordan', 'jordan@correo.com', 1, 2, 5, '1966/12/31', FALSE),
(DEFAULT, 'Pablo', 'Iglesias', 'pabloiglesias@correo.com', 5, 2, 1, '1980/06/11', FALSE),
(DEFAULT, 'Manolito', 'Gafotas', 'manolito@correo.com', 2, 1, 3, '2003/11/19', FALSE),
(DEFAULT, 'José', 'Coronado', 'jose@correo.com', 1, 1, 1, '1987/08/17', TRUE),
(DEFAULT, 'Cris', 'Kekw', 'cris@correo.com', 1, 5, 5, '1990/08/23', FALSE),
(DEFAULT, 'Ferran', 'Profe', 'ferran@correo.com', 5, 5, 6, '1973/01/22', FALSE),
(DEFAULT, 'Juan', 'Gavira', 'contacto@juangavira.me', 3, 2, 5, '1983/02/13', FALSE)
;

DELIMITER //
DROP TRIGGER IF EXISTS contador_consulta;
SET @consulta = SELECT * FROM usuarios WHERE id_usuario = $_SESSION['id_usuario'];

CREATE TRIGGER contador_consulta AFTER @consulta ON usuarios;
FOR EACH ROW 
BEGIN
	UPDATE usuarios SET num_consultas = num_consultas + 1
    WHERE id_usuario = $_SESSION['id_usuario'];
END //
DELIMITER ;






