SELECT * FROM empleado;
SELECT * FROM departamento;

-- 1. 	Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).

SELECT * FROM empleado
WHERE codigo_departamento IN (SELECT codigo FROM departamento WHERE nombre = 'Sistemas');

-- 2. 	Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.

SELECT nombre, presupuesto FROM departamento
WHERE presupuesto = (SELECT MAX(presupuesto) FROM departamento);

-- 3. 	Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.

SELECT nombre, presupuesto FROM departamento
WHERE presupuesto = (SELECT MIN(presupuesto) FROM departamento);

--    Subconsultas con ALL y ANY

-- 4. 	Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. 
-- 		Sin hacer uso de MAX, ORDER BY ni LIMIT.

SELECT nombre, presupuesto FROM departamento
WHERE presupuesto >= ALL (SELECT presupuesto FROM departamento);

-- 5. 	Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. 
-- Sin hacer uso de MIN, ORDER BY ni LIMIT.

SELECT nombre, presupuesto FROM departamento
WHERE presupuesto <= ALL (SELECT presupuesto FROM departamento);

-- 6. 	Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).

SELECT DISTINCT D.nombre FROM departamento D INNER JOIN empleado E
ON D.codigo = E.codigo_departamento
WHERE E.codigo_departamento = 
ANY (SELECT codigo_departamento
FROM empleado WHERE codigo_departamento IS NOT NULL);

-- 7. 	Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).

SELECT DISTINCT D.nombre FROM departamento D INNER JOIN empleado E
ON D.codigo = E.codigo_departamento
WHERE E.codigo_departamento = 
ANY (SELECT codigo_departamento
FROM empleado WHERE codigo_departamento IS NULL);

-- Subconsultas con IN y NOT IN
--  
-- 8. 	Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).

SELECT DISTINCT D.nombre FROM departamento D INNER JOIN empleado E
ON D.codigo = E.codigo_departamento
WHERE E.codigo_departamento IN 
(SELECT codigo_departamento FROM empleado WHERE codigo_departamento IS NULL);

-- 9. 	Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).

SELECT DISTINCT D.nombre FROM departamento D INNER JOIN empleado E
ON D.codigo = E.codigo_departamento
WHERE E.codigo_departamento IN 
(SELECT codigo_departamento FROM empleado WHERE codigo_departamento IS NULL);

 
-- Subconsultas con EXISTS y NOT EXISTS
--  
-- 10.  Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT DISTINCT D.nombre FROM departamento D INNER JOIN empleado E
ON D.codigo = E.codigo_departamento
WHERE EXISTS 
(SELECT codigo_departamento FROM empleado WHERE codigo_departamento IS NOT NULL);

-- 11.  Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT DISTINCT D.nombre FROM departamento D INNER JOIN empleado E
ON D.codigo = E.codigo_departamento
WHERE NOT EXISTS 
(SELECT codigo_departamento FROM empleado WHERE codigo_departamento IS NOT NULL);

