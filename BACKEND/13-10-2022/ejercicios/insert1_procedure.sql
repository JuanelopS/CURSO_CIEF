USE curso_web;

DROP PROCEDURE IF EXISTS matricular_alumno;
DELIMITER $$
CREATE PROCEDURE matricular_alumno(IN nif_par VARCHAR(9), IN asignatura_par VARCHAR(100), IN anyo_inicio_par YEAR, IN anyo_fin_par YEAR)
BEGIN
	
	SELECT COUNT(*) INTO @nif FROM alumnos WHERE nif = nif_par;
    SELECT id_alumno INTO @id FROM alumnos WHERE nif = nif_par;
    SELECT COUNT(*) INTO @asignatura FROM asignatura WHERE nombre = asignatura_par;
    SELECT id_asignatura INTO @id_asignatura FROM asignatura WHERE nombre = asignatura_par;
    SELECT COUNT(*) INTO @anyos FROM curso_escolar WHERE anyo_inicio = anyo_inicio_par AND anyo_fin = anyo_fin_par;
    SELECT id_curso INTO @id_curso FROM curso_escolar WHERE anyo_inicio = anyo_inicio_par AND anyo_fin = anyo_fin_par;

	IF @nif > 0 AND @asignatura > 0 AND @anyos > 0 THEN
		INSERT INTO alumno_asignatura_curso VALUES (default, @id, @id_asignatura, @id_curso);
    END IF;

END $$

DELIMITER ;
-- CALL matricular_alumno("11105554G", "HTML", 2020, 2021);