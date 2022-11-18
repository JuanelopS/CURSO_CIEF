-- DROP VIEW IF EXISTS customer_payment_vw;

CREATE OR REPLACE VIEW customer_payment_vw AS
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_amount
FROM customer AS c
INNER JOIN payment AS p ON c.customer_id = p.customer_id
GROUP BY (c.customer_id)
ORDER BY c.last_name;

SELECT * FROM customer_payment_vw;