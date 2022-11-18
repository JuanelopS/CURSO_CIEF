USE company;
-- TE DEVUELVE EN TARGET Y SALES NUMEROS CON DOS DECIMALES PORQUE ESTÁ CREADO EL CAMPO COMO DECIMAL (9,2)
SELECT * FROM offices;

-- EN CHICAGO Y DENVER EN NEGATIVO...
SELECT city, region, sales - target
FROM offices;

-- AS -> TITULO DE LA COLUMNA
SELECT city, region, sales - target AS objectives
FROM offices;



