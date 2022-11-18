USE empleados;

-- 1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.

SELECT E.nombre, D.* 
FROM empleado E JOIN departamento D	
ON E.codigo_departamento = D.codigo;

-- 2. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada
-- uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético)
-- y en segundo lugar por los apellidos y el nombre de los empleados.

SELECT E.nombre, D.* 
FROM empleado E JOIN departamento D	
ON E.codigo_departamento = D.codigo
ORDER BY D.nombre, E.apellido1, E.apellido2, E.nombre;

-- 3. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos
-- departamentos que tienen empleados.

SELECT DISTINCT D.codigo, D.nombre 
FROM empleado E JOIN departamento D
ON E.codigo_departamento = D.codigo;

-- 4. Devuelve un listado con el código, el nombre del departamento y el valor del presupuesto actual
-- del que dispone, solamente de aquellos departamentos que tienen empleados. El valor del
-- presupuesto actual lo puede calcular restando al valor del presupuesto inicial (columna
-- presupuesto) el valor de los gastos que ha generado (columna gastos).

SELECT DISTINCT D.codigo, D.nombre, D.presupuesto, D.presupuesto - D.gastos "Presupuesto Actual"
FROM empleado E JOIN departamento D
ON E.codigo_departamento = D.codigo;

-- 5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.

SELECT D.nombre 
FROM departamento D JOIN empleado E
ON D.codigo = E.codigo_departamento
WHERE E.nif = "38382980M";

-- 6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.

SELECT D.nombre 
FROM departamento D JOIN empleado E
ON D.codigo = E.codigo_departamento
WHERE E.nombre = "Pepe" AND E.apellido1= "Ruiz" AND E.apellido2 = "Santana";

-- 7. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D.
-- Ordena el resultado alfabéticamente.

SELECT E.*
FROM departamento D JOIN empleado E 
ON D.codigo = E.codigo_departamento
WHERE D.nombre = "I+D"
ORDER BY E.nombre;

-- 8. Devuelve un listado con los datos de los empleados que trabajan en el departamento de
-- Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.

SELECT E.* 
FROM empleado E JOIN departamento D 
ON D.codigo = E.codigo_departamento
WHERE D.nombre = "Sistemas" OR D.nombre = "Contabilidad" OR D.nombre = "I+D" -- D.nombre IN ("Sistemas, Contabilidad...)
ORDER BY E.nombre;

-- 9. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen
-- un presupuesto entre 100000 y 200000 euros.

SELECT E.nombre
FROM departamento D JOIN empleado E
ON D.codigo = E.codigo_departamento 
WHERE D.presupuesto NOT BETWEEN 100000 AND 200000;

-- 10. Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo
-- segundo apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos
-- que estén repetidos.

SELECT DISTINCT D.nombre
FROM departamento D JOIN empleado E
ON D.codigo = E.codigo_departamento 
WHERE E.apellido2 IS NULL;
