USE COMUNIDADES;

-- SELECT columnas FROM tabla

SELECT * FROM provincias
WHERE Codigo_comunidad="AND" OR (NOT Codigo_comunidad="CAT" AND NOT Codigo_comunidad="EXT")
ORDER BY Nombre DESC; -- por defecto ASC si no se pone nada

SELECT * FROM provincias
WHERE Codigo_comunidad="CAT";

SET SQL_SAFE_UPDATES = 0;   -- para que te deje borrar/actualizar datos en la tabla
DELETE FROM PROVINCIAS WHERE Nombre="Sevilla";

INSERT INTO PROVINCIAS VALUES ("SE","Sevilla","AND");

-- USO DE AUTO_INCREMENT CON NULL Y DEFAULT (indistinto);
-- Codigo INT PRIMARY KEY AUTO_INCREMENT; -- esto es en la creacion de la tabla
-- INSERT INTO PROVINCIAS VALUES (null, "Barcelona", "CAT");
-- INSERT INTO PROVINCIAS VALUES (default, "Barcelona", "CAT");



