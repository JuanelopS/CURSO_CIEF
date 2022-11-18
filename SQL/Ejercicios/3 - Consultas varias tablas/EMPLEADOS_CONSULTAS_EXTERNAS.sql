-- INSERT INTO departamento VALUES 
-- (null , "dirección", 10000, 2000);

-- INSERT INTO empleado VALUES
-- (null, "20495723K", "Antonio", "Martínez", "Ares", 4);

-- 1. 	Devuelve un listado con todos los empleados junto con los datos de los 
-- departamentos donde trabajan. Este listado también debe incluir los empleados 
-- que no tienen ningún departamento asociado.

SELECT * 
FROM empleado E LEFT JOIN departamento D
ON E.codigo_departamento = D.codigo;

-- 2. 	Devuelve un listado donde sólo aparezcan aquellos empleados que no 
-- tienen ningún departamento asociado.

SELECT * 
FROM empleado E LEFT JOIN departamento D
ON E.codigo_departamento = D.codigo
WHERE E.codigo_departamento IS NULL;

-- 3. 	Devuelve un listado donde sólo aparezcan aquellos departamentos 
-- que no tienen ningún empleado asociado.

SELECT * 
FROM empleado E RIGHT JOIN departamento D
ON E.codigo_departamento = D.codigo
WHERE E.codigo_departamento IS NULL;

-- 4. 	Devuelve un listado con todos los empleados junto con los datos de 
-- los departamentos donde trabajan. El listado debe incluir los empleados que no 
-- tienen ningún departamento asociado y los departamentos que no tienen ningún 
-- empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

SELECT E.*, D.nombre as nombre_depart FROM empleado E 
LEFT JOIN departamento D 
ON E.codigo_departamento = D.codigo
UNION  
SELECT E.*, D.nombre as nombre_depart FROM empleado E 
RIGHT JOIN departamento D
ON E.codigo_departamento = D.codigo
ORDER BY nombre_depart;

-- 5. 	Devuelve un listado con los empleados que no tienen ningún departamento 
-- asociado y los departamentos que no tienen ningún empleado asociado. Ordene 
-- el listado alfabéticamente por el nombre del departamento.

SELECT E.*, D.nombre as nombre_depart FROM empleado E 
LEFT JOIN departamento D 
ON E.codigo_departamento = D.codigo
WHERE D.codigo IS NULL OR E.codigo IS NULL 
UNION
SELECT E.*, D.nombre as nombre_depart FROM empleado E 
RIGHT JOIN departamento D
ON E.codigo_departamento = D.codigo
WHERE D.codigo IS NULL OR E.codigo IS NULL
ORDER BY nombre_depart;

