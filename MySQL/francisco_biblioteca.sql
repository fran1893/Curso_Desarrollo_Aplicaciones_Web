-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2022 a las 20:37:14
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
-- Base de datos: `francisco_biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `id_autor` int(5) NOT NULL,
  `nombre_autor` varchar(40) COLLATE utf8_roman_ci NOT NULL,
  `apellido_autor` varchar(60) COLLATE utf8_roman_ci NOT NULL,
  `pseudonimo_autor` varchar(100) COLLATE utf8_roman_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id_autor`, `nombre_autor`, `apellido_autor`, `pseudonimo_autor`) VALUES
(1, 'José María', 'García López', ''),
(3, 'Marta', 'Abelló', ''),
(5, 'Enric Arthur', 'Blair', 'George Orwell'),
(6, 'Joanne', 'Rowling', 'J. K. Rowling'),
(7, 'Stephen Edwin', 'King', 'Richard Bachman'),
(8, 'Charles', 'Lutwidge', 'Lewis Carroll'),
(9, 'Mohammed', 'Moulessehoul', 'Yasmina Khadra'),
(10, 'Agatha Mary Clarissa', 'Miller', 'Agatha Christie'),
(11, 'Erika Leonard', 'Mitchell', 'E.L.James'),
(12, 'Francisco de Paula', 'Fernández González', 'Blue Jeans');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id_ciudad` int(5) NOT NULL,
  `nombre_ciudad` varchar(11) COLLATE utf8_roman_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `nombre_ciudad`) VALUES
(1, 'Barcelona'),
(2, 'Madrid'),
(3, 'Carol Sur'),
(4, 'New York');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE `editoriales` (
  `id_editorial` int(5) NOT NULL,
  `nombre_editorial` varchar(40) COLLATE utf8_roman_ci NOT NULL,
  `id_ciudad` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Volcado de datos para la tabla `editoriales`
--

INSERT INTO `editoriales` (`id_editorial`, `nombre_editorial`, `id_ciudad`) VALUES
(1, 'Editorial Planeta', 1),
(2, 'Nocturna Ediciones', 2),
(3, 'CreateSpace', 3),
(4, 'Penguin Random House', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(5) NOT NULL,
  `titulo_libro` varchar(100) COLLATE utf8_roman_ci NOT NULL,
  `id_autor` int(5) NOT NULL,
  `id_editorial` int(5) NOT NULL,
  `any_editorial` year(4) NOT NULL,
  `descripcion_libro` text COLLATE utf8_roman_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `titulo_libro`, `id_autor`, `id_editorial`, `any_editorial`, `descripcion_libro`) VALUES
(1, 'Los crímenes de Chopin', 12, 1, 2022, 'Intriga, misterio, amor y crímenes son la base de esta novela ambientada en las enigmáticas calles de Sevilla, en la que el lector formará parte de la investigación. ¿Conseguirás adivinar quién es el culpable?'),
(2, 'El corazón de la piedra', 1, 2, 1914, 'Novela ambientada en la Europa de los siglos XVI y XVII, teniendo como figuras centrales a la archiduquesa Margarita (hija de Maximiliano II) y al músico castellano Tomás Luis de Victoria.'),
(3, 'Casa Oscura: Y otros relatos de terror', 3, 3, 2016, 'Estás a punto de entrar en la Casa Oscura, ahí donde habitan las sombras. Pero antes de cruzar el umbral recuerda que:\"Los monstruos son reales y los fantasmas son reales también. Viven dentro de nosotros y a veces ellos ganan\".Stephen King'),
(4, '1984', 5, 4, 2013, 'La novela \"1984\" habla de una sociedad en la que se adultera la historia de acuerdo a la conveniencia del partido único gobernante. Las tiranías intentan hacer imposible entender el mundo real y buscan sustituirlo con fantasmas y mentiras.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_prestamo` int(5) NOT NULL,
  `id_usuario` int(5) NOT NULL,
  `id_libro` int(5) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(5) NOT NULL,
  `nombre_usuario` varchar(40) COLLATE utf8_roman_ci NOT NULL,
  `apellido_usuario` varchar(60) COLLATE utf8_roman_ci NOT NULL,
  `email_usuario` varchar(160) COLLATE utf8_roman_ci NOT NULL,
  `num_consultas` int(5) NOT NULL DEFAULT 0,
  `num_prestamos` int(5) NOT NULL DEFAULT 0,
  `num_dias_falta` int(5) NOT NULL DEFAULT 0,
  `fecha_alta` date NOT NULL DEFAULT current_timestamp(),
  `bloqueo_usuario` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apellido_usuario`, `email_usuario`, `num_consultas`, `num_prestamos`, `num_dias_falta`, `fecha_alta`, `bloqueo_usuario`) VALUES
(1, 'Bill', 'Gates', 'bill.gates@gmail.com', 12, 5, 0, '2022-10-03', 0),
(2, 'Jeff', 'Bezos', 'jeff.bezos@gmail.com', 1, 5, 5, '2022-10-03', 0),
(3, 'Goku', 'Saiyan', 'dragon.ball@outlook.com', 10, 6, 0, '2022-10-03', 0),
(4, 'Francisco', 'Diaz', 'diazsalerno@hotmail.com', 7, 20, 0, '2022-10-03', 0),
(5, 'Fernando', 'Alonso', 'f1.nando@gmail.com', 10, 7, 2, '2022-10-03', 0),
(6, 'Alisson', 'Becker', 'abecker1@hotmail.com', 9, 15, 6, '2022-10-03', 0),
(7, 'Lionel', 'Messi', 'barça10@gmail.com', 4, 10, 0, '2022-10-03', 0),
(8, 'Mohamed', 'Salah', 'liverpool10@gmail.com', 1, 22, 5, '2022-10-03', 0),
(9, 'Fernando', 'Muslera', 'golnando@outlook.es', 7, 10, 2, '2022-10-03', 0),
(10, 'Federico', 'Valverde', 'halcon.valverde@gmail.com', 15, 20, 0, '2022-10-03', 0);

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
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`id_editorial`),
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
  ADD KEY `id_usuarios` (`id_usuario`),
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
  MODIFY `id_autor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id_ciudad` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  MODIFY `id_editorial` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_prestamo` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD CONSTRAINT `editoriales_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`id_editorial`) REFERENCES `editoriales` (`id_editorial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
