-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-08-2021 a las 01:53:24
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `concurso`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos`
--

DROP TABLE IF EXISTS `datos`;
CREATE TABLE IF NOT EXISTS `datos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `datos`
--

INSERT INTO `datos` (`Id`, `nombre`, `telefono`, `email`, `mensaje`) VALUES
(1, 'Elias Reyes', 993073898, 'elias@gmail.com', 'hola esto es un concurso en el que estoy participando :)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_administradores`
--

DROP TABLE IF EXISTS `tb_administradores`;
CREATE TABLE IF NOT EXISTS `tb_administradores` (
  `cod_administrador` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `usuario_creado` int(11) NOT NULL,
  `fecha_creado` datetime NOT NULL,
  `usuario_editado` int(11) DEFAULT NULL,
  `fecha_editado` datetime DEFAULT NULL,
  `usuario_eliminado` int(11) DEFAULT NULL,
  `fecha_eliminado` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_administrador`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_administradores`
--

INSERT INTO `tb_administradores` (`cod_administrador`, `nombres`, `apellidos`, `celular`, `usuario_creado`, `fecha_creado`, `usuario_editado`, `fecha_editado`, `usuario_eliminado`, `fecha_eliminado`) VALUES
(1, 'Empleado 0', 'prueba', '0123456789', 1, '2021-08-27 20:35:54', 2, '2021-08-27 20:44:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_empleados`
--

DROP TABLE IF EXISTS `tb_empleados`;
CREATE TABLE IF NOT EXISTS `tb_empleados` (
  `cod_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `usuario_creado` int(11) NOT NULL,
  `fecha_creado` datetime NOT NULL,
  `usuario_editado` int(11) DEFAULT NULL,
  `fecha_editado` datetime DEFAULT NULL,
  `usuario_eliminado` int(11) DEFAULT NULL,
  `fecha_eliminado` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_empleado`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_empleados`
--

INSERT INTO `tb_empleados` (`cod_empleado`, `nombres`, `apellidos`, `celular`, `usuario_creado`, `fecha_creado`, `usuario_editado`, `fecha_editado`, `usuario_eliminado`, `fecha_eliminado`) VALUES
(1, 'Cliente 0', 'prueba', '0123456789', 1, '2021-08-27 20:36:38', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_rol`
--

DROP TABLE IF EXISTS `tb_rol`;
CREATE TABLE IF NOT EXISTS `tb_rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `cod_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_rol`
--

INSERT INTO `tb_rol` (`id_rol`, `nombre`, `cod_rol`) VALUES
(1, 'Administrador', 1),
(2, 'GDF', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
CREATE TABLE IF NOT EXISTS `tb_usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` int(11) NOT NULL,
  `cod_rol` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `correo` varchar(1000) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(1000) NOT NULL,
  `estado` enum('A','I','D') NOT NULL,
  `conexion` enum('C','D') NOT NULL,
  `usuario_creado` int(11) NOT NULL,
  `fecha_creado` datetime NOT NULL,
  `usuario_editado` int(11) DEFAULT NULL,
  `fecha_editado` datetime DEFAULT NULL,
  `usuario_eliminado` int(11) DEFAULT NULL,
  `fecha_eliminado` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`id_usuario`, `cod_usuario`, `cod_rol`, `usuario`, `correo`, `password`, `foto`, `estado`, `conexion`, `usuario_creado`, `fecha_creado`, `usuario_editado`, `fecha_editado`, `usuario_eliminado`, `fecha_eliminado`) VALUES
(1, 1, 1, 'Luiyie', 'elias@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '20210828013554.png', 'A', 'D', 1, '2021-08-27 20:35:54', NULL, NULL, 1, '2021-08-27 20:42:43'),
(2, 1, 2, 'empleado0', 'empleado0@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '20210828013638.png', 'A', 'D', 1, '2021-08-27 20:36:38', 2, '2021-08-27 20:44:02', 1, '2021-08-27 20:38:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_voluntarios`
--

DROP TABLE IF EXISTS `tb_voluntarios`;
CREATE TABLE IF NOT EXISTS `tb_voluntarios` (
  `cod_voluntario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(20) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `edad` varchar(3) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `correo` varchar(250) NOT NULL,
  `genero` enum('H','M') NOT NULL,
  `notificacion_registro` enum('L','P') NOT NULL,
  `estado` enum('P','F','D') NOT NULL COMMENT 'P = proceso ,F = finalizado, D = eliminado',
  `fecha_creado` datetime NOT NULL,
  `usuario_editado` int(11) DEFAULT NULL,
  `fecha_editado` datetime DEFAULT NULL,
  `usuario_eliminado` int(11) DEFAULT NULL,
  `fecha_eliminado` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_voluntario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_voluntarios`
--

INSERT INTO `tb_voluntarios` (`cod_voluntario`, `nombres`, `apellidos`, `cedula`, `edad`, `celular`, `correo`, `genero`, `notificacion_registro`, `estado`, `fecha_creado`, `usuario_editado`, `fecha_editado`, `usuario_eliminado`, `fecha_eliminado`) VALUES
(1, 'Elias Alberto', 'Reyes Conforme', '0958677981', '22', '0993073898', 'hola@gmail.com', 'M', 'P', 'P', '2021-06-06 00:00:00', 1, '2021-08-27 19:01:52', NULL, NULL),
(2, 'Saile', 'luiyie', '0958677982', '21', '0993073898', '', 'M', 'P', 'P', '2021-06-07 20:05:23', 1, '2021-07-10 19:08:39', NULL, NULL),
(3, 'grace', 'reyes', '0993073898', '25', '0993073898', 'grace@gmail.com', 'M', 'P', 'P', '2021-06-07 21:11:05', 1, '2021-08-27 19:04:02', NULL, NULL),
(4, '', '', '0912', '', '', '', 'H', 'P', 'P', '2021-06-07 21:34:41', 0, '2021-06-07 21:35:05', NULL, NULL),
(5, '', '', '', '', '', '', 'H', 'P', 'P', '2021-06-07 22:14:48', NULL, NULL, NULL, NULL),
(6, 'Elias', 'Reyes', '0951815869', '20', '0993073898', 'eliasreyeselias@gmail.com', 'H', 'P', 'P', '2021-06-08 19:45:44', NULL, NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
