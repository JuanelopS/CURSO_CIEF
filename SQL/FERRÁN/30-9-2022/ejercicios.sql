USE sakila;

-- 1) Actores que tienen el primer nombre "Gary"

SELECT * FROM actor WHERE first_name = 'Gary';

-- 2) Actores que tiene de primer apellido "Streep"

SELECT * FROM actor WHERE last_name = 'Streep';

-- 3) Actores que contengan una "o" en su nombre

SELECT * FROM actor WHERE LOCATE('o', first_name);

-- 4) Actores que contengan una "a" en su nombre y una "e" en su apellido

SELECT * FROM actor WHERE LOCATE('a', first_name) AND LOCATE('e', last_name);

-- 5) Actores que contengan dos "o" en su nombre y una "a" en su apellido

SELECT * FROM actor WHERE first_name LIKE '%o%o' AND last_name LIKE '%a';

-- 6) Actores cuya tercera letra del nombre sea "b"

SELECT * FROM actor WHERE substr(first_name, 3,1) = 'b';

-- 7) Ciudades que empiezan por "a"

SELECT * FROM city WHERE city LIKE 'a%';

-- 8) Ciudades que acaban por "s"

SELECT * FROM city WHERE city LIKE '%s';

-- 9) Ciudades del country "Spain"

SELECT * 
FROM city INNER JOIN country
ON city.country_id = country.country_id
WHERE country.country = 'Spain';

-- 10) Ciudades con nombres compuestos (como New York) 

SELECT * FROM city WHERE city LIKE '% %';

-- 11) películas con una duración entre 80 y 100 m.

SELECT title, length FROM film WHERE length >= 80 AND length <= 100;

-- 12) películas con un rental_rate entre 1 y 3

SELECT * FROM film WHERE rental_rate BETWEEN 1 AND 3;

-- 13) películas con un título de más de 11 letras.

SELECT title FROM film WHERE length(title) > 11;

-- 14) películas con un rating de PG o G.

SELECT * FROM film WHERE rating = 'PG' OR rating = 'G';

-- 15) ¿Cuantas ciudades tiene el country ‘France’? 

SELECT COUNT(*)
FROM city INNER JOIN country
ON city.country_id = country.country_id
WHERE country.country = 'France';

-- 16) Películas que no tengan un rating de NC-17

SELECT * FROM film WHERE rating != 'NC-17';

-- 17) Películas con un rating PG y duración de más de 120.

SELECT * FROM film WHERE rating = 'PG' AND length > 120;

-- 18) ¿Cuantos actores hay?

SELECT COUNT(*) FROM actor;

-- 19) Película con mayor duración.

SELECT title, length FROM film WHERE length = (SELECT MAX(length) FROM film);

-- 20) ¿Cuantos countries hay que empiezan por ‘a’? 

SELECT COUNT(*) FROM country WHERE country LIKE 'a%';

-- 21) Visualiza los 10 actores que han participado en más películas

SELECT a.first_name, a.last_name, COUNT(f.actor_id) AS film_number
FROM actor AS a INNER JOIN film_actor AS f ON a.actor_id = f.actor_id
GROUP BY (f.actor_id)
ORDER BY film_number DESC LIMIT 10;

-- 22) Visualiza los clientes de países que empiezan por S

SELECT customer.first_name, address.address_id, country.country FROM customer 
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id
WHERE country.country LIKE 's%';

-- 23) Visualiza el top-10 de países con más clientes

SELECT country.country, COUNT(customer.customer_id) as 'total_customers' FROM customer 
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id
GROUP BY country.country_id
ORDER BY total_customers DESC LIMIT 10;

-- 24) Saca las 10 primeras películas alfabéticamente y el número de copias que se disponen de cada una de ellas

SELECT title, COUNT(inventory.film_id) FROM film 
INNER JOIN inventory ON film.film_id = inventory.film_id
GROUP BY inventory.film_id
ORDER BY film.title LIMIT 10;

-- 25) Saca todas las películas que ha alquilado el cliente Deborah Walker
-- rental_id customer_id 

SELECT COUNT(*) AS 'peliculas_alquiladas por Deborah Walker' 
FROM rental JOIN customer
ON rental.customer_id = customer.customer_id
WHERE customer.first_name = 'Deborah' and customer.last_name = 'Walker';
