USE google;

-- 1: Suponga que queremos mostrar en una página web las filas que
-- están almacenadas en la tabla resultados, y queremos mostrar
-- la información en diferentes páginas, donde cada una de las
-- páginas muestra solamente 5 resultados. ¿Qué consulta SQL
-- necesitamos realizar para incluir los primeros 5 resultados de la
-- primera página?
SELECT nombre FROM resultado
LIMIT 5;

-- 2: ¿Qué consulta necesitaríamos para mostrar resultados de la
-- segunda página?
SELECT nombre FROM resultado
LIMIT 5 OFFSET 5;  -- empieza en la posición 6 y limita la query a 5 filas.

-- 3: ¿Y los resultados de la tercera página?
SELECT * FROM resultado
LIMIT 5, 10;  -- empieza en la posición 11 y limita la query a 5 filas.