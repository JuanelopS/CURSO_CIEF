-- 1.	Procedimiento Almacenado para obtener la ciudad con más alumnos por año y sexo (parámetro año). Se llamará pa_ciudad_sexo_anyo: 
-- ciudad, cantidad de alumnos hombres, cantidad de mujeres, año


DROP PROCEDURE IF EXISTS lista_segun_sexo;
DELIMITER $$
CREATE PROCEDURE lista_segun_sexo(IN anyo YEAR)
BEGIN
	SELECT COUNT(persona.nombre) INTO @hombres
    FROM persona JOIN alumno_se_matricula_asignatura
    ON persona.id = alumno_se_matricula_asignatura.id_alumno
    JOIN curso_escolar
    ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
    WHERE curso_escolar.anyo_inicio = anyo AND persona.sexo = 'H';
    
    SELECT COUNT(persona.nombre) INTO @mujeres
    FROM persona JOIN alumno_se_matricula_asignatura
    ON persona.id = alumno_se_matricula_asignatura.id_alumno
    JOIN curso_escolar
    ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
    WHERE curso_escolar.anyo_inicio = anyo AND persona.sexo = 'M';
    
    SELECT anyo, @hombres, @mujeres;
END $$

DELIMITER ;
CALL lista_segun_sexo('2017');

-- 2.	Procedimiento almacenado para obtener los alumnos matriculados por asignatura, sexo y año de inicio (serán los parámetros). 
-- Se llamará pa_alumnos_asig_sexo_anyo. 
-- Por ejemplo, cuando tendrá esta respuesta cuando se ejecute así : 
-- call pa_alumnos_asig_sexo_anyo (‘Estadistica’, ‘M’, 2017): 

DROP PROCEDURE IF EXISTS pa_alumnos_asig_sexo_anyo;
DELIMITER //
CREATE PROCEDURE pa_alumnos_asig_sexo_anyo(IN asignatura_parametro VARCHAR(100), IN sexo_parametro ENUM('H','M'), IN anyo_parametro YEAR)
BEGIN
	SELECT asignatura.nombre, COUNT(alumno_se_matricula_asignatura.id_alumno) AS num_alumnos_matriculados
	FROM asignatura JOIN alumno_se_matricula_asignatura
	ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
    JOIN persona
    ON persona.id = alumno_se_matricula_asignatura.id_alumno
    JOIN curso_escolar
    ON asignatura.curso = curso_escolar.id
    WHERE asignatura.nombre = asignatura_parametro AND persona.sexo = sexo_parametro AND curso_escolar.anyo_inicio = anyo_parametro
	GROUP BY asignatura.id
	ORDER BY num_alumnos_matriculados DESC LIMIT 1;
END//

DELIMITER ;
CALL pa_alumnos_asig_sexo_anyo('Estadística','M', 2018);

-- 3.	Función para obtener el profesor (nombre, apellidos y asignatura ) con más alumnos por año y sexo (serán los parámetros). Se llamará fu_profesor:
-- La respuesta será : “El profesor nombre_profesor apellido_profesor ha tenido Y alumnas y X alumnos en XXXX”.

DROP FUNCTION IF EXISTS fu_profesor;
DELIMITER //
CREATE FUNCTION fu_profesor() RETURNS VARCHAR(50)
BEGIN
	set @profesor = '';
    SELECT asignatura.nombre, COUNT(alumno_se_matricula_asignatura.id_alumno) AS num_matriculas
	FROM asignatura JOIN alumno_se_matricula_asignatura
	ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
	JOIN persona
	ON persona.id = alumno_se_matricula_asignatura.id_alumno
	GROUP BY alumno_se_matricula_asignatura.id_asignatura
	ORDER BY num_matriculas DESC LIMIT 1;
    
    RETURN @profesor;
END//

SELECT fu_profesor(2018);


-- 4.	Crea un procedimiento para inscribir(que no matricular) alumnos, introduciendo todos los datos de la tabla “persona”. Se llamará pa_inscripcion(todos_los_datos):
-- Si se introduce un nif repetido debe de avisar del error. 



-- 5.	Crea otro procedimiento para matricular alumnos a partir de su nif. Los parámetros serán nif, asignatura, año de inicio. 
-- Se llamará pa_matricula(nif, asignatura, anyo_inicio)
-- Si ya está matriculado de esa asignatura ese año debe avisar del error.

-- 6.	Crea una función que muestre de qué asignaturas y en que año se ha matriculado un alumno. El parámetro de entrada será el nif. La salida debe mostrar nif, nombre, apellido1, asignatura, año de inicio. 
-- Se llamará fu_info_matriculas_alumno.
