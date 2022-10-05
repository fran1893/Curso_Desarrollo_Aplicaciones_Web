-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 04-10-2022 a les 15:15:26
-- Versió del servidor: 10.4.24-MariaDB
-- Versió de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `universidad`
--

DELIMITER $$
--
-- Procediments
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `profes2` (IN `genero` CHAR, OUT `n_profes` INT)   begin
select count(sexo) from persona WHERE sexo = genero and tipo = 'profesor' GROUP BY(sexo) into n_profes; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `profes_1_pr` (IN `genero` CHAR)   begin
select count(id) as profes from persona where sexo = genero and tipo = 'profesor' GROUP BY sexo;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de la taula `alumno_se_matricula_asignatura`
--

CREATE TABLE `alumno_se_matricula_asignatura` (
  `id_alumno` int(10) UNSIGNED NOT NULL,
  `id_asignatura` int(10) UNSIGNED NOT NULL,
  `id_curso_escolar` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `alumno_se_matricula_asignatura`
--

INSERT INTO `alumno_se_matricula_asignatura` (`id_alumno`, `id_asignatura`, `id_curso_escolar`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(4, 1, 1),
(4, 2, 1),
(4, 3, 1),
(19, 1, 5),
(19, 2, 5),
(19, 3, 5),
(19, 4, 5),
(19, 5, 5),
(19, 6, 5),
(19, 7, 5),
(19, 8, 5),
(19, 9, 5),
(19, 10, 5),
(23, 1, 5),
(23, 2, 5),
(23, 3, 5),
(23, 4, 5),
(23, 5, 5),
(23, 6, 5),
(23, 7, 5),
(23, 8, 5),
(23, 9, 5),
(23, 10, 5),
(24, 1, 5),
(24, 2, 5),
(24, 3, 5),
(24, 4, 5),
(24, 5, 5),
(24, 6, 5),
(24, 7, 5),
(24, 8, 5),
(24, 9, 5),
(24, 10, 5);

-- --------------------------------------------------------

--
-- Estructura de la taula `asignatura`
--

CREATE TABLE `asignatura` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `creditos` float UNSIGNED NOT NULL,
  `tipo` enum('básica','obligatoria','optativa') NOT NULL,
  `curso` tinyint(3) UNSIGNED NOT NULL,
  `cuatrimestre` tinyint(3) UNSIGNED NOT NULL,
  `id_profesor` int(10) UNSIGNED DEFAULT NULL,
  `id_grado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `asignatura`
--

INSERT INTO `asignatura` (`id`, `nombre`, `creditos`, `tipo`, `curso`, `cuatrimestre`, `id_profesor`, `id_grado`) VALUES
(1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, 3, 4),
(2, 'Cálculo', 6, 'básica', 1, 1, 14, 4),
(3, 'Física para informática', 6, 'básica', 1, 1, 3, 4),
(4, 'Introducción a la programación', 6, 'básica', 1, 1, 14, 4),
(5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, 3, 4),
(6, 'Estadística', 6, 'básica', 1, 2, 14, 4),
(7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, 3, 4),
(8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, 14, 4),
(9, 'Lógica y algorítmica', 6, 'básica', 1, 2, 3, 4),
(10, 'Metodología de la programación', 6, 'básica', 1, 2, 14, 4),
(11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4),
(12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4),
(13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4),
(14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4),
(15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4),
(16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4),
(17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4),
(18, 'Fundamentos de Redes de Computadores', 6, 'obligatoria', 2, 2, 3, 4),
(19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4),
(20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4),
(21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4),
(22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4),
(23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
(24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4),
(25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4),
(26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4),
(27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
(28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4),
(29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4),
(30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4),
(31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4),
(32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4),
(33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4),
(34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4),
(35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4),
(36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4),
(37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4),
(38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4),
(39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4),
(40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4),
(41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4),
(42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4),
(43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4),
(44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4),
(45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4),
(46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4),
(47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4),
(48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4),
(49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4),
(50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4),
(51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4),
(52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7),
(53, 'Física', 6, 'básica', 1, 1, NULL, 7),
(54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7),
(55, 'Química general', 6, 'básica', 1, 1, NULL, 7),
(56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7),
(57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7),
(58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7),
(59, 'Genética', 6, 'básica', 1, 2, NULL, 7),
(60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7),
(61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7),
(62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7),
(63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7),
(64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7),
(65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7),
(66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7),
(67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7),
(68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7),
(69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7),
(70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7),
(71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7),
(72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7),
(73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7),
(74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7),
(75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7),
(76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7),
(77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7),
(78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7),
(79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7),
(80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7),
(81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7),
(82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7),
(83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de la taula `curso_escolar`
--

CREATE TABLE `curso_escolar` (
  `id` int(10) UNSIGNED NOT NULL,
  `anyo_inicio` year(4) NOT NULL,
  `anyo_fin` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `curso_escolar`
--

INSERT INTO `curso_escolar` (`id`, `anyo_inicio`, `anyo_fin`) VALUES
(1, 2014, 2015),
(2, 2015, 2016),
(3, 2016, 2017),
(4, 2017, 2018),
(5, 2018, 2019);

-- --------------------------------------------------------

--
-- Estructura de la taula `departamento`
--

CREATE TABLE `departamento` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`) VALUES
(1, 'Informática'),
(2, 'Matemáticas'),
(3, 'Economía y Empresa'),
(4, 'Educación'),
(5, 'Agronomía'),
(6, 'Química y Física'),
(7, 'Filología'),
(8, 'Derecho'),
(9, 'Biología y Geología');

-- --------------------------------------------------------

--
-- Estructura de la taula `grado`
--

CREATE TABLE `grado` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `grado`
--

INSERT INTO `grado` (`id`, `nombre`) VALUES
(1, 'Grado en Ingeniería Agrícola (Plan 2015)'),
(2, 'Grado en Ingeniería Eléctrica (Plan 2014)'),
(3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)'),
(4, 'Grado en Ingeniería Informática (Plan 2015)'),
(5, 'Grado en Ingeniería Mecánica (Plan 2010)'),
(6, 'Grado en Ingeniería Química Industrial (Plan 2010)'),
(7, 'Grado en Biotecnología (Plan 2015)'),
(8, 'Grado en Ciencias Ambientales (Plan 2009)'),
(9, 'Grado en Matemáticas (Plan 2010)'),
(10, 'Grado en Química (Plan 2009)');

-- --------------------------------------------------------

--
-- Estructura de la taula `persona`
--

CREATE TABLE `persona` (
  `id` int(10) UNSIGNED NOT NULL,
  `nif` varchar(9) DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `ciudad` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('H','M') NOT NULL,
  `tipo` enum('profesor','alumno') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `persona`
--

INSERT INTO `persona` (`id`, `nif`, `nombre`, `apellido1`, `apellido2`, `ciudad`, `direccion`, `telefono`, `fecha_nacimiento`, `sexo`, `tipo`) VALUES
(1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991-03-28', 'H', 'alumno'),
(2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992-08-08', 'H', 'alumno'),
(3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979-08-19', 'M', 'profesor'),
(4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000-10-05', 'H', 'alumno'),
(5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978-01-19', 'H', 'profesor'),
(6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998-01-28', 'H', 'alumno'),
(7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999-05-24', 'H', 'alumno'),
(8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977-08-21', 'M', 'profesor'),
(9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996-11-21', 'H', 'alumno'),
(10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977-05-19', 'M', 'profesor'),
(11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997-04-26', 'H', 'alumno'),
(12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor'),
(13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980-02-01', 'H', 'profesor'),
(14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977-01-02', 'H', 'profesor'),
(15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980-03-14', 'H', 'profesor'),
(16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982-03-18', 'H', 'profesor'),
(17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973-05-05', 'H', 'profesor'),
(18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976-02-25', 'H', 'profesor'),
(19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998-09-01', 'M', 'alumno'),
(20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980-10-31', 'H', 'profesor'),
(21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998-01-01', 'H', 'alumno'),
(22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999-02-11', 'H', 'alumno'),
(23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996-03-12', 'M', 'alumno'),
(24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995-04-13', 'M', 'alumno'),
(25, NULL, 'MARY', 'SMITH', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(26, NULL, 'PATRICIA', 'JOHNSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(27, NULL, 'LINDA', 'WILLIAMS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(28, NULL, 'BARBARA', 'JONES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(29, NULL, 'ELIZABETH', 'BROWN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(30, NULL, 'JENNIFER', 'DAVIS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(31, NULL, 'MARIA', 'MILLER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(32, NULL, 'SUSAN', 'WILSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(33, NULL, 'MARGARET', 'MOORE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(34, NULL, 'DOROTHY', 'TAYLOR', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(35, NULL, 'LISA', 'ANDERSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(36, NULL, 'NANCY', 'THOMAS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(37, NULL, 'KAREN', 'JACKSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(38, NULL, 'BETTY', 'WHITE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(39, NULL, 'HELEN', 'HARRIS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(40, NULL, 'SANDRA', 'MARTIN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(41, NULL, 'DONNA', 'THOMPSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(42, NULL, 'CAROL', 'GARCIA', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(43, NULL, 'RUTH', 'MARTINEZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(44, NULL, 'SHARON', 'ROBINSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(45, NULL, 'MICHELLE', 'CLARK', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(46, NULL, 'LAURA', 'RODRIGUEZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(47, NULL, 'SARAH', 'LEWIS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(48, NULL, 'KIMBERLY', 'LEE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(49, NULL, 'DEBORAH', 'WALKER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(50, NULL, 'JESSICA', 'HALL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(51, NULL, 'SHIRLEY', 'ALLEN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(52, NULL, 'CYNTHIA', 'YOUNG', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(53, NULL, 'ANGELA', 'HERNANDEZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(54, NULL, 'MELISSA', 'KING', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(55, NULL, 'BRENDA', 'WRIGHT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(56, NULL, 'AMY', 'LOPEZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(57, NULL, 'ANNA', 'HILL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(58, NULL, 'REBECCA', 'SCOTT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(59, NULL, 'VIRGINIA', 'GREEN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(60, NULL, 'KATHLEEN', 'ADAMS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(61, NULL, 'PAMELA', 'BAKER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(62, NULL, 'MARTHA', 'GONZALEZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(63, NULL, 'DEBRA', 'NELSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(64, NULL, 'AMANDA', 'CARTER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(65, NULL, 'STEPHANIE', 'MITCHELL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(66, NULL, 'CAROLYN', 'PEREZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(67, NULL, 'CHRISTINE', 'ROBERTS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(68, NULL, 'MARIE', 'TURNER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(69, NULL, 'JANET', 'PHILLIPS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(70, NULL, 'CATHERINE', 'CAMPBELL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(71, NULL, 'FRANCES', 'PARKER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(72, NULL, 'ANN', 'EVANS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(73, NULL, 'JOYCE', 'EDWARDS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(74, NULL, 'DIANE', 'COLLINS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(75, NULL, 'ALICE', 'STEWART', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(76, NULL, 'JULIE', 'SANCHEZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(77, NULL, 'HEATHER', 'MORRIS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(78, NULL, 'TERESA', 'ROGERS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(79, NULL, 'DORIS', 'REED', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(80, NULL, 'GLORIA', 'COOK', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(81, NULL, 'EVELYN', 'MORGAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(82, NULL, 'JEAN', 'BELL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(83, NULL, 'CHERYL', 'MURPHY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(84, NULL, 'MILDRED', 'BAILEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(85, NULL, 'KATHERINE', 'RIVERA', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(86, NULL, 'JOAN', 'COOPER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(87, NULL, 'ASHLEY', 'RICHARDSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(88, NULL, 'JUDITH', 'COX', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(89, NULL, 'ROSE', 'HOWARD', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(90, NULL, 'JANICE', 'WARD', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(91, NULL, 'KELLY', 'TORRES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(92, NULL, 'NICOLE', 'PETERSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(93, NULL, 'JUDY', 'GRAY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(94, NULL, 'CHRISTINA', 'RAMIREZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(95, NULL, 'KATHY', 'JAMES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(96, NULL, 'THERESA', 'WATSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(97, NULL, 'BEVERLY', 'BROOKS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(98, NULL, 'DENISE', 'KELLY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(99, NULL, 'TAMMY', 'SANDERS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(100, NULL, 'IRENE', 'PRICE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(101, NULL, 'JANE', 'BENNETT', NULL, '', '', NULL, '0000-00-00', 'H', 'profesor'),
(102, NULL, 'LORI', 'WOOD', NULL, '', '', NULL, '0000-00-00', 'H', 'profesor'),
(103, NULL, 'RACHEL', 'BARNES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(104, NULL, 'MARILYN', 'ROSS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(105, NULL, 'ANDREA', 'HENDERSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(106, NULL, 'KATHRYN', 'COLEMAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(107, NULL, 'LOUISE', 'JENKINS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(108, NULL, 'SARA', 'PERRY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(109, NULL, 'ANNE', 'POWELL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(110, NULL, 'JACQUELINE', 'LONG', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(111, NULL, 'WANDA', 'PATTERSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(112, NULL, 'BONNIE', 'HUGHES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(113, NULL, 'JULIA', 'FLORES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(114, NULL, 'RUBY', 'WASHINGTON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(115, NULL, 'LOIS', 'BUTLER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(116, NULL, 'TINA', 'SIMMONS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(117, NULL, 'PHYLLIS', 'FOSTER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(118, NULL, 'NORMA', 'GONZALES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(119, NULL, 'PAULA', 'BRYANT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(120, NULL, 'DIANA', 'ALEXANDER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(121, NULL, 'ANNIE', 'RUSSELL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(122, NULL, 'LILLIAN', 'GRIFFIN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(123, NULL, 'EMILY', 'DIAZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(124, NULL, 'ROBIN', 'HAYES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(125, NULL, 'PEGGY', 'MYERS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(126, NULL, 'CRYSTAL', 'FORD', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(127, NULL, 'GLADYS', 'HAMILTON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(128, NULL, 'RITA', 'GRAHAM', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(129, NULL, 'DAWN', 'SULLIVAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(130, NULL, 'CONNIE', 'WALLACE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(131, NULL, 'FLORENCE', 'WOODS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(132, NULL, 'TRACY', 'COLE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(133, NULL, 'EDNA', 'WEST', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(134, NULL, 'TIFFANY', 'JORDAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(135, NULL, 'CARMEN', 'OWENS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(136, NULL, 'ROSA', 'REYNOLDS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(137, NULL, 'CINDY', 'FISHER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(138, NULL, 'GRACE', 'ELLIS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(139, NULL, 'WENDY', 'HARRISON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(140, NULL, 'VICTORIA', 'GIBSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(141, NULL, 'EDITH', 'MCDONALD', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(142, NULL, 'KIM', 'CRUZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(143, NULL, 'SHERRY', 'MARSHALL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(144, NULL, 'SYLVIA', 'ORTIZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(145, NULL, 'JOSEPHINE', 'GOMEZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(146, NULL, 'THELMA', 'MURRAY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(147, NULL, 'SHANNON', 'FREEMAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(148, NULL, 'SHEILA', 'WELLS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(149, NULL, 'ETHEL', 'WEBB', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(150, NULL, 'ELLEN', 'SIMPSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(151, NULL, 'ELAINE', 'STEVENS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(152, NULL, 'MARJORIE', 'TUCKER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(153, NULL, 'CARRIE', 'PORTER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(154, NULL, 'CHARLOTTE', 'HUNTER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(155, NULL, 'MONICA', 'HICKS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(156, NULL, 'ESTHER', 'CRAWFORD', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(157, NULL, 'PAULINE', 'HENRY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(158, NULL, 'EMMA', 'BOYD', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(159, NULL, 'JUANITA', 'MASON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(160, NULL, 'ANITA', 'MORALES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(161, NULL, 'RHONDA', 'KENNEDY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(162, NULL, 'HAZEL', 'WARREN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(163, NULL, 'AMBER', 'DIXON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(164, NULL, 'EVA', 'RAMOS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(165, NULL, 'DEBBIE', 'REYES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(166, NULL, 'APRIL', 'BURNS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(167, NULL, 'LESLIE', 'GORDON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(168, NULL, 'CLARA', 'SHAW', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(169, NULL, 'LUCILLE', 'HOLMES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(170, NULL, 'JAMIE', 'RICE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(171, NULL, 'JOANNE', 'ROBERTSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(172, NULL, 'ELEANOR', 'HUNT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(173, NULL, 'VALERIE', 'BLACK', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(174, NULL, 'DANIELLE', 'DANIELS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(175, NULL, 'MEGAN', 'PALMER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(176, NULL, 'ALICIA', 'MILLS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(177, NULL, 'SUZANNE', 'NICHOLS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(178, NULL, 'MICHELE', 'GRANT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(179, NULL, 'GAIL', 'KNIGHT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(180, NULL, 'BERTHA', 'FERGUSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(181, NULL, 'DARLENE', 'ROSE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(182, NULL, 'VERONICA', 'STONE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(183, NULL, 'JILL', 'HAWKINS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(184, NULL, 'ERIN', 'DUNN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(185, NULL, 'GERALDINE', 'PERKINS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(186, NULL, 'LAUREN', 'HUDSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(187, NULL, 'CATHY', 'SPENCER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(188, NULL, 'JOANN', 'GARDNER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(189, NULL, 'LORRAINE', 'STEPHENS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(190, NULL, 'LYNN', 'PAYNE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(191, NULL, 'SALLY', 'PIERCE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(192, NULL, 'REGINA', 'BERRY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(193, NULL, 'ERICA', 'MATTHEWS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(194, NULL, 'BEATRICE', 'ARNOLD', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(195, NULL, 'DOLORES', 'WAGNER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(196, NULL, 'BERNICE', 'WILLIS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(197, NULL, 'AUDREY', 'RAY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(198, NULL, 'YVONNE', 'WATKINS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(199, NULL, 'ANNETTE', 'OLSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(200, NULL, 'JUNE', 'CARROLL', NULL, '', '', NULL, '0000-00-00', 'H', 'profesor'),
(201, NULL, 'SAMANTHA', 'DUNCAN', NULL, '', '', NULL, '0000-00-00', 'H', 'profesor'),
(202, NULL, 'MARION', 'SNYDER', NULL, '', '', NULL, '0000-00-00', 'H', 'profesor'),
(203, NULL, 'DANA', 'HART', NULL, '', '', NULL, '0000-00-00', 'H', 'profesor'),
(204, NULL, 'STACY', 'CUNNINGHAM', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(205, NULL, 'ANA', 'BRADLEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(206, NULL, 'RENEE', 'LANE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(207, NULL, 'IDA', 'ANDREWS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(208, NULL, 'VIVIAN', 'RUIZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(209, NULL, 'ROBERTA', 'HARPER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(210, NULL, 'HOLLY', 'FOX', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(211, NULL, 'BRITTANY', 'RILEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(212, NULL, 'MELANIE', 'ARMSTRONG', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(213, NULL, 'LORETTA', 'CARPENTER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(214, NULL, 'YOLANDA', 'WEAVER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(215, NULL, 'JEANETTE', 'GREENE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(216, NULL, 'LAURIE', 'LAWRENCE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(217, NULL, 'KATIE', 'ELLIOTT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(218, NULL, 'KRISTEN', 'CHAVEZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(219, NULL, 'VANESSA', 'SIMS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(220, NULL, 'ALMA', 'AUSTIN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(221, NULL, 'SUE', 'PETERS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(222, NULL, 'ELSIE', 'KELLEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(223, NULL, 'BETH', 'FRANKLIN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(224, NULL, 'JEANNE', 'LAWSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(225, NULL, 'VICKI', 'FIELDS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(226, NULL, 'CARLA', 'GUTIERREZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(227, NULL, 'TARA', 'RYAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(228, NULL, 'ROSEMARY', 'SCHMIDT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(229, NULL, 'EILEEN', 'CARR', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(230, NULL, 'TERRI', 'VASQUEZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(231, NULL, 'GERTRUDE', 'CASTILLO', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(232, NULL, 'LUCY', 'WHEELER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(233, NULL, 'TONYA', 'CHAPMAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(234, NULL, 'ELLA', 'OLIVER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(235, NULL, 'STACEY', 'MONTGOMERY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(236, NULL, 'WILMA', 'RICHARDS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(237, NULL, 'GINA', 'WILLIAMSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(238, NULL, 'KRISTIN', 'JOHNSTON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(239, NULL, 'JESSIE', 'BANKS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(240, NULL, 'NATALIE', 'MEYER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(241, NULL, 'AGNES', 'BISHOP', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(242, NULL, 'VERA', 'MCCOY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(243, NULL, 'WILLIE', 'HOWELL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(244, NULL, 'CHARLENE', 'ALVAREZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(245, NULL, 'BESSIE', 'MORRISON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(246, NULL, 'DELORES', 'HANSEN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(247, NULL, 'MELINDA', 'FERNANDEZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(248, NULL, 'PEARL', 'GARZA', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(249, NULL, 'ARLENE', 'HARVEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(250, NULL, 'MAUREEN', 'LITTLE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(251, NULL, 'COLLEEN', 'BURTON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(252, NULL, 'ALLISON', 'STANLEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(253, NULL, 'TAMARA', 'NGUYEN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(254, NULL, 'JOY', 'GEORGE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(255, NULL, 'GEORGIA', 'JACOBS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(256, NULL, 'CONSTANCE', 'REID', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(257, NULL, 'LILLIE', 'KIM', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(258, NULL, 'CLAUDIA', 'FULLER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(259, NULL, 'JACKIE', 'LYNCH', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(260, NULL, 'MARCIA', 'DEAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(261, NULL, 'TANYA', 'GILBERT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(262, NULL, 'NELLIE', 'GARRETT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(263, NULL, 'MINNIE', 'ROMERO', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(264, NULL, 'MARLENE', 'WELCH', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(265, NULL, 'HEIDI', 'LARSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(266, NULL, 'GLENDA', 'FRAZIER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(267, NULL, 'LYDIA', 'BURKE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(268, NULL, 'VIOLA', 'HANSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(269, NULL, 'COURTNEY', 'DAY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(270, NULL, 'MARIAN', 'MENDOZA', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(271, NULL, 'STELLA', 'MORENO', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(272, NULL, 'CAROLINE', 'BOWMAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(273, NULL, 'DORA', 'MEDINA', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(274, NULL, 'JO', 'FOWLER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(275, NULL, 'VICKIE', 'BREWER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(276, NULL, 'MATTIE', 'HOFFMAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(277, NULL, 'TERRY', 'CARLSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(278, NULL, 'MAXINE', 'SILVA', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(279, NULL, 'IRMA', 'PEARSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(280, NULL, 'MABEL', 'HOLLAND', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(281, NULL, 'MARSHA', 'DOUGLAS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(282, NULL, 'MYRTLE', 'FLEMING', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(283, NULL, 'LENA', 'JENSEN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(284, NULL, 'CHRISTY', 'VARGAS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(285, NULL, 'DEANNA', 'BYRD', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(286, NULL, 'PATSY', 'DAVIDSON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(287, NULL, 'HILDA', 'HOPKINS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(288, NULL, 'GWENDOLYN', 'MAY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(289, NULL, 'JENNIE', 'TERRY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(290, NULL, 'NORA', 'HERRERA', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(291, NULL, 'MARGIE', 'WADE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(292, NULL, 'NINA', 'SOTO', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(293, NULL, 'CASSANDRA', 'WALTERS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(294, NULL, 'LEAH', 'CURTIS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(295, NULL, 'PENNY', 'NEAL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(296, NULL, 'KAY', 'CALDWELL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(297, NULL, 'PRISCILLA', 'LOWE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(298, NULL, 'NAOMI', 'JENNINGS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(299, NULL, 'CAROLE', 'BARNETT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(300, NULL, 'BRANDY', 'GRAVES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(301, NULL, 'OLGA', 'JIMENEZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(302, NULL, 'BILLIE', 'HORTON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(303, NULL, 'DIANNE', 'SHELTON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(304, NULL, 'TRACEY', 'BARRETT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(305, NULL, 'LEONA', 'OBRIEN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(306, NULL, 'JENNY', 'CASTRO', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(307, NULL, 'FELICIA', 'SUTTON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(308, NULL, 'SONIA', 'GREGORY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(309, NULL, 'MIRIAM', 'MCKINNEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(310, NULL, 'VELMA', 'LUCAS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(311, NULL, 'BECKY', 'MILES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(312, NULL, 'BOBBIE', 'CRAIG', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(313, NULL, 'VIOLET', 'RODRIQUEZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(314, NULL, 'KRISTINA', 'CHAMBERS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(315, NULL, 'TONI', 'HOLT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(316, NULL, 'MISTY', 'LAMBERT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(317, NULL, 'MAE', 'FLETCHER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(318, NULL, 'SHELLY', 'WATTS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(319, NULL, 'DAISY', 'BATES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(320, NULL, 'RAMONA', 'HALE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(321, NULL, 'SHERRI', 'RHODES', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(322, NULL, 'ERIKA', 'PENA', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(323, NULL, 'JAMES', 'GANNON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(324, NULL, 'JOHN', 'FARNSWORTH', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(325, NULL, 'ROBERT', 'BAUGHMAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(326, NULL, 'MICHAEL', 'SILVERMAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(327, NULL, 'WILLIAM', 'SATTERFIELD', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(328, NULL, 'DAVID', 'ROYAL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(329, NULL, 'RICHARD', 'MCCRARY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(330, NULL, 'CHARLES', 'KOWALSKI', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(331, NULL, 'JOSEPH', 'JOY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(332, NULL, 'THOMAS', 'GRIGSBY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(333, NULL, 'CHRISTOPHER', 'GRECO', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(334, NULL, 'DANIEL', 'CABRAL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(335, NULL, 'PAUL', 'TROUT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(336, NULL, 'MARK', 'RINEHART', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(337, NULL, 'DONALD', 'MAHON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(338, NULL, 'GEORGE', 'LINTON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(339, NULL, 'KENNETH', 'GOODEN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(340, NULL, 'STEVEN', 'CURLEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(341, NULL, 'EDWARD', 'BAUGH', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(342, NULL, 'BRIAN', 'WYMAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(343, NULL, 'RONALD', 'WEINER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(344, NULL, 'ANTHONY', 'SCHWAB', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(345, NULL, 'KEVIN', 'SCHULER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(346, NULL, 'JASON', 'MORRISSEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(347, NULL, 'MATTHEW', 'MAHAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(348, NULL, 'GARY', 'COY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(349, NULL, 'TIMOTHY', 'BUNN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(350, NULL, 'JOSE', 'ANDREW', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(351, NULL, 'LARRY', 'THRASHER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(352, NULL, 'JEFFREY', 'SPEAR', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(353, NULL, 'FRANK', 'WAGGONER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(354, NULL, 'SCOTT', 'SHELLEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(355, NULL, 'ERIC', 'ROBERT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(356, NULL, 'STEPHEN', 'QUALLS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(357, NULL, 'ANDREW', 'PURDY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(358, NULL, 'RAYMOND', 'MCWHORTER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(359, NULL, 'GREGORY', 'MAULDIN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(360, NULL, 'JOSHUA', 'MARK', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(361, NULL, 'JERRY', 'JORDON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(362, NULL, 'DENNIS', 'GILMAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(363, NULL, 'WALTER', 'PERRYMAN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(364, NULL, 'PATRICK', 'NEWSOM', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(365, NULL, 'PETER', 'MENARD', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(366, NULL, 'HAROLD', 'MARTINO', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(367, NULL, 'DOUGLAS', 'GRAF', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(368, NULL, 'HENRY', 'BILLINGSLEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(369, NULL, 'CARL', 'ARTIS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(370, NULL, 'ARTHUR', 'SIMPKINS', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(371, NULL, 'RYAN', 'SALISBURY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(372, NULL, 'ROGER', 'QUINTANILLA', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(373, NULL, 'JOE', 'GILLILAND', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(374, NULL, 'JUAN', 'FRALEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(375, NULL, 'JACK', 'FOUST', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(376, NULL, 'ALBERT', 'CROUSE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(377, NULL, 'JONATHAN', 'SCARBOROUGH', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(378, NULL, 'JUSTIN', 'NGO', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(379, NULL, 'TERRY', 'GRISSOM', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(380, NULL, 'GERALD', 'FULTZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(381, NULL, 'KEITH', 'RICO', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(382, NULL, 'SAMUEL', 'MARLOW', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(383, NULL, 'WILLIE', 'MARKHAM', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(384, NULL, 'RALPH', 'MADRIGAL', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(385, NULL, 'LAWRENCE', 'LAWTON', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(386, NULL, 'NICHOLAS', 'BARFIELD', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(387, NULL, 'ROY', 'WHITING', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(388, NULL, 'BENJAMIN', 'VARNEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(389, NULL, 'BRUCE', 'SCHWARZ', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(390, NULL, 'BRANDON', 'HUEY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(391, NULL, 'ADAM', 'GOOCH', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(392, NULL, 'HARRY', 'ARCE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(393, NULL, 'FRED', 'WHEAT', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(394, NULL, 'WAYNE', 'TRUONG', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(395, NULL, 'BILLY', 'POULIN', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(396, NULL, 'STEVE', 'MACKENZIE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(397, NULL, 'LOUIS', 'LEONE', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(398, NULL, 'JEREMY', 'HURTADO', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(399, NULL, 'AARON', 'SELBY', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(400, NULL, 'RANDY', 'GAITHER', NULL, '', '', NULL, '0000-00-00', 'H', 'alumno'),
(401, NULL, 'HOWARD', 'FORTNER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(402, NULL, 'EUGENE', 'CULPEPPER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(403, NULL, 'CARLOS', 'COUGHLIN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(404, NULL, 'RUSSELL', 'BRINSON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(405, NULL, 'BOBBY', 'BOUDREAU', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(406, NULL, 'VICTOR', 'BARKLEY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(407, NULL, 'MARTIN', 'BALES', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(408, NULL, 'ERNEST', 'STEPP', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(409, NULL, 'PHILLIP', 'HOLM', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(410, NULL, 'TODD', 'TAN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(411, NULL, 'JESSE', 'SCHILLING', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(412, NULL, 'CRAIG', 'MORRELL', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(413, NULL, 'ALAN', 'KAHN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(414, NULL, 'SHAWN', 'HEATON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(415, NULL, 'CLARENCE', 'GAMEZ', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(416, NULL, 'SEAN', 'DOUGLASS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(417, NULL, 'PHILIP', 'CAUSEY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(418, NULL, 'CHRIS', 'BROTHERS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(419, NULL, 'JOHNNY', 'TURPIN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(420, NULL, 'EARL', 'SHANKS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(421, NULL, 'JIMMY', 'SCHRADER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(422, NULL, 'ANTONIO', 'MEEK', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(423, NULL, 'DANNY', 'ISOM', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(424, NULL, 'BRYAN', 'HARDISON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(425, NULL, 'TONY', 'CARRANZA', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(426, NULL, 'LUIS', 'YANEZ', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(427, NULL, 'MIKE', 'WAY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(428, NULL, 'STANLEY', 'SCROGGINS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(429, NULL, 'LEONARD', 'SCHOFIELD', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(430, NULL, 'NATHAN', 'RUNYON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(431, NULL, 'DALE', 'RATCLIFF', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(432, NULL, 'MANUEL', 'MURRELL', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(433, NULL, 'RODNEY', 'MOELLER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(434, NULL, 'CURTIS', 'IRBY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(435, NULL, 'NORMAN', 'CURRIER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(436, NULL, 'ALLEN', 'BUTTERFIELD', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(437, NULL, 'MARVIN', 'YEE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(438, NULL, 'VINCENT', 'RALSTON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(439, NULL, 'GLENN', 'PULLEN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(440, NULL, 'JEFFERY', 'PINSON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(441, NULL, 'TRAVIS', 'ESTEP', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(442, NULL, 'JEFF', 'EAST', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(443, NULL, 'CHAD', 'CARBONE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(444, NULL, 'JACOB', 'LANCE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(445, NULL, 'LEE', 'HAWKS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(446, NULL, 'MELVIN', 'ELLINGTON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(447, NULL, 'ALFRED', 'CASILLAS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(448, NULL, 'KYLE', 'SPURLOCK', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(449, NULL, 'FRANCIS', 'SIKES', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(450, NULL, 'BRADLEY', 'MOTLEY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(451, NULL, 'JESUS', 'MCCARTNEY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(452, NULL, 'HERBERT', 'KRUGER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(453, NULL, 'FREDERICK', 'ISBELL', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(454, NULL, 'RAY', 'HOULE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(455, NULL, 'JOEL', 'FRANCISCO', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(456, NULL, 'EDWIN', 'BURK', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(457, NULL, 'DON', 'BONE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(458, NULL, 'EDDIE', 'TOMLIN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(459, NULL, 'RICKY', 'SHELBY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(460, NULL, 'TROY', 'QUIGLEY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(461, NULL, 'RANDALL', 'NEUMANN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(462, NULL, 'BARRY', 'LOVELACE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(463, NULL, 'ALEXANDER', 'FENNELL', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(464, NULL, 'BERNARD', 'COLBY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(465, NULL, 'MARIO', 'CHEATHAM', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(466, NULL, 'LEROY', 'BUSTAMANTE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(467, NULL, 'FRANCISCO', 'SKIDMORE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(468, NULL, 'MARCUS', 'HIDALGO', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(469, NULL, 'MICHEAL', 'FORMAN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(470, NULL, 'THEODORE', 'CULP', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(471, NULL, 'CLIFFORD', 'BOWENS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(472, NULL, 'MIGUEL', 'BETANCOURT', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(473, NULL, 'OSCAR', 'AQUINO', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(474, NULL, 'JAY', 'ROBB', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(475, NULL, 'JIM', 'REA', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(476, NULL, 'TOM', 'MILNER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(477, NULL, 'CALVIN', 'MARTEL', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(478, NULL, 'ALEX', 'GRESHAM', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(479, NULL, 'JON', 'WILES', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(480, NULL, 'RONNIE', 'RICKETTS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(481, NULL, 'BILL', 'GAVIN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(482, NULL, 'LLOYD', 'DOWD', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(483, NULL, 'TOMMY', 'COLLAZO', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(484, NULL, 'LEON', 'BOSTIC', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(485, NULL, 'DEREK', 'BLAKELY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(486, NULL, 'WARREN', 'SHERROD', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(487, NULL, 'DARRELL', 'POWER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(488, NULL, 'JEROME', 'KENYON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(489, NULL, 'FLOYD', 'GANDY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(490, NULL, 'LEO', 'EBERT', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(491, NULL, 'ALVIN', 'DELOACH', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(492, NULL, 'TIM', 'CARY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(493, NULL, 'WESLEY', 'BULL', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(494, NULL, 'GORDON', 'ALLARD', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(495, NULL, 'DEAN', 'SAUER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(496, NULL, 'GREG', 'ROBINS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(497, NULL, 'JORGE', 'OLIVARES', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(498, NULL, 'DUSTIN', 'GILLETTE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(499, NULL, 'PEDRO', 'CHESTNUT', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(500, NULL, 'DERRICK', 'BOURQUE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(501, NULL, 'DAN', 'PAINE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(502, NULL, 'LEWIS', 'LYMAN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(503, NULL, 'ZACHARY', 'HITE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(504, NULL, 'COREY', 'HAUSER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(505, NULL, 'HERMAN', 'DEVORE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(506, NULL, 'MAURICE', 'CRAWLEY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(507, NULL, 'VERNON', 'CHAPA', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(508, NULL, 'ROBERTO', 'VU', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(509, NULL, 'CLYDE', 'TOBIAS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(510, NULL, 'GLEN', 'TALBERT', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(511, NULL, 'HECTOR', 'POINDEXTER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(512, NULL, 'SHANE', 'MILLARD', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(513, NULL, 'RICARDO', 'MEADOR', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(514, NULL, 'SAM', 'MCDUFFIE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(515, NULL, 'RICK', 'MATTOX', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(516, NULL, 'LESTER', 'KRAUS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(517, NULL, 'BRENT', 'HARKINS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(518, NULL, 'RAMON', 'CHOATE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(519, NULL, 'CHARLIE', 'BESS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(520, NULL, 'TYLER', 'WREN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(521, NULL, 'GILBERT', 'SLEDGE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(522, NULL, 'GENE', 'SANBORN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(523, NULL, 'MARC', 'OUTLAW', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(524, NULL, 'REGINALD', 'KINDER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(525, NULL, 'RUBEN', 'GEARY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(526, NULL, 'BRETT', 'CORNWELL', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(527, NULL, 'ANGEL', 'BARCLAY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(528, NULL, 'NATHANIEL', 'ADAM', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(529, NULL, 'RAFAEL', 'ABNEY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(530, NULL, 'LESLIE', 'SEWARD', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(531, NULL, 'EDGAR', 'RHOADS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(532, NULL, 'MILTON', 'HOWLAND', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(533, NULL, 'RAUL', 'FORTIER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(534, NULL, 'BEN', 'EASTER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(535, NULL, 'CHESTER', 'BENNER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(536, NULL, 'CECIL', 'VINES', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(537, NULL, 'DUANE', 'TUBBS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(538, NULL, 'FRANKLIN', 'TROUTMAN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(539, NULL, 'ANDRE', 'RAPP', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(540, NULL, 'ELMER', 'NOE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(541, NULL, 'BRAD', 'MCCURDY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(542, NULL, 'GABRIEL', 'HARDER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(543, NULL, 'RON', 'DELUCA', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(544, NULL, 'MITCHELL', 'WESTMORELAND', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(545, NULL, 'ROLAND', 'SOUTH', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(546, NULL, 'ARNOLD', 'HAVENS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(547, NULL, 'HARVEY', 'GUAJARDO', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(548, NULL, 'JARED', 'ELY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(549, NULL, 'ADRIAN', 'CLARY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(550, NULL, 'KARL', 'SEAL', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(551, NULL, 'CORY', 'MEEHAN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(552, NULL, 'CLAUDE', 'HERZOG', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(553, NULL, 'ERIK', 'GUILLEN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(554, NULL, 'DARRYL', 'ASHCRAFT', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(555, NULL, 'JAMIE', 'WAUGH', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(556, NULL, 'NEIL', 'RENNER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(557, NULL, 'JESSIE', 'MILAM', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(558, NULL, 'CHRISTIAN', 'JUNG', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(559, NULL, 'JAVIER', 'ELROD', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(560, NULL, 'FERNANDO', 'CHURCHILL', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(561, NULL, 'CLINTON', 'BUFORD', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(562, NULL, 'TED', 'BREAUX', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(563, NULL, 'MATHEW', 'BOLIN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(564, NULL, 'TYRONE', 'ASHER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(565, NULL, 'DARREN', 'WINDHAM', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(566, NULL, 'LONNIE', 'TIRADO', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(567, NULL, 'LANCE', 'PEMBERTON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(568, NULL, 'CODY', 'NOLEN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(569, NULL, 'JULIO', 'NOLAND', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(570, NULL, 'KELLY', 'KNOTT', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(571, NULL, 'KURT', 'EMMONS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(572, NULL, 'ALLAN', 'CORNISH', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(573, NULL, 'NELSON', 'CHRISTENSON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(574, NULL, 'GUY', 'BROWNLEE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(575, NULL, 'CLAYTON', 'BARBEE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(576, NULL, 'HUGH', 'WALDROP', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(577, NULL, 'MAX', 'PITT', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(578, NULL, 'DWAYNE', 'OLVERA', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(579, NULL, 'DWIGHT', 'LOMBARDI', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(580, NULL, 'ARMANDO', 'GRUBER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(581, NULL, 'FELIX', 'GAFFNEY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(582, NULL, 'JIMMIE', 'EGGLESTON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(583, NULL, 'EVERETT', 'BANDA', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(584, NULL, 'JORDAN', 'ARCHULETA', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(585, NULL, 'IAN', 'STILL', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(586, NULL, 'WALLACE', 'SLONE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(587, NULL, 'KEN', 'PREWITT', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(588, NULL, 'BOB', 'PFEIFFER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(589, NULL, 'JAIME', 'NETTLES', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(590, NULL, 'CASEY', 'MENA', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(591, NULL, 'ALFREDO', 'MCADAMS', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(592, NULL, 'ALBERTO', 'HENNING', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(593, NULL, 'DAVE', 'GARDINER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(594, NULL, 'IVAN', 'CROMWELL', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(595, NULL, 'JOHNNIE', 'CHISHOLM', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(596, NULL, 'SIDNEY', 'BURLESON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(597, NULL, 'BYRON', 'BOX', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(598, NULL, 'JULIAN', 'VEST', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(599, NULL, 'ISAAC', 'OGLESBY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(600, NULL, 'MORRIS', 'MCCARTER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(601, NULL, 'CLIFTON', 'MALCOLM', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(602, NULL, 'WILLARD', 'LUMPKIN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(603, NULL, 'DARYL', 'LARUE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(604, NULL, 'ROSS', 'GREY', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(605, NULL, 'VIRGIL', 'WOFFORD', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(606, NULL, 'ANDY', 'VANHORN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(607, NULL, 'MARSHALL', 'THORN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(608, NULL, 'SALVADOR', 'TEEL', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(609, NULL, 'PERRY', 'SWAFFORD', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(610, NULL, 'KIRK', 'STCLAIR', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(611, NULL, 'SERGIO', 'STANFIELD', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(612, NULL, 'MARION', 'OCAMPO', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(613, NULL, 'TRACY', 'HERRMANN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(614, NULL, 'SETH', 'HANNON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno');
INSERT INTO `persona` (`id`, `nif`, `nombre`, `apellido1`, `apellido2`, `ciudad`, `direccion`, `telefono`, `fecha_nacimiento`, `sexo`, `tipo`) VALUES
(615, NULL, 'KENT', 'ARSENAULT', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(616, NULL, 'TERRANCE', 'ROUSH', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(617, NULL, 'RENE', 'MCALISTER', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(618, NULL, 'EDUARDO', 'HIATT', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(619, NULL, 'TERRENCE', 'GUNDERSON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(620, NULL, 'ENRIQUE', 'FORSYTHE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(621, NULL, 'FREDDIE', 'DUGGAN', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(622, NULL, 'WADE', 'DELVALLE', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(623, NULL, 'AUSTIN', 'CINTRON', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(624, NULL, 'PEPE', 'LÓPEZ', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno'),
(625, NULL, 'MARÍA', 'SÁNCHEZ', NULL, '', '', NULL, '0000-00-00', 'M', 'alumno');

-- --------------------------------------------------------

--
-- Estructura de la taula `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` int(10) UNSIGNED NOT NULL,
  `id_departamento` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `id_departamento`) VALUES
(3, 1),
(14, 1),
(5, 2),
(15, 2),
(8, 3),
(16, 3),
(10, 4),
(12, 4),
(17, 4),
(18, 5),
(13, 6),
(20, 6);

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `alumno_se_matricula_asignatura`
--
ALTER TABLE `alumno_se_matricula_asignatura`
  ADD PRIMARY KEY (`id_alumno`,`id_asignatura`,`id_curso_escolar`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_curso_escolar` (`id_curso_escolar`);

--
-- Índexs per a la taula `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `id_grado` (`id_grado`);

--
-- Índexs per a la taula `curso_escolar`
--
ALTER TABLE `curso_escolar`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nif` (`nif`);

--
-- Índexs per a la taula `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT per la taula `curso_escolar`
--
ALTER TABLE `curso_escolar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la taula `grado`
--
ALTER TABLE `grado`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la taula `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1048;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `alumno_se_matricula_asignatura`
--
ALTER TABLE `alumno_se_matricula_asignatura`
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id`),
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_3` FOREIGN KEY (`id_curso_escolar`) REFERENCES `curso_escolar` (`id`);

--
-- Restriccions per a la taula `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`),
  ADD CONSTRAINT `asignatura_ibfk_2` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`);

--
-- Restriccions per a la taula `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `profesor_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
