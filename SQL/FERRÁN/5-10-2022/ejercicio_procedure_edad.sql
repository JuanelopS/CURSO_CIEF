DROP PROCEDURE IF EXISTS ordenar_fecha;

DELIMITER //
CREATE PROCEDURE ordenar_fecha()
BEGIN
	SELECT nombre, apellido1, calcularEdad(persona.id) AS edad,
 	CASE
 		 WHEN calcularEdad(persona.id) < 18 THEN 'menor de edad'
         ELSE 'mayor de edad'
     END AS mayoria
     FROM persona WHERE fecha_nacimiento IS NOT NULL AND fecha_nacimiento != '' 
    ORDER BY fecha_nacimiento;
END //

DELIMITER ;

CALL ordenar_fecha();
