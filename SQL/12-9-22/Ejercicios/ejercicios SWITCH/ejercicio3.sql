-- Ejercicio 3: Enviar a un procedimiento en qué planta se encuentra una persona: 0, 1, 2. 
-- Y también enviar cuántos pisos quiere subir/bajar: 1 o 2. Indicar en qué planta acaba, 
-- teniendo en cuenta que solo hay 3 plantas.

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DELIMITER //

CREATE PROCEDURE comprueba_planta(IN planta INT, IN sube_baja INT)
BEGIN
	SET @planta_final = planta + sube_baja;
	CASE planta
		WHEN 0 THEN
			CASE TRUE
				WHEN sube_baja > 0 && sube_baja <= 2 THEN
					SELECT concat("Estaba en la planta ", planta, " y ha subido a la planta ", @planta_final ) AS "RESULTADO";
				ELSE
					SELECT concat("En la planta ", planta, " sólo puede irse a las plantas 1 ó 2") AS "RESULTADO";
			END CASE;
		WHEN 1 THEN
			CASE sube_baja
				WHEN 1 THEN
					SELECT concat("Estaba en la planta ", planta, " y ha subido a la planta ", @planta_final ) AS "RESULTADO";
				WHEN 0 THEN
					SELECT "Te quedas en el mismo sitio???" AS "RESULTADO";
				WHEN -1 THEN
					SELECT concat("Estaba en la planta ", planta, " y ha bajado a la planta ", @planta_final ) AS "RESULTADO";
				ELSE 
					SELECT "Sólo se puede bajar o subir un piso desde la planta 1";
			END CASE;
		WHEN 2 THEN
			CASE sube_baja
				WHEN -1 THEN
					SELECT concat("Estaba en la planta ", planta, " y ha bajado a la planta ", @planta_final ) AS "RESULTADO";
				WHEN -2 THEN
					SELECT concat("Estaba en la planta ", planta, " y ha bajado a la planta ", @planta_final ) AS "RESULTADO";
				WHEN 0 THEN
					SELECT "Te quedas en el mismo sitio???" AS "RESULTADO";
				ELSE
					SELECT "Sólo se puede bajar 1 ó 2 plantas desde la planta 2";
            END CASE;
		ELSE
			SELECT concat("No es posible que estés en la planta", planta ) AS "RESULTADO";
    END CASE;
END //

CALL comprueba_planta(3, 2);

-- WHEN (@planta_final >= 0 AND @planta_final <= 2) && (planta >= 0 && planta <= 2) THEN
-- 			SELECT concat("Estaba en la planta ", planta, " y ha llegado a la planta ", @planta_final) AS "RESULTADO";
-- 		ELSE
-- 			CASE TRUE
-- 				WHEN !(@planta_final >= 0 && @planta_final <= 2) THEN
-- 					SELECT concat("La planta destino ", @planta_final, " no existe") AS "RESULTADO";
-- 				WHEN !(planta >= 0 && planta <= 2) THEN
-- 					SELECT concat("No se puede estar en ", planta, " porque no existe") AS "RESULTADO"; 
-- 				ELSE
-- 					SELECT concat("Ni la planta origen ni la planta de destino son válidas") AS "RESULTADO";
-- 			END CASE;