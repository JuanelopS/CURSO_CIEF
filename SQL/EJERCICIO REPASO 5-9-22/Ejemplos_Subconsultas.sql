drop schema if exists tienda;
create schema tienda;
use tienda;

create table fabricante(
	codigo int primary key auto_increment,
    nombre varchar(100)
);

create table producto(
	codigo int primary key auto_increment,
    nombre varchar(100),
    precio int,
    codigo_fabricante int,
    constraint fk1 
    foreign key (codigo_fabricante)
    references fabricante(codigo)
);

insert into fabricante values
(default, "HP"),
(default, "Lenovo"),
(default, "Asus");

insert into producto values
(default, "Pantalla", 200, 1),
(default, "PC", 500, 1),
(default, "Portatil", 400, 2),
(default, "Tablet", 200, 2),
(default, "Portatil", 500, 3),
(default, "PC", 800, 3);


SELECT F.nombre, COUNT(P.codigo)
	FROM fabricante F INNER JOIN producto P
	ON F.codigo = P.codigo_fabricante
GROUP BY F.codigo
HAVING COUNT(P.codigo) >= (
	SELECT COUNT(P.codigo)
	FROM fabricante F INNER JOIN producto P
	ON F.codigo = P.codigo_fabricante
	WHERE F.nombre = 'Asus');
    
SELECT *
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE precio >= ALL (SELECT precio
FROM fabricante INNER JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Asus');
    
    
    
    