drop schema if exists tienda;
create schema tienda;
use tienda;

create table fabricante(
	id int primary key auto_increment,
    nombre varchar(100)
);

create table producto(
	id int primary key auto_increment,
    nombre varchar(100),
    precio int,
    fabricante int,
    constraint fk1 
    foreign key (fabricante)
    references fabricante(id)
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
(default, "PC", 800, 3),
(default, null, 400, 4);
-- Obtner la cantidad de productos en la tienda
select count(*) from producto;

-- Consultas a las tablas
select * from fabricante;
select * from producto;
-- Obtener el nombre de los fabricantes junto a el precio medio de
-- sus productos
select F.nombre, avg(P.precio) 
from fabricante F inner join producto P
on F.id = P.fabricante
group by F.nombre
having F.nombre != "Lenovo";









