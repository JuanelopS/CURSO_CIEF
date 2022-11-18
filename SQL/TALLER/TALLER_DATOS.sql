USE TALLER;

-- Primero se insertan los datos de tablas que no tengan Foreign Keys (obviously)

INSERT INTO PIEZA VALUES 
(10, "Tornillo TRL"),
(11, "Motor MLT"),
(12, "Rueda IZQ"),
(13, "Tuerca TRC"),
(14, "Rueda DRC");

-- Si quisieramos añadir únicamente dato en el campo nombre
-- INSERT INTO PIEZA (Nombre) VALUES (nombre_para_añadir);

INSERT INTO PROVEEDOR VALUES
("A2TH", "Tus piezas al momento, S.L."),
("SHG4", "Recambios y piezas, S.L."),
("KFI3", "Gran proveedor de piezas, S.A."),
("DG34", "Las piezas de la calle 34, S.L."),
("TGLR", "Super piezas, SCP");

-- Datos de las compras

INSERT INTO COMPRA VALUES
(1, 10, "A2TH", 1.25),
(2, 11, "KFI3", 124.50),
(3, 12, "SHG4", 46.78),
(4, 13, "TGLR", 2.34),
(5, 14, "KFI3", 44.34),
(6, 10, "SHG4", 1.09),
(7, 11, "SHG4", 129.69),
(8, 13, "DG34", 2.28),
(9, 10, "DG34", 1.19),
(10, 12, "KFI3", 46.80),
(11, 14, "TGLR", 45.59),
(12, 11, "TGLR", 127.34),
(13, 11, "A2TH", 131.50),
(14, 11, "TGLR", 49.90);







