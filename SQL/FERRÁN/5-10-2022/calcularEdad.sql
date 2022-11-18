DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `calcularEdad`(`usuario` INT(10)) RETURNS int(4)
BEGIN
  SET @edad = '';
  SELECT fecha_nacimiento INTO @edad FROM persona WHERE id = usuario;

  RETURN DATEDIFF(now(),@edad)/365;
END$$
DELIMITER ;