
ALTER TABLE profesor 
ADD nif VARCHAR(9) DEFAULT NULL,
ADD nombre VARCHAR(25),
ADD apellido1 VARCHAR(50),
ADD apellido2 VARCHAR(50) DEFAULT NULL,
ADD ciudad VARCHAR(25),
ADD direccion VARCHAR(50),
ADD telefono VARCHAR(9) DEFAULT NULL,
ADD fecha_nacimiento DATE,
ADD sexo ENUM('H', 'M');

UPDATE profesor
INNER JOIN persona ON profesor.id_profesor = persona.id
SET profesor.nif=persona.nif, 
    profesor.nombre=persona.nombre, 
    profesor.apellido1=persona.apellido1, 
    profesor.apellido2=persona.apellido2, 
    profesor.ciudad=persona.ciudad, 
    profesor.direccion=persona.direccion,
    profesor.telefono=persona.telefono, 
    profesor.fecha_nacimiento=persona.fecha_nacimiento, 
    profesor.sexo=persona.sexo 
WHERE profesor.id_profesor = persona.id;

ALTER TABLE `persona` DROP INDEX `nif`;

CREATE TABLE ciudad (
    ciudad_id INT(5) AUTO_INCREMENT,
    nombre VARCHAR(50),
    PRIMARY KEY (ciudad_id)
);

ALTER TABLE profesor DROP CONSTRAINT profesor_ibfk_1;
ALTER TABLE profesor DROP CONSTRAINT profesor_ibfk_2;
ALTER TABLE alumno_se_matricula_asignatura DROP CONSTRAINT alumno_se_matricula_asignatura_ibfk_1;
ALTER TABLE alumno_se_matricula_asignatura DROP CONSTRAINT alumno_se_matricula_asignatura_ibfk_2;
ALTER TABLE alumno_se_matricula_asignatura DROP CONSTRAINT alumno_se_matricula_asignatura_ibfk_2;
ALTER TABLE asignatura DROP CONSTRAINT asignatura_ibfk_1;
ALTER TABLE asignatura DROP CONSTRAINT asignatura_ibfk_2;
ALTER TABLE ciudad DROP CONSTRAINT sql-2180_d09_ibfk-1;




INSERT INTO ciudad VALUES 
(DEFAULT, 'Almería'),
(DEFAULT, 'Cuenca'),
(DEFAULT, 'Murcia'),
(DEFAULT, 'Jaen'),
(DEFAULT, 'Salamanca'),
(DEFAULT, 'Huelva'),
(DEFAULT, 'Logroño'),
(DEFAULT, 'Guadalajara'),
(DEFAULT, 'Zamora');

UPDATE persona SET ciudad = NULL;
UPDATE profesor SET ciudad = NULL;

ALTER TABLE persona DROP tipo;


INSERT INTO `tipo_asignatura` VALUES
(DEFAULT, 'básica'),
(DEFAULT, 'obligatoria'),
(DEFAULT, 'optativa');




