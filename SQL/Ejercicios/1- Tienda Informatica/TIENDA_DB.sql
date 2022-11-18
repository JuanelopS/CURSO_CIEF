-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Tienda
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Tienda` ;

-- -----------------------------------------------------
-- Schema Tienda
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tienda` DEFAULT CHARACTER SET utf8 ;
USE `Tienda` ;

-- -----------------------------------------------------
-- Table `Tienda`.`FABRICANTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`FABRICANTES` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`.`ARTICULOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`ARTICULOS` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NULL,
  `Precio` INT NULL,
  `Fabricante` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `fk_ARTICULOS_FABRICANTES_idx` (`Fabricante` ASC) ,
  CONSTRAINT `fk_ARTICULOS_FABRICANTES`
    FOREIGN KEY (`Fabricante`)
    REFERENCES `Tienda`.`FABRICANTES` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Tienda`.`FABRICANTES`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tienda`;
INSERT INTO `Tienda`.`FABRICANTES` (`Codigo`, `Nombre`) VALUES (DEFAULT, 'HP');
INSERT INTO `Tienda`.`FABRICANTES` (`Codigo`, `Nombre`) VALUES (DEFAULT, 'Logitech');
INSERT INTO `Tienda`.`FABRICANTES` (`Codigo`, `Nombre`) VALUES (DEFAULT, 'Asus');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Tienda`.`ARTICULOS`
-- -----------------------------------------------------
START TRANSACTION;
USE `Tienda`;
INSERT INTO `Tienda`.`ARTICULOS` (`Codigo`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'ZBOOK FURY 15', 500, 1);
INSERT INTO `Tienda`.`ARTICULOS` (`Codigo`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'TINTA 300', 40, 1);
INSERT INTO `Tienda`.`ARTICULOS` (`Codigo`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'ELITEDESK 8', 600, 1);
INSERT INTO `Tienda`.`ARTICULOS` (`Codigo`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'G502', 60, 2);
INSERT INTO `Tienda`.`ARTICULOS` (`Codigo`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'G733', 70, 2);
INSERT INTO `Tienda`.`ARTICULOS` (`Codigo`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'MK235', 75, 2);
INSERT INTO `Tienda`.`ARTICULOS` (`Codigo`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'PRIME Z690P', 199, 3);
INSERT INTO `Tienda`.`ARTICULOS` (`Codigo`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'ROG STRIX B450', 179, 3);

COMMIT;

