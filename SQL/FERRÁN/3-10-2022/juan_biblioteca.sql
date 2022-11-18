-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2022 a las 19:42:19
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
-- Base de datos: `juan_biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `id_autor` int(5) NOT NULL,
  `nombre_autor` varchar(40) DEFAULT NULL,
  `apellido_autor` varchar(60) DEFAULT NULL,
  `pseudonimo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id_ciudad` int(5) NOT NULL,
  `nombre_ciudad` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE `editoriales` (
  `id_editorial` int(5) NOT NULL,
  `id_ciudad` int(5) DEFAULT NULL,
  `nombre_editorial` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(5) NOT NULL,
  `id_autor` int(5) DEFAULT NULL,
  `id_editorial` int(5) DEFAULT NULL,
  `titulo_libro` varchar(100) DEFAULT NULL,
  `any_edicion` year(4) DEFAULT NULL,
  `descripcion_libro` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_prestamo` int(5) NOT NULL,
  `id_usuario` int(5) DEFAULT NULL,
  `id_libro` int(5) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(5) NOT NULL,
  `nombre_usuario` varchar(50) DEFAULT NULL,
  `apellido_usuario` varchar(60) DEFAULT NULL,
  `email_usuario` varchar(150) DEFAULT NULL,
  `num_consultas` int(5) DEFAULT 0,
  `num_prestamos` int(5) DEFAULT 0,
  `num_dias_falta` int(5) DEFAULT 0,
  `fecha_alta` date DEFAULT NULL,
  `bloqueo_usuario` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apellido_usuario`, `email_usuario`, `num_consultas`, `num_prestamos`, `num_dias_falta`, `fecha_alta`, `bloqueo_usuario`) VALUES
(1, 'Juan', 'Gavira', 'contacto@juangavira.me', 3, 2, 5, '1983-02-13', 0),
(2, 'Sheila', 'Tejedor', 'contacto@sheilatejedor.me', 3, 2, 5, '1989-06-29', 0),
(3, 'Pedro', 'Picapiedra', 'pedro@correo.com', 1, 2, 5, '1993-11-22', 0),
(4, 'Pablo', 'Escobar', 'pablo@correo.com', 1, 5, 3, '1983-02-13', 1),
(5, 'Michael', 'Jordan', 'jordan@correo.com', 1, 2, 5, '1966-12-31', 0),
(6, 'Pablo', 'Iglesias', 'pabloiglesias@correo.com', 5, 2, 1, '1980-06-11', 0),
(7, 'Manolito', 'Gafotas', 'manolito@correo.com', 2, 1, 3, '2003-11-19', 0),
(8, 'José', 'Coronado', 'jose@correo.com', 1, 1, 1, '1987-08-17', 1),
(9, 'Cris', 'Kekw', 'cris@correo.com', 1, 5, 5, '1990-08-23', 0),
(10, 'Ferran', 'Profe', 'ferran@correo.com', 5, 5, 6, '1973-01-22', 0),
(12, 'Juan', 'Gavira', 'contacto@juangavira.me', 3, 2, 5, '1983-02-13', 0),
(13, 'Pedro', 'Picapiedra', 'pedro@correo.com', 1, 2, 5, '1993-11-22', 0),
(14, 'Pablo', 'Escobar', 'pablo@correo.com', 1, 5, 3, '1983-02-13', 1),
(15, 'Michael', 'Jordan', 'jordan@correo.com', 1, 2, 5, '1966-12-31', 0),
(16, 'Pablo', 'Iglesias', 'pabloiglesias@correo.com', 5, 2, 1, '1980-06-11', 0),
(17, 'Manolito', 'Gafotas', 'manolito@correo.com', 2, 1, 3, '2003-11-19', 0),
(18, 'José', 'Coronado', 'jose@correo.com', 1, 1, 1, '1987-08-17', 1),
(19, 'Cris', 'Kekw', 'cris@correo.com', 1, 5, 5, '1990-08-23', 0),
(20, 'Ferran', 'Profe', 'ferran@correo.com', 5, 5, 6, '1973-01-22', 0),
(21, 'Juan', 'Gavira', 'contacto@juangavira.me', 3, 2, 5, '1983-02-13', 0),
(22, 'Juan', 'Gavira', 'contacto@juangavira.me', 3, 2, 5, '1983-02-13', 0),
(23, 'Pedro', 'Picapiedra', 'pedro@correo.com', 1, 2, 5, '1993-11-22', 0),
(24, 'Pablo', 'Escobar', 'pablo@correo.com', 1, 5, 3, '1983-02-13', 1),
(25, 'Michael', 'Jordan', 'jordan@correo.com', 1, 2, 5, '1966-12-31', 0),
(26, 'Pablo', 'Iglesias', 'pabloiglesias@correo.com', 5, 2, 1, '1980-06-11', 0),
(27, 'Manolito', 'Gafotas', 'manolito@correo.com', 2, 1, 3, '2003-11-19', 0),
(28, 'José', 'Coronado', 'jose@correo.com', 1, 1, 1, '1987-08-17', 1),
(29, 'Cris', 'Kekw', 'cris@correo.com', 1, 5, 5, '1990-08-23', 0),
(30, 'Ferran', 'Profe', 'ferran@correo.com', 5, 5, 6, '1973-01-22', 0),
(31, 'Juan', 'Gavira', 'contacto@juangavira.me', 3, 2, 5, '1983-02-13', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id_ciudad`,`nombre_ciudad`);

--
-- Indices de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`id_editorial`,`nombre_editorial`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `id_autor` (`id_autor`),
  ADD KEY `id_editorial` (`id_editorial`);
ALTER TABLE `libros` ADD FULLTEXT KEY `descripcion_libro` (`descripcion_libro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autor` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id_ciudad` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  MODIFY `id_editorial` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_prestamo` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD CONSTRAINT `editoriales_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`),
  ADD CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`id_editorial`) REFERENCES `editoriales` (`id_editorial`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
