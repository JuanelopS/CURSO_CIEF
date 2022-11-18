USE tienda;

-- También pueden hacerse consultas que devuelvan cálculos
SELECT id, cantidad_comprada, precio_por_elemento,
cantidad_comprada * precio_por_elemento
FROM ventas;