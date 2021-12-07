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
-- Base de datos: `rancho_fae`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--
DROP TABLE IF EXISTS `tb_rol`;
CREATE TABLE `tb_rol` (
`id_rol` int(11) NOT NULL AUTO_INCREMENT,
`tipo_usuario` varchar(50) NOT NULL,
PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--
-- Volcado de tb_rol para la tabla `tb_rol`
--
insert into `tb_rol` (`tipo_usuario`) values 
('Cliente'),
('Administrador');
--
-- Estructura de tabla para la tabla `rol`
--
DROP TABLE IF EXISTS `tb_grado`;
CREATE TABLE `tb_grado` (
`id_grado` int(11) NOT NULL AUTO_INCREMENT,
`descripcion_grado` varchar(255) NOT NULL,
PRIMARY KEY (`id_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--
-- Volcado de tb_Usuarios para la tabla `tb_grado`
--
INSERT INTO `tb_grado` (`descripcion_grado`) VALUES 
('Soldado')
,('Cabo'),('Cabo 2°'),('Cabo 1°'),
('Sargento 2°'),('Sargento 1°'),('Suboficial')
,('Suboficial Mayor'),('Alférez'),('Subteniene'),('teniente'),('Capitán')
,('Mayor'),('Teniente Coronel'),('Coronel'),('Brigodier'),('General de Brigade')
,('General de División'),('General del Ejército(CIE)');
--
-- Estructura de tabla para la tabla `tb_Usuarios`
--

DROP TABLE IF EXISTS `tb_Usuarios`;
CREATE TABLE IF NOT EXISTS `tb_Usuarios` (
  `id_user` int(11) not null auto_increment,
  `nombre_user` varchar(20) NOT NULL,
  `apellido_user` varchar(20) NOT NULL,
  `cedula_user` int(10) NOT NULL,
  `id_grado` int,
  `unidad` varchar(20) NOT NULL,
  `usuario_user` varchar(20) NOT NULL,
  `telefono_user` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tipo_user` int ,
  `contrasena_user` varchar(50) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_user`),
  CONSTRAINT FK_USER_GRADO FOREIGN KEY (id_grado) REFERENCES tb_grado (id_grado),
  CONSTRAINT FK_USER_TIPOUSER FOREIGN KEY (tipo_user) REFERENCES  tb_rol(id_rol)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--
-- Volcado de tb_Usuarios para la tabla `tb_Usuarios`
--
INSERT INTO `tb_Usuarios` (`id_user`, `nombre_user`, `apellido_user`,`cedula_user`,`id_grado`,`unidad`,`usuario_user`
,`telefono_user`,`email`,`tipo_user`,`contrasena_user`,`fecha_creacion`) VALUES
(1, 'Mario', 'Arguello', 0956874512, 4, '23FuerzaArmada', 'Belmont02', 0124578956, 'Mario@fae.mil.ec',2,'123',2021/11/11),
(2, 'Abdon', 'Calderon', 0956874512, 6, '25FuerzaArmada', 'AbdonCalderon', 0124578956, 'Abdon@fae.mil.ec',3,'145',2021/11/11);
-- --------------------------------------------------------



--
-- Estructura de tabla para la tabla `tb_Restaurante`
--



DROP TABLE IF EXISTS `tb_Restaurante`;
CREATE TABLE IF NOT EXISTS `tb_Restaurante` (
`id_rest` int(11) NOT NULL AUTO_INCREMENT,
`nombre_restaurante` varchar(100) NOT NULL,
`base_fae` varchar(50) NOT NULL,
PRIMARY KEY (`id_rest`)


) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de tb_Restaurante para la tabla `tb_Restaurante`
--
INSERT INTO `tb_Restaurante` (`nombre_restaurante`,`base_fae`) values 
('Restaurante #1','Guayaquil'),
('Restaurante #2','Guayaquil'),
('Restaurante #3','Guayaquil');

--
-- Estructura de tabla para la tabla `tb_tipo_comida`
--
DROP TABLE IF EXISTS  `tb_tipo_comida`;
CREATE TABLE IF NOT EXISTS `tb_tipo_comida` (
`id_tipo` int(11) NOT NULL AUTO_INCREMENT,
`id_restaurante` int(11) NOT NULL,
`nombre_Tipo` varchar(100) NOT NULL,
`precio_tipo_comida` float (1.2) NOT NULL,
PRIMARY KEY (`id_tipo`),
CONSTRAINT FK_RestauranteTipo_Comida FOREIGN KEY (id_restaurante) REFERENCES tb_Restaurante (id_rest)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `tb_tipo_comida` (`id_restaurante`,`nombre_Tipo`,`precio_tipo_comida`) values 
(1,'Desayuno',1),
(1,'Almuerzo',1.50),
(1,'Merienda',2),
(2,'Desayuno',1.50),
(2,'Almuerzo',2),
(2,'Merienda',2.50);

--
-- Estructura de tabla para la tabla `tb_orden`
--

DROP TABLE IF EXISTS `tb_orden`;
CREATE TABLE IF NOT EXISTS `tb_orden` (
`id_or` int(11) NOT NULL AUTO_INCREMENT,
`id_user` int(11) NOT NULL,
`id_tipoComida` int(11) not NULL,
`id_restaurante` int(11) not NULL,
`estado_pago` varchar(50) NOT NULL,
`nombreTipo_comida` varchar(50) NOT NULL,
`extra_aumentoOrden` varchar(100) NOT NULL,
`fecha_orden` datetime NOT NULL,
`fecha_actual_bloqueo` date NOT NULL,
`cantidad_orden` int(5) NOT NULL,
`precio_comida` float(1.2) NOT NULL,
`total_pagar` float(1.2) NOT NULL,
PRIMARY KEY (`id_or`),
CONSTRAINT FK_UsuarioOrden1 FOREIGN KEY (id_user) REFERENCES tb_Usuarios (id_user),
CONSTRAINT FK_RestauranteOrden1 FOREIGN KEY (id_restaurante) REFERENCES tb_Restaurante (id_rest),
CONSTRAINT FK_TipoComidaOrden FOREIGN KEY (id_tipoComida) REFERENCES tb_tipo_comida (id_tipo)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
-- el tipo de comida las id 1,2,3 son del restaurante 1, las id 4,5,6 son del restaurante 2
INSERT INTO `tb_orden` (`id_user`,`id_tipoComida`,`id_restaurante`,`estado_pago`,`nombreTipo_comida`,`extra_aumentoOrden`,`fecha_orden`,`fecha_actual_bloqueo`
,`cantidad_orden`,`precio_comida`,`total_pagar`) values 
(1,2,1,'Cancelado','Almuerzo','Cuchara, tarrina',2021/11/10 ,2021/11/12,1,1.50,2.10),
(2,6,2,'En deuda','Merienda','tarrina',2021/11/11 ,2021/11/12 ,2,2.50,5.50);

--
-- Estructura de tabla para la tabla `tb_pago`
--

DROP TABLE IF EXISTS `tb_pago`;
CREATE TABLE IF NOT EXISTS `tb_pago` (
  `id_pago` int(10) NOT NULL AUTO_INCREMENT,
  `id_orden` int(10) not NULL,
  `id_usuario` int(10) NOT NULL,
  `id_restaurante` int(10) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `nombre_user` varchar(100) NOT NULL,
  `apellido_user` varchar(100) NOT NULL,
  `cedula_user` int(10) NOT NULL,
  `nombre_restaurante` varchar(100) NOT NULL,
  `fecha_orden` datetime NOT NULL,
  `nombre_tipo_comida` varchar(100) NOT NULL,
  `cantidad_orden` int(5) NOT NULL,
  `precio_orden` float(3.2) NOT NULL,
  `total_pagar` float(3.2) NOT NULL,
PRIMARY KEY (`id_pago`),
CONSTRAINT FK_OrdenPago FOREIGN KEY (id_orden) REFERENCES tb_orden (id_or),
CONSTRAINT FK_UserPago FOREIGN KEY (id_usuario) REFERENCES tb_Usuarios (id_user),
CONSTRAINT FK_RestaurantPago FOREIGN KEY (id_restaurante) REFERENCES tb_Restaurante (id_rest)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `tb_pago` (`id_orden`,`id_usuario`,`id_restaurante`,`fecha_pago`,`nombre_user`,`apellido_user`,`cedula_user`,`nombre_restaurante`
,`fecha_orden`,`nombre_tipo_comida`,`cantidad_orden`,`precio_orden`,`total_pagar`) values 
(2,2,2,2021/11/11,'Abdon','Calderon',956874512,'Restaurante #2',2021/11/11,'Merienda',2,2.50,5.50),
(1,1,1,2021/11/11,'Mario','Arguello',956874512,'Restaurante #1',2021/11/11,'Almuerzo',1,1.50,2.10);


--
-- Estructura de tabla para la tabla `tb_contable`
--

Drop TABLE IF EXISTS `tb_contable`;
CREATE TABLE IF NOT EXISTS `tb_contable` (
`id_tablaContable` int(10) NOT NULL AUTO_INCREMENT,
`id_ordenCont`int (10) NOT NULL,
`totalCantidad` int(5) NOT NULL,
`Fecha_actual` datetime NOT NULL,
`totalPrecioRecaudado` float (4.2),
PRIMARY KEY (`id_tablaContable`),
CONSTRAINT FK_OrdenContable FOREIGN KEY (id_ordenCont) REFERENCES tb_orden (id_or)

) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
