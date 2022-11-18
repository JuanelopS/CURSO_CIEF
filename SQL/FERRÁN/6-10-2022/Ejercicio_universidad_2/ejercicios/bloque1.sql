USE juan_universidad;

-- 1.	Lista de profesores ordenados alfabéticamente.

SELECT * FROM profesor 
ORDER BY apellido1;

-- 2.	Lista de alumnos ordenados por ciudad y por apellido, alfabéticamente.

SELECT * FROM persona 
ORDER BY ciudad, apellido1;

-- 3.	Lista de alumnos solo de Barcelona, alfabéticamente en sentido descendente.

SELECT * FROM persona WHERE ciudad  = 'Barcelona'
ORDER BY apellido1 DESC;

-- 4.	Lista de alumnos no matriculados en ninguna asignatura: 
-- nif, nombre, apellido1

SELECT nif, nombre, apellido1
FROM persona LEFT JOIN alumno_se_matricula_asignatura
ON persona.id = alumno_se_matricula_asignatura.id_alumno
WHERE id_asignatura IS NULL;

-- 5.	Alumno hombre más joven matriculado en 2017: 
-- nombre, apellido1 (atención, que hay personas no matriculadas)

SELECT persona.nombre, persona.apellido1
FROM persona JOIN alumno_se_matricula_asignatura
ON persona.id = alumno_se_matricula_asignatura.id_alumno
JOIN curso_escolar 
ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE curso_escolar.anyo_inicio = 2017
ORDER BY persona.fecha_nacimiento DESC LIMIT 1;

-- 6.	Profesor de más edad que dio cursos en 2018

SELECT * FROM profesor
JOIN asignatura 
ON profesor.id_profesor = asignatura.id_profesor
JOIN curso_escolar
ON asignatura.curso = curso_escolar.id
WHERE curso_escolar.anyo_inicio = 2018 
AND (profesor.fecha_nacimiento IS NOT NULL AND profesor.fecha_nacimiento != '0000-00-00')
ORDER by profesor.fecha_nacimiento DESC;

-- 7.	Asignatura con más alumnos por año

SELECT asignatura.nombre, COUNT(alumno_se_matricula_asignatura.id_alumno) AS num_alumnos_matriculados
FROM asignatura JOIN alumno_se_matricula_asignatura
ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
GROUP BY alumno_se_matricula_asignatura.id_asignatura
ORDER BY num_alumnos_matriculados DESC LIMIT 1;

-- 8.	Asignatura con más alumnos mujeres y cuantas son

SELECT asignatura.nombre, COUNT(alumno_se_matricula_asignatura.id_alumno) AS num_mujeres_matriculadas
FROM asignatura JOIN alumno_se_matricula_asignatura
ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
JOIN persona
ON persona.id = alumno_se_matricula_asignatura.id_alumno
WHERE persona.sexo = 'M'
GROUP BY alumno_se_matricula_asignatura.id_asignatura
ORDER BY num_mujeres_matriculadas DESC LIMIT 1;

-- 9.	Asignatura con menos alumnos hombres en 2018

SELECT asignatura.nombre, COUNT(alumno_se_matricula_asignatura.id_alumno) AS hombres_matriculados
FROM asignatura JOIN alumno_se_matricula_asignatura
ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
JOIN persona
ON persona.id = alumno_se_matricula_asignatura.id_alumno
WHERE persona.sexo = 'H'
GROUP BY alumno_se_matricula_asignatura.id_asignatura
ORDER BY hombres_matriculados ASC LIMIT 1;

-- 10.	10 nombres de alumnos más usuales, ordenados de mayor a menor

SELECT persona.nombre, COUNT(persona.id) as alumnos_mas_usuales
FROM persona 
GROUP BY persona.nombre
ORDER BY alumnos_mas_usuales DESC
LIMIT 10;

-- 11.	Ciudad con más alumnos hombres en 2016: ciudad, cantidad de alumnos

SELECT ciudad, COUNT(persona.id) AS cantidad_alumnos_hombres
FROM persona
WHERE sexo = 'H'
GROUP BY ciudad
ORDER BY cantidad_alumnos_hombres DESC LIMIT 1;

-- 12.	Las tres asignaturas con mayor número de alumnos inscritos en toda la historia de más a menos, indicando la cantidad: 
-- Nombre de la asignatura, cantidad de alumnos

SELECT asignatura.nombre, COUNT(alumno_se_matricula_asignatura.id_alumno) AS cantidad_alumnos
FROM asignatura JOIN alumno_se_matricula_asignatura
ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
JOIN persona
ON persona.id = alumno_se_matricula_asignatura.id_alumno
GROUP BY alumno_se_matricula_asignatura.id_asignatura
ORDER BY cantidad_alumnos DESC LIMIT 3;

-- 13.	Se ha decidido conceder una beca a los tres alumnos casados de mayor edad. Identifica quienes son, mostrando su nif, nombre y apellido1.

SELECT nif, nombre, apellido1, fecha_nacimiento
FROM persona WHERE casado = 'S' AND fecha_nacimiento IS NOT NULL AND fecha_nacimiento != '0000-00-00'
ORDER BY fecha_nacimiento ASC LIMIT 3;

-- 14.	Mostrar por parejas los alumnos que viven en la misma ciudad. Deben aparecer los apellidos de cada uno y la ciudad, 
-- sin parejas duplicadas. El orden debe ser por el nombre de la ciudad y el apellido de la primera columna. Ejemplo:  

SELECT a.apellido1 as alumno1, b.apellido1 as alumno2, a.ciudad as ciudad
FROM persona a, persona b
WHERE a.ciudad = b.ciudad AND a.apellido1 != b.apellido1
ORDER BY ciudad, alumno1 ASC;

-- 15.	Gestión de usuarios. Has de guardar de código de cada acción:
-- a.	Muestra los usuarios y sus permisos.
-- b.	Crea un usuario llamado cliente que solo se pueda conectar por localhost y permisos para hacer select y update. Su contraseña será ‘1234abcd’.
-- c.	Quítale el permiso de update. 
-- d.	Borra el usuario.

SELECT * FROM mysql.user;
CREATE USER 'cliente'@'localhost' IDENTIFIED BY '1234abcd';
GRANT SELECT, UPDATE ON juan_universidad.* TO cliente;
REVOKE UPDATE ON juan_universidad.* FROM cliente;
DROP USER cliente;

