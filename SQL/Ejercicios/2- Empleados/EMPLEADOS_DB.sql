-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EMPLEADOS
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `EMPLEADOS` ;

-- -----------------------------------------------------
-- Schema EMPLEADOS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EMPLEADOS` DEFAULT CHARACTER SET utf8 ;
USE `EMPLEADOS` ;

-- -----------------------------------------------------
-- Table `EMPLEADOS`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EMPLEADOS`.`departamento` (
  `codigo` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `presupuesto` DOUBLE NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EMPLEADOS`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EMPLEADOS`.`empleado` (
  `codigo` INT(10) NOT NULL AUTO_INCREMENT,
  `nif` VARCHAR(9) NULL,
  `nombre` VARCHAR(100) NULL,
  `apellido1` VARCHAR(100) NULL,
  `apellido2` VARCHAR(100) NULL,
  `codigo_departamento` INT(10) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC),
  INDEX `fk_empleado_departamento_idx` (`codigo_departamento` ASC) ,
  CONSTRAINT `fk_empleado_departamento`
    FOREIGN KEY (`codigo_departamento`)
    REFERENCES `EMPLEADOS`.`departamento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EMPLEADOS`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EMPLEADOS`.`departamento` (
  `codigo` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `presupuesto` DOUBLE NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `EMPLEADOS`.`departamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `EMPLEADOS`;
INSERT INTO `EMPLEADOS`.`departamento` (`codigo`, `nombre`, `presupuesto`) VALUES (DEFAULT, 'contabilidad', 1000);
INSERT INTO `EMPLEADOS`.`departamento` (`codigo`, `nombre`, `presupuesto`) VALUES (DEFAULT, 'marketing', 2000);
INSERT INTO `EMPLEADOS`.`departamento` (`codigo`, `nombre`, `presupuesto`) VALUES (DEFAULT, 'rrhh', 4000);
INSERT INTO `EMPLEADOS`.`departamento` (`codigo`, `nombre`, `presupuesto`) VALUES (DEFAULT, 'i+d', 2000);
INSERT INTO `EMPLEADOS`.`departamento` (`codigo`, `nombre`, `presupuesto`) VALUES (DEFAULT, 'soporte', 3000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `EMPLEADOS`.`empleado`
-- -----------------------------------------------------
START TRANSACTION;
USE `EMPLEADOS`;
INSERT INTO `EMPLEADOS`.`empleado` (`codigo`, `nif`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (DEFAULT, '12345678A', 'ANTONIO', 'GARCIA', 'GUTIERREZ', 1);
INSERT INTO `EMPLEADOS`.`empleado` (`codigo`, `nif`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (DEFAULT, '23456789B', 'JESUS', 'RODRIGUEZ', 'ALMEIDA', 1);
INSERT INTO `EMPLEADOS`.`empleado` (`codigo`, `nif`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (DEFAULT, '34567890C', 'JUAN', 'LOPEZ', 'AYALA', 1);
INSERT INTO `EMPLEADOS`.`empleado` (`codigo`, `nif`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (DEFAULT, '45678901D', 'RODRIGO', 'GONZALEZ', 'TARREGA', 2);
INSERT INTO `EMPLEADOS`.`empleado` (`codigo`, `nif`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (DEFAULT, '56789012E', 'PEDRO', 'GUTIERREZ', 'ALMANSA', 2);
INSERT INTO `EMPLEADOS`.`empleado` (`codigo`, `nif`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (DEFAULT, '67890123F', 'ALFREDO', 'DURO', 'RODRIGUEZ', 3);
INSERT INTO `EMPLEADOS`.`empleado` (`codigo`, `nif`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (DEFAULT, '78901234G', 'JOSEP', 'PEDREROL', 'KEKW', 3);
INSERT INTO `EMPLEADOS`.`empleado` (`codigo`, `nif`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (DEFAULT, '89012345H', 'MIGUEL ÁNGEL', 'RODRIGUEZ', 'LIAÑO', 4);
INSERT INTO `EMPLEADOS`.`empleado` (`codigo`, `nif`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (DEFAULT, '90123456I', 'TOMÁS', 'CAMPELO', 'MARTINEZ', 4);
INSERT INTO `EMPLEADOS`.`empleado` (`codigo`, `nif`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (DEFAULT, '01234567J', 'PABLO', 'ESCOBAR', 'GAVIRIA', 5);

COMMIT;


