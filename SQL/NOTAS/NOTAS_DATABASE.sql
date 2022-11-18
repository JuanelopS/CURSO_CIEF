DROP SCHEMA IF EXISTS IFCD0210;

CREATE SCHEMA IFCD0210;

USE IFCD0210;

CREATE TABLE MODULOS(
	id_modulo VARCHAR(10) PRIMARY KEY,
    nombre_modulo VARCHAR(100)
);

CREATE TABLE UNIDADES(
	id_unidad VARCHAR(10) PRIMARY KEY,
    nombre_unidad VARCHAR(100),
    horas_unidad TINYINT,
    id_modulo VARCHAR(10),
    FOREIGN KEY (id_modulo) REFERENCES MODULOS(id_modulo)
);

CREATE TABLE ALUMNOS(
	id_alumno INT PRIMARY KEY AUTO_INCREMENT,
    nombre_alumno VARCHAR(30)
);

CREATE TABLE NOTAS(
	id_alumno INT,
    id_unidad VARCHAR(10),
    nota INT,
    FOREIGN KEY (id_alumno) REFERENCES ALUMNOS(id_alumno),
    FOREIGN KEY (id_unidad) REFERENCES UNIDADES(id_unidad)
);
    

