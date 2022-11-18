-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2022 a las 16:58:10
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cine`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `actores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `actores` (
`nombre` varchar(20)
,`apellido` varchar(30)
,`oscars` int(2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `actors`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `actors` (
`nombre` varchar(20)
,`apellido` varchar(30)
,`oscars` int(2)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(1) NOT NULL,
  `genero` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `genero`) VALUES
(1, 'mujer'),
(2, 'hombre'),
(5, 'otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `id_people` int(2) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `profesion` int(2) NOT NULL,
  `genero` int(1) NOT NULL,
  `oscars` int(2) NOT NULL,
  `fecha_nacimiento` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Datos básicos de personas famosas del cine';

--
-- Volcado de datos para la tabla `people`
--

INSERT INTO `people` (`id_people`, `nombre`, `apellido`, `profesion`, `genero`, `oscars`, `fecha_nacimiento`) VALUES
(1, 'Katharine', 'Hepburn', 2, 1, 4, '1907'),
(2, 'James', 'Stewart', 2, 2, 2, '1908'),
(3, 'John', 'Ford', 1, 1, 4, '1894'),
(4, 'Cary', 'Grant', 2, 2, 1, '1908'),
(5, 'Henry', 'Fonda', 2, 2, 2, '1905'),
(6, 'Billy', 'Wilder', 1, 2, 6, '1906'),
(7, 'Marilyn', 'Monroe', 2, 1, 0, '1926'),
(8, 'Shirley', 'MacLaine', 2, 1, 1, '1934'),
(9, 'Alfred', 'Hitchcock', 1, 2, 0, '1899'),
(10, 'Nino', 'Rota', 3, 2, 1, '1911'),
(11, 'John', 'Barry', 3, 2, 4, '1933'),
(12, 'Sean', 'Connery', 2, 2, 1, '1930'),
(13, 'Ingrid', 'Bergman', 2, 1, 2, '1915'),
(14, 'Audrey', 'Hepburn', 2, 1, 1, '1929'),
(15, 'Grace', 'Kelly', 2, 1, 1, '1929'),
(17, 'Meryl', 'Streep', 2, 1, 3, '1949'),
(18, 'John', 'Williams', 3, 2, 6, '1932'),
(22, 'Woody', 'Allen', 1, 2, 4, '1935'),
(23, 'Groucho', 'Marx', 2, 2, 1, '1890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion`
--

CREATE TABLE `profesion` (
  `id_profesion` int(2) NOT NULL,
  `profesion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesion`
--

INSERT INTO `profesion` (`id_profesion`, `profesion`) VALUES
(1, 'director'),
(2, 'actor'),
(3, 'compositor');

-- --------------------------------------------------------

--
-- Estructura para la vista `actores`
--
DROP TABLE IF EXISTS `actores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `actores`  AS SELECT `people`.`nombre` AS `nombre`, `people`.`apellido` AS `apellido`, `people`.`oscars` AS `oscars` FROM (`people` join `genero` on(`people`.`genero` = `genero`.`id_genero`)) WHERE `genero`.`genero` = 'hombre''hombre'  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `actors`
--
DROP TABLE IF EXISTS `actors`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `actors`  AS SELECT `people`.`nombre` AS `nombre`, `people`.`apellido` AS `apellido`, `people`.`oscars` AS `oscars` FROM (`people` join `genero` on(`people`.`genero` = `genero`.`id_genero`)) WHERE `genero`.`genero` = 'hombre''hombre'  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id_people`),
  ADD KEY `fk_genero` (`genero`),
  ADD KEY `fk_profesion` (`profesion`);

--
-- Indices de la tabla `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`id_profesion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `people`
--
ALTER TABLE `people`
  MODIFY `id_people` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `profesion`
--
ALTER TABLE `profesion`
  MODIFY `id_profesion` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `fk_genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`id_genero`),
  ADD CONSTRAINT `fk_profesion` FOREIGN KEY (`profesion`) REFERENCES `profesion` (`id_profesion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
