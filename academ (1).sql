-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2016 a las 03:06:10
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `academ`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE IF NOT EXISTS `articulos` (
  `id_articulo` int(20) NOT NULL,
  `nombre_articulo` varchar(20) NOT NULL,
  `precio` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id_articulo`, `nombre_articulo`, `precio`) VALUES
(48, 'TOMATE', '303030'),
(49, 'cilantro', '300');

--
-- Disparadores `articulos`
--
DELIMITER $$
CREATE TRIGGER `actualizar` AFTER UPDATE ON `articulos`
 FOR EACH ROW insert into bitacora (id_articulo, nombre_nuevo, nombre_viejo, precio_nuevo, precio_viejo, usuario, fecha, accion) values (old.id_articulo, new.nombre_articulo, old.nombre_articulo, new.precio, old.precio, user(), now(), 'Modifico')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `eliminar` AFTER DELETE ON `articulos`
 FOR EACH ROW insert into bitacora (id_articulo, nombre_viejo, precio_viejo, usuario, fecha, accion) values (old.id_articulo, old.nombre_articulo, old.precio, user(), now(), 'Elimino')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertar` AFTER INSERT ON `articulos`
 FOR EACH ROW insert into bitacora (id_articulo, nombre_nuevo, precio_nuevo, usuario, fecha, accion) values (new.id_articulo, new.nombre_articulo, new.precio, user(), now(), 'Inserto')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE IF NOT EXISTS `bitacora` (
  `id_bitacora` int(30) NOT NULL,
  `id_articulo` int(20) DEFAULT NULL,
  `nombre_nuevo` varchar(20) DEFAULT NULL,
  `nombre_viejo` varchar(20) DEFAULT NULL,
  `precio_nuevo` varchar(20) DEFAULT NULL,
  `precio_viejo` varchar(20) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `accion` varchar(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id_bitacora`, `id_articulo`, `nombre_nuevo`, `nombre_viejo`, `precio_nuevo`, `precio_viejo`, `usuario`, `fecha`, `accion`) VALUES
(1, 1, 'portatil', NULL, '1000000', NULL, 'manuel@localhost', '2016-05-21 19:30:32', 'Inserto'),
(2, 1, 'pc', 'portatil', '1000000', '1000000', 'manuel@localhost', '2016-05-21 19:31:47', 'Modifico'),
(3, 1, NULL, 'pc', NULL, '1000000', 'manuel@localhost', '2016-05-21 19:32:03', 'Elimino'),
(4, 2, 'vvvvvvv', NULL, '900', NULL, 'diego@localhost', '2016-05-21 19:54:07', 'Inserto'),
(5, 2, 'diego', 'vvvvvvv', '3000', '900', 'root@localhost', '2016-05-22 00:08:24', 'Modifico'),
(6, 2, 'daza', 'diego', '5000', '3000', 'root@localhost', '2016-05-22 00:33:22', 'Modifico'),
(7, 2, 'daza', 'daza', '2000', '5000', 'snoopy@localhost', '2016-05-22 00:36:54', 'Modifico'),
(8, 2, 'daza', 'daza', '3', '2000', 'snoopy@localhost', '2016-05-22 00:37:32', 'Modifico'),
(9, 2, 'daza', 'daza', '', '3', 'snoopy@localhost', '2016-05-22 00:38:04', 'Modifico'),
(10, 2, 'daza', 'daza', '', '', 'snoopy@localhost', '2016-05-22 00:38:27', 'Modifico'),
(11, 2, 'daza', 'daza', '1000', '', 'snoopy@localhost', '2016-05-22 00:38:46', 'Modifico'),
(12, 2, 'daza', 'daza', '10001', '1000', 'snoopy@localhost', '2016-05-22 00:40:16', 'Modifico'),
(13, 2, 'daza', 'daza', '100013', '10001', 'snoopy@localhost', '2016-05-22 00:40:28', 'Modifico'),
(14, 2, 'diego', 'daza', '1000133', '100013', 'snoopy@localhost', '2016-05-22 00:42:16', 'Modifico'),
(15, 2, 'ddaniel', 'diego', '244', '1000133', 'snoopy@localhost', '2016-05-22 00:42:33', 'Modifico'),
(16, 2, 'este', 'ddaniel', '111', '244', 'snoopy@localhost', '2016-05-22 00:44:45', 'Modifico'),
(17, 3, 'daniel', NULL, '55', NULL, 'root@localhost', '2016-05-22 01:03:08', 'Inserto'),
(18, 4, 'rorororo', NULL, '', NULL, 'snoopy@localhost', '2016-05-22 01:11:55', 'Inserto'),
(19, 4, 'rorororo', 'rorororo', '33', '', 'snoopy@localhost', '2016-05-22 01:12:37', 'Modifico'),
(20, 5, 'adada', NULL, '33333', NULL, 'snoopy@localhost', '2016-05-22 01:12:44', 'Inserto'),
(21, 5, NULL, 'adada', NULL, '33333', 'snoopy@localhost', '2016-05-22 01:14:24', 'Elimino'),
(22, 2, 'este otro', 'este', '111', '111', 'snoopy@localhost', '2016-05-22 02:23:43', 'Modifico'),
(23, 6, 'diego es un marica e', NULL, '55555', NULL, 'snoopy@localhost', '2016-05-22 02:26:24', 'Inserto'),
(24, 7, 'fabuloso', NULL, '50000', NULL, 'daniel@localhost', '2016-05-22 04:51:43', 'Inserto'),
(25, 7, NULL, 'fabuloso', NULL, '50000', 'daniel@localhost', '2016-05-22 04:51:54', 'Elimino'),
(26, 8, 'romantico', NULL, '456', NULL, 'daniel@localhost', '2016-05-22 05:52:56', 'Inserto'),
(27, 9, 'casa', NULL, '1234', NULL, 'kevin@localhost', '2016-05-22 19:00:29', 'Inserto'),
(28, 2, 'este ortoooo', 'este otro', '111222', '111', 'kevin@localhost', '2016-05-22 19:16:42', 'Modifico'),
(29, 10, 'tocooooo', NULL, '1234566789', NULL, 'kevin@localhost', '2016-05-22 19:20:49', 'Inserto'),
(30, 11, 'pocosss', NULL, '121', NULL, 'kevin@localhost', '2016-05-22 19:21:31', 'Inserto'),
(31, 11, NULL, 'pocosss', NULL, '121', 'daniel@localhost', '2016-05-22 20:58:15', 'Elimino'),
(32, 10, NULL, 'tocooooo', NULL, '1234566789', 'daniel@localhost', '2016-05-22 20:58:19', 'Elimino'),
(33, 9, NULL, 'casa', NULL, '1234', 'daniel@localhost', '2016-05-22 20:58:21', 'Elimino'),
(34, 8, NULL, 'romantico', NULL, '456', 'daniel@localhost', '2016-05-22 20:58:24', 'Elimino'),
(35, 6, NULL, 'diego es un marica e', NULL, '55555', 'daniel@localhost', '2016-05-22 20:58:27', 'Elimino'),
(36, 4, NULL, 'rorororo', NULL, '33', 'daniel@localhost', '2016-05-22 20:58:29', 'Elimino'),
(37, 3, NULL, 'daniel', NULL, '55', 'daniel@localhost', '2016-05-22 20:58:31', 'Elimino'),
(38, 2, NULL, 'este ortoooo', NULL, '111222', 'daniel@localhost', '2016-05-22 20:58:35', 'Elimino'),
(39, 12, 'salchichón', NULL, '1500', NULL, 'root@localhost', '2016-05-22 21:12:05', 'Inserto'),
(40, 13, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:01:35', 'Inserto'),
(41, 13, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:01:39', 'Elimino'),
(42, 14, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:06:19', 'Inserto'),
(43, 15, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:06:24', 'Inserto'),
(44, 16, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:06:27', 'Inserto'),
(45, 17, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:06:28', 'Inserto'),
(46, 18, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:06:30', 'Inserto'),
(47, 19, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:47', 'Inserto'),
(48, 20, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:47', 'Inserto'),
(49, 21, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:47', 'Inserto'),
(50, 22, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:48', 'Inserto'),
(51, 23, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:48', 'Inserto'),
(52, 24, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:48', 'Inserto'),
(53, 25, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:48', 'Inserto'),
(54, 26, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:48', 'Inserto'),
(55, 27, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:48', 'Inserto'),
(56, 28, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:49', 'Inserto'),
(57, 29, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:49', 'Inserto'),
(58, 30, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:49', 'Inserto'),
(59, 31, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:52', 'Inserto'),
(60, 32, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:07:57', 'Inserto'),
(61, 33, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:08:00', 'Inserto'),
(62, 34, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:08:01', 'Inserto'),
(63, 35, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:08:02', 'Inserto'),
(64, 36, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:08:25', 'Inserto'),
(65, 37, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:08:25', 'Inserto'),
(66, 38, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:09:00', 'Inserto'),
(67, 14, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:15', 'Elimino'),
(68, 15, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:18', 'Elimino'),
(69, 16, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:20', 'Elimino'),
(70, 17, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:22', 'Elimino'),
(71, 18, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:25', 'Elimino'),
(72, 19, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:26', 'Elimino'),
(73, 20, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:27', 'Elimino'),
(74, 21, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:28', 'Elimino'),
(75, 22, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:29', 'Elimino'),
(76, 23, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:30', 'Elimino'),
(77, 24, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:31', 'Elimino'),
(78, 25, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:33', 'Elimino'),
(79, 26, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:34', 'Elimino'),
(80, 27, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:35', 'Elimino'),
(81, 28, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:36', 'Elimino'),
(82, 29, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:37', 'Elimino'),
(83, 30, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:38', 'Elimino'),
(84, 31, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:39', 'Elimino'),
(85, 32, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:40', 'Elimino'),
(86, 33, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:41', 'Elimino'),
(87, 34, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:42', 'Elimino'),
(88, 35, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:43', 'Elimino'),
(89, 36, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:44', 'Elimino'),
(90, 37, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:45', 'Elimino'),
(91, 38, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:10:46', 'Elimino'),
(92, 39, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:10:57', 'Inserto'),
(93, 39, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:11:05', 'Elimino'),
(94, 40, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:11:39', 'Inserto'),
(95, 40, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:11:44', 'Elimino'),
(96, 41, '', NULL, '', NULL, 'root@localhost', '2016-05-23 09:13:18', 'Inserto'),
(97, 41, NULL, '', NULL, '', 'root@localhost', '2016-05-23 09:13:27', 'Elimino'),
(98, 42, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:21:06', 'Inserto'),
(99, 42, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:21:10', 'Elimino'),
(100, 43, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:22:01', 'Inserto'),
(101, 44, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:22:43', 'Inserto'),
(102, 43, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:24:00', 'Elimino'),
(103, 44, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:24:02', 'Elimino'),
(104, 45, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:24:09', 'Inserto'),
(105, 45, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:24:13', 'Elimino'),
(106, 46, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:25:02', 'Inserto'),
(107, 46, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:27:30', 'Elimino'),
(108, 47, '', NULL, '', NULL, 'diego@localhost', '2016-05-23 09:27:33', 'Inserto'),
(109, 47, NULL, '', NULL, '', 'diego@localhost', '2016-05-23 09:27:36', 'Elimino'),
(110, 48, 'TOMATE', NULL, '303030', NULL, 'diego@localhost', '2016-05-23 09:36:04', 'Inserto'),
(111, 49, 'pataconas', NULL, '2000', NULL, 'daniel@localhost', '2016-05-25 09:12:31', 'Inserto'),
(112, 49, 'cilantro', 'pataconas', '300', '2000', 'daniel@localhost', '2016-05-25 09:12:47', 'Modifico'),
(113, 12, NULL, 'salchichón', NULL, '1500', 'daniel@localhost', '2016-05-25 09:12:53', 'Elimino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL,
  `user` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `pasadmin` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `user`, `password`, `email`, `pasadmin`) VALUES
(1, 'Joseph', '12345', 'gjosephpaul@live.com', ''),
(4, 'alex', 'alex1', 'alex@gmail.com', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id_articulo`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id_bitacora`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id_articulo` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id_bitacora` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
