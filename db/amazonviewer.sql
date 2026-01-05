-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 05-01-2026 a las 13:36:11
-- Versión del servidor: 9.4.0
-- Versión de PHP: 8.3.26
CREATE DATABASE IF NOT EXISTS amazonviewer;
USE amazonviewer;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `amazonviewer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

CREATE TABLE `book` (
  `id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `edition_date` date DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `authors` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`id`, `title`, `editorial`, `edition_date`, `isbn`, `authors`) VALUES
(1, 'Cien años de soledad', 'Sudamericana', '1967-05-30', '978-0307474728', 'Gabriel García Márquez'),
(2, 'El código Da Vinci', 'Doubleday', '2003-03-18', '978-0307474278', 'Dan Brown'),
(3, 'Don Quijote de la Mancha', 'Juan de la Cuesta', '1605-01-16', '978-8424116415', 'Miguel de Cervantes'),
(4, 'El resplandor', 'Doubleday', '1977-01-28', '978-1501143519', 'Stephen King'),
(5, 'Crimen y castigo', 'El mensajero ruso', '1866-01-01', '978-8424921613', 'Fiódor Dostoyevski');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chapter`
--

CREATE TABLE `chapter` (
  `id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `duration` int DEFAULT NULL,
  `year` smallint DEFAULT NULL,
  `session_number` int DEFAULT NULL,
  `id_serie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `chapter`
--

INSERT INTO `chapter` (`id`, `title`, `duration`, `year`, `session_number`, `id_serie`) VALUES
(1, 'The Vanishing of Will Byers', 48, 2016, 1, 1),
(2, 'The Weirdo on Maple Street', 55, 2016, 1, 1),
(3, 'Holly, Jolly', 51, 2016, 1, 1),
(4, 'Capitulo 1: The Mandalorian', 39, 2019, 1, 2),
(5, 'Capitulo 2: The Child', 32, 2019, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `magazine`
--

CREATE TABLE `magazine` (
  `id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `edition_date` date DEFAULT NULL,
  `authors` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `magazine`
--

INSERT INTO `magazine` (`id`, `title`, `editorial`, `edition_date`, `authors`) VALUES
(1, 'National Geographic', 'National Geographic Society', '2024-01-01', 'Varios Autores - NG'),
(2, 'Scientific American', 'Springer Nature', '2024-02-15', 'Comité Científico'),
(3, 'Time Magazine', 'Time USA, LLC', '2024-03-10', 'Time Editorial Staff'),
(4, 'The Economist', 'The Economist Group', '2024-04-05', 'Economist Group Editors'),
(5, 'Vogue', 'Condé Nast', '2024-05-20', 'Anna Wintour & Staff');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `material`
--

INSERT INTO `material` (`id`, `name`) VALUES
(1, 'Movie'),
(2, 'Serie'),
(3, 'Chapter'),
(4, 'Book'),
(5, 'Magazine');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie`
--

CREATE TABLE `movie` (
  `id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `year` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `movie`
--

INSERT INTO `movie` (`id`, `title`, `genre`, `creator`, `duration`, `year`) VALUES
(1, 'Coco', 'Animada', 'Pixar', 120, 2017),
(2, 'The Matrix', 'Ci-Fi', 'Wachowskis', 136, 1999),
(3, 'Inception', 'Ci-Fi', 'Christopher Nolan', 148, 2010),
(4, 'Interstellar', 'Ci-Fi', 'Christopher Nolan', 169, 2014),
(5, 'The Godfather', 'Drama', 'Francis Ford Coppola', 175, 1972),
(6, 'Pulp Fiction', 'Crimen', 'Quentin Tarantino', 154, 1994),
(7, 'Spirited Away', 'Animada', 'Hayao Miyazaki', 125, 2001),
(8, 'Parasite', 'Terror', 'Bong Joon-ho', 132, 2019),
(9, 'The Dark Knight', 'Acción', 'Christopher Nolan', 152, 2008),
(10, 'Your Name', 'Animada', 'Makoto Shinkai', 106, 2016),
(11, 'Blade Runner 2049', 'Ci-Fi', 'Denis Villeneuve', 164, 2017);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `page`
--

CREATE TABLE `page` (
  `id` int NOT NULL,
  `id_book` int NOT NULL,
  `number` int NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `page`
--

INSERT INTO `page` (`id`, `id_book`, `number`, `content`) VALUES
(1, 1, 1, 'Muchos años después, frente al pelotón de fusilamiento...'),
(2, 1, 2, 'Macondo era entonces una aldea de veinte casas de barro...'),
(3, 1, 3, 'El mundo era tan reciente que muchas cosas carecían de nombre...'),
(4, 2, 1, 'Robert Langdon se despertó sobresaltado en mitad de la noche...'),
(5, 2, 2, 'El Louvre parecía una fortaleza inexpugnable bajo la lluvia...'),
(6, 2, 3, 'Sion guarda un secreto que podría cambiar la historia de la humanidad...'),
(7, 3, 1, 'En un lugar de la Mancha, de cuyo nombre no quiero acordarme...'),
(8, 3, 2, 'No ha mucho tiempo que vivía un hidalgo de los de lanza en astillero...'),
(9, 3, 3, 'Aquel caballero de la triste figura comenzó su aventura...'),
(10, 4, 1, 'Jack Torrance pensó que el hotel Overlook era su última oportunidad...'),
(11, 4, 2, 'Danny vio la palabra REDRUM reflejada en el espejo...'),
(12, 4, 3, 'El laberinto de setos se movía bajo la luz de la luna...');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serie`
--

CREATE TABLE `serie` (
  `id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `year` smallint DEFAULT NULL,
  `session_quantity` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `serie`
--

INSERT INTO `serie` (`id`, `title`, `genre`, `creator`, `duration`, `year`, `session_quantity`) VALUES
(1, 'Stranger Things', 'Ci-Fi', 'Duffer Brothers', 50, 2016, 1),
(2, 'The Mandalorian', 'Acción', 'Jon Favreau', 40, 2019, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`) VALUES
(1, 'Luigi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viewed`
--

CREATE TABLE `viewed` (
  `id` int NOT NULL,
  `id_material` int NOT NULL,
  `id_element` int NOT NULL,
  `id_user` int NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `viewed`
--

INSERT INTO `viewed` (`id`, `id_material`, `id_element`, `id_user`, `date`) VALUES
(129, 1, 4, 1, '2026-01-04 23:01:49'),
(130, 1, 2, 1, '2026-01-04 23:14:09'),
(131, 1, 2, 1, '2026-01-04 23:15:23'),
(132, 1, 1, 1, '2026-01-04 23:15:56'),
(133, 1, 2, 1, '2026-01-04 23:15:59'),
(134, 1, 3, 1, '2026-01-04 23:16:16'),
(135, 2, 1, 1, '2026-01-04 23:16:18'),
(136, 2, 1, 1, '2026-01-04 23:16:31'),
(137, 4, 3, 1, '2026-01-04 23:17:10'),
(138, 3, 5, 1, '2026-01-04 18:37:26'),
(139, 3, 4, 1, '2026-01-04 18:37:45'),
(140, 2, 2, 1, '2026-01-04 18:37:47'),
(141, 2, 2, 1, '2026-01-04 18:37:53'),
(142, 4, 5, 1, '2026-01-04 18:38:17'),
(143, 4, 5, 1, '2026-01-04 18:38:49'),
(144, 1, 5, 1, '2026-01-05 04:45:41'),
(145, 2, 2, 1, '2026-01-05 04:46:39'),
(146, 4, 5, 1, '2026-01-05 04:46:59'),
(147, 3, 1, 1, '2026-01-05 05:22:04');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_serie` (`id_serie`);

--
-- Indices de la tabla `magazine`
--
ALTER TABLE `magazine`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_page_book` (`id_book`);

--
-- Indices de la tabla `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `viewed`
--
ALTER TABLE `viewed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_material` (`id_material`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `book`
--
ALTER TABLE `book`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `chapter`
--
ALTER TABLE `chapter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `magazine`
--
ALTER TABLE `magazine`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `page`
--
ALTER TABLE `page`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `serie`
--
ALTER TABLE `serie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `viewed`
--
ALTER TABLE `viewed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`id_serie`) REFERENCES `serie` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `page`
--
ALTER TABLE `page`
  ADD CONSTRAINT `fk_page_book` FOREIGN KEY (`id_book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `viewed`
--
ALTER TABLE `viewed`
  ADD CONSTRAINT `viewed_ibfk_1` FOREIGN KEY (`id_material`) REFERENCES `material` (`id`),
  ADD CONSTRAINT `viewed_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
