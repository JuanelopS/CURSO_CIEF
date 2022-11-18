DROP DATABASE IF EXISTS instituto;

CREATE DATABASE instituto CHARACTER SET utf8mb4;

USE instituto;

CREATE TABLE alumno (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
fecha_nacimiento DATE NOT NULL,
es_repetidor ENUM('sí', 'no') NOT NULL,
teléfono VARCHAR(9)
);

INSERT INTO alumno VALUES(1, 'María', 'Sánchez', 'Pérez',
'1990/12/01', 'no', NULL);
INSERT INTO alumno VALUES(2, 'Juan', 'Sáez', 'Vega',
'1998/04/02', 'no', 618253876);
INSERT INTO alumno VALUES(3, 'Pepe', 'Ramírez', 'Gea',
'1988/01/03', 'no', NULL);
INSERT INTO alumno VALUES(4, 'Lucía', 'Sánchez', 'Ortega',
'1993/06/13', 'sí', 678516294);
INSERT INTO alumno VALUES(5, 'Paco', 'Martínez', 'López',
'1995/11/24', 'no', 692735409);
INSERT INTO alumno VALUES(6, 'Irene', 'Gutiérrez', 'Sánchez',
'1991/03/28', 'sí', NULL);
INSERT INTO alumno VALUES(7, 'Cristina', 'Fernández',
'Ramírez', '1996/09/17', 'no', 628349590);
INSERT INTO alumno VALUES(8, 'Antonio', 'Carretero', 'Ortega',
'1994/05/20', 'sí', 612345633);
INSERT INTO alumno VALUES(9, 'Manuel', 'Domínguez',
'Hernández', '1999/07/08', 'no', NULL);
INSERT INTO alumno VALUES(10, 'Daniel', 'Moreno', 'Ruiz',
'1998/02/03', 'no', NULL);

SET lc_time_names = 'es_ES';  -- PARA QUE FUNCIONE CORRECTAMENTE SE DEBE USAR LA VARIABLE DE SESIÓN

-- 1. Devuelva un listado con cuatro columnas, donde aparezca en la
-- primera columna la fecha de nacimiento completa de los
-- alumnos, en la segunda columna el día, en la tercera el mes y en
-- la cuarta el año. Utilice las funciones DAY , MONTH y YEAR .

SELECT fecha_nacimiento, DAY(fecha_nacimiento), MONTH(fecha_nacimiento), YEAR(fecha_nacimiento) FROM alumno;	

-- 2. Devuelva un listado con tres columnas, donde aparezca en la
-- primera columna la fecha de nacimiento de los alumnos, en la
-- segunda el nombre del día de la semana de la fecha de
-- nacimiento y en la tercera el nombre del mes de la fecha de
-- nacimiento.
-- • Resuelva la consulta utilizando las
-- funciones DAYNAME y MONTHNAME .
-- • Resuelva la consulta utilizando la función DATE_FORMAT .


SELECT DATE_FORMAT(fecha_nacimiento, '%d %M %Y'), DAYNAME(fecha_nacimiento), MONTHNAME(fecha_nacimiento) FROM alumno;

-- 3. Devuelva un listado con dos columnas, donde aparezca en la
-- primera columna la fecha de nacimiento de los alumnos y en la
-- segunda columna el número de días que han pasado desde la
-- fecha actual hasta la fecha de nacimiento. Utilice las
-- funciones DATEDIFF y NOW . Consulte la documentación oficial de
-- MySQL para DATEDIFF .

SELECT fecha_nacimiento, DATEDIFF(now(), fecha_nacimiento) FROM alumno;

-- 4. Devuelva un listado con dos columnas, donde aparezca en la
-- primera columna la fecha de nacimiento de los alumnos y en la
-- segunda columna la edad de cada alumno/a. La edad
-- (aproximada) la podemos calcular realizando las siguientes
-- operaciones:
-- • Calcula el número de días que han pasado desde la fecha actual
-- hasta la fecha de nacimiento. Utilice las
-- funciones DATEDIFF y NOW .
-- • Divida entre 365.25 el resultado que ha obtenido en el paso
-- anterior. (El 0.25 es para compensar los años bisiestos que han
-- podido existir entre la fecha de nacimiento y la fecha actual).
-- • Trunca las cifras decimales del número obtenido.

SELECT fecha_nacimiento, TRUNCATE(DATEDIFF(now(), fecha_nacimiento)/365.25, 0) FROM alumno;