USE cine;

-- 1. Mostra les persones que tenen “Hepburn” com a cognom.

SELECT * FROM people 
WHERE apellido = "Hepburn";

-- 2. Mostra només les actrius. Ha d’aparèixer: nom, cognom, òscars.

SELECT people.nombre, people.apellido, people.oscars
FROM people JOIN genero
ON people.genero = genero.id_genero
WHERE genero.genero = 'mujer';

-- 3. Mostra persones que tenen la “J” com a primera lletra del nom.
-- Ha d’aparèixer : nom, cognom, any de naixement.

SELECT nombre, apellido, fecha_nacimiento
FROM people
WHERE nombre LIKE 'J%';

-- 4. Mostra només els actors que hagin guanyat un sol òscar.
-- Ha d’aparèixer tota la informació menys l’id.

SELECT nombre, apellido, profesion, genero, oscars, fecha_nacimiento
FROM people 
WHERE oscars = 1;

-- 5. Mostra els directors de cine. Ha d’aparèixer tota la informació menys l’id.

SELECT nombre, apellido, profesion.profesion, genero, oscars, fecha_nacimiento
FROM people JOIN profesion
ON people.profesion = profesion.id_profesion
WHERE profesion.profesion = 'Director';

-- 6. Mostra les persones nascudes després de 1910 ordenades alfabèticament pel seu cognom de forma
-- ascendent.

SELECT * FROM people
WHERE fecha_nacimiento > 1910
ORDER BY apellido ASC;

-- 7. Inserta dues persones més, amb aquestes dades:

INSERT INTO people VALUES 
(DEFAULT, 'Woody', 'Allen', 1, 2, 4, '1935'),
(DEFAULT, 'Groucho', 'Marx', 2, 2, 1, '1890');

-- 8. La data de naixement de John Williams està malament: no és 1923, sinó 1932. Cànvia‐la.

UPDATE people SET fecha_nacimiento = '1932' WHERE nombre = 'John' AND apellido = 'Williams';

-- el sexo de John Ford:
UPDATE people SET genero = 
(SELECT genero.id_genero
FROM genero
WHERE genero.genero = 'hombre')
WHERE people.nombre = 'John' AND people.apellido = 'Ford';


-- 9. Esborra aquesta persona de llista: Arthur Rubinstein.

DELETE FROM people WHERE nombre = 'Arthur' AND apellido = 'Rubinstein';

-- 10. Crea una vista només amb els actors, on aparegui el seu nom, cognom i Òscars guanyats.

CREATE OR REPLACE VIEW actors AS
SELECT people.nombre, people.apellido, people.oscars
FROM people JOIN genero
ON people.genero = genero.id_genero
WHERE genero.genero = 'hombre';

SELECT * FROM actors;

