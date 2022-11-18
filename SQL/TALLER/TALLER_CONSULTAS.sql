-- Consultas en Word Ejemplo Taller
 USE TALLER;

-- 1. nombre de todas las piezas
SELECT Nombre FROM pieza;

-- 2. todos los datos de todos los proveedores
SELECT * FROM proveedor;

-- 3. precio medio de las piezas (AS -> alias para el título de la columna)
SELECT AVG(precio) AS precio_medio FROM compra;

-- 4. obtener los identificadores de los proveedores que suministran la pieza 10
SELECT Id_proveedor FROM compra WHERE Codigo_Pieza = 10; 

-- 5. nombres de las piezas suministradas por el proveedor TGLR

SELECT Codigo_Pieza FROM compra WHERE Id_Proveedor = 'TGLR';  -- CON DISTINCT NO SE REPITEN LOS VALORES

-- 6. Obtener los identificadores de los proveedores que suministran las piezas más caras, indicando el precio al que la suministran.

SELECT Id_Proveedor, MAX(precio) FROM compra GROUP BY Codigo_Pieza;

-- 7. Hacer constar en la base de datos que la empresa “Tus piezas al momento, S.L.” va a empezar a suministrarnos Tuerca TRC a 2,19 cada una.

INSERT INTO compra VALUES (15, 13, 'A2TH', 2.19);

-- 8. Aumentar los precios en diez céntimos.

UPDATE compra SET precio = precio + 0.1;  -- SET SQL_SAFE_UPDATES = 0 para poder hacer dicho update.

-- 9. Hacer constar en la base de datos que la empresa  “Las piezas de la calle 34, S.L.” no va a suministrarnos ninguna pieza (aunque la empresa sí va a seguir constando en nuestra base de datos).

DELETE FROM compra WHERE Id_proveedor = "DG34";

-- 10. Hacer constar en la base de datos que la empresa  “Recambios y piezas, S.L.” ya no va a suministrarnos Motor MLT.

DELETE FROM compra WHERE Id_proveedor = 'SHG4' && Codigo_Pieza = 11;
