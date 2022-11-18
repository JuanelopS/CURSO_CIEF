/* SHOW DATABASES; 
CREATE DATABASE -> PUEDE USARSE DATABASE O SCHEMA */
-- COMENTARIO_DE_UNA_LÍNEA
-- NO CASE-SENSITIVE

-- DROP: SE BORRA LA BASE DE DATOS SI EXISTE PREVIAMENTE Y MÁS ABAJO LA VOLVEMOS A CREAR: no error/warning database exists
DROP SCHEMA IF EXISTS TALLER;

-- CREAMOS LA BASE DE DATOS "TALLER"
-- se puede añadir la instrucción "CREATE DATABASE TALLER"
-- IF NOT EXISTS: salta un warning en lugar de error al intentar crear la base de datos de nuevo

CREATE SCHEMA TALLER; 

-- Seleccionamos la base de datos donde queremos añadir nuestras tablas
-- Se puede con o sin -> ``
USE `TALLER`;

-- TABLA PIEZA
CREATE TABLE PIEZA(
	Codigo INT PRIMARY KEY,
    Nombre VARCHAR(15)
);

-- TABLA PROVEEDORES
CREATE TABLE PROVEEDOR(
	Identificador CHAR(4) PRIMARY KEY,
    Nombre VARCHAR(50)
);

-- TABLA INTERMEDIA QUE ESTABLECE LA CARDINALIDAD N:M (LLAVES FORÁNEAS)
CREATE TABLE COMPRA(
	Id_compra INT PRIMARY KEY,
    Codigo_Pieza INT,  -- FK1
    Id_proveedor CHAR(4), -- FK2
    Precio DECIMAL(5,2),
    -- relación hacia tabla pieza
    FOREIGN KEY (Codigo_Pieza) REFERENCES PIEZA(Codigo),
    -- relación hacia tabla proveedor
    FOREIGN KEY (Id_proveedor) REFERENCES PROVEEDOR(Identificador)
);




