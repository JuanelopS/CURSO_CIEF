

SELECT COUNT(*) AS 'peliculas_alquiladas por Deborah Walker' 
FROM rental JOIN customer
ON rental.customer_id = customer.customer_id
WHERE customer.first_name = 'Deborah' and customer.last_name = 'Walker';
