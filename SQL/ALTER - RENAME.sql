-- DDL: (Lenguaje de Definición de Datos)
-- Instrucciones
-- 1 - DROP
DROP DATABASE IF EXISTS ddl;
DROP TABLE IF EXISTS ddl;

-- 2 - CREATE
CREATE DATABASE IF NOT EXISTS ddl;
CREATE TABLE IF NOT EXISTS ddl;

CREATE SCHEMA IF NOT EXISTS test;
USE test;
CREATE TABLE t(
	id INT PRIMARY KEY
);

-- 3 - ALTER
-- add
ALTER TABLE t ADD email varchar(255);
-- drop
ALTER TABLE t DROP email;
-- modify
ALTER TABLE t MODIFY COLUMN email INT;
-- rename
RENAME TABLE t TO m;

