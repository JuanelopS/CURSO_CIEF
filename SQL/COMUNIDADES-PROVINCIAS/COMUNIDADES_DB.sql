DROP SCHEMA IF EXISTS COMUNIDADES;

CREATE SCHEMA COMUNIDADES;

USE COMUNIDADES;

CREATE TABLE CCAA(
	Id_ccaa CHAR(3) PRIMARY KEY,
    Nombre VARCHAR(30)
);

CREATE TABLE PROVINCIAS(
	Id_prov VARCHAR(2) PRIMARY KEY,
	Nombre VARCHAR(30),
    Codigo_comunidad CHAR(3),
    FOREIGN KEY (Codigo_comunidad) REFERENCES CCAA(Id_ccaa)
);
