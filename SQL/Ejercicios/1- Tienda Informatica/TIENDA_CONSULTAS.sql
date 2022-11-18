USE TIENDA;

-- 1.1  Obtener los nombres de los productos de la tienda.

SELECT Nombre FROM ARTICULOS;

-- 1.2  Obtener los nombres y los precios de los productos de la tienda.

SELECT Nombre, Precio FROM ARTICULOS;

-- 1.3  Obtener el nombre de los productos cuyo precio sea menor o igual a 200.

SELECT Nombre FROM ARTICULOS WHERE Precio <= 200;

-- 1.4  Obtener todos los datos de los artículos cuyo precio esté entre
--      los 60 y los 120€ (ambas cantidades incluidas).

SELECT * FROM ARTICULOS WHERE Precio BETWEEN 60 AND 120;

-- 1.5 Obtener el nombre y el precio en pesetas 
-- (es decir, el precio en euros multiplicado por 166’386).

SELECT Nombre, Precio, ROUND(Precio * 166.386) AS Pesetas FROM ARTICULOS;

-- 1.6  Seleccionar el precio medio de todos los productos. (TRUNCATE PARA 2 DECIMALES)

SELECT TRUNCATE(AVG(Precio), 2) FROM ARTICULOS;

-- 1.7  Obtener el precio medio de los artículos cuyo código de fabricante sea 2.

SELECT TRUNCATE(AVG(Precio), 2) FROM ARTICULOS WHERE Fabricante = 2;

-- 1.8  Obtener el número de artículos cuyo precio sea mayor o igual a 180€.

SELECT COUNT(*) AS 'PRECIO +180' FROM ARTICULOS WHERE Precio >= 180; -- CON * EL COUNT CUENTA LOS CAMPOS NULL, SI SE ESPECIFICA NO.

-- 1.9  Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 180 € 
--      y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.

SELECT Nombre, Precio FROM ARTICULOS WHERE PRECIO >= 180 ORDER BY Precio DESC, Nombre ASC;

-- 1.10  Obtener un listado completo de artículos, incluyendo por cada artículo los datos 
--       del artículo y de su fabricante.

SELECT * FROM ARTICULOS, FABRICANTES WHERE FABRICANTES.Codigo = ARTICULOS.Fabricante;

-- 1.11 Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, 
-- y el nombre de su fabricante.

SELECT ARTICULOS.Nombre, Precio, FABRICANTES.Nombre FROM ARTICULOS, FABRICANTES WHERE FABRICANTES.Codigo = ARTICULOS.Fabricante;

-- 1.12  Obtener el precio medio de los productos de cada fabricante, 
--       mostrando solo los códigos de fabricante. ****************

SELECT FABRICANTES.Codigo, AVG(Precio) FROM FABRICANTES, ARTICULOS GROUP BY FABRICANTES.Codigo;

-- 1.13  Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.

SELECT 
