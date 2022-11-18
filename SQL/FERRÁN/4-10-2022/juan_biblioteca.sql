-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql112.epizy.com
-- Tiempo de generación: 04-10-2022 a las 09:04:27
-- Versión del servidor: 10.3.27-MariaDB
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `epiz_32640110_juan_biblioteca`
--
CREATE DATABASE IF NOT EXISTS `epiz_32640110_juan_biblioteca` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `epiz_32640110_juan_biblioteca`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE IF NOT EXISTS `autores` (
  `id_autor` int(5) NOT NULL AUTO_INCREMENT,
  `nombre_autor` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `apellido_autor` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `pseudonimo` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id_autor`, `nombre_autor`, `apellido_autor`, `pseudonimo`) VALUES
(1, 'Miguel', 'de Cervantes', 'El manco'),
(2, 'Jane', 'Austen', 'La guapa'),
(3, 'Mary', 'Shelley', 'La simpática'),
(4, 'Victor', 'Hugo', 'El amable'),
(5, 'Charles', 'Dickens', 'Le gustaban las ballenas'),
(6, 'Agatha', 'Christie', 'La gran madre del misterio'),
(7, 'Federico', 'García Lorca', 'Poeta universal'),
(8, 'Gabriel', 'García Márquez', 'Un escrito que lo hizo todo'),
(9, 'Ernest', 'Hemingway', 'Víctima de su propia leyenda'),
(10, 'James', 'Joyce', 'Agitador de la lengua con su estilo vanguardista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE IF NOT EXISTS `ciudades` (
  `id_ciudad` int(5) NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(40) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_ciudad`,`nombre_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `nombre_ciudad`) VALUES
(1, 'Barcelona'),
(2, 'Madrid'),
(3, 'Sevilla'),
(4, 'Valencia'),
(5, 'Bilbao'),
(6, 'A Coruña'),
(7, 'León'),
(8, 'Granada'),
(9, 'Logroño'),
(10, 'Zaragoza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE IF NOT EXISTS `editoriales` (
  `id_editorial` int(5) NOT NULL AUTO_INCREMENT,
  `id_ciudad` int(5) DEFAULT NULL,
  `nombre_editorial` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_editorial`,`nombre_editorial`),
  KEY `id_ciudad` (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `editoriales`
--

INSERT INTO `editoriales` (`id_editorial`, `id_ciudad`, `nombre_editorial`) VALUES
(1, 1, 'Planeta'),
(2, 2, 'Algani Editorial'),
(3, 3, 'Andavira Editora'),
(4, 4, 'Apiario Editora'),
(5, 5, 'Arcibel Editores'),
(6, 6, 'Atónitos'),
(7, 7, 'BioGea Ediciones'),
(8, 8, 'Calambur Editorial'),
(9, 9, 'Colandcol'),
(10, 10, 'Ediciones Alfar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE IF NOT EXISTS `libros` (
  `id_libro` int(5) NOT NULL AUTO_INCREMENT,
  `id_autor` int(5) DEFAULT NULL,
  `id_editorial` int(5) DEFAULT NULL,
  `titulo_libro` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `any_edicion` year(4) DEFAULT NULL,
  `descripcion_libro` mediumtext CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `id_autor` (`id_autor`),
  KEY `id_editorial` (`id_editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `id_autor`, `id_editorial`, `titulo_libro`, `any_edicion`, `descripcion_libro`) VALUES
(1, 1, 1, 'Don Quijote de la Mancha', 1905, 'El ingenioso hidalgo don Quijote de la Mancha narra las aventuras de Alonso Quijano, un hidalgo pobre que de tanto leer novelas de caballería acaba enloqueciendo y creyendo ser un caballero andante, nombrándose a sí mismo como don Quijote de la Mancha.'),
(2, 2, 2, 'Orgullo y prejuicio', 1925, 'La obra más famosa de Jane Austen. Una novela romántica de malentendidos que tiene como protagonista a las cinco hermanas Bennet, casaderas ellas, dentro de las cuales se alza con absoluto dominio Elizabeth. Su pareja narrativa es el señor Fitzwilliam Darcy.'),
(3, 3, 3, 'Frankenstein', 1933, 'Se trata de un ser creado a partir de partes diferentes de cadáveres, al cual le es otorgada la vida por su creador, Víctor Frankenstein, durante un experimento.'),
(4, 4, 4, 'Los Miserables', 1912, 'La mejor obra de Víctor Hugo y uno de los libros más bellos y dramáticos de la historia. Por Los Miserables desfilan los personajes que caracterizaron el convulso siglo XIX, presidiarios, eclesiásticos, revolucionarios, pobres, burgueses, policías, perseguidos...'),
(5, 5, 5, 'Historia de dos ciudades', 1940, 'En plena revolución francesa, y a medio camino entre el país galo e inglaterra, una joven rescata a su padre que creía muerto pero que realmente había estado encarcelado por 15 años en una torre en unas lamentables condiciones. Un lustro después, ambos presencian cómo un pulgoso abogado, infructuosamente enamorado de ella, logra salvar a su cliente de un juicio que parecía imposible'),
(6, 6, 6, 'Asesinato en el Orient Express', 1955, 'El detective belga Hércules Poirot investiga un asesinato a bordo de un tren. El asesino se encuentra dentro del Orient Express y Poirot está dispuesto a desenmascararlo.'),
(7, 7, 7, 'Poema del cante jondo', 1921, 'Federico García Lorca, con esta obra, penetra en el espíritu de Andalucía captando su cultura popular primitiva y misteriosa, curtida en el dolor.'),
(8, 8, 8, 'Cien años de soledad', 1967, 'La historia de la familia Buendía, habitante del perdido pueblo de Macondo, no solo sirvió para narrar la historia de Latinoamérica a lo largo de varias generaciones, sino para acuñar el boom de un realismo mágico que imperó durante las décadas de las 60 y 70 para convertirse en una marca insignia de las letras iberoamericanas.'),
(9, 9, 9, 'El viejo y el mar', 1952, 'En el Gulf Stream - La Habana, Santiago es un pescador de avanzada edad, que lleva 84 días sin pescar algo. Un buen día por la mañana, decide salir solo al mar, donde por fin, un enorme marlín pica el anzuelo y da batalla antes de ser capturado. La lucha con el pez dura tres días, en los que Santiago recuerda su vida pasada.'),
(10, 10, 10, 'Ulises', 1922, 'Relato paródico de la épica de la condición humana y de Dublín y sus buenas costumbres cuya estructura, desbordantemente vanguardista avisa a cada rato de su dificultad y exige la máxima dedicación.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE IF NOT EXISTS `prestamos` (
  `id_prestamo` int(5) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(5) DEFAULT NULL,
  `id_libro` int(5) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_libro` (`id_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id_prestamo`, `id_usuario`, `id_libro`, `fecha_prestamo`, `fecha_devolucion`) VALUES
(1, 1, 10, '2022-10-01', '2022-10-11'),
(2, 3, 8, '2022-09-26', '2022-10-06'),
(3, 5, 6, '2022-09-24', '2022-10-04'),
(4, 2, 4, '2022-10-04', '2022-10-14'),
(5, 6, 2, '2022-10-03', '2022-10-13'),
(6, 4, 1, '2022-10-20', '2022-10-30'),
(7, 7, 3, '2022-10-02', '2022-10-12'),
(8, 9, 5, '2022-09-28', '2022-10-08'),
(9, 10, 7, '2022-09-23', '2022-10-03'),
(10, 8, 9, '2022-10-01', '2022-10-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(5) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `apellido_usuario` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `email_usuario` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `num_consultas` int(5) DEFAULT 0,
  `num_prestamos` int(5) DEFAULT 0,
  `num_dias_falta` int(5) DEFAULT 0,
  `fecha_alta` date DEFAULT NULL,
  `bloqueo_usuario` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
(10, 'Ferran', 'Profe', 'ferran@correo.com', 5, 5, 6, '1973-01-22', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros` ADD FULLTEXT KEY `descripcion_libro` (`descripcion_libro`);

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
