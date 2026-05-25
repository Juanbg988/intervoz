-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2026 a las 03:29:16
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `intervoz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion`
--

CREATE TABLE `asignacion` (
  `id_asignacion` int(11) NOT NULL,
  `Estado` bit(1) DEFAULT NULL,
  `id_solicitud` int(11) DEFAULT NULL,
  `id_interprete` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponibilidad`
--

CREATE TABLE `disponibilidad` (
  `id_disponibilidad` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  `id_interprete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `disponibilidad`
--

INSERT INTO `disponibilidad` (`id_disponibilidad`, `fecha`, `disponible`, `id_interprete`) VALUES
(1, '2026-05-20', 1, 10),
(2, '2026-05-20', 1, 11),
(3, '2026-05-20', 1, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre`) VALUES
(1, 'Oaxaca'),
(2, 'Veracruz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `id_evaluacion` int(11) NOT NULL,
  `id_sesion` int(11) DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `comentarios` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interprete`
--

CREATE TABLE `interprete` (
  `id_interprete` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `interprete`
--

INSERT INTO `interprete` (`id_interprete`, `id_usuario`, `telefono`) VALUES
(5, 19, '2147483647'),
(10, 28, '2871411373'),
(11, 29, '2871411374'),
(12, 30, '2871411373');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interprete_lengua`
--

CREATE TABLE `interprete_lengua` (
  `id_interprete` int(11) NOT NULL,
  `id_lengua` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `interprete_lengua`
--

INSERT INTO `interprete_lengua` (`id_interprete`, `id_lengua`) VALUES
(10, 6),
(11, 6),
(12, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lengua`
--

CREATE TABLE `lengua` (
  `id_lengua` int(11) NOT NULL,
  `nombre` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lengua`
--

INSERT INTO `lengua` (`id_lengua`, `nombre`) VALUES
(5, 'Zapoteco'),
(6, 'Chinanteco'),
(7, 'Mazateco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar`
--

CREATE TABLE `lugar` (
  `id_lugar` int(11) NOT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `municipio` varchar(30) DEFAULT NULL,
  `comunidad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id_municipio`, `nombre`, `id_estado`) VALUES
(1, 'San Lorenzo Texmelucan', 1),
(2, 'Villa Sola de Vega', 1),
(3, 'Santa María Zaniza', 1),
(4, 'Santiago Textitlán', 1),
(5, 'San Antonino el Alto', 1),
(6, 'San Miguel Mixtepec', 1),
(7, 'Santa Cruz Mixtepec', 1),
(8, 'Santa María Lachixío', 1),
(9, 'San Vicente Lachixío', 1),
(10, 'San Miguel Aloápam', 1),
(11, 'Abejones', 1),
(12, 'Santa María Jaltianguis', 1),
(13, 'Nuevo Zoquiápam', 1),
(14, 'San Juan Atepec', 1),
(15, 'San Juan Evangelista Analco', 1),
(16, 'San Miguel del Río', 1),
(17, 'San Pablo Macuiltianguis', 1),
(18, 'Santa Catarina Ixtepeji', 1),
(19, 'San Juan Comaltepec', 1),
(20, 'San Juan Lalana', 1),
(21, 'Santiago Choápam', 1),
(22, 'Santiago Yaveo', 1),
(23, 'Santa María Temaxcalapa', 1),
(24, 'Capulálpam de Méndez', 1),
(25, 'Guelatao de Juárez', 1),
(26, 'Ixtlán de Juárez', 1),
(27, 'Natividad', 1),
(28, 'San Juan Chicomezúchil', 1),
(29, 'San Miguel Amatlán', 1),
(30, 'Santa Catarina Lachatao', 1),
(31, 'Santa María Yavesía', 1),
(32, 'Santiago Xiacuí', 1),
(33, 'San Ildefonso Villa Alta', 1),
(34, 'San Juan Yaeé', 1),
(35, 'San Juan Yatzona', 1),
(36, 'San Miguel Yotao', 1),
(37, 'San Pedro Yaneri', 1),
(38, 'Santiago Camotlán', 1),
(39, 'Santiago Lalopa', 1),
(40, 'Santo Domingo Roayaga', 1),
(41, 'Villa Talea de Castro', 1),
(42, 'Tanetze de Zaragoza', 1),
(43, 'San Andrés Yaá', 1),
(44, 'San Baltazar Yatzachi el Bajo', 1),
(45, 'San Cristóbal Lachirioag', 1),
(46, 'San Melchor Betaza', 1),
(47, 'Villa Hidalgo Yalálag', 1),
(48, 'San Andrés Solaga', 1),
(49, 'San Bartolomé Zoogocho', 1),
(50, 'Santiago Zoochila', 1),
(51, 'Santa María Yalina', 1),
(52, 'San Juan Tabaá', 1),
(53, 'Santiago Laxopa', 1),
(54, 'San Francisco Cajonos', 1),
(55, 'San Mateo Cajonos', 1),
(56, 'San Pablo Yaganiza', 1),
(57, 'San Pedro Cajonos', 1),
(58, 'Santa Ana Yareni', 1),
(59, 'Teococuilco de Marcos Pérez', 1),
(60, 'Coatecas Altas', 1),
(61, 'Heroica Ciudad de Ejutla de Crespo', 1),
(62, 'San José del Progreso', 1),
(63, 'Miahuatlán de Porfirio Díaz', 1),
(64, 'San Jerónimo Coatlán', 1),
(65, 'San Miguel Coatlán', 1),
(66, 'San Pablo Coatlán', 1),
(67, 'San Baltazar Loxicha', 1),
(68, 'Santa María Tonameca', 1),
(69, 'Santo Domingo de Morelos', 1),
(70, 'Candelaria Loxicha', 1),
(71, 'Pluma Hidalgo', 1),
(72, 'San Agustín Loxicha', 1),
(73, 'San Bartolomé Loxicha', 1),
(74, 'San Pedro Pochutla', 1),
(75, 'Santa María Colotepec', 1),
(76, 'Santa María Huatulco', 1),
(77, 'San Vicente Coatlán', 1),
(78, 'San Carlos Yautepec', 1),
(79, 'San Cristóbal Amatlán', 1),
(80, 'San José Lachiguiri', 1),
(81, 'San Juan Mixtepec Dto. 26', 1),
(82, 'San Pedro Mixtepec Dto. 26', 1),
(83, 'San Pedro Mártir Quiéchapa', 1),
(84, 'San Francisco Logueche', 1),
(85, 'San Ildefonso Amatlán', 1),
(86, 'San Luis Amatlán', 1),
(87, 'San Juan Ozolotepec', 1),
(88, 'San Marcial Ozolotepec', 1),
(89, 'San Mateo Piñas', 1),
(90, 'San Miguel Suchixtepec', 1),
(91, 'San Pedro El Alto', 1),
(92, 'San Sebastián Río Hondo', 1),
(93, 'Santa María Ozolotepec', 1),
(94, 'Santo Domingo Ozolotepec', 1),
(95, 'Santiago Xánica', 1),
(96, 'San Francisco Ozolotepec', 1),
(97, 'Santa María Quiegolani', 1),
(98, 'San Bartolo Yautepec', 1),
(99, 'Asunción Tlacolulita', 1),
(100, 'San Miguel del Puerto', 1),
(101, 'San Agustín Etla', 1),
(102, 'San Andrés Zautla', 1),
(103, 'San Pablo Etla', 1),
(104, 'Santa María Atzompa', 1),
(105, 'Santo Tomás Mazaltepec', 1),
(106, 'Villa de Etla', 1),
(107, 'San Andrés Huayápam', 1),
(108, 'Santo Domingo Tonaltepec', 1),
(109, 'Tlalixtac de Cabrera', 1),
(110, 'Oaxaca de Juárez', 1),
(111, 'San Antonio de la Cal', 1),
(112, 'San Raymundo Jalpan', 1),
(113, 'San Sebastián Tutla', 1),
(114, 'Santa Cruz Xoxocotlán', 1),
(115, 'Santa Lucía del Camino', 1),
(116, 'Santa María Guelacé', 1),
(117, 'Santa María del Tule', 1),
(118, 'San Bartolo Coyotepec', 1),
(119, 'Santa María Coyotepec', 1),
(120, 'Villa de Zaachila', 1),
(121, 'San Felipe Jalapa de Díaz', 1),
(122, 'San Felipe Usila', 1),
(123, 'San José Chiltepec', 1),
(124, 'San Juan Cotzocón', 1),
(125, 'San Lucas Ojitlán', 1),
(126, 'San Juan Bautista Tuxtepec', 1),
(127, 'Cosamaloapan', 2),
(128, 'Isla', 2),
(129, 'Juan Rodríguez Clara', 2),
(130, 'Tierra Blanca', 2),
(131, 'Tres Valles', 2),
(132, 'Uxpanapa', 2),
(133, 'Ayotzintepec', 1),
(134, 'San Juan Bautista Atatlahuca', 1),
(135, 'San Juan Bautista Valle Nacional', 1),
(136, 'San Juan Quiotepec', 1),
(137, 'San Pedro Yolox', 1),
(138, 'Santiago Comaltepec', 1),
(139, 'San Andrés Teotilalpam', 1),
(140, 'San Juan Bautista Tlacoatzintepec', 1),
(141, 'San Pedro Sochiapam', 1),
(142, 'San Juan Lalana', 1),
(143, 'San Juan Petlapa', 1),
(144, 'Santiago Choápam', 1),
(145, 'Santiago Jocotepec', 1),
(146, 'Playa Vicente', 2),
(147, 'Santa María Jacatepec', 1),
(148, 'Acatlán de Pérez Figueroa', 1),
(149, 'San Miguel Soyaltepec', 1),
(150, 'San Pedro Ixcatlán', 1),
(151, 'San Pedro Teutila', 1),
(152, 'Chiquihuitlán de Benito Juárez', 1),
(153, 'San Bartolomé Ayautla', 1),
(154, 'Huautepec', 1),
(155, 'Huautla de Jiménez', 1),
(156, 'Santa María la Asunción', 1),
(157, 'Mazatlán Villa de Flores', 1),
(158, 'San Juan de los Cues', 1),
(159, 'Santa María Tecomavaca', 1),
(160, 'San José Independencia', 1),
(161, 'San José Tenango', 1),
(162, 'Eloxochitlán de Flores Magón', 1),
(163, 'San Jerónimo Tecóatl', 1),
(164, 'San Francisco Huehuetlán', 1),
(165, 'Coyomepan', 1),
(166, 'San Lorenzo Cuaunecuiltitla', 1),
(167, 'San Sebastián Tlacotepec', 1),
(168, 'Santa Ana Ateixtlahuaca', 1),
(169, 'San Lucas Zoquiapam', 1),
(170, 'San Martín Toxpalan', 1),
(171, 'San Pedro Ocopetatillo', 1),
(172, 'Santa Cruz Acatepec', 1),
(173, 'Santa María Chilchotla', 1),
(174, 'San Mateo Yoloxochitlán', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `id_lugar` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `rol`, `estado`, `fecha_creacion`, `id_lugar`, `id_usuario`) VALUES
(13, 'interprete', b'1', '2026-05-17', NULL, 19),
(14, 'solicitante', b'1', '2026-05-17', NULL, 20),
(15, 'solicitante', b'1', '2026-05-17', NULL, 21),
(19, 'solicitante', b'1', '2026-05-20', NULL, 25),
(22, 'interprete', b'1', '2026-05-20', NULL, 28),
(23, 'interprete', b'1', '2026-05-20', NULL, 29),
(24, 'interprete', b'1', '2026-05-20', NULL, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `id_reporte` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `detalles` varchar(100) DEFAULT NULL,
  `id_sesion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE `sesion` (
  `id_sesion` int(11) NOT NULL,
  `estado` enum('activa','finalizada') DEFAULT NULL,
  `inicio` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `id_asignacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `id_solicitud` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `estado` enum('buscando','aceptada','cancelada','finalizada') DEFAULT 'buscando',
  `id_variante` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`id_solicitud`, `id_usuario`, `estado`, `id_variante`, `fecha`) VALUES
(1, 22, '', 126, '2026-05-20 16:22:50'),
(2, 25, '', 39, '2026-05-20 17:47:06'),
(3, 25, '', 39, '2026-05-20 17:51:22'),
(4, 25, 'buscando', 39, '2026-05-20 19:05:49'),
(5, 25, 'buscando', 57, '2026-05-20 19:07:55'),
(6, 25, 'buscando', 39, '2026-05-20 20:22:51'),
(7, 25, 'buscando', 39, '2026-05-20 20:32:28'),
(8, 25, 'buscando', 39, '2026-05-20 20:33:31'),
(9, 25, 'buscando', 39, '2026-05-20 20:57:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `ape_pat` varchar(20) DEFAULT NULL,
  `ape_mat` varchar(20) DEFAULT NULL,
  `correo` varchar(254) DEFAULT NULL,
  `contraseña` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `ape_pat`, `ape_mat`, `correo`, `contraseña`) VALUES
(19, 'Luisa Camila', 'González', 'Lorenzo', 'luisacamilagonzalezlorenzo@gmail.com', '12345678'),
(20, 'Luisa Camila', 'González ', 'Lorenzo', 'luisacamilagonzalezlorenzo@gmail.com', '12345678'),
(21, 'Camila', 'González', 'Lorenzo', 'luisacamilagonzalezlorenzo@gmail.com', '098765432'),
(25, 'Juan', 'Bautista', 'García', 'juan@gmail.com', '12345678'),
(28, 'Juan1', 'Bautista1', 'García1', 'juan1@gmail.com', '12345678'),
(29, 'Juan2', 'Bautista2', 'García2', 'juan2@gmail.com', '12345678'),
(30, 'Juan3', 'Bautista', 'García', 'juan3@gmail.com', 'juanjesus');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variante`
--

CREATE TABLE `variante` (
  `id_variante` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `id_lengua` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `variante`
--

INSERT INTO `variante` (`id_variante`, `nombre`, `id_lengua`) VALUES
(1, 'zapoteco de Texmelucan', 5),
(2, 'zapoteco de la Sierra sur, noroeste bajo', 5),
(3, 'zapoteco de la Sierra sur, noroeste', 5),
(4, 'zapoteco de San Antonino el Alto', 5),
(5, 'zapoteco de la Sierra sur, oeste bajo', 5),
(6, 'zapoteco de la Sierra sur, noreste alto', 5),
(7, 'zapoteco de San Miguel Aloápam', 5),
(8, 'zapoteco serrano, del noroeste', 5),
(9, 'zapoteco serrano, del oeste', 5),
(10, 'zapoteco de Santiago Yaveo', 5),
(11, 'zapoteco de Santa María Temaxcalapa', 5),
(12, 'zapoteco del oeste de Tuxtepec', 5),
(13, 'zapoteco serrano, del noroeste bajo', 5),
(14, 'zapoteco serrano, bajo', 5),
(15, 'zapoteco serrano, del sureste', 5),
(16, 'zapoteco serrano, del sureste medio', 5),
(17, 'zapoteco de Santiago Laxopa', 5),
(18, 'zapoteco serrano, del sureste alto', 5),
(19, 'zapoteco serrano, del sureste bajo', 5),
(20, 'zapoteco serrano, del oeste medio', 5),
(21, 'zapoteco de Valles del sur', 5),
(22, 'zapoteco de la costa central', 5),
(23, 'zapoteco de la costa oeste', 5),
(24, 'zapoteco de San Vicente Coatlán', 5),
(25, 'zapoteco de la Sierra sur, del este bajo', 5),
(26, 'zapoteco de la Sierra sur, central', 5),
(27, 'zapoteco de la Sierra sur, noroeste medio', 5),
(28, 'zapoteco de Quiavicuzas', 5),
(29, 'zapoteco de la costa noreste', 5),
(30, 'zapoteco de la Sierra sur, del sureste alto', 5),
(31, 'zapoteco de San Bartolo Yautepec', 5),
(32, 'zapoteco de Asunción Tlacolulita', 5),
(33, 'zapoteco de la costa este', 5),
(34, 'zapoteco de Valles, del noroeste bajo', 5),
(35, 'zapoteco de Valles, del noroeste medio', 5),
(36, 'zapoteco de Valles, norte', 5),
(37, 'zapoteco de Valles (variante)', 5),
(38, 'zapoteco de San Ildefonso Villa Alta', 5),
(39, 'chinanteco del norte', 6),
(40, 'chinanteco central bajo', 6),
(41, 'chinanteco del sureste bajo', 6),
(42, 'chinanteco de la Sierra', 6),
(43, 'chinanteco del noroeste', 6),
(44, 'chinanteco del oeste', 6),
(45, 'chinanteco del oeste central alto', 6),
(46, 'chinanteco central', 6),
(47, 'chinanteco del sureste medio', 6),
(48, 'chinanteco del sureste medio (variante)', 6),
(49, 'mazateco del este bajo', 7),
(50, 'mazateco de la presa bajo', 7),
(51, 'mazateco del noreste', 7),
(52, 'mazateco del centro', 7),
(53, 'mazateco del sureste', 7),
(54, 'mazateco de Eloxochitlán', 7),
(55, 'mazateco del norte', 7),
(56, 'mazateco del oeste', 7),
(57, 'mazateco de Huehuetlán', 7),
(58, 'mazateco de la presa alto', 7),
(59, 'mazateco de Ocopetatillo', 7),
(60, 'mazateco de Acatepec', 7),
(61, 'mazateco de Puebla', 7),
(62, 'zapoteco de Texmelucan', 5),
(63, 'zapoteco de la Sierra sur, noroeste bajo', 5),
(64, 'zapoteco de la Sierra sur, noroeste', 5),
(65, 'zapoteco de San Antonino el Alto', 5),
(66, 'zapoteco de la Sierra sur, oeste bajo', 5),
(67, 'zapoteco de la Sierra sur, noreste alto', 5),
(68, 'zapoteco de San Miguel Aloápam', 5),
(69, 'zapoteco serrano, del noroeste', 5),
(70, 'zapoteco serrano, del oeste', 5),
(71, 'zapoteco de Santiago Yaveo', 5),
(72, 'zapoteco de Santa María Temaxcalapa', 5),
(73, 'zapoteco del oeste de Tuxtepec', 5),
(74, 'zapoteco serrano, del noroeste bajo', 5),
(75, 'zapoteco serrano, bajo', 5),
(76, 'zapoteco serrano, del sureste', 5),
(77, 'zapoteco serrano, del sureste medio', 5),
(78, 'zapoteco de Santiago Laxopa', 5),
(79, 'zapoteco serrano, del sureste alto', 5),
(80, 'zapoteco serrano, del sureste bajo', 5),
(81, 'zapoteco serrano, del oeste medio', 5),
(82, 'zapoteco de Valles del sur', 5),
(83, 'zapoteco de la costa central', 5),
(84, 'zapoteco de la costa oeste', 5),
(85, 'zapoteco de San Vicente Coatlán', 5),
(86, 'zapoteco de la Sierra sur, del este bajo', 5),
(87, 'zapoteco de la Sierra sur, central', 5),
(88, 'zapoteco de la Sierra sur, noroeste medio', 5),
(89, 'zapoteco de Quiavicuzas', 5),
(90, 'zapoteco de la costa noreste', 5),
(91, 'zapoteco de la Sierra sur, del sureste alto', 5),
(92, 'zapoteco de San Bartolo Yautepec', 5),
(93, 'zapoteco de Asunción Tlacolulita', 5),
(94, 'zapoteco de la costa este', 5),
(95, 'zapoteco de Valles, del noroeste bajo', 5),
(96, 'zapoteco de Valles, del noroeste medio', 5),
(97, 'zapoteco de Valles, norte', 5),
(98, 'zapoteco de Valles (variante)', 5),
(99, 'zapoteco de San Ildefonso Villa Alta', 5),
(100, 'chinanteco del norte', 6),
(101, 'chinanteco central bajo', 6),
(102, 'chinanteco del sureste bajo', 6),
(103, 'chinanteco de la Sierra', 6),
(104, 'chinanteco del noroeste', 6),
(105, 'chinanteco del oeste', 6),
(106, 'chinanteco del oeste central alto', 6),
(107, 'chinanteco central', 6),
(108, 'chinanteco del sureste medio', 6),
(109, 'chinanteco del sureste medio (variante)', 6),
(110, 'mazateco del este bajo', 7),
(111, 'mazateco de la presa bajo', 7),
(112, 'mazateco del noreste', 7),
(113, 'mazateco del centro', 7),
(114, 'mazateco del sureste', 7),
(115, 'mazateco de Eloxochitlán', 7),
(116, 'mazateco del norte', 7),
(117, 'mazateco del oeste', 7),
(118, 'mazateco de Huehuetlán', 7),
(119, 'mazateco de la presa alto', 7),
(120, 'mazateco de Ocopetatillo', 7),
(121, 'mazateco de Acatepec', 7),
(122, 'mazateco de Puebla', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variante_municipio`
--

CREATE TABLE `variante_municipio` (
  `id_variante` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `variante_municipio`
--

INSERT INTO `variante_municipio` (`id_variante`, `id_municipio`) VALUES
(1, 1),
(2, 2),
(3, 2),
(3, 3),
(3, 4),
(4, 5),
(5, 6),
(5, 7),
(6, 8),
(6, 9),
(7, 10),
(8, 11),
(8, 12),
(9, 13),
(9, 14),
(9, 15),
(9, 16),
(9, 17),
(9, 18),
(10, 19),
(10, 20),
(10, 21),
(11, 22),
(11, 23),
(12, 24),
(12, 25),
(12, 26),
(12, 27),
(12, 28),
(12, 29),
(12, 30),
(12, 31),
(12, 32),
(13, 26),
(13, 33),
(13, 34),
(13, 35),
(13, 36),
(13, 37),
(13, 38),
(13, 39),
(13, 40),
(13, 41),
(13, 42),
(14, 33),
(14, 43),
(14, 44),
(14, 45),
(14, 46),
(14, 47),
(15, 44),
(15, 48),
(15, 49),
(15, 50),
(15, 51),
(16, 48),
(16, 52),
(17, 53),
(18, 54),
(18, 55),
(18, 56),
(18, 57),
(19, 58),
(19, 59),
(20, 60),
(20, 61),
(20, 62),
(21, 63),
(21, 64),
(21, 65),
(21, 66),
(22, 64),
(22, 67),
(22, 68),
(22, 69),
(23, 68),
(23, 70),
(23, 71),
(23, 72),
(23, 73),
(23, 74),
(23, 75),
(23, 76),
(24, 77),
(25, 78),
(25, 79),
(25, 80),
(25, 81),
(25, 82),
(25, 83),
(26, 79),
(26, 84),
(26, 85),
(26, 86),
(27, 87),
(27, 88),
(27, 89),
(27, 90),
(27, 91),
(27, 92),
(27, 93),
(27, 94),
(28, 78),
(29, 87),
(29, 95),
(29, 96),
(30, 97),
(31, 98),
(32, 99),
(33, 87),
(33, 95),
(33, 96),
(33, 100),
(34, 101),
(34, 102),
(34, 103),
(34, 104),
(34, 105),
(34, 106),
(35, 107),
(35, 108),
(35, 109),
(36, 110),
(36, 111),
(36, 112),
(36, 113),
(36, 114),
(36, 115),
(36, 116),
(36, 117),
(37, 118),
(37, 119),
(37, 120),
(38, 33),
(39, 121),
(39, 122),
(39, 123),
(39, 124),
(39, 125),
(39, 126),
(39, 127),
(39, 128),
(39, 129),
(39, 130),
(39, 131),
(39, 132),
(40, 133),
(41, 133),
(42, 133),
(43, 134),
(43, 135),
(43, 136),
(43, 137),
(43, 138),
(44, 139),
(44, 140),
(45, 141),
(46, 122),
(46, 142),
(47, 143),
(47, 144),
(47, 145),
(47, 146),
(48, 122),
(48, 123),
(48, 135),
(48, 145),
(48, 147),
(49, 122),
(50, 148),
(50, 149),
(51, 121),
(51, 150),
(51, 151),
(51, 152),
(52, 153),
(53, 154),
(53, 155),
(53, 156),
(54, 157),
(54, 158),
(54, 159),
(55, 160),
(55, 161),
(56, 162),
(57, 163),
(58, 164),
(59, 165),
(59, 166),
(59, 167),
(59, 168),
(60, 169),
(60, 170),
(61, 171),
(62, 172),
(63, 173),
(63, 174);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`id_asignacion`),
  ADD KEY `FK_Asignacion_Solicitud` (`id_solicitud`),
  ADD KEY `FK_Asignacion_Interprete` (`id_interprete`);

--
-- Indices de la tabla `disponibilidad`
--
ALTER TABLE `disponibilidad`
  ADD PRIMARY KEY (`id_disponibilidad`),
  ADD KEY `FK_Disponibilidad_Interprete` (`id_interprete`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`id_evaluacion`),
  ADD KEY `FK_Evaluacion_Sesion` (`id_sesion`);

--
-- Indices de la tabla `interprete`
--
ALTER TABLE `interprete`
  ADD PRIMARY KEY (`id_interprete`),
  ADD KEY `FK_Interprete_Usuario` (`id_usuario`);

--
-- Indices de la tabla `interprete_lengua`
--
ALTER TABLE `interprete_lengua`
  ADD PRIMARY KEY (`id_interprete`,`id_lengua`);

--
-- Indices de la tabla `lengua`
--
ALTER TABLE `lengua`
  ADD PRIMARY KEY (`id_lengua`);

--
-- Indices de la tabla `lugar`
--
ALTER TABLE `lugar`
  ADD PRIMARY KEY (`id_lugar`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id_municipio`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`),
  ADD KEY `FK_Perfil_Lugar` (`id_lugar`),
  ADD KEY `FK_Perfil_Usuario` (`id_usuario`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `FK_Reporte_Sesion` (`id_sesion`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`id_sesion`),
  ADD KEY `FK_Sesion_Asignacion` (`id_asignacion`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `FK_Solicitud_Usuario` (`id_usuario`),
  ADD KEY `FK_Solicitud_Variante` (`id_variante`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `variante`
--
ALTER TABLE `variante`
  ADD PRIMARY KEY (`id_variante`),
  ADD KEY `id_lengua` (`id_lengua`);

--
-- Indices de la tabla `variante_municipio`
--
ALTER TABLE `variante_municipio`
  ADD PRIMARY KEY (`id_variante`,`id_municipio`),
  ADD KEY `id_municipio` (`id_municipio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `id_asignacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `disponibilidad`
--
ALTER TABLE `disponibilidad`
  MODIFY `id_disponibilidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `id_evaluacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `interprete`
--
ALTER TABLE `interprete`
  MODIFY `id_interprete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `lengua`
--
ALTER TABLE `lengua`
  MODIFY `id_lengua` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `sesion`
--
ALTER TABLE `sesion`
  MODIFY `id_sesion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `id_solicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `variante`
--
ALTER TABLE `variante`
  MODIFY `id_variante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `variante`
--
ALTER TABLE `variante`
  ADD CONSTRAINT `variante_ibfk_1` FOREIGN KEY (`id_lengua`) REFERENCES `lengua` (`id_lengua`);

--
-- Filtros para la tabla `variante_municipio`
--
ALTER TABLE `variante_municipio`
  ADD CONSTRAINT `variante_municipio_ibfk_1` FOREIGN KEY (`id_variante`) REFERENCES `variante` (`id_variante`),
  ADD CONSTRAINT `variante_municipio_ibfk_2` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
