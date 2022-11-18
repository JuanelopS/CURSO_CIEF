USE empleados;

SELECT * FROM empleado;
SELECT * FROM departamento;

-- INSERT INTO `EMPLEADOS`.`empleado` (`codigo`, `nif`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) 
-- VALUES (DEFAULT, '72921342A', 'PEPITO', 'SIN', 'DEPARTAMENTO', null);

-- 1. 	Calcula la suma del presupuesto de todos los departamentos.

SELECT SUM(presupuesto) FROM departamento;

-- 2. 	Calcula la media del presupuesto de todos los departamentos.

SELECT AVG(presupuesto) FROM departamento;

-- 3. 	Calcula el valor mínimo del presupuesto de todos los departamentos.

SELECT MIN(presupuesto) FROM departamento;

-- 4. 	Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.

SELECT nombre, MIN(presupuesto) FROM departamento;

-- 5. 	Calcula el valor máximo del presupuesto de todos los departamentos.

SELECT MAX(presupuesto) FROM departamento;

-- 6. 	Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.

SELECT nombre, MAX(presupuesto) FROM departamento;

-- 7. 	Calcula el número total de empleados que hay en la tabla empleado.

SELECT COUNT(codigo) FROM empleado; -- * cuenta los NULL

-- 8. 	Calcula el número de empleados que no tienen NULL en su segundo apellido.

SELECT COUNT(codigo) FROM empleado
WHERE apellido2 IS NOT NULL;

-- 9. 	Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas, 
-- 		una con el nombre del departamento y otra con el número de empleados que tiene asignados.

SELECT D.nombre, COUNT(E.codigo_departamento)
FROM departamento D LEFT JOIN empleado E
ON D.codigo = E.codigo_departamento
GROUP BY D.nombre;

-- 10.  Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe tener 
-- dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.

SELECT D.nombre, COUNT(E.codigo_departamento) AS num_empleados
FROM departamento D LEFT JOIN empleado E
ON D.codigo = E.codigo_departamento
GROUP BY D.nombre
HAVING num_empleados > 2;

-- 11.  Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado
-- de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.

SELECT D.nombre, COUNT(*) AS num_empleados
FROM departamento D RIGHT JOIN empleado E
ON D.codigo = E.codigo_departamento
GROUP BY D.nombre;

-- 12.  Calcula el número de empleados que trabajan en cada uno de los departamentos que tienen un 
-- presupuesto mayor a 200000 euros.

SELECT D.nombre, COUNT(E.codigo_departamento) AS num_empleados, D.presupuesto
FROM departamento D LEFT JOIN empleado E
ON D.codigo = E.codigo_departamento
GROUP BY D.nombre
HAVING D.presupuesto > 200000;
