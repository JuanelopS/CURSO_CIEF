
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
    bloqueo_usuario BOOLEAN,
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

ALTER TABLE prestamos
ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
ADD FOREIGN KEY (id_libro) REFERENCES libros(id_libro);

ALTER TABLE libros
ADD FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
ADD FOREIGN KEY (id_editorial) REFERENCES editoriales(id_editorial);

ALTER TABLE editoriales
ADD FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad);





