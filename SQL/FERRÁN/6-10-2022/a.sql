DROP FUNCTION IF EXISTS calcularEdad;
DELIMITER $$
CREATE FUNCTION calcularEdad(id INT) RETURNS INT
BEGIN
	SELECT DATEDIFF(NOW(),fecha_nacimiento)/365 INTO @temp FROM persona 
    WHERE persona.id = id;
	RETURN @temp;
END $$

DELIMITER ;
SELECT calcularEdad('1');


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

-- --------------------------------------------------------------------------
-- 3.	Función para obtener el profesor (nombre, apellidos y asignatura ) con más alumnos por año y sexo (serán los parámetros). Se llamará fu_profesor:
-- La respuesta será : “El profesor nombre_profesor apellido_profesor ha tenido Y alumnas y X alumnos en XXXX”.

DROP FUNCTION IF EXISTS fu_profesor;
DELIMITER $$
CREATE FUNCTION fu_profesor() RETURNS
BEGIN
	RETURN
END $$

DELIMITER ;
SELECT fu_profesor('2017')



