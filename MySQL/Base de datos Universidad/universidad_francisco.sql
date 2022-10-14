-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-10-2022 a las 19:52:14
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
-- Base de datos: `universidad_francisco`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumnosPorAnyo` (IN `anyo` YEAR(4))   BEGIN

SELECT DISTINCT nombre, apellido1 FROM persona P JOIN alumno_se_matricula_asignatura A ON P.id = A.id_alumno JOIN curso_escolar C ON A.id_curso_escolar = C.id_curso_escolar WHERE C.anyo_inicio = anyo;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cuentaPalabra` (IN `palabra` VARCHAR(20))   BEGIN
	select COUNT(*) FROM persona where nombre = palabra GROUP BY (nombre);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cuentaPalabra2` (IN `palabra` VARCHAR(20), OUT `contador` INT)   BEGIN
	select COUNT(*) FROM persona where nombre = palabra GROUP BY (nombre) into contador;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mayoriaEdad` (IN `id` INT(3))   BEGIN

SELECT nombre, apellido1, YEAR(CURDATE())-YEAR(persona.fecha_nacimiento) + IF(DATE_FORMAT(CURDATE(),'%m-%d') >
 DATE_FORMAT(persona.fecha_nacimiento,'%m-%d'), 0 , -1 ) AS edad_actual, 
 CASE
  	WHEN YEAR(CURDATE())-YEAR(persona.fecha_nacimiento) + IF(DATE_FORMAT(CURDATE(),'%m-%d') > 
          DATE_FORMAT(persona.fecha_nacimiento,'%m-%d'), 0 , -1 ) > 18
 		THEN 'Eres mayor de edad'
 	ELSE 'Eres menor de edad'
 END
FROM persona WHERE id_alumno=id AND fecha_nacimiento IS NOT NULL AND fecha_nacimiento != '';

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `profes2` (IN `genero` CHAR, OUT `n_profes` INT)   begin
select count(sexo) from persona WHERE sexo = genero and tipo = 'profesor' GROUP BY(sexo) into n_profes; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `profes_1_pr` (IN `genero` CHAR)   begin
select count(id) as profes from persona where sexo = genero and tipo = 'profesor' GROUP BY sexo;
end$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `cuantosAnyos` (`id` INT(10)) RETURNS INT(11)  BEGIN
DECLARE resultado INT;
SELECT YEAR(CURDATE())-YEAR(persona.fecha_nacimiento) + IF(DATE_FORMAT(CURDATE(),'%m-%d') >
 DATE_FORMAT(persona.fecha_nacimiento,'%m-%d'), 0 , -1 ) AS edad_actual FROM persona WHERE id_alumno=id INTO resultado;
RETURN resultado;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `funcionPalabras` (`palabra` VARCHAR(40)) RETURNS INT(11)  BEGIN
DECLARE resultado int;
SELECT COUNT(nombre) FROM persona WHERE nombre = palabra INTO resultado;
RETURN resultado;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_se_matricula_asignatura`
--

CREATE TABLE `alumno_se_matricula_asignatura` (
  `id_alumno` int(10) UNSIGNED NOT NULL,
  `id_asignatura` int(10) UNSIGNED NOT NULL,
  `id_curso_escolar` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumno_se_matricula_asignatura`
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
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id_asignatura` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `creditos` float UNSIGNED NOT NULL,
  `id_tipo` int(3) NOT NULL,
  `curso` tinyint(3) UNSIGNED NOT NULL,
  `cuatrimestre` tinyint(3) UNSIGNED NOT NULL,
  `id_profesor` int(10) UNSIGNED DEFAULT NULL,
  `id_grado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id_asignatura`, `nombre`, `creditos`, `id_tipo`, `curso`, `cuatrimestre`, `id_profesor`, `id_grado`) VALUES
(1, 'Álgegra lineal y matemática discreta', 6, 1, 1, 1, 3, 4),
(2, 'Cálculo', 6, 1, 1, 1, 14, 4),
(3, 'Física para informática', 6, 1, 1, 1, 3, 4),
(4, 'Introducción a la programación', 6, 1, 1, 1, 14, 4),
(5, 'Organización y gestión de empresas', 6, 1, 1, 1, 3, 4),
(6, 'Estadística', 6, 1, 1, 2, 14, 4),
(7, 'Estructura y tecnología de computadores', 6, 1, 1, 2, 3, 4),
(8, 'Fundamentos de electrónica', 6, 1, 1, 2, 14, 4),
(9, 'Lógica y algorítmica', 6, 1, 1, 2, 3, 4),
(10, 'Metodología de la programación', 6, 1, 1, 2, 14, 4),
(11, 'Arquitectura de Computadores', 6, 1, 2, 1, 3, 4),
(12, 'Estructura de Datos y Algoritmos I', 6, 2, 2, 1, 3, 4),
(13, 'Ingeniería del Software', 6, 2, 2, 1, 14, 4),
(14, 'Sistemas Inteligentes', 6, 2, 2, 1, 3, 4),
(15, 'Sistemas Operativos', 6, 2, 2, 1, 14, 4),
(16, 'Bases de Datos', 6, 1, 2, 2, 14, 4),
(17, 'Estructura de Datos y Algoritmos II', 6, 2, 2, 2, 14, 4),
(18, 'Fundamentos de Redes de Computadores', 6, 2, 2, 2, 3, 4),
(19, 'Planificación y Gestión de Proyectos Informáticos', 6, 2, 2, 2, 3, 4),
(20, 'Programación de Servicios Software', 6, 2, 2, 2, 14, 4),
(21, 'Desarrollo de interfaces de usuario', 6, 2, 3, 1, 14, 4),
(22, 'Ingeniería de Requisitos', 6, 3, 3, 1, NULL, 4),
(23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 3, 3, 1, NULL, 4),
(24, 'Modelado y Diseño del Software 1', 6, 3, 3, 1, NULL, 4),
(25, 'Multiprocesadores', 6, 3, 3, 1, NULL, 4),
(26, 'Seguridad y cumplimiento normativo', 6, 3, 3, 1, NULL, 4),
(27, 'Sistema de Información para las Organizaciones', 6, 3, 3, 1, NULL, 4),
(28, 'Tecnologías web', 6, 3, 3, 1, NULL, 4),
(29, 'Teoría de códigos y criptografía', 6, 3, 3, 1, NULL, 4),
(30, 'Administración de bases de datos', 6, 3, 3, 2, NULL, 4),
(31, 'Herramientas y Métodos de Ingeniería del Software', 6, 3, 3, 2, NULL, 4),
(32, 'Informática industrial y robótica', 6, 3, 3, 2, NULL, 4),
(33, 'Ingeniería de Sistemas de Información', 6, 3, 3, 2, NULL, 4),
(34, 'Modelado y Diseño del Software 2', 6, 3, 3, 2, NULL, 4),
(35, 'Negocio Electrónico', 6, 3, 3, 2, NULL, 4),
(36, 'Periféricos e interfaces', 6, 3, 3, 2, NULL, 4),
(37, 'Sistemas de tiempo real', 6, 3, 3, 2, NULL, 4),
(38, 'Tecnologías de acceso a red', 6, 3, 3, 2, NULL, 4),
(39, 'Tratamiento digital de imágenes', 6, 3, 3, 2, NULL, 4),
(40, 'Administración de redes y sistemas operativos', 6, 3, 4, 1, NULL, 4),
(41, 'Almacenes de Datos', 6, 3, 4, 1, NULL, 4),
(42, 'Fiabilidad y Gestión de Riesgos', 6, 3, 4, 1, NULL, 4),
(43, 'Líneas de Productos Software', 6, 3, 4, 1, NULL, 4),
(44, 'Procesos de Ingeniería del Software 1', 6, 3, 4, 1, NULL, 4),
(45, 'Tecnologías multimedia', 6, 3, 4, 1, NULL, 4),
(46, 'Análisis y planificación de las TI', 6, 3, 4, 2, NULL, 4),
(47, 'Desarrollo Rápido de Aplicaciones', 6, 3, 4, 2, NULL, 4),
(48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 3, 4, 2, NULL, 4),
(49, 'Inteligencia del Negocio', 6, 3, 4, 2, NULL, 4),
(50, 'Procesos de Ingeniería del Software 2', 6, 3, 4, 2, NULL, 4),
(51, 'Seguridad Informática', 6, 3, 4, 2, NULL, 4),
(52, 'Biologia celular', 6, 1, 1, 1, NULL, 7),
(53, 'Física', 6, 1, 1, 1, NULL, 7),
(54, 'Matemáticas I', 6, 1, 1, 1, NULL, 7),
(55, 'Química general', 6, 1, 1, 1, NULL, 7),
(56, 'Química orgánica', 6, 1, 1, 1, NULL, 7),
(57, 'Biología vegetal y animal', 6, 1, 1, 2, NULL, 7),
(58, 'Bioquímica', 6, 1, 1, 2, NULL, 7),
(59, 'Genética', 6, 1, 1, 2, NULL, 7),
(60, 'Matemáticas II', 6, 1, 1, 2, NULL, 7),
(61, 'Microbiología', 6, 1, 1, 2, NULL, 7),
(62, 'Botánica agrícola', 6, 2, 2, 1, NULL, 7),
(63, 'Fisiología vegetal', 6, 2, 2, 1, NULL, 7),
(64, 'Genética molecular', 6, 2, 2, 1, NULL, 7),
(65, 'Ingeniería bioquímica', 6, 2, 2, 1, NULL, 7),
(66, 'Termodinámica y cinética química aplicada', 6, 2, 2, 1, NULL, 7),
(67, 'Biorreactores', 6, 2, 2, 2, NULL, 7),
(68, 'Biotecnología microbiana', 6, 2, 2, 2, NULL, 7),
(69, 'Ingeniería genética', 6, 2, 2, 2, NULL, 7),
(70, 'Inmunología', 6, 2, 2, 2, NULL, 7),
(71, 'Virología', 6, 2, 2, 2, NULL, 7),
(72, 'Bases moleculares del desarrollo vegetal', 4.5, 2, 3, 1, NULL, 7),
(73, 'Fisiología animal', 4.5, 2, 3, 1, NULL, 7),
(74, 'Metabolismo y biosíntesis de biomoléculas', 6, 2, 3, 1, NULL, 7),
(75, 'Operaciones de separación', 6, 2, 3, 1, NULL, 7),
(76, 'Patología molecular de plantas', 4.5, 2, 3, 1, NULL, 7),
(77, 'Técnicas instrumentales básicas', 4.5, 2, 3, 1, NULL, 7),
(78, 'Bioinformática', 4.5, 2, 3, 2, NULL, 7),
(79, 'Biotecnología de los productos hortofrutículas', 4.5, 2, 3, 2, NULL, 7),
(80, 'Biotecnología vegetal', 6, 2, 3, 2, NULL, 7),
(81, 'Genómica y proteómica', 4.5, 2, 3, 2, NULL, 7),
(82, 'Procesos biotecnológicos', 6, 2, 3, 2, NULL, 7),
(83, 'Técnicas instrumentales avanzadas', 4.5, 2, 3, 2, NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id_ciudad` int(10) NOT NULL,
  `nombre_ciudad` varchar(50) COLLATE utf8_roman_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `nombre_ciudad`) VALUES
(1, 'Almería'),
(2, 'Mataró');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_escolar`
--

CREATE TABLE `curso_escolar` (
  `id_curso_escolar` int(10) UNSIGNED NOT NULL,
  `anyo_inicio` year(4) NOT NULL,
  `anyo_fin` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `curso_escolar`
--

INSERT INTO `curso_escolar` (`id_curso_escolar`, `anyo_inicio`, `anyo_fin`) VALUES
(1, 2014, 2015),
(2, 2015, 2016),
(3, 2016, 2017),
(4, 2017, 2018),
(5, 2018, 2019);

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
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_alumno` int(10) UNSIGNED NOT NULL,
  `nif` varchar(9) DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `id_ciudad` int(10) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('H','M') NOT NULL,
  `tipo` enum('profesor','alumno') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_alumno`, `nif`, `nombre`, `apellido1`, `apellido2`, `id_ciudad`, `direccion`, `telefono`, `fecha_nacimiento`, `sexo`, `tipo`) VALUES
(1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 1, 'C/ Real del barrio alto', '950254837', '1991-03-28', 'H', 'alumno'),
(2, '89542419S', 'Juan', 'Saez', 'Vega', 1, 'C/ Mercurio', '618253876', '1992-08-08', 'H', 'alumno'),
(3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 1, 'C/ Marte', '618223876', '1979-08-19', 'M', 'profesor'),
(4, '17105885A', 'Pedro', 'Heller', 'Pagac', 1, 'C/ Estrella fugaz', NULL, '2000-10-05', 'H', 'alumno'),
(5, '38223286T', 'David', 'Schmidt', 'Fisher', 1, 'C/ Venus', '678516294', '1978-01-19', 'H', 'profesor'),
(6, '04233869Y', 'José', 'Koss', 'Bayer', 1, 'C/ Júpiter', '628349590', '1998-01-28', 'H', 'alumno'),
(7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 1, 'C/ Neptuno', NULL, '1999-05-24', 'H', 'alumno'),
(8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 1, 'C/ Saturno', '669162534', '1977-08-21', 'M', 'profesor'),
(9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 1, 'C/ Urano', '626351429', '1996-11-21', 'H', 'alumno'),
(10, '61142000L', 'Esther', 'Spencer', 'Lakin', 1, 'C/ Plutón', NULL, '1977-05-19', 'M', 'profesor'),
(11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 1, 'C/ Andarax', '679837625', '1997-04-26', 'H', 'alumno'),
(12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 1, 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor'),
(13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 1, 'C/ Guadalquivir', '950896725', '1980-02-01', 'H', 'profesor'),
(14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 1, 'C/ Duero', '950263514', '1977-01-02', 'H', 'profesor'),
(15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 1, 'C/ Tajo', '668726354', '1980-03-14', 'H', 'profesor'),
(16, '10485008K', 'Antonio', 'Fahey', 'Considine', 1, 'C/ Sierra de los Filabres', NULL, '1982-03-18', 'H', 'profesor'),
(17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 1, 'C/ Sierra de Gádor', NULL, '1973-05-05', 'H', 'profesor'),
(18, '04326833G', 'Micaela', 'Monahan', 'Murray', 1, 'C/ Veleta', '662765413', '1976-02-25', 'H', 'profesor'),
(19, '11578526G', 'Inma', 'Lakin', 'Yundt', 1, 'C/ Picos de Europa', '678652431', '1998-09-01', 'M', 'alumno'),
(20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 1, 'C/ Quinto pino', NULL, '1980-10-31', 'H', 'profesor'),
(21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 1, 'C/ Los pinos', '678652431', '1998-01-01', 'H', 'alumno'),
(22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 1, 'C/ Cabo de Gata', '626652498', '1999-02-11', 'H', 'alumno'),
(23, '64753215G', 'Irene', 'Hernández', 'Martínez', 1, 'C/ Zapillo', '628452384', '1996-03-12', 'M', 'alumno'),
(24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 1, 'C/ Mercurio', '678812017', '1995-04-13', 'M', 'alumno'),
(25, NULL, 'MARY', 'SMITH', NULL, 1, '', NULL, '2015-04-13', 'H', 'alumno'),
(26, NULL, 'PATRICIA', 'JOHNSON', NULL, 1, '', NULL, '2016-07-15', 'H', 'alumno'),
(27, NULL, 'LINDA', 'WILLIAMS', NULL, 1, '', NULL, '2017-10-01', 'H', 'alumno'),
(28, NULL, 'BARBARA', 'JONES', NULL, 1, '', NULL, '2018-04-13', 'H', 'alumno'),
(29, NULL, 'ELIZABETH', 'BROWN', NULL, 1, '', NULL, '2005-05-20', 'H', 'alumno'),
(30, NULL, 'JENNIFER', 'DAVIS', NULL, 1, '', NULL, '2006-08-02', 'H', 'alumno'),
(31, NULL, 'MARIA', 'MILLER', NULL, 1, '', NULL, '2007-01-18', 'H', 'alumno'),
(32, NULL, 'SUSAN', 'WILSON', NULL, 1, '', NULL, '2008-06-21', 'H', 'alumno'),
(33, NULL, 'MARGARET', 'MOORE', NULL, 1, '', NULL, '2009-04-11', 'H', 'alumno'),
(34, NULL, 'DOROTHY', 'TAYLOR', NULL, 1, '', NULL, '2010-03-02', 'H', 'alumno'),
(35, NULL, 'LISA', 'ANDERSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(36, NULL, 'NANCY', 'THOMAS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(37, NULL, 'KAREN', 'JACKSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(38, NULL, 'BETTY', 'WHITE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(39, NULL, 'HELEN', 'HARRIS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(40, NULL, 'SANDRA', 'MARTIN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(41, NULL, 'DONNA', 'THOMPSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(42, NULL, 'CAROL', 'GARCIA', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(43, NULL, 'RUTH', 'MARTINEZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(44, NULL, 'SHARON', 'ROBINSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(45, NULL, 'MICHELLE', 'CLARK', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(46, NULL, 'LAURA', 'RODRIGUEZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(47, NULL, 'SARAH', 'LEWIS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(48, NULL, 'KIMBERLY', 'LEE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(49, NULL, 'DEBORAH', 'WALKER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(50, NULL, 'JESSICA', 'HALL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(51, NULL, 'SHIRLEY', 'ALLEN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(52, NULL, 'CYNTHIA', 'YOUNG', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(53, NULL, 'ANGELA', 'HERNANDEZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(54, NULL, 'MELISSA', 'KING', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(55, NULL, 'BRENDA', 'WRIGHT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(56, NULL, 'AMY', 'LOPEZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(57, NULL, 'ANNA', 'HILL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(58, NULL, 'REBECCA', 'SCOTT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(59, NULL, 'VIRGINIA', 'GREEN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(60, NULL, 'KATHLEEN', 'ADAMS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(61, NULL, 'PAMELA', 'BAKER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(62, NULL, 'MARTHA', 'GONZALEZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(63, NULL, 'DEBRA', 'NELSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(64, NULL, 'AMANDA', 'CARTER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(65, NULL, 'STEPHANIE', 'MITCHELL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(66, NULL, 'CAROLYN', 'PEREZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(67, NULL, 'CHRISTINE', 'ROBERTS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(68, NULL, 'MARIE', 'TURNER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(69, NULL, 'JANET', 'PHILLIPS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(70, NULL, 'CATHERINE', 'CAMPBELL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(71, NULL, 'FRANCES', 'PARKER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(72, NULL, 'ANN', 'EVANS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(73, NULL, 'JOYCE', 'EDWARDS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(74, NULL, 'DIANE', 'COLLINS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(75, NULL, 'ALICE', 'STEWART', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(76, NULL, 'JULIE', 'SANCHEZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(77, NULL, 'HEATHER', 'MORRIS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(78, NULL, 'TERESA', 'ROGERS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(79, NULL, 'DORIS', 'REED', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(80, NULL, 'GLORIA', 'COOK', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(81, NULL, 'EVELYN', 'MORGAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(82, NULL, 'JEAN', 'BELL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(83, NULL, 'CHERYL', 'MURPHY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(84, NULL, 'MILDRED', 'BAILEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(85, NULL, 'KATHERINE', 'RIVERA', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(86, NULL, 'JOAN', 'COOPER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(87, NULL, 'ASHLEY', 'RICHARDSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(88, NULL, 'JUDITH', 'COX', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(89, NULL, 'ROSE', 'HOWARD', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(90, NULL, 'JANICE', 'WARD', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(91, NULL, 'KELLY', 'TORRES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(92, NULL, 'NICOLE', 'PETERSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(93, NULL, 'JUDY', 'GRAY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(94, NULL, 'CHRISTINA', 'RAMIREZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(95, NULL, 'KATHY', 'JAMES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(96, NULL, 'THERESA', 'WATSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(97, NULL, 'BEVERLY', 'BROOKS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(98, NULL, 'DENISE', 'KELLY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(99, NULL, 'TAMMY', 'SANDERS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(100, NULL, 'IRENE', 'PRICE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(101, NULL, 'JANE', 'BENNETT', NULL, 1, '', NULL, '0000-00-00', 'H', 'profesor'),
(102, NULL, 'LORI', 'WOOD', NULL, 1, '', NULL, '0000-00-00', 'H', 'profesor'),
(103, NULL, 'RACHEL', 'BARNES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(104, NULL, 'MARILYN', 'ROSS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(105, NULL, 'ANDREA', 'HENDERSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(106, NULL, 'KATHRYN', 'COLEMAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(107, NULL, 'LOUISE', 'JENKINS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(108, NULL, 'SARA', 'PERRY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(109, NULL, 'ANNE', 'POWELL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(110, NULL, 'JACQUELINE', 'LONG', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(111, NULL, 'WANDA', 'PATTERSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(112, NULL, 'BONNIE', 'HUGHES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(113, NULL, 'JULIA', 'FLORES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(114, NULL, 'RUBY', 'WASHINGTON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(115, NULL, 'LOIS', 'BUTLER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(116, NULL, 'TINA', 'SIMMONS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(117, NULL, 'PHYLLIS', 'FOSTER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(118, NULL, 'NORMA', 'GONZALES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(119, NULL, 'PAULA', 'BRYANT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(120, NULL, 'DIANA', 'ALEXANDER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(121, NULL, 'ANNIE', 'RUSSELL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(122, NULL, 'LILLIAN', 'GRIFFIN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(123, NULL, 'EMILY', 'DIAZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(124, NULL, 'ROBIN', 'HAYES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(125, NULL, 'PEGGY', 'MYERS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(126, NULL, 'CRYSTAL', 'FORD', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(127, NULL, 'GLADYS', 'HAMILTON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(128, NULL, 'RITA', 'GRAHAM', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(129, NULL, 'DAWN', 'SULLIVAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(130, NULL, 'CONNIE', 'WALLACE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(131, NULL, 'FLORENCE', 'WOODS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(132, NULL, 'TRACY', 'COLE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(133, NULL, 'EDNA', 'WEST', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(134, NULL, 'TIFFANY', 'JORDAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(135, NULL, 'CARMEN', 'OWENS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(136, NULL, 'ROSA', 'REYNOLDS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(137, NULL, 'CINDY', 'FISHER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(138, NULL, 'GRACE', 'ELLIS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(139, NULL, 'WENDY', 'HARRISON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(140, NULL, 'VICTORIA', 'GIBSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(141, NULL, 'EDITH', 'MCDONALD', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(142, NULL, 'KIM', 'CRUZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(143, NULL, 'SHERRY', 'MARSHALL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(144, NULL, 'SYLVIA', 'ORTIZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(145, NULL, 'JOSEPHINE', 'GOMEZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(146, NULL, 'THELMA', 'MURRAY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(147, NULL, 'SHANNON', 'FREEMAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(148, NULL, 'SHEILA', 'WELLS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(149, NULL, 'ETHEL', 'WEBB', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(150, NULL, 'ELLEN', 'SIMPSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(151, NULL, 'ELAINE', 'STEVENS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(152, NULL, 'MARJORIE', 'TUCKER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(153, NULL, 'CARRIE', 'PORTER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(154, NULL, 'CHARLOTTE', 'HUNTER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(155, NULL, 'MONICA', 'HICKS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(156, NULL, 'ESTHER', 'CRAWFORD', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(157, NULL, 'PAULINE', 'HENRY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(158, NULL, 'EMMA', 'BOYD', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(159, NULL, 'JUANITA', 'MASON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(160, NULL, 'ANITA', 'MORALES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(161, NULL, 'RHONDA', 'KENNEDY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(162, NULL, 'HAZEL', 'WARREN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(163, NULL, 'AMBER', 'DIXON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(164, NULL, 'EVA', 'RAMOS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(165, NULL, 'DEBBIE', 'REYES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(166, NULL, 'APRIL', 'BURNS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(167, NULL, 'LESLIE', 'GORDON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(168, NULL, 'CLARA', 'SHAW', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(169, NULL, 'LUCILLE', 'HOLMES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(170, NULL, 'JAMIE', 'RICE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(171, NULL, 'JOANNE', 'ROBERTSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(172, NULL, 'ELEANOR', 'HUNT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(173, NULL, 'VALERIE', 'BLACK', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(174, NULL, 'DANIELLE', 'DANIELS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(175, NULL, 'MEGAN', 'PALMER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(176, NULL, 'ALICIA', 'MILLS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(177, NULL, 'SUZANNE', 'NICHOLS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(178, NULL, 'MICHELE', 'GRANT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(179, NULL, 'GAIL', 'KNIGHT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(180, NULL, 'BERTHA', 'FERGUSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(181, NULL, 'DARLENE', 'ROSE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(182, NULL, 'VERONICA', 'STONE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(183, NULL, 'JILL', 'HAWKINS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(184, NULL, 'ERIN', 'DUNN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(185, NULL, 'GERALDINE', 'PERKINS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(186, NULL, 'LAUREN', 'HUDSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(187, NULL, 'CATHY', 'SPENCER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(188, NULL, 'JOANN', 'GARDNER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(189, NULL, 'LORRAINE', 'STEPHENS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(190, NULL, 'LYNN', 'PAYNE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(191, NULL, 'SALLY', 'PIERCE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(192, NULL, 'REGINA', 'BERRY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(193, NULL, 'ERICA', 'MATTHEWS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(194, NULL, 'BEATRICE', 'ARNOLD', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(195, NULL, 'DOLORES', 'WAGNER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(196, NULL, 'BERNICE', 'WILLIS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(197, NULL, 'AUDREY', 'RAY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(198, NULL, 'YVONNE', 'WATKINS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(199, NULL, 'ANNETTE', 'OLSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(200, NULL, 'JUNE', 'CARROLL', NULL, 1, '', NULL, '0000-00-00', 'H', 'profesor'),
(201, NULL, 'SAMANTHA', 'DUNCAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'profesor'),
(202, NULL, 'MARION', 'SNYDER', NULL, 1, '', NULL, '0000-00-00', 'H', 'profesor'),
(203, NULL, 'DANA', 'HART', NULL, 1, '', NULL, '0000-00-00', 'H', 'profesor'),
(204, NULL, 'STACY', 'CUNNINGHAM', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(205, NULL, 'ANA', 'BRADLEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(206, NULL, 'RENEE', 'LANE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(207, NULL, 'IDA', 'ANDREWS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(208, NULL, 'VIVIAN', 'RUIZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(209, NULL, 'ROBERTA', 'HARPER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(210, NULL, 'HOLLY', 'FOX', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(211, NULL, 'BRITTANY', 'RILEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(212, NULL, 'MELANIE', 'ARMSTRONG', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(213, NULL, 'LORETTA', 'CARPENTER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(214, NULL, 'YOLANDA', 'WEAVER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(215, NULL, 'JEANETTE', 'GREENE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(216, NULL, 'LAURIE', 'LAWRENCE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(217, NULL, 'KATIE', 'ELLIOTT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(218, NULL, 'KRISTEN', 'CHAVEZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(219, NULL, 'VANESSA', 'SIMS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(220, NULL, 'ALMA', 'AUSTIN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(221, NULL, 'SUE', 'PETERS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(222, NULL, 'ELSIE', 'KELLEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(223, NULL, 'BETH', 'FRANKLIN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(224, NULL, 'JEANNE', 'LAWSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(225, NULL, 'VICKI', 'FIELDS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(226, NULL, 'CARLA', 'GUTIERREZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(227, NULL, 'TARA', 'RYAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(228, NULL, 'ROSEMARY', 'SCHMIDT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(229, NULL, 'EILEEN', 'CARR', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(230, NULL, 'TERRI', 'VASQUEZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(231, NULL, 'GERTRUDE', 'CASTILLO', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(232, NULL, 'LUCY', 'WHEELER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(233, NULL, 'TONYA', 'CHAPMAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(234, NULL, 'ELLA', 'OLIVER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(235, NULL, 'STACEY', 'MONTGOMERY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(236, NULL, 'WILMA', 'RICHARDS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(237, NULL, 'GINA', 'WILLIAMSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(238, NULL, 'KRISTIN', 'JOHNSTON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(239, NULL, 'JESSIE', 'BANKS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(240, NULL, 'NATALIE', 'MEYER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(241, NULL, 'AGNES', 'BISHOP', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(242, NULL, 'VERA', 'MCCOY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(243, NULL, 'WILLIE', 'HOWELL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(244, NULL, 'CHARLENE', 'ALVAREZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(245, NULL, 'BESSIE', 'MORRISON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(246, NULL, 'DELORES', 'HANSEN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(247, NULL, 'MELINDA', 'FERNANDEZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(248, NULL, 'PEARL', 'GARZA', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(249, NULL, 'ARLENE', 'HARVEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(250, NULL, 'MAUREEN', 'LITTLE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(251, NULL, 'COLLEEN', 'BURTON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(252, NULL, 'ALLISON', 'STANLEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(253, NULL, 'TAMARA', 'NGUYEN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(254, NULL, 'JOY', 'GEORGE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(255, NULL, 'GEORGIA', 'JACOBS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(256, NULL, 'CONSTANCE', 'REID', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(257, NULL, 'LILLIE', 'KIM', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(258, NULL, 'CLAUDIA', 'FULLER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(259, NULL, 'JACKIE', 'LYNCH', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(260, NULL, 'MARCIA', 'DEAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(261, NULL, 'TANYA', 'GILBERT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(262, NULL, 'NELLIE', 'GARRETT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(263, NULL, 'MINNIE', 'ROMERO', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(264, NULL, 'MARLENE', 'WELCH', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(265, NULL, 'HEIDI', 'LARSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(266, NULL, 'GLENDA', 'FRAZIER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(267, NULL, 'LYDIA', 'BURKE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(268, NULL, 'VIOLA', 'HANSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(269, NULL, 'COURTNEY', 'DAY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(270, NULL, 'MARIAN', 'MENDOZA', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(271, NULL, 'STELLA', 'MORENO', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(272, NULL, 'CAROLINE', 'BOWMAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(273, NULL, 'DORA', 'MEDINA', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(274, NULL, 'JO', 'FOWLER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(275, NULL, 'VICKIE', 'BREWER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(276, NULL, 'MATTIE', 'HOFFMAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(277, NULL, 'TERRY', 'CARLSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(278, NULL, 'MAXINE', 'SILVA', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(279, NULL, 'IRMA', 'PEARSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(280, NULL, 'MABEL', 'HOLLAND', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(281, NULL, 'MARSHA', 'DOUGLAS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(282, NULL, 'MYRTLE', 'FLEMING', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(283, NULL, 'LENA', 'JENSEN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(284, NULL, 'CHRISTY', 'VARGAS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(285, NULL, 'DEANNA', 'BYRD', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(286, NULL, 'PATSY', 'DAVIDSON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(287, NULL, 'HILDA', 'HOPKINS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(288, NULL, 'GWENDOLYN', 'MAY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(289, NULL, 'JENNIE', 'TERRY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(290, NULL, 'NORA', 'HERRERA', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(291, NULL, 'MARGIE', 'WADE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(292, NULL, 'NINA', 'SOTO', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(293, NULL, 'CASSANDRA', 'WALTERS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(294, NULL, 'LEAH', 'CURTIS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(295, NULL, 'PENNY', 'NEAL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(296, NULL, 'KAY', 'CALDWELL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(297, NULL, 'PRISCILLA', 'LOWE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(298, NULL, 'NAOMI', 'JENNINGS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(299, NULL, 'CAROLE', 'BARNETT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(300, NULL, 'BRANDY', 'GRAVES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(301, NULL, 'OLGA', 'JIMENEZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(302, NULL, 'BILLIE', 'HORTON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(303, NULL, 'DIANNE', 'SHELTON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(304, NULL, 'TRACEY', 'BARRETT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(305, NULL, 'LEONA', 'OBRIEN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(306, NULL, 'JENNY', 'CASTRO', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(307, NULL, 'FELICIA', 'SUTTON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(308, NULL, 'SONIA', 'GREGORY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(309, NULL, 'MIRIAM', 'MCKINNEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(310, NULL, 'VELMA', 'LUCAS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(311, NULL, 'BECKY', 'MILES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(312, NULL, 'BOBBIE', 'CRAIG', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(313, NULL, 'VIOLET', 'RODRIQUEZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(314, NULL, 'KRISTINA', 'CHAMBERS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(315, NULL, 'TONI', 'HOLT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(316, NULL, 'MISTY', 'LAMBERT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(317, NULL, 'MAE', 'FLETCHER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(318, NULL, 'SHELLY', 'WATTS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(319, NULL, 'DAISY', 'BATES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(320, NULL, 'RAMONA', 'HALE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(321, NULL, 'SHERRI', 'RHODES', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(322, NULL, 'ERIKA', 'PENA', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(323, NULL, 'JAMES', 'GANNON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(324, NULL, 'JOHN', 'FARNSWORTH', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(325, NULL, 'ROBERT', 'BAUGHMAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(326, NULL, 'MICHAEL', 'SILVERMAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(327, NULL, 'WILLIAM', 'SATTERFIELD', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(328, NULL, 'DAVID', 'ROYAL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(329, NULL, 'RICHARD', 'MCCRARY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(330, NULL, 'CHARLES', 'KOWALSKI', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(331, NULL, 'JOSEPH', 'JOY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(332, NULL, 'THOMAS', 'GRIGSBY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(333, NULL, 'CHRISTOPHER', 'GRECO', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(334, NULL, 'DANIEL', 'CABRAL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(335, NULL, 'PAUL', 'TROUT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(336, NULL, 'MARK', 'RINEHART', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(337, NULL, 'DONALD', 'MAHON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(338, NULL, 'GEORGE', 'LINTON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(339, NULL, 'KENNETH', 'GOODEN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(340, NULL, 'STEVEN', 'CURLEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(341, NULL, 'EDWARD', 'BAUGH', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(342, NULL, 'BRIAN', 'WYMAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(343, NULL, 'RONALD', 'WEINER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(344, NULL, 'ANTHONY', 'SCHWAB', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(345, NULL, 'KEVIN', 'SCHULER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(346, NULL, 'JASON', 'MORRISSEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(347, NULL, 'MATTHEW', 'MAHAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(348, NULL, 'GARY', 'COY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(349, NULL, 'TIMOTHY', 'BUNN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(350, NULL, 'JOSE', 'ANDREW', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(351, NULL, 'LARRY', 'THRASHER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(352, NULL, 'JEFFREY', 'SPEAR', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(353, NULL, 'FRANK', 'WAGGONER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(354, NULL, 'SCOTT', 'SHELLEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(355, NULL, 'ERIC', 'ROBERT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(356, NULL, 'STEPHEN', 'QUALLS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(357, NULL, 'ANDREW', 'PURDY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(358, NULL, 'RAYMOND', 'MCWHORTER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(359, NULL, 'GREGORY', 'MAULDIN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(360, NULL, 'JOSHUA', 'MARK', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(361, NULL, 'JERRY', 'JORDON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(362, NULL, 'DENNIS', 'GILMAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(363, NULL, 'WALTER', 'PERRYMAN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(364, NULL, 'PATRICK', 'NEWSOM', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(365, NULL, 'PETER', 'MENARD', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(366, NULL, 'HAROLD', 'MARTINO', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(367, NULL, 'DOUGLAS', 'GRAF', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(368, NULL, 'HENRY', 'BILLINGSLEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(369, NULL, 'CARL', 'ARTIS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(370, NULL, 'ARTHUR', 'SIMPKINS', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(371, NULL, 'RYAN', 'SALISBURY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(372, NULL, 'ROGER', 'QUINTANILLA', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(373, NULL, 'JOE', 'GILLILAND', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(374, NULL, 'JUAN', 'FRALEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(375, NULL, 'JACK', 'FOUST', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(376, NULL, 'ALBERT', 'CROUSE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(377, NULL, 'JONATHAN', 'SCARBOROUGH', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(378, NULL, 'JUSTIN', 'NGO', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(379, NULL, 'TERRY', 'GRISSOM', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(380, NULL, 'GERALD', 'FULTZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(381, NULL, 'KEITH', 'RICO', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(382, NULL, 'SAMUEL', 'MARLOW', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(383, NULL, 'WILLIE', 'MARKHAM', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(384, NULL, 'RALPH', 'MADRIGAL', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(385, NULL, 'LAWRENCE', 'LAWTON', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(386, NULL, 'NICHOLAS', 'BARFIELD', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(387, NULL, 'ROY', 'WHITING', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(388, NULL, 'BENJAMIN', 'VARNEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(389, NULL, 'BRUCE', 'SCHWARZ', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(390, NULL, 'BRANDON', 'HUEY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(391, NULL, 'ADAM', 'GOOCH', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(392, NULL, 'HARRY', 'ARCE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(393, NULL, 'FRED', 'WHEAT', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(394, NULL, 'WAYNE', 'TRUONG', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(395, NULL, 'BILLY', 'POULIN', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(396, NULL, 'STEVE', 'MACKENZIE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(397, NULL, 'LOUIS', 'LEONE', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(398, NULL, 'JEREMY', 'HURTADO', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(399, NULL, 'AARON', 'SELBY', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(400, NULL, 'RANDY', 'GAITHER', NULL, 1, '', NULL, '0000-00-00', 'H', 'alumno'),
(401, NULL, 'HOWARD', 'FORTNER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(402, NULL, 'EUGENE', 'CULPEPPER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(403, NULL, 'CARLOS', 'COUGHLIN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(404, NULL, 'RUSSELL', 'BRINSON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(405, NULL, 'BOBBY', 'BOUDREAU', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(406, NULL, 'VICTOR', 'BARKLEY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(407, NULL, 'MARTIN', 'BALES', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(408, NULL, 'ERNEST', 'STEPP', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(409, NULL, 'PHILLIP', 'HOLM', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(410, NULL, 'TODD', 'TAN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(411, NULL, 'JESSE', 'SCHILLING', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(412, NULL, 'CRAIG', 'MORRELL', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(413, NULL, 'ALAN', 'KAHN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(414, NULL, 'SHAWN', 'HEATON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(415, NULL, 'CLARENCE', 'GAMEZ', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(416, NULL, 'SEAN', 'DOUGLASS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(417, NULL, 'PHILIP', 'CAUSEY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(418, NULL, 'CHRIS', 'BROTHERS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(419, NULL, 'JOHNNY', 'TURPIN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(420, NULL, 'EARL', 'SHANKS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(421, NULL, 'JIMMY', 'SCHRADER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(422, NULL, 'ANTONIO', 'MEEK', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(423, NULL, 'DANNY', 'ISOM', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(424, NULL, 'BRYAN', 'HARDISON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(425, NULL, 'TONY', 'CARRANZA', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(426, NULL, 'LUIS', 'YANEZ', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(427, NULL, 'MIKE', 'WAY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(428, NULL, 'STANLEY', 'SCROGGINS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(429, NULL, 'LEONARD', 'SCHOFIELD', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(430, NULL, 'NATHAN', 'RUNYON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(431, NULL, 'DALE', 'RATCLIFF', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(432, NULL, 'MANUEL', 'MURRELL', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(433, NULL, 'RODNEY', 'MOELLER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(434, NULL, 'CURTIS', 'IRBY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(435, NULL, 'NORMAN', 'CURRIER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(436, NULL, 'ALLEN', 'BUTTERFIELD', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(437, NULL, 'MARVIN', 'YEE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(438, NULL, 'VINCENT', 'RALSTON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(439, NULL, 'GLENN', 'PULLEN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(440, NULL, 'JEFFERY', 'PINSON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(441, NULL, 'TRAVIS', 'ESTEP', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(442, NULL, 'JEFF', 'EAST', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(443, NULL, 'CHAD', 'CARBONE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(444, NULL, 'JACOB', 'LANCE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(445, NULL, 'LEE', 'HAWKS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(446, NULL, 'MELVIN', 'ELLINGTON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(447, NULL, 'ALFRED', 'CASILLAS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(448, NULL, 'KYLE', 'SPURLOCK', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(449, NULL, 'FRANCIS', 'SIKES', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(450, NULL, 'BRADLEY', 'MOTLEY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(451, NULL, 'JESUS', 'MCCARTNEY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(452, NULL, 'HERBERT', 'KRUGER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(453, NULL, 'FREDERICK', 'ISBELL', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(454, NULL, 'RAY', 'HOULE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(455, NULL, 'JOEL', 'FRANCISCO', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(456, NULL, 'EDWIN', 'BURK', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(457, NULL, 'DON', 'BONE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(458, NULL, 'EDDIE', 'TOMLIN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(459, NULL, 'RICKY', 'SHELBY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(460, NULL, 'TROY', 'QUIGLEY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(461, NULL, 'RANDALL', 'NEUMANN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(462, NULL, 'BARRY', 'LOVELACE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(463, NULL, 'ALEXANDER', 'FENNELL', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(464, NULL, 'BERNARD', 'COLBY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(465, NULL, 'MARIO', 'CHEATHAM', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(466, NULL, 'LEROY', 'BUSTAMANTE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(467, NULL, 'FRANCISCO', 'SKIDMORE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(468, NULL, 'MARCUS', 'HIDALGO', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(469, NULL, 'MICHEAL', 'FORMAN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(470, NULL, 'THEODORE', 'CULP', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(471, NULL, 'CLIFFORD', 'BOWENS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(472, NULL, 'MIGUEL', 'BETANCOURT', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(473, NULL, 'OSCAR', 'AQUINO', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(474, NULL, 'JAY', 'ROBB', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(475, NULL, 'JIM', 'REA', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(476, NULL, 'TOM', 'MILNER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(477, NULL, 'CALVIN', 'MARTEL', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(478, NULL, 'ALEX', 'GRESHAM', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(479, NULL, 'JON', 'WILES', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(480, NULL, 'RONNIE', 'RICKETTS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(481, NULL, 'BILL', 'GAVIN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(482, NULL, 'LLOYD', 'DOWD', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(483, NULL, 'TOMMY', 'COLLAZO', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(484, NULL, 'LEON', 'BOSTIC', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(485, NULL, 'DEREK', 'BLAKELY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(486, NULL, 'WARREN', 'SHERROD', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(487, NULL, 'DARRELL', 'POWER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(488, NULL, 'JEROME', 'KENYON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(489, NULL, 'FLOYD', 'GANDY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(490, NULL, 'LEO', 'EBERT', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(491, NULL, 'ALVIN', 'DELOACH', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(492, NULL, 'TIM', 'CARY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(493, NULL, 'WESLEY', 'BULL', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(494, NULL, 'GORDON', 'ALLARD', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(495, NULL, 'DEAN', 'SAUER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(496, NULL, 'GREG', 'ROBINS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(497, NULL, 'JORGE', 'OLIVARES', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(498, NULL, 'DUSTIN', 'GILLETTE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(499, NULL, 'PEDRO', 'CHESTNUT', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(500, NULL, 'DERRICK', 'BOURQUE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(501, NULL, 'DAN', 'PAINE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(502, NULL, 'LEWIS', 'LYMAN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(503, NULL, 'ZACHARY', 'HITE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(504, NULL, 'COREY', 'HAUSER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(505, NULL, 'HERMAN', 'DEVORE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(506, NULL, 'MAURICE', 'CRAWLEY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(507, NULL, 'VERNON', 'CHAPA', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(508, NULL, 'ROBERTO', 'VU', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(509, NULL, 'CLYDE', 'TOBIAS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(510, NULL, 'GLEN', 'TALBERT', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(511, NULL, 'HECTOR', 'POINDEXTER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(512, NULL, 'SHANE', 'MILLARD', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(513, NULL, 'RICARDO', 'MEADOR', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(514, NULL, 'SAM', 'MCDUFFIE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(515, NULL, 'RICK', 'MATTOX', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(516, NULL, 'LESTER', 'KRAUS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(517, NULL, 'BRENT', 'HARKINS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(518, NULL, 'RAMON', 'CHOATE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(519, NULL, 'CHARLIE', 'BESS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(520, NULL, 'TYLER', 'WREN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(521, NULL, 'GILBERT', 'SLEDGE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(522, NULL, 'GENE', 'SANBORN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(523, NULL, 'MARC', 'OUTLAW', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(524, NULL, 'REGINALD', 'KINDER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(525, NULL, 'RUBEN', 'GEARY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(526, NULL, 'BRETT', 'CORNWELL', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(527, NULL, 'ANGEL', 'BARCLAY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(528, NULL, 'NATHANIEL', 'ADAM', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(529, NULL, 'RAFAEL', 'ABNEY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(530, NULL, 'LESLIE', 'SEWARD', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(531, NULL, 'EDGAR', 'RHOADS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(532, NULL, 'MILTON', 'HOWLAND', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(533, NULL, 'RAUL', 'FORTIER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(534, NULL, 'BEN', 'EASTER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(535, NULL, 'CHESTER', 'BENNER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(536, NULL, 'CECIL', 'VINES', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(537, NULL, 'DUANE', 'TUBBS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(538, NULL, 'FRANKLIN', 'TROUTMAN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(539, NULL, 'ANDRE', 'RAPP', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(540, NULL, 'ELMER', 'NOE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(541, NULL, 'BRAD', 'MCCURDY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(542, NULL, 'GABRIEL', 'HARDER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(543, NULL, 'RON', 'DELUCA', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(544, NULL, 'MITCHELL', 'WESTMORELAND', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(545, NULL, 'ROLAND', 'SOUTH', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(546, NULL, 'ARNOLD', 'HAVENS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(547, NULL, 'HARVEY', 'GUAJARDO', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(548, NULL, 'JARED', 'ELY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(549, NULL, 'ADRIAN', 'CLARY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(550, NULL, 'KARL', 'SEAL', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(551, NULL, 'CORY', 'MEEHAN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(552, NULL, 'CLAUDE', 'HERZOG', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(553, NULL, 'ERIK', 'GUILLEN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(554, NULL, 'DARRYL', 'ASHCRAFT', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(555, NULL, 'JAMIE', 'WAUGH', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(556, NULL, 'NEIL', 'RENNER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(557, NULL, 'JESSIE', 'MILAM', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(558, NULL, 'CHRISTIAN', 'JUNG', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(559, NULL, 'JAVIER', 'ELROD', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(560, NULL, 'FERNANDO', 'CHURCHILL', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(561, NULL, 'CLINTON', 'BUFORD', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(562, NULL, 'TED', 'BREAUX', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(563, NULL, 'MATHEW', 'BOLIN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(564, NULL, 'TYRONE', 'ASHER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(565, NULL, 'DARREN', 'WINDHAM', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(566, NULL, 'LONNIE', 'TIRADO', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(567, NULL, 'LANCE', 'PEMBERTON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(568, NULL, 'CODY', 'NOLEN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(569, NULL, 'JULIO', 'NOLAND', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(570, NULL, 'KELLY', 'KNOTT', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(571, NULL, 'KURT', 'EMMONS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(572, NULL, 'ALLAN', 'CORNISH', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(573, NULL, 'NELSON', 'CHRISTENSON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(574, NULL, 'GUY', 'BROWNLEE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(575, NULL, 'CLAYTON', 'BARBEE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(576, NULL, 'HUGH', 'WALDROP', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(577, NULL, 'MAX', 'PITT', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(578, NULL, 'DWAYNE', 'OLVERA', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(579, NULL, 'DWIGHT', 'LOMBARDI', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(580, NULL, 'ARMANDO', 'GRUBER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(581, NULL, 'FELIX', 'GAFFNEY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(582, NULL, 'JIMMIE', 'EGGLESTON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(583, NULL, 'EVERETT', 'BANDA', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(584, NULL, 'JORDAN', 'ARCHULETA', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(585, NULL, 'IAN', 'STILL', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(586, NULL, 'WALLACE', 'SLONE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(587, NULL, 'KEN', 'PREWITT', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(588, NULL, 'BOB', 'PFEIFFER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(589, NULL, 'JAIME', 'NETTLES', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(590, NULL, 'CASEY', 'MENA', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(591, NULL, 'ALFREDO', 'MCADAMS', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(592, NULL, 'ALBERTO', 'HENNING', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(593, NULL, 'DAVE', 'GARDINER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(594, NULL, 'IVAN', 'CROMWELL', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(595, NULL, 'JOHNNIE', 'CHISHOLM', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(596, NULL, 'SIDNEY', 'BURLESON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(597, NULL, 'BYRON', 'BOX', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(598, NULL, 'JULIAN', 'VEST', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(599, NULL, 'ISAAC', 'OGLESBY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(600, NULL, 'MORRIS', 'MCCARTER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(601, NULL, 'CLIFTON', 'MALCOLM', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(602, NULL, 'WILLARD', 'LUMPKIN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(603, NULL, 'DARYL', 'LARUE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(604, NULL, 'ROSS', 'GREY', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(605, NULL, 'VIRGIL', 'WOFFORD', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(606, NULL, 'ANDY', 'VANHORN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(607, NULL, 'MARSHALL', 'THORN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(608, NULL, 'SALVADOR', 'TEEL', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(609, NULL, 'PERRY', 'SWAFFORD', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(610, NULL, 'KIRK', 'STCLAIR', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(611, NULL, 'SERGIO', 'STANFIELD', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(612, NULL, 'MARION', 'OCAMPO', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(613, NULL, 'TRACY', 'HERRMANN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(614, NULL, 'SETH', 'HANNON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(615, NULL, 'KENT', 'ARSENAULT', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(616, NULL, 'TERRANCE', 'ROUSH', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(617, NULL, 'RENE', 'MCALISTER', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(618, NULL, 'EDUARDO', 'HIATT', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(619, NULL, 'TERRENCE', 'GUNDERSON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(620, NULL, 'ENRIQUE', 'FORSYTHE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(621, NULL, 'FREDDIE', 'DUGGAN', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(622, NULL, 'WADE', 'DELVALLE', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(623, NULL, 'AUSTIN', 'CINTRON', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno');
INSERT INTO `persona` (`id_alumno`, `nif`, `nombre`, `apellido1`, `apellido2`, `id_ciudad`, `direccion`, `telefono`, `fecha_nacimiento`, `sexo`, `tipo`) VALUES
(624, NULL, 'PEPE', 'LÓPEZ', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno'),
(625, NULL, 'MARÍA', 'SÁNCHEZ', NULL, 1, '', NULL, '0000-00-00', 'M', 'alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` int(10) UNSIGNED NOT NULL,
  `id_departamento` int(10) UNSIGNED NOT NULL,
  `nif` varchar(9) DEFAULT NULL,
  `nombre_profesor` varchar(25) NOT NULL,
  `apellido1_profesor` varchar(50) NOT NULL,
  `apellido2_profesor` varchar(50) DEFAULT NULL,
  `id_ciudad` int(10) NOT NULL,
  `direccion_profesor` varchar(50) NOT NULL,
  `telefono_profesor` varchar(9) DEFAULT NULL,
  `nacimiento_profesor` date NOT NULL DEFAULT current_timestamp(),
  `sexo_profesor` enum('H','M') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `id_departamento`, `nif`, `nombre_profesor`, `apellido1_profesor`, `apellido2_profesor`, `id_ciudad`, `direccion_profesor`, `telefono_profesor`, `nacimiento_profesor`, `sexo_profesor`) VALUES
(3, 1, '11105554G', 'Zoe', 'Ramirez', 'Gea', 1, 'C/ Marte', '618223876', '1979-08-19', 'M'),
(5, 2, '38223286T', 'David', 'Schmidt', 'Fisher', 1, 'C/ Venus', '678516294', '1978-01-19', 'H'),
(8, 3, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 1, 'C/ Saturno', '669162534', '1977-08-21', 'M'),
(10, 4, '61142000L', 'Esther', 'Spencer', 'Lakin', 1, 'C/ Plutón', NULL, '1977-05-19', 'M'),
(12, 4, '85366986W', 'Carmen', 'Streich', 'Hirthe', 1, 'C/ Almanzora', NULL, '1971-04-29', 'M'),
(13, 6, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 1, 'C/ Guadalquivir', '950896725', '1980-02-01', 'H'),
(14, 1, '82937751G', 'Manolo', 'Hamill', 'Kozey', 1, 'C/ Duero', '950263514', '1977-01-02', 'H'),
(15, 2, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 1, 'C/ Tajo', '668726354', '1980-03-14', 'H'),
(16, 3, '10485008K', 'Antonio', 'Fahey', 'Considine', 1, 'C/ Sierra de los Filabres', NULL, '1982-03-18', 'H'),
(17, 4, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 1, 'C/ Sierra de Gádor', NULL, '1973-05-05', 'H'),
(18, 5, '04326833G', 'Micaela', 'Monahan', 'Murray', 1, 'C/ Veleta', '662765413', '1976-02-25', 'H'),
(20, 6, '79221403L', 'Francesca', 'Schowalter', 'Muller', 1, 'C/ Quinto pino', NULL, '1980-10-31', 'H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_asignatura`
--

CREATE TABLE `tipo_asignatura` (
  `id_tipo` int(3) NOT NULL,
  `tipo` enum('obligatoria','básica','optativa') COLLATE utf8_roman_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Volcado de datos para la tabla `tipo_asignatura`
--

INSERT INTO `tipo_asignatura` (`id_tipo`, `tipo`) VALUES
(1, 'básica'),
(2, 'obligatoria'),
(3, 'optativa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno_se_matricula_asignatura`
--
ALTER TABLE `alumno_se_matricula_asignatura`
  ADD PRIMARY KEY (`id_alumno`,`id_asignatura`,`id_curso_escolar`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_curso_escolar` (`id_curso_escolar`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asignatura`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `id_grado` (`id_grado`),
  ADD KEY `tipo` (`id_tipo`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `curso_escolar`
--
ALTER TABLE `curso_escolar`
  ADD PRIMARY KEY (`id_curso_escolar`);

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
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_alumno`),
  ADD UNIQUE KEY `nif` (`nif`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `tipo_asignatura`
--
ALTER TABLE `tipo_asignatura`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id_asignatura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id_ciudad` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `curso_escolar`
--
ALTER TABLE `curso_escolar`
  MODIFY `id_curso_escolar` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_alumno` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1048;

--
-- AUTO_INCREMENT de la tabla `tipo_asignatura`
--
ALTER TABLE `tipo_asignatura`
  MODIFY `id_tipo` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno_se_matricula_asignatura`
--
ALTER TABLE `alumno_se_matricula_asignatura`
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `persona` (`id_alumno`),
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_3` FOREIGN KEY (`id_curso_escolar`) REFERENCES `curso_escolar` (`id_curso_escolar`);

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`),
  ADD CONSTRAINT `asignatura_ibfk_2` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`),
  ADD CONSTRAINT `asignatura_ibfk_3` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_asignatura` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `persona` (`id_alumno`),
  ADD CONSTRAINT `profesor_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`),
  ADD CONSTRAINT `profesor_ibfk_3` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
