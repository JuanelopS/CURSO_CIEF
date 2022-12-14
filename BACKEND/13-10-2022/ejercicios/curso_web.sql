-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2022 a las 17:23:15
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
-- Base de datos: `curso_web`
--
CREATE DATABASE IF NOT EXISTS `curso_web` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `curso_web`;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `matricular_alumno` (IN `nif_par` VARCHAR(9), IN `asignatura_par` VARCHAR(100), IN `anyo_inicio_par` YEAR, IN `anyo_fin_par` YEAR)   BEGIN
	
	SELECT COUNT(*) INTO @nif FROM alumnos WHERE nif = nif_par;
    SELECT id_alumno INTO @id FROM alumnos WHERE nif = nif_par;
    SELECT COUNT(*) INTO @asignatura FROM asignatura WHERE nombre = asignatura_par;
    SELECT id_asignatura INTO @id_asignatura FROM asignatura WHERE nombre = asignatura_par;
    SELECT COUNT(*) INTO @anyos FROM curso_escolar WHERE anyo_inicio = anyo_inicio_par AND anyo_fin = anyo_fin_par;
    SELECT id_curso INTO @id_curso FROM curso_escolar WHERE anyo_inicio = anyo_inicio_par AND anyo_fin = anyo_fin_par;

	IF @nif > 0 AND @asignatura > 0 AND @anyos > 0 THEN
		INSERT INTO alumno_asignatura_curso VALUES (default, @id, @id_asignatura, @id_curso);
    END IF;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumno` int(10) UNSIGNED NOT NULL,
  `nif` varchar(9) DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `ciudad` varchar(25) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('H','M') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumno`, `nif`, `nombre`, `apellido`, `ciudad`, `fecha_nacimiento`, `sexo`) VALUES
(1, '26902806M', 'Salvador', 'Sánchez', 'Barcelona', '1999-09-04', 'H'),
(2, '89542419S', 'Juan', 'Saez', 'Valencia', '1997-10-12', 'H'),
(3, '11105554G', 'Zoe', 'Ramirez', 'Barcelona', '1991-01-08', 'M'),
(5, '38223286T', 'David', 'Schmidt', 'Valencia', '1991-07-05', 'H'),
(6, '04233869Y', 'José', 'Koss', 'Valencia', '2004-08-12', 'H'),
(7, '97258166K', 'Ismael', 'Strosin', 'Barcelona', '1998-12-09', 'H'),
(8, '79503962T', 'Cristina', 'Lemke', 'Madrid', '1993-09-08', 'M'),
(9, '82842571K', 'Ramón', 'Herzog', 'Barcelona', '1993-03-08', 'H'),
(11, '46900725E', 'Daniel', 'Herman', 'Barcelona', '2003-06-11', 'H'),
(12, '85366986W', 'Carmen', 'Streich', 'Valencia', '1996-06-05', 'M'),
(13, '73571384L', 'Alfredo', 'Stiedemann', 'Sevilla', '1999-10-12', 'H'),
(14, '82937751G', 'Manolo', 'Hamill', 'Valencia', '1994-11-01', 'H'),
(15, '80502866Z', 'Alejandro', 'Kohler', 'Madrid', '1995-05-07', 'H'),
(16, '10485008K', 'Antonio', 'Fahey', 'Madrid', '1994-01-08', 'H'),
(17, '85869555K', 'Guillermo', 'Ruecker', 'Barcelona', '1999-01-03', 'H'),
(19, '11578526G', 'Inma', 'Lakin', 'Madrid', '2001-06-09', 'M'),
(20, '79221403L', 'Francesca', 'Schowalter', 'Sevilla', '1998-06-11', 'H'),
(21, '79089577Y', 'Juan', 'Gutiérrez', 'París', '2004-08-01', 'H'),
(22, '41491230N', 'Antonio', 'Domínguez', 'Valencia', '2001-12-01', 'H'),
(23, '64753215G', 'Irene', 'Hernández', 'Valencia', '2001-06-05', 'M'),
(24, '85135690V', 'Sonia', 'Gea', 'Sevilla', '2003-01-09', 'M'),
(25, '53111822A', 'Mary', 'Smith', 'Valencia', '1997-08-07', 'H'),
(26, '42651623A', 'Patricia', 'Johnson', 'Valencia', '2003-04-12', 'H'),
(27, '33726737A', 'Linda', 'Williams', 'Barcelona', '2004-01-05', 'H'),
(28, '65939582A', 'Barbara', 'Jones', 'Valencia', '2002-08-03', 'H'),
(29, '30999534A', 'Elizabeth', 'Brown', 'Valencia', '2003-07-10', 'H'),
(30, '12594732A', 'Jennifer', 'Davis', 'Madrid', '1993-05-01', 'H'),
(31, '22236693A', 'Maria', 'Miller', 'Barcelona', '1996-09-04', 'H'),
(32, '26902277A', 'Susan', 'Wilson', 'Valencia', '1994-10-03', 'H'),
(33, '72409209A', 'Margaret', 'Moore', 'Sevilla', '1999-06-11', 'H'),
(34, '42283097A', 'Dorothy', 'Taylor', 'Madrid', '1998-11-10', 'H'),
(35, '28333153A', 'Lisa', 'Anderson', 'Sevilla', '1998-06-10', 'H'),
(36, '25586202A', 'Nancy', 'Thomas', 'Barcelona', '2001-07-01', 'H'),
(37, '11125699A', 'Karen', 'Jackson', 'Barcelona', '1994-07-05', 'H'),
(38, '39792670A', 'Betty', 'White', 'Barcelona', '1993-01-07', 'H'),
(39, '65228938A', 'Helen', 'Harris', 'Barcelona', '2001-02-08', 'H'),
(40, '12417008A', 'Sandra', 'Martin', 'Valencia', '2003-07-03', 'H'),
(41, '92229399A', 'Donna', 'Thompson', 'Valencia', '1994-11-11', 'H'),
(42, '76527835A', 'Carol', 'Garcia', 'Valencia', '2001-08-12', 'H'),
(43, '77053708A', 'Ruth', 'Martinez', 'Valencia', '1991-11-05', 'H'),
(44, '20022643A', 'Sharon', 'Robinson', 'Sevilla', '2003-11-07', 'H'),
(45, '33576912A', 'Michelle', 'Clark', 'Barcelona', '1992-09-04', 'H'),
(46, '14256756A', 'Laura', 'Rodriguez', 'Madrid', '2001-10-07', 'H'),
(47, '35126955A', 'Sarah', 'Lewis', 'Valencia', '1993-05-12', 'H'),
(48, '90503176A', 'Kimberly', 'Lee', 'Sevilla', '2004-07-03', 'H'),
(49, '32229650A', 'Deborah', 'Walker', 'Valencia', '1990-09-07', 'H'),
(50, '31621215A', 'Jessica', 'Hall', 'Valencia', '2003-04-01', 'H'),
(51, '92682446A', 'Shirley', 'Allen', 'Valencia', '1995-11-02', 'H'),
(52, '32111486A', 'Cynthia', 'Young', 'Barcelona', '2001-04-09', 'H'),
(53, '79821489A', 'Angela', 'Hernandez', 'Sevilla', '2001-06-01', 'H'),
(54, '87521207A', 'Melissa', 'King', 'Valencia', '2004-12-09', 'H'),
(55, '68919980A', 'Brenda', 'Wright', 'Barcelona', '1993-01-06', 'H'),
(56, '21978679A', 'Amy', 'Lopez', 'Valencia', '1999-06-06', 'H'),
(57, '20615154A', 'Anna', 'Hill', 'Valencia', '2004-04-02', 'H'),
(58, '12875260A', 'Rebecca', 'Scott', 'Barcelona', '2002-09-03', 'H'),
(59, '12381884A', 'Virginia', 'Green', 'Barcelona', '1998-02-05', 'H'),
(60, '29148889A', 'Kathleen', 'Adams', 'Sevilla', '2002-12-06', 'H'),
(61, '41027879A', 'Pamela', 'Baker', 'Madrid', '2000-12-09', 'H'),
(62, '59586294A', 'Martha', 'Gonzalez', 'Madrid', '1991-08-09', 'H'),
(63, '33184411A', 'Debra', 'Nelson', 'Valencia', '1993-01-09', 'H'),
(64, '12798448A', 'Amanda', 'Carter', 'Madrid', '2001-05-08', 'H'),
(65, '34722311A', 'Stephanie', 'Mitchell', 'Madrid', '2002-01-03', 'H'),
(66, '84643098A', 'Carolyn', 'Perez', 'Madrid', '1998-05-07', 'H'),
(67, '65318443A', 'Christine', 'Roberts', 'Madrid', '1990-06-02', 'H'),
(68, '98125214A', 'Marie', 'Turner', 'Barcelona', '2003-02-07', 'H'),
(69, '75436940A', 'Janet', 'Phillips', 'Valencia', '2000-04-08', 'H'),
(70, '81812590A', 'Catherine', 'Campbell', 'Barcelona', '1999-05-04', 'H'),
(71, '76136085A', 'Frances', 'Parker', 'Barcelona', '2003-04-02', 'H'),
(72, '23727622A', 'Ann', 'Evans', 'Madrid', '1995-10-05', 'H'),
(73, '79313944A', 'Joyce', 'Edwards', 'Barcelona', '1991-11-02', 'H'),
(74, '60776864A', 'Diane', 'Collins', 'Barcelona', '1994-10-04', 'H'),
(75, '19498510A', 'Alice', 'Stewart', 'Madrid', '1997-11-08', 'H'),
(76, '86082076A', 'Julie', 'Sanchez', 'Madrid', '1996-06-06', 'H'),
(77, '28879007A', 'Heather', 'Morris', 'Barcelona', '1990-08-01', 'H'),
(78, '49067024A', 'Teresa', 'Rogers', 'Valencia', '1996-07-10', 'H'),
(79, '73128936A', 'Doris', 'Reed', 'Sevilla', '1998-12-11', 'H'),
(80, '94409729A', 'Gloria', 'Cook', 'Madrid', '1995-07-06', 'H'),
(81, '67041887A', 'Evelyn', 'Morgan', 'Madrid', '1995-07-04', 'H'),
(82, '31356817A', 'Jean', 'Bell', 'Barcelona', '1997-03-04', 'H'),
(83, '83518742A', 'Cheryl', 'Murphy', 'Madrid', '1995-11-06', 'H'),
(84, '57598762A', 'Mildred', 'Bailey', 'Sevilla', '1990-08-10', 'H'),
(85, '46573797A', 'Katherine', 'Rivera', 'Barcelona', '1994-11-12', 'H'),
(86, '89201624A', 'Joan', 'Cooper', 'Valencia', '2001-07-07', 'H'),
(87, '46839754A', 'Ashley', 'Richardson', 'Barcelona', '2001-04-06', 'H'),
(88, '90367958A', 'Judith', 'Cox', 'Sevilla', '1994-06-10', 'H'),
(89, '95035027A', 'Rose', 'Howard', 'Valencia', '2001-08-06', 'H'),
(90, '32302424A', 'Janice', 'Ward', 'Valencia', '2001-02-11', 'H'),
(91, '26079551A', 'Kelly', 'Torres', 'Barcelona', '2000-11-06', 'H'),
(92, '49174885A', 'Nicole', 'Peterson', 'Valencia', '1997-01-06', 'H'),
(93, '63868013A', 'Judy', 'Gray', 'Madrid', '2003-12-12', 'H'),
(94, '89515598A', 'Christina', 'Ramirez', 'Valencia', '2000-08-08', 'H'),
(95, '20355095A', 'Kathy', 'James', 'Barcelona', '1997-06-10', 'H'),
(96, '63072598A', 'Theresa', 'Watson', 'Madrid', '2001-10-08', 'H'),
(97, '31546776A', 'Beverly', 'Brooks', 'Valencia', '1998-05-09', 'H'),
(98, '27687060A', 'Denise', 'Kelly', 'Sevilla', '1996-11-07', 'H'),
(99, '68545936A', 'Tammy', 'Sanders', 'Sevilla', '1998-11-02', 'H'),
(100, '79707190A', 'Irene', 'Price', 'Sevilla', '2003-10-05', 'H'),
(101, '57258874A', 'Jane', 'Bennett', 'Barcelona', '1996-07-11', 'H'),
(102, '91228650A', 'Lori', 'Wood', 'Madrid', '1994-01-05', 'H'),
(103, '66752269A', 'Rachel', 'Barnes', 'Valencia', '1990-04-05', 'H'),
(104, '51628580A', 'Marilyn', 'Ross', 'Sevilla', '2000-12-02', 'H'),
(105, '84608970A', 'Andrea', 'Henderson', 'Sevilla', '1992-01-09', 'H'),
(106, '93186053A', 'Kathryn', 'Coleman', 'Madrid', '1995-06-05', 'H'),
(107, '47978631A', 'Louise', 'Jenkins', 'Barcelona', '1990-09-11', 'H'),
(108, '48413926A', 'Sara', 'Perry', 'Sevilla', '1993-06-11', 'H'),
(109, '24695935A', 'Anne', 'Powell', 'Barcelona', '1997-06-07', 'H'),
(110, '68618598A', 'Jacqueline', 'Long', 'Sevilla', '1992-09-11', 'H'),
(111, '50669525A', 'Wanda', 'Patterson', 'Barcelona', '2004-08-02', 'H'),
(112, '16024827A', 'Bonnie', 'Hughes', 'Barcelona', '1990-10-07', 'H'),
(113, '21825956A', 'Julia', 'Flores', 'Sevilla', '2000-07-01', 'H'),
(114, '45177122A', 'Ruby', 'Washington', 'Madrid', '2003-04-06', 'H'),
(115, '95933538A', 'Lois', 'Butler', 'Barcelona', '1993-07-02', 'H'),
(116, '30134214A', 'Tina', 'Simmons', 'Madrid', '1995-10-03', 'H'),
(117, '42097890A', 'Phyllis', 'Foster', 'Madrid', '2003-03-01', 'H'),
(118, '12422874A', 'Norma', 'Gonzales', 'Madrid', '1994-12-06', 'H'),
(119, '65285102A', 'Paula', 'Bryant', 'Valencia', '2000-07-09', 'H'),
(120, '38938867A', 'Diana', 'Alexander', 'Barcelona', '1994-09-02', 'H'),
(121, '12325600A', 'Annie', 'Russell', 'Barcelona', '1994-01-01', 'H'),
(122, '83371253A', 'Lillian', 'Griffin', 'Valencia', '2004-08-10', 'H'),
(123, '59937398A', 'Emily', 'Diaz', 'Barcelona', '2003-11-10', 'H'),
(124, '20749503A', 'Robin', 'Hayes', 'Barcelona', '1991-06-01', 'H'),
(125, '77736613A', 'Peggy', 'Myers', 'Sevilla', '1990-09-11', 'H'),
(126, '87035280A', 'Crystal', 'Ford', 'Valencia', '1999-07-09', 'H'),
(127, '54232535A', 'Gladys', 'Hamilton', 'Sevilla', '1994-06-01', 'H'),
(128, '29481804A', 'Rita', 'Graham', 'Valencia', '2001-03-09', 'H'),
(129, '24812275A', 'Dawn', 'Sullivan', 'Valencia', '1992-11-09', 'H'),
(130, '86147232A', 'Connie', 'Wallace', 'Valencia', '1992-10-05', 'H'),
(131, '25121119A', 'Florence', 'Woods', 'Valencia', '2002-03-10', 'H'),
(132, '50421148A', 'Tracy', 'Cole', 'Valencia', '1998-06-05', 'H'),
(133, '64644498A', 'Edna', 'West', 'Sevilla', '1996-04-04', 'H'),
(134, '58958748A', 'Tiffany', 'Jordan', 'Sevilla', '1998-03-03', 'H'),
(135, '99287634A', 'Carmen', 'Owens', 'Valencia', '1995-03-11', 'H'),
(136, '30971839A', 'Rosa', 'Reynolds', 'Sevilla', '2000-02-11', 'H'),
(137, '57281386A', 'Cindy', 'Fisher', 'Valencia', '1994-02-06', 'H'),
(138, '68158000A', 'Grace', 'Ellis', 'Barcelona', '2004-05-04', 'H'),
(139, '65223080A', 'Wendy', 'Harrison', 'Barcelona', '2003-10-05', 'H'),
(140, '22231335A', 'Victoria', 'Gibson', 'Madrid', '1992-10-08', 'H'),
(141, '91185203A', 'Edith', 'Mcdonald', 'Barcelona', '2000-02-06', 'H'),
(142, '88483982A', 'Kim', 'Cruz', 'Madrid', '2004-09-10', 'H'),
(143, '14858211A', 'Sherry', 'Marshall', 'Sevilla', '2003-06-11', 'H'),
(144, '83046943A', 'Sylvia', 'Ortiz', 'Valencia', '1997-09-01', 'H'),
(145, '17843979A', 'Josephine', 'Gomez', 'Barcelona', '1998-06-03', 'H'),
(146, '49715460A', 'Thelma', 'Murray', 'Madrid', '2000-02-11', 'H'),
(147, '33419390A', 'Shannon', 'Freeman', 'Barcelona', '1990-04-12', 'H'),
(148, '66395733A', 'Sheila', 'Wells', 'Barcelona', '1991-01-07', 'H'),
(149, '86484720A', 'Ethel', 'Webb', 'Barcelona', '1993-11-05', 'H'),
(150, '17906897A', 'Ellen', 'Simpson', 'Sevilla', '1998-09-02', 'H'),
(151, '86344727A', 'Elaine', 'Stevens', 'Madrid', '1994-11-10', 'H'),
(152, '51709997A', 'Marjorie', 'Tucker', 'Barcelona', '2004-12-06', 'H'),
(153, '89144868A', 'Carrie', 'Porter', 'Madrid', '1998-02-10', 'H'),
(154, '22359968A', 'Charlotte', 'Hunter', 'Barcelona', '1995-02-06', 'H'),
(155, '30886455A', 'Monica', 'Hicks', 'Barcelona', '1990-10-12', 'H'),
(156, '18325371A', 'Esther', 'Crawford', 'Barcelona', '1992-12-08', 'H'),
(157, '43667600A', 'Pauline', 'Henry', 'Madrid', '1996-08-10', 'H'),
(158, '75281131A', 'Emma', 'Boyd', 'Valencia', '2004-05-07', 'H'),
(159, '69915068A', 'Juanita', 'Mason', 'Madrid', '1996-09-11', 'H'),
(160, '44152816A', 'Anita', 'Morales', 'Valencia', '2004-02-07', 'H'),
(161, '15434548A', 'Rhonda', 'Kennedy', 'Sevilla', '1993-09-12', 'H'),
(162, '49081963A', 'Hazel', 'Warren', 'Valencia', '1995-05-01', 'H'),
(163, '21983002A', 'Amber', 'Dixon', 'Sevilla', '2000-08-05', 'H'),
(164, '80723222A', 'Eva', 'Ramos', 'Sevilla', '2003-12-03', 'H'),
(165, '70476421A', 'Debbie', 'Reyes', 'Sevilla', '1991-03-03', 'H'),
(166, '27299917A', 'April', 'Burns', 'Barcelona', '2001-03-01', 'H'),
(167, '94777839A', 'Leslie', 'Gordon', 'Sevilla', '1993-02-03', 'H'),
(168, '64943164A', 'Clara', 'Shaw', 'Madrid', '2004-03-06', 'H'),
(169, '82926084A', 'Lucille', 'Holmes', 'Sevilla', '2004-04-09', 'H'),
(170, '44335264A', 'Jamie', 'Rice', 'Madrid', '1996-02-12', 'H'),
(171, '15805758A', 'Joanne', 'Robertson', 'Barcelona', '1993-01-08', 'H'),
(172, '20532248A', 'Eleanor', 'Hunt', 'Barcelona', '1994-07-08', 'H'),
(173, '64218136A', 'Valerie', 'Black', 'Madrid', '2002-07-03', 'H'),
(174, '64471427A', 'Danielle', 'Daniels', 'Sevilla', '1993-09-02', 'H'),
(175, '83238727A', 'Megan', 'Palmer', 'Barcelona', '1990-05-07', 'H'),
(176, '52517789A', 'Alicia', 'Mills', 'Sevilla', '1994-05-12', 'H'),
(177, '12461544A', 'Suzanne', 'Nichols', 'Barcelona', '1997-05-04', 'H'),
(178, '68961208A', 'Michele', 'Grant', 'Madrid', '1993-08-09', 'H'),
(179, '23664544A', 'Gail', 'Knight', 'Valencia', '1998-05-02', 'H'),
(180, '56893790A', 'Bertha', 'Ferguson', 'Barcelona', '1999-09-05', 'H'),
(181, '80328065A', 'Darlene', 'Rose', 'Madrid', '1999-12-04', 'H'),
(182, '18072289A', 'Veronica', 'Stone', 'Madrid', '1994-03-06', 'H'),
(183, '88751366A', 'Jill', 'Hawkins', 'Barcelona', '1990-11-09', 'H'),
(184, '54724027A', 'Erin', 'Dunn', 'Valencia', '1998-05-05', 'H'),
(185, '24236019A', 'Geraldine', 'Perkins', 'Sevilla', '2003-11-10', 'H'),
(186, '26468586A', 'Lauren', 'Hudson', 'Barcelona', '1995-04-10', 'H'),
(187, '91491510A', 'Cathy', 'Spencer', 'Valencia', '1993-02-05', 'H'),
(188, '51288248A', 'Joann', 'Gardner', 'Madrid', '1990-09-05', 'H'),
(189, '88702171A', 'Lorraine', 'Stephens', 'Barcelona', '1996-07-04', 'H'),
(190, '44321794A', 'Lynn', 'Payne', 'Valencia', '2000-11-03', 'H'),
(191, '57754346A', 'Sally', 'Pierce', 'Valencia', '1992-07-01', 'H'),
(192, '24996875A', 'Regina', 'Berry', 'Valencia', '1994-01-07', 'H'),
(193, '31609753A', 'Erica', 'Matthews', 'Sevilla', '1995-07-09', 'H'),
(194, '77196604A', 'Beatrice', 'Arnold', 'Valencia', '1999-03-06', 'H'),
(195, '40745473A', 'Dolores', 'Wagner', 'Sevilla', '1997-06-04', 'H'),
(196, '75219233A', 'Bernice', 'Willis', 'Valencia', '2001-09-06', 'H'),
(197, '42211123A', 'Audrey', 'Ray', 'Madrid', '1991-03-04', 'H'),
(198, '64714546A', 'Yvonne', 'Watkins', 'Sevilla', '1997-10-11', 'H'),
(199, '78591637A', 'Annette', 'Olson', 'Sevilla', '1999-11-04', 'H'),
(200, '76523842A', 'June', 'Carroll', 'Madrid', '1990-11-08', 'H'),
(201, '61958336A', 'Samantha', 'Duncan', 'Valencia', '1997-09-06', 'H'),
(202, '13025931A', 'Marion', 'Snyder', 'Barcelona', '2000-11-09', 'H'),
(203, '92778474A', 'Dana', 'Hart', 'Barcelona', '1994-03-12', 'H'),
(204, '91953794A', 'Stacy', 'Cunningham', 'Valencia', '1990-01-08', 'H'),
(205, '44931394A', 'Ana', 'Bradley', 'Valencia', '2002-09-03', 'H'),
(206, '47317724A', 'Renee', 'Lane', 'Barcelona', '1994-02-11', 'H'),
(207, '37369967A', 'Ida', 'Andrews', 'Valencia', '2001-03-02', 'H'),
(208, '28554067A', 'Vivian', 'Ruiz', 'Barcelona', '1994-03-08', 'H'),
(209, '35548338A', 'Roberta', 'Harper', 'Valencia', '1993-11-07', 'H'),
(210, '23917994A', 'Holly', 'Fox', 'Valencia', '1991-02-12', 'H'),
(211, '72929868A', 'Brittany', 'Riley', 'Madrid', '1998-08-11', 'H'),
(212, '88594354A', 'Melanie', 'Armstrong', 'Valencia', '1991-04-12', 'H'),
(213, '63714337A', 'Loretta', 'Carpenter', 'Sevilla', '1995-10-08', 'H'),
(214, '75644265A', 'Yolanda', 'Weaver', 'Barcelona', '2001-08-04', 'H'),
(215, '46284572A', 'Jeanette', 'Greene', 'Barcelona', '1991-05-09', 'H'),
(216, '77742714A', 'Laurie', 'Lawrence', 'Sevilla', '1992-05-11', 'H'),
(217, '19007134A', 'Katie', 'Elliott', 'Barcelona', '1995-04-10', 'H'),
(218, '62334571A', 'Kristen', 'Chavez', 'Barcelona', '2003-06-08', 'H'),
(219, '53695928A', 'Vanessa', 'Sims', 'Madrid', '1992-08-05', 'H'),
(220, '55857741A', 'Alma', 'Austin', 'Sevilla', '2004-06-11', 'H'),
(221, '81527694A', 'Sue', 'Peters', 'Barcelona', '1994-03-02', 'H'),
(222, '26145863A', 'Elsie', 'Kelley', 'Madrid', '1996-03-02', 'H'),
(223, '99642953A', 'Beth', 'Franklin', 'Barcelona', '2000-10-05', 'H'),
(224, '33258333A', 'Jeanne', 'Lawson', 'Madrid', '1992-07-08', 'H'),
(225, '47961800A', 'Vicki', 'Fields', 'Madrid', '1996-09-07', 'H'),
(226, '34113028A', 'Carla', 'Gutierrez', 'Barcelona', '2000-06-06', 'H'),
(227, '78336903A', 'Tara', 'Ryan', 'Barcelona', '2003-06-09', 'H'),
(228, '29926804A', 'Rosemary', 'Schmidt', 'Madrid', '2002-03-12', 'H'),
(229, '44514040A', 'Eileen', 'Carr', 'Sevilla', '2000-05-12', 'H'),
(230, '58641144A', 'Terri', 'Vasquez', 'Sevilla', '1997-09-11', 'H'),
(231, '82185506A', 'Gertrude', 'Castillo', 'Valencia', '1999-08-08', 'H'),
(232, '65912830A', 'Lucy', 'Wheeler', 'Madrid', '1996-10-05', 'H'),
(233, '65196579A', 'Tonya', 'Chapman', 'Sevilla', '1994-04-10', 'H'),
(234, '55168718A', 'Ella', 'Oliver', 'Barcelona', '1998-02-03', 'H'),
(235, '58188676A', 'Stacey', 'Montgomery', 'Madrid', '1994-11-04', 'H'),
(236, '93971726A', 'Wilma', 'Richards', 'Sevilla', '2000-02-07', 'H'),
(237, '47173647A', 'Gina', 'Williamson', 'Madrid', '1994-01-01', 'H'),
(238, '51584366A', 'Kristin', 'Johnston', 'Barcelona', '2002-08-04', 'H'),
(239, '15981800A', 'Jessie', 'Banks', 'Barcelona', '1998-11-09', 'H'),
(240, '89154620A', 'Natalie', 'Meyer', 'Barcelona', '2002-02-12', 'H'),
(241, '92646328A', 'Agnes', 'Bishop', 'Madrid', '1992-12-03', 'H'),
(242, '55312401A', 'Vera', 'Mccoy', 'Barcelona', '1991-04-12', 'H'),
(243, '33176273A', 'Willie', 'Howell', 'Barcelona', '1995-04-06', 'H'),
(244, '41581397A', 'Charlene', 'Alvarez', 'Madrid', '2000-11-03', 'H'),
(245, '92602386A', 'Bessie', 'Morrison', 'Sevilla', '1993-04-04', 'H'),
(246, '28388274A', 'Delores', 'Hansen', 'Madrid', '2002-02-03', 'H'),
(247, '38087023A', 'Melinda', 'Fernandez', 'Sevilla', '1992-08-05', 'H'),
(248, '88705238A', 'Pearl', 'Garza', 'Sevilla', '2001-06-01', 'H'),
(249, '13418333A', 'Arlene', 'Harvey', 'Barcelona', '1993-03-07', 'H'),
(250, '25934894A', 'Maureen', 'Little', 'Sevilla', '2004-02-02', 'H'),
(251, '79191835A', 'Colleen', 'Burton', 'Madrid', '1994-03-02', 'H'),
(252, '17804284A', 'Allison', 'Stanley', 'Sevilla', '1993-03-08', 'H'),
(253, '45381605A', 'Tamara', 'Nguyen', 'Valencia', '1995-04-05', 'H'),
(254, '68238477A', 'Joy', 'George', 'Madrid', '2001-01-12', 'H'),
(255, '20124921A', 'Georgia', 'Jacobs', 'Barcelona', '1993-05-09', 'H'),
(256, '23129268A', 'Constance', 'Reid', 'Sevilla', '1991-11-11', 'H'),
(257, '54142938A', 'Lillie', 'Kim', 'Barcelona', '1998-05-05', 'H'),
(258, '72502246A', 'Claudia', 'Fuller', 'Madrid', '1994-06-06', 'H'),
(259, '12132335A', 'Jackie', 'Lynch', 'Valencia', '1996-05-11', 'H'),
(260, '84229780A', 'Marcia', 'Dean', 'Madrid', '1992-06-10', 'H'),
(261, '87318484A', 'Tanya', 'Gilbert', 'Sevilla', '1997-12-08', 'H'),
(262, '19619312A', 'Nellie', 'Garrett', 'Barcelona', '1991-05-01', 'H'),
(263, '52871461A', 'Minnie', 'Romero', 'Valencia', '1991-09-10', 'H'),
(264, '55179679A', 'Marlene', 'Welch', 'Sevilla', '1996-06-08', 'H'),
(265, '62902747A', 'Heidi', 'Larson', 'Valencia', '1996-11-04', 'H'),
(266, '43923763A', 'Glenda', 'Frazier', 'Sevilla', '1990-01-04', 'H'),
(267, '39172009A', 'Lydia', 'Burke', 'Sevilla', '2003-11-06', 'H'),
(268, '61283267A', 'Viola', 'Hanson', 'Barcelona', '2004-01-08', 'H'),
(269, '95947851A', 'Courtney', 'Day', 'Madrid', '1997-04-04', 'H'),
(270, '46737183A', 'Marian', 'Mendoza', 'Sevilla', '2000-04-08', 'H'),
(271, '33856984A', 'Stella', 'Moreno', 'Valencia', '2003-09-01', 'H'),
(272, '17913321A', 'Caroline', 'Bowman', 'Valencia', '1990-05-09', 'H'),
(273, '46688130A', 'Dora', 'Medina', 'Sevilla', '2001-08-07', 'H'),
(274, '40505454A', 'Jo', 'Fowler', 'Madrid', '1997-09-02', 'H'),
(275, '97433337A', 'Vickie', 'Brewer', 'Sevilla', '1999-01-04', 'H'),
(276, '53509878A', 'Mattie', 'Hoffman', 'Barcelona', '1996-09-11', 'H'),
(277, '70687630A', 'Terry', 'Carlson', 'Madrid', '2001-12-08', 'H'),
(278, '16939167A', 'Maxine', 'Silva', 'Sevilla', '2001-11-05', 'H'),
(279, '71722461A', 'Irma', 'Pearson', 'Valencia', '2001-10-05', 'H'),
(280, '72978275A', 'Mabel', 'Holland', 'Sevilla', '2002-02-06', 'H'),
(281, '83058467A', 'Marsha', 'Douglas', 'Madrid', '1992-06-10', 'H'),
(282, '71882414A', 'Myrtle', 'Fleming', 'Sevilla', '2002-06-01', 'H'),
(283, '29931201A', 'Lena', 'Jensen', 'Sevilla', '1991-08-10', 'H'),
(284, '88527012A', 'Christy', 'Vargas', 'Barcelona', '1998-03-04', 'H'),
(285, '57441946A', 'Deanna', 'Byrd', 'Sevilla', '1997-03-03', 'H'),
(286, '71021284A', 'Patsy', 'Davidson', 'Sevilla', '2003-07-03', 'H'),
(287, '17476393A', 'Hilda', 'Hopkins', 'Valencia', '1992-11-12', 'H'),
(288, '79622477A', 'Gwendolyn', 'May', 'Barcelona', '2003-01-04', 'H'),
(289, '43917020A', 'Jennie', 'Terry', 'Sevilla', '1998-01-10', 'H'),
(290, '20128574A', 'Nora', 'Herrera', 'Madrid', '1993-08-12', 'H'),
(291, '87455647A', 'Margie', 'Wade', 'Madrid', '1999-04-05', 'H'),
(292, '36257106A', 'Nina', 'Soto', 'Sevilla', '1990-09-12', 'H'),
(293, '75352455A', 'Cassandra', 'Walters', 'Barcelona', '1991-09-09', 'H'),
(294, '89526580A', 'Leah', 'Curtis', 'Sevilla', '1997-07-10', 'H'),
(295, '77284674A', 'Penny', 'Neal', 'Barcelona', '1997-06-03', 'H'),
(296, '97933554A', 'Kay', 'Caldwell', 'Madrid', '1993-03-01', 'H'),
(297, '45745282A', 'Priscilla', 'Lowe', 'Madrid', '1992-08-08', 'H'),
(298, '80268344A', 'Naomi', 'Jennings', 'Valencia', '1998-02-05', 'H'),
(299, '83608524A', 'Carole', 'Barnett', 'Sevilla', '2004-11-09', 'H'),
(300, '74447145A', 'Brandy', 'Graves', 'Barcelona', '2000-01-02', 'H'),
(301, '61676773A', 'Olga', 'Jimenez', 'Madrid', '1995-03-09', 'H'),
(302, '17899798A', 'Billie', 'Horton', 'Madrid', '2002-06-01', 'H'),
(303, '54815003A', 'Dianne', 'Shelton', 'Barcelona', '1999-11-12', 'H'),
(304, '44476422A', 'Tracey', 'Barrett', 'Barcelona', '2003-05-03', 'H'),
(305, '50171884A', 'Leona', 'Obrien', 'Sevilla', '1990-09-10', 'H'),
(306, '35144443A', 'Jenny', 'Castro', 'Madrid', '1996-04-04', 'H'),
(307, '36582079A', 'Felicia', 'Sutton', 'Sevilla', '1997-04-09', 'H'),
(308, '47321359A', 'Sonia', 'Gregory', 'Barcelona', '1995-02-12', 'H'),
(309, '54064111A', 'Miriam', 'Mckinney', 'Valencia', '1998-11-07', 'H'),
(310, '39287965A', 'Velma', 'Lucas', 'Barcelona', '1994-12-07', 'H'),
(311, '36935042A', 'Becky', 'Miles', 'Madrid', '1997-11-11', 'H'),
(312, '62332486A', 'Bobbie', 'Craig', 'Valencia', '1996-05-06', 'H'),
(313, '79765802A', 'Violet', 'Rodriquez', 'Valencia', '1990-07-12', 'H'),
(314, '16573747A', 'Kristina', 'Chambers', 'Valencia', '1999-08-01', 'H'),
(315, '55766059A', 'Toni', 'Holt', 'Madrid', '2003-09-03', 'H'),
(316, '33103304A', 'Misty', 'Lambert', 'Sevilla', '2000-09-01', 'H'),
(317, '58803657A', 'Mae', 'Fletcher', 'Valencia', '1998-04-04', 'H'),
(318, '77067856A', 'Shelly', 'Watts', 'Sevilla', '1998-11-12', 'H'),
(319, '12298444A', 'Daisy', 'Bates', 'Sevilla', '2004-01-01', 'H'),
(320, '43842259A', 'Ramona', 'Hale', 'Sevilla', '1995-07-06', 'H'),
(321, '74112858A', 'Sherri', 'Rhodes', 'Barcelona', '1993-08-10', 'H'),
(322, '64329089A', 'Erika', 'Pena', 'Sevilla', '1995-10-01', 'H'),
(323, '44873730A', 'James', 'Gannon', 'Valencia', '2003-04-10', 'H'),
(324, '31373969A', 'John', 'Farnsworth', 'Madrid', '1992-10-10', 'H'),
(325, '49365579A', 'Robert', 'Baughman', 'Madrid', '2001-01-08', 'H'),
(326, '96008709A', 'Michael', 'Silverman', 'Valencia', '1992-02-10', 'H'),
(327, '43353361A', 'William', 'Satterfield', 'Sevilla', '1992-01-01', 'H'),
(328, '92565753A', 'David', 'Royal', 'Madrid', '2000-06-04', 'H'),
(329, '20844867A', 'Richard', 'Mccrary', 'Sevilla', '2004-02-02', 'H'),
(330, '56658940A', 'Charles', 'Kowalski', 'Valencia', '2003-04-04', 'H'),
(331, '72471446A', 'Joseph', 'Joy', 'Madrid', '1993-09-06', 'H'),
(332, '91369086A', 'Thomas', 'Grigsby', 'Valencia', '1996-08-01', 'H'),
(333, '21339182A', 'Christopher', 'Greco', 'Madrid', '1993-01-08', 'H'),
(334, '11375689A', 'Daniel', 'Cabral', 'Madrid', '1991-08-03', 'H'),
(335, '32742007A', 'Paul', 'Trout', 'Barcelona', '1995-02-09', 'H'),
(336, '50536340A', 'Mark', 'Rinehart', 'Barcelona', '1999-10-12', 'H'),
(337, '81792770A', 'Donald', 'Mahon', 'Sevilla', '1998-07-07', 'H'),
(338, '32236612A', 'George', 'Linton', 'Barcelona', '2000-09-04', 'H'),
(339, '84305073A', 'Kenneth', 'Gooden', 'Barcelona', '2002-03-06', 'H'),
(340, '56892993A', 'Steven', 'Curley', 'Madrid', '1990-09-10', 'H'),
(341, '24134196A', 'Edward', 'Baugh', 'Valencia', '1999-08-10', 'H'),
(342, '88512798A', 'Brian', 'Wyman', 'Madrid', '1993-03-11', 'H'),
(343, '23326841A', 'Ronald', 'Weiner', 'Madrid', '1990-06-02', 'H'),
(344, '16191241A', 'Anthony', 'Schwab', 'Sevilla', '1997-05-01', 'H'),
(345, '42799301A', 'Kevin', 'Schuler', 'Barcelona', '1992-01-02', 'H'),
(346, '86507200A', 'Jason', 'Morrissey', 'Valencia', '1993-05-07', 'H'),
(347, '17044580A', 'Matthew', 'Mahan', 'Sevilla', '2002-07-02', 'H'),
(348, '64076334A', 'Gary', 'Coy', 'Valencia', '2001-06-12', 'H'),
(349, '49262510A', 'Timothy', 'Bunn', 'Valencia', '1995-10-12', 'H'),
(350, '43219448A', 'Jose', 'Andrew', 'Barcelona', '2004-09-06', 'H'),
(351, '80889013A', 'Larry', 'Thrasher', 'Madrid', '2003-07-04', 'H'),
(352, '52986446A', 'Jeffrey', 'Spear', 'Barcelona', '1996-01-01', 'H'),
(353, '24304577A', 'Frank', 'Waggoner', 'Madrid', '2000-02-01', 'H'),
(354, '32142289A', 'Scott', 'Shelley', 'Barcelona', '2003-12-03', 'H'),
(355, '89432146A', 'Eric', 'Robert', 'Sevilla', '2001-09-10', 'H'),
(356, '71227642A', 'Stephen', 'Qualls', 'Barcelona', '1996-08-04', 'H'),
(357, '31922660A', 'Andrew', 'Purdy', 'Sevilla', '1995-05-05', 'H'),
(358, '66454086A', 'Raymond', 'Mcwhorter', 'Sevilla', '1996-02-10', 'H'),
(359, '70287483A', 'Gregory', 'Mauldin', 'Madrid', '2004-03-09', 'H'),
(360, '60223325A', 'Joshua', 'Mark', 'Barcelona', '2003-06-11', 'H'),
(361, '83478657A', 'Jerry', 'Jordon', 'Barcelona', '1996-01-08', 'H'),
(362, '20869485A', 'Dennis', 'Gilman', 'Barcelona', '1994-07-12', 'H'),
(363, '27319593A', 'Walter', 'Perryman', 'Sevilla', '1992-08-03', 'H'),
(364, '42372714A', 'Patrick', 'Newsom', 'Valencia', '2004-07-04', 'H'),
(365, '40141455A', 'Peter', 'Menard', 'Barcelona', '1990-10-09', 'H'),
(366, '75854073A', 'Harold', 'Martino', 'Valencia', '1993-06-10', 'H'),
(367, '89928419A', 'Douglas', 'Graf', 'Sevilla', '1995-12-10', 'H'),
(368, '63726832A', 'Henry', 'Billingsley', 'Sevilla', '2003-10-08', 'H'),
(369, '71562675A', 'Carl', 'Artis', 'Sevilla', '1999-01-08', 'H'),
(370, '73788225A', 'Arthur', 'Simpkins', 'Madrid', '1994-05-03', 'H'),
(371, '81634530A', 'Ryan', 'Salisbury', 'Sevilla', '1991-10-12', 'H'),
(372, '40193685A', 'Roger', 'Quintanilla', 'Sevilla', '2004-05-03', 'H'),
(373, '40328914A', 'Joe', 'Gilliland', 'Barcelona', '1991-03-05', 'H'),
(374, '66075131A', 'Juan', 'Fraley', 'Barcelona', '1993-10-11', 'H'),
(375, '45452300A', 'Jack', 'Foust', 'Sevilla', '2004-07-05', 'H'),
(376, '90148126A', 'Albert', 'Crouse', 'Barcelona', '1997-12-01', 'H'),
(377, '92523054A', 'Jonathan', 'Scarborough', 'Madrid', '2001-09-05', 'H'),
(378, '66904955A', 'Justin', 'Ngo', 'Madrid', '2002-07-11', 'H'),
(379, '55341950A', 'Terry', 'Grissom', 'Madrid', '2000-07-02', 'H'),
(380, '78052789A', 'Gerald', 'Fultz', 'Sevilla', '1996-01-02', 'H'),
(381, '72805148A', 'Keith', 'Rico', 'Madrid', '1994-01-10', 'H'),
(382, '22032283A', 'Samuel', 'Marlow', 'Sevilla', '2002-12-03', 'H'),
(383, '54917592A', 'Willie', 'Markham', 'Madrid', '1993-02-04', 'H'),
(384, '17025492A', 'Ralph', 'Madrigal', 'Barcelona', '1992-01-05', 'H'),
(385, '48596409A', 'Lawrence', 'Lawton', 'Sevilla', '1994-09-05', 'H'),
(386, '79472370A', 'Nicholas', 'Barfield', 'Valencia', '2002-04-12', 'H'),
(387, '39495201A', 'Roy', 'Whiting', 'Barcelona', '2000-01-03', 'H'),
(388, '11785744A', 'Benjamin', 'Varney', 'Barcelona', '1997-11-01', 'H'),
(389, '74329588A', 'Bruce', 'Schwarz', 'Madrid', '2003-09-08', 'H'),
(390, '67083277A', 'Brandon', 'Huey', 'Valencia', '1993-06-12', 'H'),
(391, '38395373A', 'Adam', 'Gooch', 'Sevilla', '1991-06-08', 'H'),
(392, '56758409A', 'Harry', 'Arce', 'Sevilla', '2003-02-03', 'H'),
(393, '62716286A', 'Fred', 'Wheat', 'Barcelona', '2003-04-03', 'H'),
(394, '99868376A', 'Wayne', 'Truong', 'Barcelona', '1996-03-04', 'H'),
(395, '53927581A', 'Billy', 'Poulin', 'Barcelona', '1990-01-05', 'H'),
(396, '12068734A', 'Steve', 'Mackenzie', 'Barcelona', '1998-09-10', 'H'),
(397, '39239473A', 'Louis', 'Leone', 'Sevilla', '2004-01-07', 'H'),
(398, '30295710A', 'Jeremy', 'Hurtado', 'Valencia', '2004-09-10', 'H'),
(399, '91485732A', 'Aaron', 'Selby', 'Madrid', '1998-02-01', 'H'),
(400, '33984438A', 'Randy', 'Gaither', 'Valencia', '2003-10-03', 'H'),
(401, '96958034A', 'Howard', 'Fortner', 'Valencia', '1996-02-07', 'H'),
(402, '11253455A', 'Eugene', 'Culpepper', 'Sevilla', '1998-08-08', 'H'),
(403, '78037245A', 'Carlos', 'Coughlin', 'Valencia', '2004-06-12', 'H'),
(404, '39981224A', 'Russell', 'Brinson', 'Barcelona', '1991-10-10', 'H'),
(405, '40567758A', 'Bobby', 'Boudreau', 'Valencia', '2004-09-04', 'H'),
(406, '47725722A', 'Victor', 'Barkley', 'Sevilla', '1992-06-06', 'H'),
(407, '94543323A', 'Martin', 'Bales', 'Valencia', '1997-11-09', 'H'),
(408, '75303653A', 'Ernest', 'Stepp', 'Madrid', '1992-08-07', 'H'),
(409, '59307656A', 'Phillip', 'Holm', 'Barcelona', '1992-08-12', 'H'),
(410, '22731184A', 'Todd', 'Tan', 'Barcelona', '1996-01-01', 'H'),
(411, '77196729A', 'Jesse', 'Schilling', 'Sevilla', '1999-04-06', 'H'),
(412, '32219847A', 'Craig', 'Morrell', 'Sevilla', '1993-09-05', 'H'),
(413, '89028485A', 'Alan', 'Kahn', 'Barcelona', '1997-11-03', 'H'),
(414, '44603258A', 'Shawn', 'Heaton', 'Sevilla', '1995-12-06', 'H'),
(415, '41648866A', 'Clarence', 'Gamez', 'Valencia', '1994-04-05', 'H'),
(416, '12661300A', 'Sean', 'Douglass', 'Valencia', '1995-03-01', 'H'),
(417, '90085692A', 'Philip', 'Causey', 'Valencia', '1992-05-01', 'H'),
(418, '57939793A', 'Chris', 'Brothers', 'Sevilla', '2001-07-02', 'H'),
(419, '88156132A', 'Johnny', 'Turpin', 'Barcelona', '1990-02-06', 'H'),
(420, '29689364A', 'Earl', 'Shanks', 'Barcelona', '1992-06-12', 'H'),
(421, '21389873A', 'Jimmy', 'Schrader', 'Madrid', '1999-09-01', 'H'),
(422, '69939303A', 'Antonio', 'Meek', 'Barcelona', '1995-01-05', 'H'),
(423, '19484977A', 'Danny', 'Isom', 'Valencia', '1993-04-02', 'H'),
(424, '62679993A', 'Bryan', 'Hardison', 'Valencia', '1990-12-04', 'H'),
(425, '66872559A', 'Tony', 'Carranza', 'Valencia', '1990-01-07', 'H'),
(426, '40738047A', 'Luis', 'Yanez', 'Barcelona', '1995-09-04', 'H'),
(427, '78184932A', 'Mike', 'Way', 'Madrid', '2000-06-06', 'H'),
(428, '13934629A', 'Stanley', 'Scroggins', 'Madrid', '2004-02-11', 'H'),
(429, '71774269A', 'Leonard', 'Schofield', 'Barcelona', '2004-06-06', 'H'),
(430, '13329834A', 'Nathan', 'Runyon', 'Madrid', '1998-12-06', 'H'),
(431, '78475141A', 'Dale', 'Ratcliff', 'Barcelona', '1996-09-01', 'H'),
(432, '16867420A', 'Manuel', 'Murrell', 'Madrid', '1997-06-06', 'H'),
(433, '38248873A', 'Rodney', 'Moeller', 'Valencia', '2003-03-11', 'H'),
(434, '48567721A', 'Curtis', 'Irby', 'Valencia', '1994-11-12', 'H'),
(435, '97156952A', 'Norman', 'Currier', 'Sevilla', '1990-12-12', 'H'),
(436, '15007986A', 'Allen', 'Butterfield', 'Madrid', '1996-07-05', 'H'),
(437, '44405287A', 'Marvin', 'Yee', 'Sevilla', '1992-11-02', 'H'),
(438, '43945353A', 'Vincent', 'Ralston', 'Madrid', '2002-03-09', 'H'),
(439, '34787324A', 'Glenn', 'Pullen', 'Barcelona', '1999-10-04', 'H'),
(440, '43755934A', 'Jeffery', 'Pinson', 'Sevilla', '1996-01-09', 'H'),
(441, '66151847A', 'Travis', 'Estep', 'Sevilla', '2004-09-10', 'H'),
(442, '57265393A', 'Jeff', 'East', 'Sevilla', '1991-10-03', 'H'),
(443, '13704621A', 'Chad', 'Carbone', 'Valencia', '1990-12-10', 'H'),
(444, '26856874A', 'Jacob', 'Lance', 'Barcelona', '2001-03-11', 'H'),
(445, '82209999A', 'Lee', 'Hawks', 'Valencia', '1996-11-03', 'H'),
(446, '89651797A', 'Melvin', 'Ellington', 'Valencia', '2001-12-10', 'H'),
(447, '45497322A', 'Alfred', 'Casillas', 'Valencia', '2004-04-12', 'H'),
(448, '84126204A', 'Kyle', 'Spurlock', 'Madrid', '1999-01-06', 'H'),
(449, '62175505A', 'Francis', 'Sikes', 'Valencia', '1998-02-05', 'H'),
(450, '58514407A', 'Bradley', 'Motley', 'Madrid', '2003-08-02', 'H'),
(451, '52347280A', 'Jesus', 'Mccartney', 'Sevilla', '2002-11-07', 'H'),
(452, '40996256A', 'Herbert', 'Kruger', 'Valencia', '2000-05-03', 'H'),
(453, '34722032A', 'Frederick', 'Isbell', 'Barcelona', '2001-04-05', 'H'),
(454, '84181627A', 'Ray', 'Houle', 'Valencia', '2004-10-07', 'H'),
(455, '28169983A', 'Joel', 'Francisco', 'Barcelona', '1993-06-10', 'H'),
(456, '85124836A', 'Edwin', 'Burk', 'Madrid', '1999-06-08', 'H'),
(457, '12888383A', 'Don', 'Bone', 'Sevilla', '1995-09-03', 'H'),
(458, '99796459A', 'Eddie', 'Tomlin', 'Sevilla', '1996-01-06', 'H'),
(459, '48423602A', 'Ricky', 'Shelby', 'Madrid', '1992-08-04', 'H'),
(460, '72031645A', 'Troy', 'Quigley', 'Valencia', '1992-11-06', 'H'),
(461, '48829266A', 'Randall', 'Neumann', 'Valencia', '1997-12-06', 'H'),
(462, '86433837A', 'Barry', 'Lovelace', 'Valencia', '2002-03-03', 'H'),
(463, '26815364A', 'Alexander', 'Fennell', 'Valencia', '2003-06-07', 'H'),
(464, '68025451A', 'Bernard', 'Colby', 'Madrid', '1991-09-10', 'H'),
(465, '42377472A', 'Mario', 'Cheatham', 'Sevilla', '1990-06-07', 'H'),
(466, '59933636A', 'Leroy', 'Bustamante', 'Sevilla', '1997-02-03', 'H'),
(467, '25522032A', 'Francisco', 'Skidmore', 'Barcelona', '1991-07-09', 'H'),
(468, '35747567A', 'Marcus', 'Hidalgo', 'Sevilla', '2000-10-04', 'H'),
(469, '73792533A', 'Micheal', 'Forman', 'Valencia', '1998-04-03', 'H'),
(470, '87784576A', 'Theodore', 'Culp', 'Sevilla', '1993-03-02', 'H'),
(471, '72924394A', 'Clifford', 'Bowens', 'Valencia', '2004-09-09', 'H'),
(472, '63457163A', 'Miguel', 'Betancourt', 'Barcelona', '1990-09-07', 'H'),
(473, '53243623A', 'Oscar', 'Aquino', 'Valencia', '2004-09-04', 'H'),
(474, '49029597A', 'Jay', 'Robb', 'Sevilla', '1996-03-11', 'H'),
(475, '18188060A', 'Jim', 'Rea', 'Madrid', '2004-05-10', 'H'),
(476, '25611249A', 'Tom', 'Milner', 'Madrid', '1992-10-09', 'H'),
(477, '36776371A', 'Calvin', 'Martel', 'Barcelona', '1996-01-07', 'H'),
(478, '57895435A', 'Alex', 'Gresham', 'Barcelona', '1991-03-01', 'H'),
(479, '54821380A', 'Jon', 'Wiles', 'Valencia', '1996-08-09', 'H'),
(480, '24371328A', 'Ronnie', 'Ricketts', 'Sevilla', '1995-12-06', 'H'),
(481, '22095910A', 'Bill', 'Gavin', 'Sevilla', '2002-01-03', 'H'),
(482, '17645613A', 'Lloyd', 'Dowd', 'Madrid', '2001-12-08', 'H'),
(483, '83638191A', 'Tommy', 'Collazo', 'Sevilla', '1990-10-09', 'H'),
(484, '80306273A', 'Leon', 'Bostic', 'Barcelona', '1998-02-04', 'H'),
(485, '15186689A', 'Derek', 'Blakely', 'Valencia', '1999-03-01', 'H'),
(486, '39662383A', 'Warren', 'Sherrod', 'Sevilla', '1990-05-08', 'H'),
(487, '42255796A', 'Darrell', 'Power', 'Valencia', '1999-09-07', 'H'),
(488, '55528549A', 'Jerome', 'Kenyon', 'Barcelona', '1995-08-10', 'H'),
(489, '89453643A', 'Floyd', 'Gandy', 'Madrid', '2003-10-09', 'H'),
(490, '96505587A', 'Leo', 'Ebert', 'Sevilla', '2004-01-04', 'H'),
(491, '53254614A', 'Alvin', 'Deloach', 'Valencia', '1993-01-11', 'H'),
(492, '62736453A', 'Tim', 'Cary', 'Valencia', '2004-01-10', 'H'),
(493, '29222057A', 'Wesley', 'Bull', 'Madrid', '2000-08-10', 'H'),
(494, '17664061A', 'Gordon', 'Allard', 'Sevilla', '1991-09-10', 'H'),
(495, '44389370A', 'Dean', 'Sauer', 'Valencia', '1996-03-11', 'H'),
(496, '91152447A', 'Greg', 'Robins', 'Madrid', '1990-04-06', 'H'),
(497, '74077173A', 'Jorge', 'Olivares', 'Sevilla', '2002-02-07', 'H'),
(498, '12847726A', 'Dustin', 'Gillette', 'Valencia', '1991-11-08', 'H'),
(499, '61079585A', 'Pedro', 'Chestnut', 'Barcelona', '1990-07-07', 'H'),
(500, '40137685A', 'Derrick', 'Bourque', 'Barcelona', '1999-09-04', 'H'),
(501, '97962386A', 'Dan', 'Paine', 'Barcelona', '2004-06-10', 'H'),
(502, '67736552A', 'Lewis', 'Lyman', 'Sevilla', '2000-09-04', 'H'),
(503, '27815080A', 'Zachary', 'Hite', 'Sevilla', '1998-01-07', 'H'),
(504, '66377625A', 'Corey', 'Hauser', 'Sevilla', '2003-03-01', 'H'),
(505, '80084877A', 'Herman', 'Devore', 'Sevilla', '2000-02-09', 'H'),
(506, '59211966A', 'Maurice', 'Crawley', 'Sevilla', '1993-04-01', 'H'),
(507, '45491904A', 'Vernon', 'Chapa', 'Madrid', '1990-08-01', 'H'),
(508, '23624233A', 'Roberto', 'Vu', 'Sevilla', '1996-01-01', 'H'),
(509, '14054734A', 'Clyde', 'Tobias', 'Sevilla', '1997-08-05', 'H'),
(510, '96537335A', 'Glen', 'Talbert', 'Barcelona', '2000-09-07', 'H'),
(511, '90636010A', 'Hector', 'Poindexter', 'Sevilla', '2003-05-03', 'H'),
(512, '18626527A', 'Shane', 'Millard', 'Barcelona', '1990-08-05', 'H'),
(513, '23525110A', 'Ricardo', 'Meador', 'Madrid', '1993-03-07', 'H'),
(514, '71996691A', 'Sam', 'Mcduffie', 'Madrid', '2003-02-03', 'H'),
(515, '44949990A', 'Rick', 'Mattox', 'Sevilla', '1999-07-11', 'H'),
(516, '83149913A', 'Lester', 'Kraus', 'Madrid', '1991-05-01', 'H'),
(517, '45373569A', 'Brent', 'Harkins', 'Madrid', '2003-08-11', 'H'),
(518, '60706928A', 'Ramon', 'Choate', 'Valencia', '2003-06-02', 'H'),
(519, '98944884A', 'Charlie', 'Bess', 'Sevilla', '1998-11-09', 'H'),
(520, '53352279A', 'Tyler', 'Wren', 'Sevilla', '1993-01-07', 'H'),
(521, '23118912A', 'Gilbert', 'Sledge', 'Madrid', '1993-11-07', 'H'),
(522, '96687846A', 'Gene', 'Sanborn', 'Valencia', '1999-03-09', 'H'),
(523, '45453051A', 'Marc', 'Outlaw', 'Madrid', '1994-09-11', 'H'),
(524, '22604105A', 'Reginald', 'Kinder', 'Barcelona', '1992-09-02', 'H'),
(525, '85792909A', 'Ruben', 'Geary', 'Valencia', '1995-10-01', 'H'),
(526, '87812401A', 'Brett', 'Cornwell', 'Madrid', '2004-10-09', 'H'),
(527, '12228996A', 'Angel', 'Barclay', 'Valencia', '1995-08-02', 'H'),
(528, '56445760A', 'Nathaniel', 'Adam', 'Barcelona', '1999-12-01', 'H'),
(529, '58431198A', 'Rafael', 'Abney', 'Barcelona', '1996-12-08', 'H'),
(530, '56436581A', 'Leslie', 'Seward', 'Sevilla', '1996-10-10', 'H'),
(531, '56929329A', 'Edgar', 'Rhoads', 'Sevilla', '2004-06-11', 'H'),
(532, '58655592A', 'Milton', 'Howland', 'Valencia', '1991-02-10', 'H'),
(533, '78259967A', 'Raul', 'Fortier', 'Barcelona', '1996-06-05', 'H'),
(534, '16356039A', 'Ben', 'Easter', 'Sevilla', '2002-09-01', 'H'),
(535, '60151409A', 'Chester', 'Benner', 'Barcelona', '1995-12-01', 'H'),
(536, '33331338A', 'Cecil', 'Vines', 'Valencia', '1994-06-10', 'H'),
(537, '89855804A', 'Duane', 'Tubbs', 'Madrid', '1998-10-10', 'H'),
(538, '61078650A', 'Franklin', 'Troutman', 'Madrid', '2001-08-02', 'H'),
(539, '89401542A', 'Andre', 'Rapp', 'Valencia', '2000-12-12', 'H'),
(540, '56947272A', 'Elmer', 'Noe', 'Valencia', '1995-11-12', 'H'),
(541, '48912407A', 'Brad', 'Mccurdy', 'Valencia', '2000-02-11', 'H'),
(542, '83183907A', 'Gabriel', 'Harder', 'Sevilla', '1992-05-05', 'H'),
(543, '45401587A', 'Ron', 'Deluca', 'Valencia', '2002-10-10', 'H'),
(544, '87346360A', 'Mitchell', 'Westmoreland', 'Barcelona', '2001-03-04', 'H'),
(545, '38998582A', 'Roland', 'South', 'Barcelona', '2000-01-12', 'H'),
(546, '81627247A', 'Arnold', 'Havens', 'Valencia', '1993-03-01', 'H'),
(547, '65643716A', 'Harvey', 'Guajardo', 'Barcelona', '2001-04-08', 'H'),
(548, '26433868A', 'Jared', 'Ely', 'Madrid', '1995-05-05', 'H'),
(549, '78648058A', 'Adrian', 'Clary', 'Valencia', '2002-10-01', 'H'),
(550, '50595967A', 'Karl', 'Seal', 'Barcelona', '2003-11-04', 'H'),
(551, '37611413A', 'Cory', 'Meehan', 'Sevilla', '1991-10-08', 'H'),
(552, '42359604A', 'Claude', 'Herzog', 'Valencia', '1990-03-06', 'H'),
(553, '63497665A', 'Erik', 'Guillen', 'Sevilla', '1990-01-11', 'H'),
(554, '82376249A', 'Darryl', 'Ashcraft', 'Madrid', '2004-07-06', 'H'),
(555, '48308739A', 'Jamie', 'Waugh', 'Barcelona', '1993-05-10', 'H'),
(556, '72357318A', 'Neil', 'Renner', 'Sevilla', '1993-11-04', 'H'),
(557, '86239176A', 'Jessie', 'Milam', 'Valencia', '2002-01-10', 'H'),
(558, '34215753A', 'Christian', 'Jung', 'Madrid', '1992-01-05', 'H'),
(559, '59416167A', 'Javier', 'Elrod', 'Barcelona', '1991-04-11', 'H'),
(560, '81679898A', 'Fernando', 'Churchill', 'Barcelona', '2004-09-09', 'H'),
(561, '21885431A', 'Clinton', 'Buford', 'Sevilla', '1999-03-06', 'H'),
(562, '24059523A', 'Ted', 'Breaux', 'Barcelona', '2004-04-02', 'H'),
(563, '69257150A', 'Mathew', 'Bolin', 'Valencia', '1992-09-01', 'H'),
(564, '14982539A', 'Tyrone', 'Asher', 'Barcelona', '2003-11-12', 'H'),
(565, '30797406A', 'Darren', 'Windham', 'Valencia', '1996-11-11', 'H'),
(566, '21555796A', 'Lonnie', 'Tirado', 'Valencia', '1993-02-08', 'H'),
(567, '25815221A', 'Lance', 'Pemberton', 'Madrid', '1993-06-08', 'H'),
(568, '11569080A', 'Cody', 'Nolen', 'Valencia', '1993-01-12', 'H'),
(569, '42242247A', 'Julio', 'Noland', 'Valencia', '2004-04-01', 'H'),
(570, '25089228A', 'Kelly', 'Knott', 'Sevilla', '1994-11-04', 'H'),
(571, '92378012A', 'Kurt', 'Emmons', 'Sevilla', '1998-05-02', 'H'),
(572, '15471713A', 'Allan', 'Cornish', 'Valencia', '2001-02-06', 'H'),
(573, '81132974A', 'Nelson', 'Christenson', 'Valencia', '2001-05-10', 'H'),
(574, '41124644A', 'Guy', 'Brownlee', 'Sevilla', '1996-02-11', 'H'),
(575, '61223001A', 'Clayton', 'Barbee', 'Barcelona', '1992-10-05', 'H'),
(576, '57469914A', 'Hugh', 'Waldrop', 'Valencia', '1991-01-06', 'H'),
(577, '29227937A', 'Max', 'Pitt', 'Valencia', '1992-07-06', 'H'),
(578, '18705675A', 'Dwayne', 'Olvera', 'Madrid', '1997-06-05', 'H'),
(579, '31219029A', 'Dwight', 'Lombardi', 'Madrid', '2002-08-05', 'H'),
(580, '80495317A', 'Armando', 'Gruber', 'Barcelona', '1997-06-03', 'H'),
(581, '91557207A', 'Felix', 'Gaffney', 'Valencia', '1997-06-09', 'H'),
(582, '63553859A', 'Jimmie', 'Eggleston', 'Madrid', '2000-08-04', 'H'),
(583, '59462865A', 'Everett', 'Banda', 'Sevilla', '1993-09-02', 'H'),
(584, '52359585A', 'Jordan', 'Archuleta', 'Barcelona', '2003-07-03', 'H'),
(585, '25227310A', 'Ian', 'Still', 'Barcelona', '1994-02-08', 'H'),
(586, '70265397A', 'Wallace', 'Slone', 'Barcelona', '2002-04-04', 'H'),
(587, '17502787A', 'Ken', 'Prewitt', 'Valencia', '1996-07-01', 'H'),
(588, '31167798A', 'Bob', 'Pfeiffer', 'Sevilla', '2001-06-08', 'H'),
(589, '56392575A', 'Jaime', 'Nettles', 'Sevilla', '1990-01-11', 'H'),
(590, '20757476A', 'Casey', 'Mena', 'Sevilla', '1999-10-07', 'H'),
(591, '53935926A', 'Alfredo', 'Mcadams', 'Sevilla', '2001-10-11', 'H'),
(592, '54524320A', 'Alberto', 'Henning', 'Madrid', '2000-06-05', 'H'),
(593, '41918223A', 'Dave', 'Gardiner', 'Valencia', '2000-03-11', 'H'),
(594, '23289162A', 'Ivan', 'Cromwell', 'Barcelona', '1998-04-05', 'H'),
(595, '16062557A', 'Johnnie', 'Chisholm', 'Barcelona', '2002-08-11', 'H'),
(596, '22274550A', 'Sidney', 'Burleson', 'Valencia', '1994-02-07', 'H'),
(597, '27449931A', 'Byron', 'Box', 'Madrid', '1996-10-11', 'H'),
(598, '92757769A', 'Julian', 'Vest', 'Sevilla', '2000-06-12', 'H'),
(599, '33291334A', 'Isaac', 'Oglesby', 'Barcelona', '2001-04-09', 'H'),
(600, '44839280A', 'Morris', 'Mccarter', 'Madrid', '2000-08-06', 'H'),
(601, '62868610A', 'Clifton', 'Malcolm', 'Sevilla', '1993-08-04', 'H'),
(602, '46356541A', 'Willard', 'Lumpkin', 'Valencia', '1993-04-04', 'H'),
(603, '85859136A', 'Daryl', 'Larue', 'Barcelona', '1998-06-04', 'H'),
(604, '96011875A', 'Ross', 'Grey', 'Madrid', '2001-11-05', 'H'),
(605, '72629786A', 'Virgil', 'Wofford', 'Valencia', '2004-01-06', 'H'),
(606, '66365634A', 'Andy', 'Vanhorn', 'Valencia', '1991-06-01', 'H'),
(607, '75282093A', 'Marshall', 'Thorn', 'Valencia', '1996-09-10', 'H'),
(608, '57498260A', 'Salvador', 'Teel', 'Sevilla', '1996-06-04', 'H'),
(609, '58911972A', 'Perry', 'Swafford', 'Madrid', '1991-06-05', 'H'),
(610, '58293211A', 'Kirk', 'Stclair', 'Sevilla', '1997-12-05', 'H'),
(611, '92515636A', 'Sergio', 'Stanfield', 'Sevilla', '1999-10-08', 'H'),
(612, '65812655A', 'Marion', 'Ocampo', 'Valencia', '2000-07-12', 'H'),
(613, '16471336A', 'Tracy', 'Herrmann', 'Barcelona', '1996-06-12', 'H'),
(614, '38173569A', 'Seth', 'Hannon', 'Madrid', '1992-01-04', 'H'),
(615, '44435096A', 'Kent', 'Arsenault', 'Sevilla', '1995-08-02', 'H'),
(616, '12966897A', 'Terrance', 'Roush', 'Sevilla', '1999-10-10', 'H'),
(617, '90351779A', 'Rene', 'Mcalister', 'Sevilla', '2004-10-11', 'H'),
(618, '90263511A', 'Eduardo', 'Hiatt', 'Sevilla', '1995-07-08', 'H'),
(619, '73772911A', 'Terrence', 'Gunderson', 'Sevilla', '1998-09-06', 'H'),
(620, '85255671A', 'Enrique', 'Forsythe', 'Valencia', '1992-02-10', 'H'),
(621, '41901403A', 'Freddie', 'Duggan', 'Barcelona', '2002-12-09', 'H'),
(622, '68286532A', 'Wade', 'Delvalle', 'Sevilla', '2004-04-09', 'H'),
(623, '99789228A', 'Austin', 'Cintron', 'Valencia', '1990-12-10', 'H'),
(624, '82243857A', 'Pepe', 'López', 'Madrid', '2002-01-12', 'H'),
(625, '45656030A', 'María', 'Sánchez', 'Barcelona', '1999-01-01', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_asignatura_curso`
--

CREATE TABLE `alumno_asignatura_curso` (
  `id_matricula` int(10) NOT NULL,
  `id_alumno` int(10) UNSIGNED NOT NULL,
  `id_asignatura` int(10) UNSIGNED NOT NULL,
  `id_curso` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumno_asignatura_curso`
--

INSERT INTO `alumno_asignatura_curso` (`id_matricula`, `id_alumno`, `id_asignatura`, `id_curso`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 2),
(5, 1, 5, 2),
(6, 1, 6, 2),
(7, 2, 1, 1),
(8, 2, 2, 1),
(9, 2, 3, 1),
(10, 2, 4, 2),
(11, 2, 5, 2),
(12, 2, 6, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id_asignatura` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `creditos` float UNSIGNED NOT NULL,
  `tipo` enum('básica','obligatoria','optativa') NOT NULL,
  `id_profesor` int(10) UNSIGNED DEFAULT NULL,
  `id_grado` int(10) UNSIGNED NOT NULL,
  `id_departamento` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id_asignatura`, `nombre`, `creditos`, `tipo`, `id_profesor`, `id_grado`, `id_departamento`) VALUES
(1, 'HTML', 6, 'básica', 3, 1, 1),
(2, 'CSS', 6, 'básica', 5, 1, 1),
(3, 'Javascript Básico', 6, 'básica', 8, 1, 1),
(4, 'Accesibilidad', 6, 'básica', 3, 2, 1),
(5, 'PHP', 6, 'básica', 8, 2, 1),
(6, 'Javascript Avanzado', 6, 'básica', 8, 2, 1),
(87, 'NODE.JS', 6, 'optativa', 10, 2, 1),
(88, 'Servidores', 6, 'optativa', 10, 2, 1),
(89, 'Criptografía', 6, 'optativa', 21, 2, 1),
(90, 'NODE.JS', 6, 'optativa', 21, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_escolar`
--

CREATE TABLE `curso_escolar` (
  `id_curso` int(10) UNSIGNED NOT NULL,
  `anyo_inicio` year(4) NOT NULL,
  `anyo_fin` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `curso_escolar`
--

INSERT INTO `curso_escolar` (`id_curso`, `anyo_inicio`, `anyo_fin`) VALUES
(1, 2020, 2021),
(2, 2021, 2022);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `nombre`) VALUES
(1, 'Informática');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `id_grado` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id_grado`, `nombre`) VALUES
(1, 'Desarrollo web básico'),
(2, 'Desarrollo web avanzado'),
(4, 'Grado en Ingeniería Informática (Plan 2015)'),
(5, 'Grado en Ingeniería Mecánica (Plan 2010)'),
(6, 'Grado en Ingeniería Química Industrial (Plan 2010)'),
(7, 'Grado en Biotecnología (Plan 2015)'),
(8, 'Grado en Ciencias Ambientales (Plan 2009)'),
(9, 'Grado en Matemáticas (Plan 2010)'),
(10, 'Grado en Química (Plan 2009)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id_profesor` int(10) UNSIGNED NOT NULL,
  `nif` varchar(9) DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `ciudad` varchar(25) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('H','M') NOT NULL,
  `id_matricula` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id_profesor`, `nif`, `nombre`, `apellido1`, `ciudad`, `fecha_nacimiento`, `sexo`, `id_matricula`) VALUES
(3, '11105554G', 'Zoe', 'Ramirez', 'Valencia', '1979-08-19', 'M', 0),
(5, '38223286T', 'David', 'Schmidt', 'Barcelona', '1978-01-19', 'H', 0),
(8, '79503962T', 'Cristina', 'Lemke', 'Madrid', '1977-08-21', 'M', 0),
(10, '61142000L', 'Esther', 'Spencer', 'Tarragona', '1977-05-19', 'M', 0),
(12, '85366986W', 'Carmen', 'Streich', 'Barcelona', '1971-04-29', 'M', 0),
(13, '73571384L', 'Alfredo', 'Stiedemann', 'Madrid', '1980-02-01', 'H', 0),
(14, '82937751G', 'Paco', 'Hamill', 'Bilbao', '1977-01-02', 'H', 0),
(16, '10485008K', 'Antonio', 'Fahey', 'Madrid', '1982-03-18', 'H', 0),
(17, '85869555K', 'Guillermo', 'Ruecker', 'Tarragona', '1973-05-05', 'H', 0),
(18, '04326833G', 'Micaela', 'Monahan', 'Sevilla', '1976-02-25', 'H', 0),
(20, '79221403L', 'Francesca', 'Schowalter', 'Sevilla', '1980-10-31', 'H', 0),
(21, '76787677A', 'John', 'Le Carré', 'Jaén', '1999-12-31', 'H', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`),
  ADD UNIQUE KEY `nif` (`nif`);

--
-- Indices de la tabla `alumno_asignatura_curso`
--
ALTER TABLE `alumno_asignatura_curso`
  ADD PRIMARY KEY (`id_matricula`),
  ADD KEY `matricula_alumno_ibfk_2` (`id_alumno`),
  ADD KEY `matricula_curso_ibfk_2` (`id_curso`),
  ADD KEY `matricula_asignatura_ibfk_2` (`id_asignatura`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asignatura`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `id_grado` (`id_grado`),
  ADD KEY `departamento_asignatura_ibfk_2` (`id_departamento`);

--
-- Indices de la tabla `curso_escolar`
--
ALTER TABLE `curso_escolar`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id_grado`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id_profesor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=630;

--
-- AUTO_INCREMENT de la tabla `alumno_asignatura_curso`
--
ALTER TABLE `alumno_asignatura_curso`
  MODIFY `id_matricula` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id_asignatura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de la tabla `curso_escolar`
--
ALTER TABLE `curso_escolar`
  MODIFY `id_curso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id_grado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id_profesor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno_asignatura_curso`
--
ALTER TABLE `alumno_asignatura_curso`
  ADD CONSTRAINT `matricula_alumno_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`),
  ADD CONSTRAINT `matricula_asignatura_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `matricula_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso_escolar` (`id_curso`);

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `departamento_asignatura_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
