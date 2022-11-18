USE IFCD0210;

INSERT INTO MODULOS VALUES
("MF0491_3","Programación Web en el entorno cliente"),
("MF0492_3","Programación Web en el entorno servidor"),
("MF0493_3",": Implantación de aplicaciones web en entornos internet, intranet y extranet");

INSERT INTO UNIDADES VALUES
("UF1841", "Elaboración de documentos web mediante lenguajes de marcas", 60, "MF0491_3"),
("UF1842", "Desarrollo y reutilización de componentes software y multimedia mediante
-- lenguajes de guión", 90, "MF0491_3"),
("UF1843", "Aplicación de técnicas de usabilidad y accesibilidad en el entorno cliente", 30, "MF0491_3"),
("UF1844", "Desarrollo de aplicaciones web en el entorno servidor", 90, "MF0492_3"),
("UF1845", "Acceso a datos en aplicaciones web del entorno servidor", 90, "MF0492_3"),
("UF1846", "Desarrollo de aplicaciones web distribuidas", 60, "MF0492_3");

INSERT INTO ALUMNOS VALUES
(NULL,"Pepe"),
(NULL,"Juan"),
(NULL,"Pedro"),
(NULL,"María"),
(NULL,"Sandra");

INSERT INTO NOTAS VALUES
(1,"UF1841",9),
(3,"UF1841",7),
(4,"UF1844",8),
(2,"UF1841",7),
(1,"UF1843",10),
(3,"UF1841",7),
(5,"UF1846",9);
