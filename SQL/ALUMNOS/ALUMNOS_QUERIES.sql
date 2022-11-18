USE instituto;

SELECT * FROM alumno;

SELECT nombre, apellido1, apellido2 FROM alumno;

SELECT CONCAT(nombre, apellido1, apellido2) AS concat FROM alumno;

-- a minúsculas
SELECT LOWER(CONCAT_WS(' ', nombre, apellido1, apellido2)) AS concat_ws FROM alumno; 

-- a mayúsculas
SELECT UPPER(CONCAT_WS(' ', nombre, apellido1, apellido2)) AS concat_ws FROM alumno; 

-- La función CONCAT devolverá NULL cuando alguna de
-- las cadenas que está concatenando es igual NULL , mientras que la
-- función CONCAT_WS omitirá todas las cadenas que sean igual
-- a NULL y realizará la concatenación con el resto de cadenas.

-- Si quiero actualizar o borrar todos los registros de un campo, salta error 1175 por seguridad.
-- Para desactivarlo tenemos que modificar a valor 1 la variable global
-- SET SQL_SAFE_UPDATES = 0;

-- SET SQL_SAFE_UPDATES = 0;

-- UPDATE el campo apellido2 a null en la fila donde el id sea 1
UPDATE alumno SET apellido2 = NULL
WHERE id = 1;

-- CONCAT en este caso devuelve una filla NULL
SELECT CONCAT(nombre, apellido1, apellido2)
FROM alumno; 

-- CONCAT_WS ignora los NULL
SELECT CONCAT_WS(' ', nombre, apellido1, apellido2) AS nombreCompleto
FROM alumno;

-- si apellido2 ES NULL, entonces muestra el nombre y el apellido1 FULL MAYUSCULAS
SELECT 
  IF
  (
    apellido2 IS NULL,
    UPPER(CONCAT_WS(' ', nombre, apellido1)),
    CONCAT_WS(' ', nombre, apellido1, apellido2)
  )
AS 
  nombreCompleto
FROM 
  alumno;
  
-- OTRA SOLUCIÓN

SELECT CONCAT_WS(' ', UPPER(nombre), UPPER(apellido1)) FROM alumno WHERE apellido2 IS NULL
UNION
SELECT CONCAT_WS(' ', nombre, apellido1, apellido2) FROM alumno WHERE apellido2 IS NOT NULL;

-- OTRA SOLUCIÓN CON IFNULL
SELECT IFNULL
  (
	CONCAT(nombre, " ", apellido1, " ", apellido2, " "), -- FILA NULL
    UPPER(CONCAT_WS(' ', nombre, apellido1)) -- FILA NO NULL
  )
AS 
  nombreCompleto
FROM 
  alumno;
                
-- uso de substr
SELECT SUBSTR('Lorem Ipsum is simply dummy text of the printing and typesetting industry', 6, 34) AS substr;

-- DISTINCT: No se repiten filas
SELECT DISTINCT apellido1 FROM alumno;

-- Deben repetirse todos para que no muestre la fila
SELECT DISTINCT nombre, apellido1, apellido2 FROM alumno;

-- ORDER BY: ordenador por columna ascendente ASC (por defecto) o descendente DESC;
SELECT nombre, apellido1, apellido2
FROM ALUMNO
ORDER BY apellido1, apellido2 DESC;

SELECT nombre, apellido1, apellido2
FROM ALUMNO
ORDER BY 1, 2, 3;

-- LIMIT: limitar la cantidad de filas devueltas
SELECT nombre, apellido1, apellido2
FROM ALUMNO
ORDER BY apellido1, apellido2
LIMIT 4;

-- WHERE:

-- 1. Obtener el nombre de todos los alumnos que su primer apellido sea Martínez.
SELECT nombre
FROM alumno
WHERE apellido1 = 'Martínez'; 

-- 2. Obtener todos los datos del alumno que tiene un id igual a 9.
SELECT *
FROM alumno
WHERE id = 9;

-- 3. Obtener el nombre y la fecha de nacimiento de todos los alumnos nacieron después del 1 de enero de 1997.
SELECT nombre, fecha_nacimiento
FROM alumno
WHERE fecha_nacimiento >= '1997/01/01';  -- FORMATO DATE 'AAAA/MM/DD' o 'AAAA-MM-DD';

-- ********** EJERCICIOS PDF CONSULTAS PÁG. 31 *********** --

-- 1. Devuelve los datos del alumno cuyo id es igual a 1.
SELECT *
FROM alumno
WHERE id = 1;

-- 2. Devuelve los datos del alumno cuyo teléfono es igual a 692735409.
SELECT *
FROM alumno
WHERE teléfono = "692735409";

-- 3. Devuelve un listado de todos los alumnos que son repetidores.
SELECT *
FROM alumno
WHERE es_repetidor = 'si';

-- 4. Devuelve un listado de todos los alumnos que no son repetidores.
SELECT *
FROM alumno
WHERE es_repetidor = 'no';

-- 5. Devuelve el listado de los alumnos que han nacido antes del 1 de enero de 1993.
SELECT *
FROM alumno
WHERE fecha_nacimiento < '1993/01/01';

-- 6. Devuelve el listado de los alumnos que han nacido después del 1 de enero de 1994.
SELECT *
FROM alumno
WHERE fecha_nacimiento > '1994/01/01';

-- 7. Devuelve el listado de los alumnos que han nacido después del 1 de enero de 1994 y no son repetidores.
SELECT *
FROM alumno
WHERE fecha_nacimiento > '1994/01/01' AND es_repetidor = 'no';

-- 8. Devuelve el listado de todos los alumnos que nacieron en 1998.
SELECT *
FROM alumno
-- WHERE fecha_nacimiento >= '1998/01/01' AND fecha_nacimiento <= '1998/12/31';
-- WHERE fecha_nacimiento BETWEEN '1998/01/01' AND '1998/12/31';
WHERE fecha_nacimiento LIKE '1998%'; 

-- 9. Devuelve el listado de todos los alumnos que no nacieron en 1998.
SELECT *
FROM alumno
-- WHERE fecha_nacimiento <= '1998/01/01' OR fecha_nacimiento >= '1998/12/31';
-- WHERE fecha_nacimiento NOT BETWEEN '1998/01/01' AND '1998/12/31';
WHERE fecha_nacimiento NOT LIKE '1998%'; 

-- ----------------------------------------------------------------------------------

-- BETWEEN:

-- 1. Devuelve los datos de los alumnos que hayan nacido entre el 1 de enero de 1998 y el 31 de mayo de 1998.
SELECT *
FROM alumno
WHERE fecha_nacimiento BETWEEN "1998/01/01" AND "1998/05/31";

-- 2. Devuelve los datos de los alumnos que no hayan nacido entre el 1 de enero de 1998 y el 31 de mayo de 1998.
SELECT *
FROM alumno
WHERE fecha_nacimiento NOT BETWEEN "1998/01/01" AND "1998/05/31";

-- IN: 

SELECT *
FROM alumno
WHERE apellido1 IN ('Sánchez', 'Martínez', 'Domínguez');

SELECT *
FROM alumno
WHERE apellido1 NOT IN ('Sánchez', 'Martínez', 'Domínguez');

-- LIKE:

-- todos los alumnos que su primer apellido empiece por la letra S .
SELECT *
FROM alumno
WHERE apellido1 LIKE 'S%';

-- Devuelve un listado de todos los productos cuyo nombre empieza con estas cuatro letras ‘A%BC’.
-- 2 opciones: 

SELECT *
FROM producto
WHERE nombre LIKE 'A$%BC%' ESCAPE '$';

SELECT *
FROM producto
WHERE nombre LIKE 'A\%BC%';

-- ----------------------------------------------------------------------------------------------

SELECT REVERSE(apellido1) AS reverse  -- DEL REVÉS
FROM alumno;

SELECT CHAR_LENGTH(apellido1) AS reverse  -- LONGITUD DE LA CADENA
FROM alumno;

SELECT LENGTH(apellido1) AS reverse  -- BYTES QUE OCUPA
FROM alumno;

SET GLOBAL lc_time_names = 'es_ES'; -- CONFIGURA LA LOCALE DE LA BASE DE DATOS AL ESPAÑOL DE MANERA 'GLOBAL'

