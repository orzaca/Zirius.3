-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-12-2024 a las 04:27:53
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
-- Base de datos: `ziriuson_zirius`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateTables` ()   BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE table_name VARCHAR(255);
    
    WHILE i <= 54 DO
        SET table_name = CONCAT('steps', CASE WHEN i = 1 THEN '' ELSE i END);
        SET @query = CONCAT(
            'CREATE TABLE `', table_name, '` (
                `id` int(11) NOT NULL,
                `title` varchar(255) NOT NULL,
                `description` text NOT NULL,
                `option_yes_id` int(11) DEFAULT NULL,
                `option_no_id` int(11) DEFAULT NULL,
                `created_at` timestamp NOT NULL DEFAULT current_timestamp()
            ) ENGINE=InnoDB DEFAULT CHARSET=latin1;'
        );
        PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `tab_name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editable_texts`
--

CREATE TABLE `editable_texts` (
  `id` int(11) NOT NULL,
  `text_content` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flows`
--

CREATE TABLE `flows` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `flows`
--

INSERT INTO `flows` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'No Navega', '', '2024-12-10 16:41:11'),
(2, 'Lentitud', '', '2024-12-10 16:42:37'),
(3, 'Inestabilidad', '', '2024-12-10 17:06:35'),
(4, 'ONT Dañada', '', '2024-12-10 20:00:10'),
(5, 'PON Apagada', '', '2024-12-13 15:52:14'),
(6, 'DTH', '', '2024-12-13 15:55:25'),
(7, 'Inicio Pruebas', '', '2024-12-13 15:56:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flows1`
--

CREATE TABLE `flows1` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `flows1`
--

INSERT INTO `flows1` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Luces Ok No navega', '', '2024-12-10 21:07:39'),
(2, 'Inicio Pruebas a', '', '2024-12-13 15:40:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flows2`
--

CREATE TABLE `flows2` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `flows2`
--

INSERT INTO `flows2` (`id`, `name`, `description`, `created_at`) VALUES
(5, 'Inicio Pruebas DTH', '', '2024-12-13 16:13:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flows3`
--

CREATE TABLE `flows3` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `flows3`
--

INSERT INTO `flows3` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Inicio Pruebas HFC', '', '2024-12-13 16:20:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flows4`
--

CREATE TABLE `flows4` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `flows4`
--

INSERT INTO `flows4` (`id`, `name`, `description`, `created_at`) VALUES
(0, 'Inicio Pruebas', '', '2024-12-13 16:22:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flows5`
--

CREATE TABLE `flows5` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `flows5`
--

INSERT INTO `flows5` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Inicio Pruebas TV HFC', '', '2024-12-13 16:26:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flows6`
--

CREATE TABLE `flows6` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `flows6`
--

INSERT INTO `flows6` (`id`, `name`, `description`, `created_at`) VALUES
(5, 'Wifi', '', '2024-12-13 17:25:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manuales`
--

CREATE TABLE `manuales` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `ruta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id`, `user_id`, `mensaje`, `fecha`) VALUES
(1, 14, '', '2024-12-04 21:56:58'),
(2, 17, '', '2024-12-04 21:56:58'),
(3, 18, '', '2024-12-04 21:56:58'),
(4, 20, '', '2024-12-04 21:56:58'),
(5, 51, '', '2024-12-04 21:56:58'),
(6, 52, '', '2024-12-04 21:56:58'),
(7, 53, '', '2024-12-04 21:56:58'),
(8, 54, '', '2024-12-04 21:56:58'),
(9, 55, '', '2024-12-04 21:56:58'),
(10, 56, '', '2024-12-04 21:56:58'),
(11, 57, '', '2024-12-04 21:56:58'),
(12, 58, '', '2024-12-04 21:56:58'),
(13, 59, '', '2024-12-04 21:56:58'),
(14, 60, '', '2024-12-04 21:56:58'),
(15, 61, '', '2024-12-04 21:56:58'),
(16, 62, '', '2024-12-04 21:56:59'),
(17, 63, '', '2024-12-04 21:56:59'),
(18, 64, '', '2024-12-04 21:56:59'),
(19, 65, '', '2024-12-04 21:56:59'),
(20, 66, '', '2024-12-04 21:56:59'),
(21, 67, '', '2024-12-04 21:56:59'),
(22, 68, '', '2024-12-04 21:56:59'),
(23, 69, '', '2024-12-04 21:56:59'),
(24, 70, '', '2024-12-04 21:56:59'),
(25, 71, '', '2024-12-04 21:56:59'),
(26, 72, '', '2024-12-04 21:56:59'),
(27, 73, '', '2024-12-04 21:56:59'),
(28, 74, '', '2024-12-04 21:56:59'),
(29, 75, '', '2024-12-04 21:56:59'),
(30, 76, '', '2024-12-04 21:56:59'),
(31, 77, '', '2024-12-04 21:56:59'),
(32, 78, '', '2024-12-04 21:56:59'),
(33, 79, '', '2024-12-04 21:56:59'),
(34, 80, '', '2024-12-04 21:56:59'),
(35, 81, '', '2024-12-04 21:56:59'),
(36, 82, '', '2024-12-04 21:56:59'),
(37, 83, '', '2024-12-04 21:56:59'),
(38, 84, '', '2024-12-04 21:56:59'),
(39, 85, '', '2024-12-04 21:56:59'),
(40, 86, '', '2024-12-04 21:56:59'),
(41, 87, '', '2024-12-04 21:56:59'),
(42, 88, '', '2024-12-04 21:56:59'),
(43, 89, '', '2024-12-04 21:56:59'),
(44, 91, '', '2024-12-04 21:57:00'),
(45, 92, '', '2024-12-04 21:57:00'),
(46, 93, '', '2024-12-04 21:57:00'),
(47, 94, '', '2024-12-04 21:57:00'),
(48, 95, '', '2024-12-04 21:57:00'),
(49, 96, '', '2024-12-04 21:57:00'),
(50, 97, '', '2024-12-04 21:57:00'),
(51, 98, '', '2024-12-04 21:57:00'),
(52, 99, '', '2024-12-04 21:57:00'),
(53, 100, '', '2024-12-04 21:57:00'),
(54, 101, '', '2024-12-04 21:57:00'),
(55, 102, '', '2024-12-04 21:57:00'),
(56, 103, '', '2024-12-04 21:57:00'),
(57, 104, '', '2024-12-04 21:57:00'),
(58, 105, '', '2024-12-04 21:57:00'),
(59, 106, '', '2024-12-04 21:57:00'),
(60, 107, '', '2024-12-04 21:57:00'),
(61, 108, '', '2024-12-04 21:57:00'),
(62, 109, '', '2024-12-04 21:57:00'),
(63, 110, '', '2024-12-04 21:57:00'),
(64, 111, '', '2024-12-04 21:57:00'),
(65, 112, '', '2024-12-04 21:57:00'),
(66, 113, '', '2024-12-04 21:57:00'),
(67, 114, '', '2024-12-04 21:57:00'),
(68, 115, '', '2024-12-04 21:57:00'),
(69, 116, '', '2024-12-04 21:57:00'),
(70, 117, '', '2024-12-04 21:57:01'),
(71, 118, '', '2024-12-04 21:57:01'),
(72, 119, '', '2024-12-04 21:57:01'),
(73, 120, '', '2024-12-04 21:57:01'),
(74, 121, '', '2024-12-04 21:57:01'),
(75, 122, '', '2024-12-04 21:57:01'),
(76, 123, '', '2024-12-04 21:57:01'),
(77, 124, '', '2024-12-04 21:57:01'),
(78, 125, '', '2024-12-04 21:57:01'),
(79, 126, '', '2024-12-04 21:57:01'),
(80, 127, '', '2024-12-04 21:57:01'),
(81, 128, '', '2024-12-04 21:57:01'),
(82, 129, '', '2024-12-04 21:57:01'),
(83, 130, '', '2024-12-04 21:57:01'),
(84, 131, '', '2024-12-04 21:57:01'),
(85, 132, '', '2024-12-04 21:57:01'),
(86, 133, '', '2024-12-04 21:57:01'),
(87, 14, 'asdasd', '2024-12-04 21:57:01'),
(88, 17, 'asdasd', '2024-12-04 21:57:01'),
(89, 18, 'asdasd', '2024-12-04 21:57:01'),
(90, 20, 'asdasd', '2024-12-04 21:57:01'),
(91, 51, 'asdasd', '2024-12-04 21:57:01'),
(92, 52, 'asdasd', '2024-12-04 21:57:01'),
(93, 53, 'asdasd', '2024-12-04 21:57:01'),
(94, 54, 'asdasd', '2024-12-04 21:57:02'),
(95, 55, 'asdasd', '2024-12-04 21:57:02'),
(96, 56, 'asdasd', '2024-12-04 21:57:02'),
(97, 57, 'asdasd', '2024-12-04 21:57:02'),
(98, 58, 'asdasd', '2024-12-04 21:57:02'),
(99, 59, 'asdasd', '2024-12-04 21:57:02'),
(100, 60, 'asdasd', '2024-12-04 21:57:02'),
(101, 61, 'asdasd', '2024-12-04 21:57:02'),
(102, 62, 'asdasd', '2024-12-04 21:57:02'),
(103, 63, 'asdasd', '2024-12-04 21:57:02'),
(104, 64, 'asdasd', '2024-12-04 21:57:02'),
(105, 65, 'asdasd', '2024-12-04 21:57:02'),
(106, 66, 'asdasd', '2024-12-04 21:57:02'),
(107, 67, 'asdasd', '2024-12-04 21:57:02'),
(108, 68, 'asdasd', '2024-12-04 21:57:02'),
(109, 69, 'asdasd', '2024-12-04 21:57:02'),
(110, 70, 'asdasd', '2024-12-04 21:57:02'),
(111, 71, 'asdasd', '2024-12-04 21:57:02'),
(112, 72, 'asdasd', '2024-12-04 21:57:02'),
(113, 73, 'asdasd', '2024-12-04 21:57:02'),
(114, 74, 'asdasd', '2024-12-04 21:57:02'),
(115, 75, 'asdasd', '2024-12-04 21:57:02'),
(116, 76, 'asdasd', '2024-12-04 21:57:03'),
(117, 77, 'asdasd', '2024-12-04 21:57:03'),
(118, 78, 'asdasd', '2024-12-04 21:57:03'),
(119, 79, 'asdasd', '2024-12-04 21:57:03'),
(120, 80, 'asdasd', '2024-12-04 21:57:03'),
(121, 81, 'asdasd', '2024-12-04 21:57:03'),
(122, 82, 'asdasd', '2024-12-04 21:57:03'),
(123, 83, 'asdasd', '2024-12-04 21:57:03'),
(124, 84, 'asdasd', '2024-12-04 21:57:03'),
(125, 85, 'asdasd', '2024-12-04 21:57:03'),
(126, 86, 'asdasd', '2024-12-04 21:57:03'),
(127, 87, 'asdasd', '2024-12-04 21:57:03'),
(128, 88, 'asdasd', '2024-12-04 21:57:03'),
(129, 89, 'asdasd', '2024-12-04 21:57:03'),
(130, 91, 'asdasd', '2024-12-04 21:57:03'),
(131, 92, 'asdasd', '2024-12-04 21:57:03'),
(132, 93, 'asdasd', '2024-12-04 21:57:04'),
(133, 94, 'asdasd', '2024-12-04 21:57:04'),
(134, 95, 'asdasd', '2024-12-04 21:57:04'),
(135, 96, 'asdasd', '2024-12-04 21:57:04'),
(136, 97, 'asdasd', '2024-12-04 21:57:04'),
(137, 98, 'asdasd', '2024-12-04 21:57:04'),
(138, 99, 'asdasd', '2024-12-04 21:57:04'),
(139, 100, 'asdasd', '2024-12-04 21:57:04'),
(140, 101, 'asdasd', '2024-12-04 21:57:04'),
(141, 102, 'asdasd', '2024-12-04 21:57:04'),
(142, 103, 'asdasd', '2024-12-04 21:57:04'),
(143, 104, 'asdasd', '2024-12-04 21:57:04'),
(144, 105, 'asdasd', '2024-12-04 21:57:04'),
(145, 106, 'asdasd', '2024-12-04 21:57:04'),
(146, 107, 'asdasd', '2024-12-04 21:57:04'),
(147, 108, 'asdasd', '2024-12-04 21:57:04'),
(148, 109, 'asdasd', '2024-12-04 21:57:04'),
(149, 110, 'asdasd', '2024-12-04 21:57:04'),
(150, 111, 'asdasd', '2024-12-04 21:57:04'),
(151, 112, 'asdasd', '2024-12-04 21:57:04'),
(152, 113, 'asdasd', '2024-12-04 21:57:04'),
(153, 114, 'asdasd', '2024-12-04 21:57:04'),
(154, 115, 'asdasd', '2024-12-04 21:57:04'),
(155, 116, 'asdasd', '2024-12-04 21:57:04'),
(156, 117, 'asdasd', '2024-12-04 21:57:04'),
(157, 118, 'asdasd', '2024-12-04 21:57:04'),
(158, 119, 'asdasd', '2024-12-04 21:57:04'),
(159, 120, 'asdasd', '2024-12-04 21:57:04'),
(160, 121, 'asdasd', '2024-12-04 21:57:04'),
(161, 122, 'asdasd', '2024-12-04 21:57:04'),
(162, 123, 'asdasd', '2024-12-04 21:57:05'),
(163, 124, 'asdasd', '2024-12-04 21:57:05'),
(164, 125, 'asdasd', '2024-12-04 21:57:05'),
(165, 126, 'asdasd', '2024-12-04 21:57:05'),
(166, 127, 'asdasd', '2024-12-04 21:57:05'),
(167, 128, 'asdasd', '2024-12-04 21:57:05'),
(168, 129, 'asdasd', '2024-12-04 21:57:05'),
(169, 130, 'asdasd', '2024-12-04 21:57:05'),
(170, 131, 'asdasd', '2024-12-04 21:57:05'),
(171, 132, 'asdasd', '2024-12-04 21:57:05'),
(172, 133, 'asdasd', '2024-12-04 21:57:05'),
(173, 14, 'asdasd', '2024-12-04 21:57:05'),
(174, 17, 'asdasd', '2024-12-04 21:57:05'),
(175, 18, 'asdasd', '2024-12-04 21:57:05'),
(176, 20, 'asdasd', '2024-12-04 21:57:05'),
(177, 51, 'asdasd', '2024-12-04 21:57:05'),
(178, 52, 'asdasd', '2024-12-04 21:57:05'),
(179, 53, 'asdasd', '2024-12-04 21:57:05'),
(180, 54, 'asdasd', '2024-12-04 21:57:05'),
(181, 55, 'asdasd', '2024-12-04 21:57:05'),
(182, 56, 'asdasd', '2024-12-04 21:57:05'),
(183, 57, 'asdasd', '2024-12-04 21:57:05'),
(184, 58, 'asdasd', '2024-12-04 21:57:05'),
(185, 59, 'asdasd', '2024-12-04 21:57:05'),
(186, 60, 'asdasd', '2024-12-04 21:57:05'),
(187, 61, 'asdasd', '2024-12-04 21:57:05'),
(188, 62, 'asdasd', '2024-12-04 21:57:05'),
(189, 63, 'asdasd', '2024-12-04 21:57:05'),
(190, 64, 'asdasd', '2024-12-04 21:57:05'),
(191, 65, 'asdasd', '2024-12-04 21:57:05'),
(192, 66, 'asdasd', '2024-12-04 21:57:05'),
(193, 67, 'asdasd', '2024-12-04 21:57:06'),
(194, 68, 'asdasd', '2024-12-04 21:57:06'),
(195, 69, 'asdasd', '2024-12-04 21:57:06'),
(196, 70, 'asdasd', '2024-12-04 21:57:06'),
(197, 71, 'asdasd', '2024-12-04 21:57:06'),
(198, 72, 'asdasd', '2024-12-04 21:57:06'),
(199, 73, 'asdasd', '2024-12-04 21:57:06'),
(200, 74, 'asdasd', '2024-12-04 21:57:06'),
(201, 75, 'asdasd', '2024-12-04 21:57:06'),
(202, 76, 'asdasd', '2024-12-04 21:57:06'),
(203, 77, 'asdasd', '2024-12-04 21:57:06'),
(204, 78, 'asdasd', '2024-12-04 21:57:06'),
(205, 79, 'asdasd', '2024-12-04 21:57:06'),
(206, 80, 'asdasd', '2024-12-04 21:57:06'),
(207, 81, 'asdasd', '2024-12-04 21:57:06'),
(208, 82, 'asdasd', '2024-12-04 21:57:06'),
(209, 83, 'asdasd', '2024-12-04 21:57:06'),
(210, 84, 'asdasd', '2024-12-04 21:57:06'),
(211, 85, 'asdasd', '2024-12-04 21:57:06'),
(212, 86, 'asdasd', '2024-12-04 21:57:06'),
(213, 87, 'asdasd', '2024-12-04 21:57:06'),
(214, 88, 'asdasd', '2024-12-04 21:57:06'),
(215, 89, 'asdasd', '2024-12-04 21:57:07'),
(216, 91, 'asdasd', '2024-12-04 21:57:07'),
(217, 92, 'asdasd', '2024-12-04 21:57:07'),
(218, 93, 'asdasd', '2024-12-04 21:57:07'),
(219, 94, 'asdasd', '2024-12-04 21:57:07'),
(220, 95, 'asdasd', '2024-12-04 21:57:07'),
(221, 96, 'asdasd', '2024-12-04 21:57:07'),
(222, 97, 'asdasd', '2024-12-04 21:57:07'),
(223, 98, 'asdasd', '2024-12-04 21:57:07'),
(224, 99, 'asdasd', '2024-12-04 21:57:07'),
(225, 100, 'asdasd', '2024-12-04 21:57:07'),
(226, 101, 'asdasd', '2024-12-04 21:57:07'),
(227, 102, 'asdasd', '2024-12-04 21:57:07'),
(228, 103, 'asdasd', '2024-12-04 21:57:07'),
(229, 104, 'asdasd', '2024-12-04 21:57:07'),
(230, 105, 'asdasd', '2024-12-04 21:57:07'),
(231, 106, 'asdasd', '2024-12-04 21:57:07'),
(232, 107, 'asdasd', '2024-12-04 21:57:07'),
(233, 108, 'asdasd', '2024-12-04 21:57:07'),
(234, 109, 'asdasd', '2024-12-04 21:57:07'),
(235, 110, 'asdasd', '2024-12-04 21:57:07'),
(236, 111, 'asdasd', '2024-12-04 21:57:07'),
(237, 112, 'asdasd', '2024-12-04 21:57:07'),
(238, 113, 'asdasd', '2024-12-04 21:57:07'),
(239, 114, 'asdasd', '2024-12-04 21:57:07'),
(240, 115, 'asdasd', '2024-12-04 21:57:07'),
(241, 116, 'asdasd', '2024-12-04 21:57:07'),
(242, 117, 'asdasd', '2024-12-04 21:57:07'),
(243, 118, 'asdasd', '2024-12-04 21:57:07'),
(244, 119, 'asdasd', '2024-12-04 21:57:07'),
(245, 120, 'asdasd', '2024-12-04 21:57:07'),
(246, 121, 'asdasd', '2024-12-04 21:57:08'),
(247, 122, 'asdasd', '2024-12-04 21:57:08'),
(248, 123, 'asdasd', '2024-12-04 21:57:08'),
(249, 124, 'asdasd', '2024-12-04 21:57:08'),
(250, 125, 'asdasd', '2024-12-04 21:57:08'),
(251, 126, 'asdasd', '2024-12-04 21:57:08'),
(252, 127, 'asdasd', '2024-12-04 21:57:08'),
(253, 128, 'asdasd', '2024-12-04 21:57:08'),
(254, 129, 'asdasd', '2024-12-04 21:57:08'),
(255, 130, 'asdasd', '2024-12-04 21:57:08'),
(256, 131, 'asdasd', '2024-12-04 21:57:08'),
(257, 132, 'asdasd', '2024-12-04 21:57:08'),
(258, 133, 'asdasd', '2024-12-04 21:57:08'),
(259, 14, 'asda', '2024-12-04 21:57:08'),
(260, 17, 'asda', '2024-12-04 21:57:08'),
(261, 18, 'asda', '2024-12-04 21:57:08'),
(262, 20, 'asda', '2024-12-04 21:57:08'),
(263, 51, 'asda', '2024-12-04 21:57:08'),
(264, 52, 'asda', '2024-12-04 21:57:09'),
(265, 53, 'asda', '2024-12-04 21:57:09'),
(266, 54, 'asda', '2024-12-04 21:57:09'),
(267, 55, 'asda', '2024-12-04 21:57:09'),
(268, 56, 'asda', '2024-12-04 21:57:09'),
(269, 57, 'asda', '2024-12-04 21:57:09'),
(270, 58, 'asda', '2024-12-04 21:57:10'),
(271, 59, 'asda', '2024-12-04 21:57:10'),
(272, 60, 'asda', '2024-12-04 21:57:10'),
(273, 61, 'asda', '2024-12-04 21:57:10'),
(274, 62, 'asda', '2024-12-04 21:57:10'),
(275, 63, 'asda', '2024-12-04 21:57:10'),
(276, 64, 'asda', '2024-12-04 21:57:10'),
(277, 65, 'asda', '2024-12-04 21:57:10'),
(278, 66, 'asda', '2024-12-04 21:57:10'),
(279, 67, 'asda', '2024-12-04 21:57:10'),
(280, 68, 'asda', '2024-12-04 21:57:10'),
(281, 69, 'asda', '2024-12-04 21:57:10'),
(282, 70, 'asda', '2024-12-04 21:57:10'),
(283, 71, 'asda', '2024-12-04 21:57:10'),
(284, 72, 'asda', '2024-12-04 21:57:10'),
(285, 73, 'asda', '2024-12-04 21:57:10'),
(286, 74, 'asda', '2024-12-04 21:57:11'),
(287, 75, 'asda', '2024-12-04 21:57:11'),
(288, 76, 'asda', '2024-12-04 21:57:11'),
(289, 77, 'asda', '2024-12-04 21:57:11'),
(290, 78, 'asda', '2024-12-04 21:57:11'),
(291, 79, 'asda', '2024-12-04 21:57:11'),
(292, 80, 'asda', '2024-12-04 21:57:11'),
(293, 81, 'asda', '2024-12-04 21:57:11'),
(294, 82, 'asda', '2024-12-04 21:57:11'),
(295, 83, 'asda', '2024-12-04 21:57:11'),
(296, 84, 'asda', '2024-12-04 21:57:11'),
(297, 85, 'asda', '2024-12-04 21:57:11'),
(298, 86, 'asda', '2024-12-04 21:57:11'),
(299, 87, 'asda', '2024-12-04 21:57:11'),
(300, 88, 'asda', '2024-12-04 21:57:11'),
(301, 89, 'asda', '2024-12-04 21:57:11'),
(302, 91, 'asda', '2024-12-04 21:57:11'),
(303, 92, 'asda', '2024-12-04 21:57:11'),
(304, 93, 'asda', '2024-12-04 21:57:11'),
(305, 94, 'asda', '2024-12-04 21:57:11'),
(306, 95, 'asda', '2024-12-04 21:57:11'),
(307, 96, 'asda', '2024-12-04 21:57:11'),
(308, 97, 'asda', '2024-12-04 21:57:12'),
(309, 98, 'asda', '2024-12-04 21:57:12'),
(310, 99, 'asda', '2024-12-04 21:57:12'),
(311, 100, 'asda', '2024-12-04 21:57:12'),
(312, 101, 'asda', '2024-12-04 21:57:12'),
(313, 102, 'asda', '2024-12-04 21:57:12'),
(314, 103, 'asda', '2024-12-04 21:57:12'),
(315, 104, 'asda', '2024-12-04 21:57:12'),
(316, 105, 'asda', '2024-12-04 21:57:12'),
(317, 106, 'asda', '2024-12-04 21:57:12'),
(318, 107, 'asda', '2024-12-04 21:57:12'),
(319, 108, 'asda', '2024-12-04 21:57:12'),
(320, 109, 'asda', '2024-12-04 21:57:12'),
(321, 110, 'asda', '2024-12-04 21:57:12'),
(322, 111, 'asda', '2024-12-04 21:57:12'),
(323, 112, 'asda', '2024-12-04 21:57:13'),
(324, 113, 'asda', '2024-12-04 21:57:13'),
(325, 114, 'asda', '2024-12-04 21:57:13'),
(326, 115, 'asda', '2024-12-04 21:57:13'),
(327, 116, 'asda', '2024-12-04 21:57:13'),
(328, 117, 'asda', '2024-12-04 21:57:13'),
(329, 118, 'asda', '2024-12-04 21:57:13'),
(330, 119, 'asda', '2024-12-04 21:57:13'),
(331, 120, 'asda', '2024-12-04 21:57:13'),
(332, 121, 'asda', '2024-12-04 21:57:13'),
(333, 122, 'asda', '2024-12-04 21:57:13'),
(334, 123, 'asda', '2024-12-04 21:57:13'),
(335, 124, 'asda', '2024-12-04 21:57:13'),
(336, 125, 'asda', '2024-12-04 21:57:14'),
(337, 126, 'asda', '2024-12-04 21:57:14'),
(338, 127, 'asda', '2024-12-04 21:57:14'),
(339, 128, 'asda', '2024-12-04 21:57:14'),
(340, 129, 'asda', '2024-12-04 21:57:14'),
(341, 130, 'asda', '2024-12-04 21:57:14'),
(342, 131, 'asda', '2024-12-04 21:57:14'),
(343, 132, 'asda', '2024-12-04 21:57:14'),
(344, 133, 'asda', '2024-12-04 21:57:14'),
(345, 14, 'asdasd', '2024-12-04 21:58:17'),
(346, 17, 'asdasd', '2024-12-04 21:58:17'),
(347, 18, 'asdasd', '2024-12-04 21:58:17'),
(348, 20, 'asdasd', '2024-12-04 21:58:17'),
(349, 51, 'asdasd', '2024-12-04 21:58:17'),
(350, 52, 'asdasd', '2024-12-04 21:58:17'),
(351, 53, 'asdasd', '2024-12-04 21:58:17'),
(352, 54, 'asdasd', '2024-12-04 21:58:17'),
(353, 55, 'asdasd', '2024-12-04 21:58:17'),
(354, 56, 'asdasd', '2024-12-04 21:58:18'),
(355, 57, 'asdasd', '2024-12-04 21:58:18'),
(356, 58, 'asdasd', '2024-12-04 21:58:18'),
(357, 59, 'asdasd', '2024-12-04 21:58:18'),
(358, 60, 'asdasd', '2024-12-04 21:58:18'),
(359, 61, 'asdasd', '2024-12-04 21:58:18'),
(360, 62, 'asdasd', '2024-12-04 21:58:18'),
(361, 63, 'asdasd', '2024-12-04 21:58:18'),
(362, 64, 'asdasd', '2024-12-04 21:58:18'),
(363, 65, 'asdasd', '2024-12-04 21:58:18'),
(364, 66, 'asdasd', '2024-12-04 21:58:18'),
(365, 67, 'asdasd', '2024-12-04 21:58:18'),
(366, 68, 'asdasd', '2024-12-04 21:58:18'),
(367, 69, 'asdasd', '2024-12-04 21:58:18'),
(368, 70, 'asdasd', '2024-12-04 21:58:18'),
(369, 71, 'asdasd', '2024-12-04 21:58:18'),
(370, 72, 'asdasd', '2024-12-04 21:58:19'),
(371, 73, 'asdasd', '2024-12-04 21:58:19'),
(372, 74, 'asdasd', '2024-12-04 21:58:19'),
(373, 75, 'asdasd', '2024-12-04 21:58:19'),
(374, 76, 'asdasd', '2024-12-04 21:58:19'),
(375, 77, 'asdasd', '2024-12-04 21:58:19'),
(376, 78, 'asdasd', '2024-12-04 21:58:19'),
(377, 79, 'asdasd', '2024-12-04 21:58:19'),
(378, 80, 'asdasd', '2024-12-04 21:58:19'),
(379, 81, 'asdasd', '2024-12-04 21:58:19'),
(380, 82, 'asdasd', '2024-12-04 21:58:19'),
(381, 83, 'asdasd', '2024-12-04 21:58:19'),
(382, 84, 'asdasd', '2024-12-04 21:58:19'),
(383, 85, 'asdasd', '2024-12-04 21:58:19'),
(384, 86, 'asdasd', '2024-12-04 21:58:19'),
(385, 87, 'asdasd', '2024-12-04 21:58:19'),
(386, 88, 'asdasd', '2024-12-04 21:58:20'),
(387, 89, 'asdasd', '2024-12-04 21:58:20'),
(388, 91, 'asdasd', '2024-12-04 21:58:20'),
(389, 92, 'asdasd', '2024-12-04 21:58:20'),
(390, 93, 'asdasd', '2024-12-04 21:58:20'),
(391, 94, 'asdasd', '2024-12-04 21:58:20'),
(392, 95, 'asdasd', '2024-12-04 21:58:20'),
(393, 96, 'asdasd', '2024-12-04 21:58:20'),
(394, 97, 'asdasd', '2024-12-04 21:58:20'),
(395, 98, 'asdasd', '2024-12-04 21:58:20'),
(396, 99, 'asdasd', '2024-12-04 21:58:20'),
(397, 100, 'asdasd', '2024-12-04 21:58:20'),
(398, 101, 'asdasd', '2024-12-04 21:58:20'),
(399, 102, 'asdasd', '2024-12-04 21:58:20'),
(400, 103, 'asdasd', '2024-12-04 21:58:20'),
(401, 104, 'asdasd', '2024-12-04 21:58:20'),
(402, 105, 'asdasd', '2024-12-04 21:58:21'),
(403, 106, 'asdasd', '2024-12-04 21:58:21'),
(404, 107, 'asdasd', '2024-12-04 21:58:21'),
(405, 108, 'asdasd', '2024-12-04 21:58:21'),
(406, 109, 'asdasd', '2024-12-04 21:58:21'),
(407, 110, 'asdasd', '2024-12-04 21:58:21'),
(408, 111, 'asdasd', '2024-12-04 21:58:21'),
(409, 112, 'asdasd', '2024-12-04 21:58:21'),
(410, 113, 'asdasd', '2024-12-04 21:58:21'),
(411, 114, 'asdasd', '2024-12-04 21:58:21'),
(412, 115, 'asdasd', '2024-12-04 21:58:21'),
(413, 116, 'asdasd', '2024-12-04 21:58:21'),
(414, 117, 'asdasd', '2024-12-04 21:58:21'),
(415, 118, 'asdasd', '2024-12-04 21:58:21'),
(416, 119, 'asdasd', '2024-12-04 21:58:21'),
(417, 120, 'asdasd', '2024-12-04 21:58:21'),
(418, 121, 'asdasd', '2024-12-04 21:58:22'),
(419, 122, 'asdasd', '2024-12-04 21:58:22'),
(420, 123, 'asdasd', '2024-12-04 21:58:22'),
(421, 124, 'asdasd', '2024-12-04 21:58:22'),
(422, 125, 'asdasd', '2024-12-04 21:58:22'),
(423, 126, 'asdasd', '2024-12-04 21:58:22'),
(424, 127, 'asdasd', '2024-12-04 21:58:22'),
(425, 128, 'asdasd', '2024-12-04 21:58:22'),
(426, 129, 'asdasd', '2024-12-04 21:58:22'),
(427, 130, 'asdasd', '2024-12-04 21:58:22'),
(428, 131, 'asdasd', '2024-12-04 21:58:22'),
(429, 132, 'asdasd', '2024-12-04 21:58:22'),
(430, 133, 'asdasd', '2024-12-04 21:58:22'),
(431, 14, 'asdasdasdasd', '2024-12-04 21:59:07'),
(432, 17, 'asdasdasdasd', '2024-12-04 21:59:07'),
(433, 18, 'asdasdasdasd', '2024-12-04 21:59:07'),
(434, 20, 'asdasdasdasd', '2024-12-04 21:59:07'),
(435, 51, 'asdasdasdasd', '2024-12-04 21:59:07'),
(436, 52, 'asdasdasdasd', '2024-12-04 21:59:07'),
(437, 53, 'asdasdasdasd', '2024-12-04 21:59:07'),
(438, 54, 'asdasdasdasd', '2024-12-04 21:59:07'),
(439, 55, 'asdasdasdasd', '2024-12-04 21:59:07'),
(440, 56, 'asdasdasdasd', '2024-12-04 21:59:07'),
(441, 57, 'asdasdasdasd', '2024-12-04 21:59:07'),
(442, 58, 'asdasdasdasd', '2024-12-04 21:59:07'),
(443, 59, 'asdasdasdasd', '2024-12-04 21:59:07'),
(444, 60, 'asdasdasdasd', '2024-12-04 21:59:07'),
(445, 61, 'asdasdasdasd', '2024-12-04 21:59:07'),
(446, 62, 'asdasdasdasd', '2024-12-04 21:59:07'),
(447, 63, 'asdasdasdasd', '2024-12-04 21:59:07'),
(448, 64, 'asdasdasdasd', '2024-12-04 21:59:07'),
(449, 65, 'asdasdasdasd', '2024-12-04 21:59:08'),
(450, 66, 'asdasdasdasd', '2024-12-04 21:59:08'),
(451, 67, 'asdasdasdasd', '2024-12-04 21:59:08'),
(452, 68, 'asdasdasdasd', '2024-12-04 21:59:08'),
(453, 69, 'asdasdasdasd', '2024-12-04 21:59:08'),
(454, 70, 'asdasdasdasd', '2024-12-04 21:59:08'),
(455, 71, 'asdasdasdasd', '2024-12-04 21:59:08'),
(456, 72, 'asdasdasdasd', '2024-12-04 21:59:08'),
(457, 73, 'asdasdasdasd', '2024-12-04 21:59:08'),
(458, 74, 'asdasdasdasd', '2024-12-04 21:59:08'),
(459, 75, 'asdasdasdasd', '2024-12-04 21:59:08'),
(460, 76, 'asdasdasdasd', '2024-12-04 21:59:08'),
(461, 77, 'asdasdasdasd', '2024-12-04 21:59:08'),
(462, 78, 'asdasdasdasd', '2024-12-04 21:59:08'),
(463, 79, 'asdasdasdasd', '2024-12-04 21:59:08'),
(464, 80, 'asdasdasdasd', '2024-12-04 21:59:08'),
(465, 81, 'asdasdasdasd', '2024-12-04 21:59:08'),
(466, 82, 'asdasdasdasd', '2024-12-04 21:59:08'),
(467, 83, 'asdasdasdasd', '2024-12-04 21:59:08'),
(468, 84, 'asdasdasdasd', '2024-12-04 21:59:08'),
(469, 85, 'asdasdasdasd', '2024-12-04 21:59:09'),
(470, 86, 'asdasdasdasd', '2024-12-04 21:59:09'),
(471, 87, 'asdasdasdasd', '2024-12-04 21:59:09'),
(472, 88, 'asdasdasdasd', '2024-12-04 21:59:09'),
(473, 89, 'asdasdasdasd', '2024-12-04 21:59:09'),
(474, 91, 'asdasdasdasd', '2024-12-04 21:59:09'),
(475, 92, 'asdasdasdasd', '2024-12-04 21:59:09'),
(476, 93, 'asdasdasdasd', '2024-12-04 21:59:09'),
(477, 94, 'asdasdasdasd', '2024-12-04 21:59:09'),
(478, 95, 'asdasdasdasd', '2024-12-04 21:59:09'),
(479, 96, 'asdasdasdasd', '2024-12-04 21:59:09'),
(480, 97, 'asdasdasdasd', '2024-12-04 21:59:09'),
(481, 98, 'asdasdasdasd', '2024-12-04 21:59:09'),
(482, 99, 'asdasdasdasd', '2024-12-04 21:59:09'),
(483, 100, 'asdasdasdasd', '2024-12-04 21:59:09'),
(484, 101, 'asdasdasdasd', '2024-12-04 21:59:09'),
(485, 102, 'asdasdasdasd', '2024-12-04 21:59:09'),
(486, 103, 'asdasdasdasd', '2024-12-04 21:59:10'),
(487, 104, 'asdasdasdasd', '2024-12-04 21:59:10'),
(488, 105, 'asdasdasdasd', '2024-12-04 21:59:10'),
(489, 106, 'asdasdasdasd', '2024-12-04 21:59:10'),
(490, 107, 'asdasdasdasd', '2024-12-04 21:59:10'),
(491, 108, 'asdasdasdasd', '2024-12-04 21:59:10'),
(492, 109, 'asdasdasdasd', '2024-12-04 21:59:10'),
(493, 110, 'asdasdasdasd', '2024-12-04 21:59:10'),
(494, 111, 'asdasdasdasd', '2024-12-04 21:59:10'),
(495, 112, 'asdasdasdasd', '2024-12-04 21:59:10'),
(496, 113, 'asdasdasdasd', '2024-12-04 21:59:10'),
(497, 114, 'asdasdasdasd', '2024-12-04 21:59:10'),
(498, 115, 'asdasdasdasd', '2024-12-04 21:59:10'),
(499, 116, 'asdasdasdasd', '2024-12-04 21:59:10'),
(500, 117, 'asdasdasdasd', '2024-12-04 21:59:10'),
(501, 118, 'asdasdasdasd', '2024-12-04 21:59:10'),
(502, 119, 'asdasdasdasd', '2024-12-04 21:59:10'),
(503, 120, 'asdasdasdasd', '2024-12-04 21:59:10'),
(504, 121, 'asdasdasdasd', '2024-12-04 21:59:10'),
(505, 122, 'asdasdasdasd', '2024-12-04 21:59:10'),
(506, 123, 'asdasdasdasd', '2024-12-04 21:59:10'),
(507, 124, 'asdasdasdasd', '2024-12-04 21:59:10'),
(508, 125, 'asdasdasdasd', '2024-12-04 21:59:10'),
(509, 126, 'asdasdasdasd', '2024-12-04 21:59:10'),
(510, 127, 'asdasdasdasd', '2024-12-04 21:59:11'),
(511, 128, 'asdasdasdasd', '2024-12-04 21:59:11'),
(512, 129, 'asdasdasdasd', '2024-12-04 21:59:11'),
(513, 130, 'asdasdasdasd', '2024-12-04 21:59:11'),
(514, 131, 'asdasdasdasd', '2024-12-04 21:59:11'),
(515, 132, 'asdasdasdasd', '2024-12-04 21:59:11'),
(516, 133, 'asdasdasdasd', '2024-12-04 21:59:11'),
(517, 14, 'asdasdasdasd', '2024-12-04 21:59:11'),
(518, 17, 'asdasdasdasd', '2024-12-04 21:59:11'),
(519, 18, 'asdasdasdasd', '2024-12-04 21:59:11'),
(520, 20, 'asdasdasdasd', '2024-12-04 21:59:11'),
(521, 51, 'asdasdasdasd', '2024-12-04 21:59:11'),
(522, 52, 'asdasdasdasd', '2024-12-04 21:59:11'),
(523, 53, 'asdasdasdasd', '2024-12-04 21:59:11'),
(524, 54, 'asdasdasdasd', '2024-12-04 21:59:11'),
(525, 55, 'asdasdasdasd', '2024-12-04 21:59:11'),
(526, 56, 'asdasdasdasd', '2024-12-04 21:59:11'),
(527, 57, 'asdasdasdasd', '2024-12-04 21:59:11'),
(528, 58, 'asdasdasdasd', '2024-12-04 21:59:11'),
(529, 59, 'asdasdasdasd', '2024-12-04 21:59:11'),
(530, 60, 'asdasdasdasd', '2024-12-04 21:59:11'),
(531, 61, 'asdasdasdasd', '2024-12-04 21:59:11'),
(532, 62, 'asdasdasdasd', '2024-12-04 21:59:12'),
(533, 63, 'asdasdasdasd', '2024-12-04 21:59:12'),
(534, 64, 'asdasdasdasd', '2024-12-04 21:59:12'),
(535, 65, 'asdasdasdasd', '2024-12-04 21:59:12'),
(536, 66, 'asdasdasdasd', '2024-12-04 21:59:12'),
(537, 67, 'asdasdasdasd', '2024-12-04 21:59:12'),
(538, 68, 'asdasdasdasd', '2024-12-04 21:59:12'),
(539, 69, 'asdasdasdasd', '2024-12-04 21:59:12'),
(540, 70, 'asdasdasdasd', '2024-12-04 21:59:12'),
(541, 71, 'asdasdasdasd', '2024-12-04 21:59:12'),
(542, 72, 'asdasdasdasd', '2024-12-04 21:59:12'),
(543, 73, 'asdasdasdasd', '2024-12-04 21:59:12'),
(544, 74, 'asdasdasdasd', '2024-12-04 21:59:12'),
(545, 75, 'asdasdasdasd', '2024-12-04 21:59:12'),
(546, 76, 'asdasdasdasd', '2024-12-04 21:59:12'),
(547, 77, 'asdasdasdasd', '2024-12-04 21:59:12'),
(548, 78, 'asdasdasdasd', '2024-12-04 21:59:12'),
(549, 79, 'asdasdasdasd', '2024-12-04 21:59:12'),
(550, 80, 'asdasdasdasd', '2024-12-04 21:59:12'),
(551, 81, 'asdasdasdasd', '2024-12-04 21:59:12'),
(552, 82, 'asdasdasdasd', '2024-12-04 21:59:13'),
(553, 83, 'asdasdasdasd', '2024-12-04 21:59:13'),
(554, 84, 'asdasdasdasd', '2024-12-04 21:59:13'),
(555, 85, 'asdasdasdasd', '2024-12-04 21:59:13'),
(556, 86, 'asdasdasdasd', '2024-12-04 21:59:13'),
(557, 87, 'asdasdasdasd', '2024-12-04 21:59:13'),
(558, 88, 'asdasdasdasd', '2024-12-04 21:59:13'),
(559, 89, 'asdasdasdasd', '2024-12-04 21:59:13'),
(560, 91, 'asdasdasdasd', '2024-12-04 21:59:13'),
(561, 92, 'asdasdasdasd', '2024-12-04 21:59:13'),
(562, 93, 'asdasdasdasd', '2024-12-04 21:59:13'),
(563, 94, 'asdasdasdasd', '2024-12-04 21:59:13'),
(564, 95, 'asdasdasdasd', '2024-12-04 21:59:13'),
(565, 96, 'asdasdasdasd', '2024-12-04 21:59:13'),
(566, 97, 'asdasdasdasd', '2024-12-04 21:59:13'),
(567, 98, 'asdasdasdasd', '2024-12-04 21:59:13'),
(568, 99, 'asdasdasdasd', '2024-12-04 21:59:13'),
(569, 100, 'asdasdasdasd', '2024-12-04 21:59:13'),
(570, 101, 'asdasdasdasd', '2024-12-04 21:59:13'),
(571, 102, 'asdasdasdasd', '2024-12-04 21:59:13'),
(572, 103, 'asdasdasdasd', '2024-12-04 21:59:13'),
(573, 104, 'asdasdasdasd', '2024-12-04 21:59:14'),
(574, 105, 'asdasdasdasd', '2024-12-04 21:59:14'),
(575, 106, 'asdasdasdasd', '2024-12-04 21:59:14'),
(576, 107, 'asdasdasdasd', '2024-12-04 21:59:14'),
(577, 108, 'asdasdasdasd', '2024-12-04 21:59:14'),
(578, 109, 'asdasdasdasd', '2024-12-04 21:59:14'),
(579, 110, 'asdasdasdasd', '2024-12-04 21:59:14'),
(580, 111, 'asdasdasdasd', '2024-12-04 21:59:14'),
(581, 112, 'asdasdasdasd', '2024-12-04 21:59:14'),
(582, 113, 'asdasdasdasd', '2024-12-04 21:59:14'),
(583, 114, 'asdasdasdasd', '2024-12-04 21:59:14'),
(584, 115, 'asdasdasdasd', '2024-12-04 21:59:14'),
(585, 116, 'asdasdasdasd', '2024-12-04 21:59:14'),
(586, 117, 'asdasdasdasd', '2024-12-04 21:59:14'),
(587, 118, 'asdasdasdasd', '2024-12-04 21:59:14'),
(588, 119, 'asdasdasdasd', '2024-12-04 21:59:14'),
(589, 120, 'asdasdasdasd', '2024-12-04 21:59:14'),
(590, 121, 'asdasdasdasd', '2024-12-04 21:59:14'),
(591, 122, 'asdasdasdasd', '2024-12-04 21:59:14'),
(592, 123, 'asdasdasdasd', '2024-12-04 21:59:14'),
(593, 124, 'asdasdasdasd', '2024-12-04 21:59:15'),
(594, 125, 'asdasdasdasd', '2024-12-04 21:59:15'),
(595, 126, 'asdasdasdasd', '2024-12-04 21:59:15'),
(596, 127, 'asdasdasdasd', '2024-12-04 21:59:15'),
(597, 128, 'asdasdasdasd', '2024-12-04 21:59:15'),
(598, 129, 'asdasdasdasd', '2024-12-04 21:59:15'),
(599, 130, 'asdasdasdasd', '2024-12-04 21:59:15'),
(600, 131, 'asdasdasdasd', '2024-12-04 21:59:15'),
(601, 132, 'asdasdasdasd', '2024-12-04 21:59:15'),
(602, 133, 'asdasdasdasd', '2024-12-04 21:59:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes_chat`
--

CREATE TABLE `mensajes_chat` (
  `id` int(11) NOT NULL,
  `emisor` varchar(50) DEFAULT NULL,
  `receptor` varchar(50) DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `leido` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mensajes_chat`
--

INSERT INTO `mensajes_chat` (`id`, `emisor`, `receptor`, `mensaje`, `fecha`, `leido`) VALUES
(31, 'admin', 'telefonico', 'Este es un mensaje de Prueba, favor responder si lo lees 🛑🛑🛑', '2024-12-16 19:26:51', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modales`
--

CREATE TABLE `modales` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  `creado_por` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modal_config`
--

CREATE TABLE `modal_config` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `background_color` varchar(7) DEFAULT NULL,
  `text_color` varchar(7) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modal_config`
--

INSERT INTO `modal_config` (`id`, `title`, `content`, `image_url`, `background_color`, `text_color`, `created_at`) VALUES
(1, '11111111', '111', 'uploads/images.jpg', '#000000', '#000000', '2024-12-17 03:25:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `new_paragraphs`
--

CREATE TABLE `new_paragraphs` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombres_pestanas`
--

CREATE TABLE `nombres_pestanas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `nombres_pestanas`
--

INSERT INTO `nombres_pestanas` (`id`, `nombre`, `user_id`) VALUES
(1, 'Bienvenida', 0),
(2, 'Disculpas', 0),
(3, 'HFC', 0),
(4, 'Gpon', 0),
(5, 'Adsl', 0),
(6, 'Wifi', 0),
(7, 'Empatia', 0),
(8, 'Despedida', 0),
(9, 'Otros', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina1`
--

CREATE TABLE `pagina1` (
  `id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `parrafo_id` int(11) NOT NULL,
  `menu_option` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina1`
--

INSERT INTO `pagina1` (`id`, `content`, `user_id`, `parrafo_id`, `menu_option`) VALUES
(7, 'Inserta Aqui tus Scripts.', 2, 0, NULL),
(9, 'Inserta Aqui tus Scripts.', 0, 0, NULL),
(10, 'Inserta Aqui tus Scripts.', 0, 0, NULL),
(11, 'Inserta Aqui tus Scripts.', 0, 0, NULL),
(12, 'Inserta Aqui tus Scripts.', 0, 0, NULL),
(13, 'Inserta Aqui tus Scripts.', 8, 0, NULL),
(14, 'Inserta Aqui tus Scripts.', 9, 0, NULL),
(15, 'Inserta Aqui tus Scripts.', 11, 0, NULL),
(16, 'Inserta Aqui tus Scripts.', 12, 0, NULL),
(17, 'Inserta Aqui tus Scripts.', 13, 0, NULL),
(18, 'Inserta Aqui tus Scripts.', 14, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina2`
--

CREATE TABLE `pagina2` (
  `id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `pagina2_id` int(11) NOT NULL,
  `menu_option` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina2`
--

INSERT INTO `pagina2` (`id`, `content`, `user_id`, `pagina2_id`, `menu_option`) VALUES
(7, 'Inserta Aqui tus Scripts', 2, 0, NULL),
(9, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(10, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(11, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(12, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(13, 'Inserta Aqui tus Scripts', 8, 0, NULL),
(14, 'Inserta Aqui tus Scripts', 9, 0, NULL),
(15, 'Inserta Aqui tus Scripts', 11, 0, NULL),
(16, 'Inserta Aqui tus Scripts', 12, 0, NULL),
(17, 'Inserta Aqui tus Scripts', 13, 0, NULL),
(18, 'Inserta Aqui tus Scripts', 14, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina3`
--

CREATE TABLE `pagina3` (
  `id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `parrafo_id` int(11) NOT NULL,
  `menu_option` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina3`
--

INSERT INTO `pagina3` (`id`, `content`, `user_id`, `parrafo_id`, `menu_option`) VALUES
(7, 'Inserta Aqui tus Scripts.', 2, 0, NULL),
(9, 'Inserta Aqui tus Scripts.', 0, 0, NULL),
(10, 'Inserta Aqui tus Scripts.', 0, 0, NULL),
(11, 'Inserta Aqui tus Scripts.', 0, 0, NULL),
(12, 'Inserta Aqui tus Scripts.', 0, 0, NULL),
(13, 'Inserta Aqui tus Scripts.', 8, 0, NULL),
(14, 'Inserta Aqui tus Scripts.', 9, 0, NULL),
(15, 'Inserta Aqui tus Scripts.', 11, 0, NULL),
(16, 'Inserta Aqui tus Scripts.', 12, 0, NULL),
(17, 'Inserta Aqui tus Scripts.', 13, 0, NULL),
(18, 'Inserta Aqui tus Scripts.', 14, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina4`
--

CREATE TABLE `pagina4` (
  `id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `parrafo_id` int(11) NOT NULL,
  `menu_option` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina4`
--

INSERT INTO `pagina4` (`id`, `content`, `user_id`, `parrafo_id`, `menu_option`) VALUES
(7, 'Inserta Aqui tus Scripts', 2, 0, NULL),
(9, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(10, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(11, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(12, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(13, 'Inserta Aqui tus Scripts', 8, 0, NULL),
(14, 'Inserta Aqui tus Scripts', 9, 0, NULL),
(15, 'Inserta Aqui tus Scripts', 11, 0, NULL),
(16, 'Inserta Aqui tus Scripts', 12, 0, NULL),
(17, 'Inserta Aqui tus Scripts', 13, 0, NULL),
(18, 'Inserta Aqui tus Scripts', 14, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina5`
--

CREATE TABLE `pagina5` (
  `id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `parrafo_id` int(11) NOT NULL,
  `menu_option` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina5`
--

INSERT INTO `pagina5` (`id`, `content`, `user_id`, `parrafo_id`, `menu_option`) VALUES
(7, 'Inserta Aqui tus Scripts', 2, 0, NULL),
(9, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(10, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(11, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(12, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(13, 'Inserta Aqui tus Scripts', 8, 0, NULL),
(14, 'Inserta Aqui tus Scripts', 9, 0, NULL),
(15, 'Inserta Aqui tus Scripts', 11, 0, NULL),
(16, 'Inserta Aqui tus Scripts', 12, 0, NULL),
(17, 'Inserta Aqui tus Scripts', 13, 0, NULL),
(18, 'Inserta Aqui tus Scripts', 14, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina6`
--

CREATE TABLE `pagina6` (
  `id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `parrafo_id` int(11) NOT NULL,
  `menu_option` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina6`
--

INSERT INTO `pagina6` (`id`, `content`, `user_id`, `parrafo_id`, `menu_option`) VALUES
(7, 'Inserta Aqui tus Scripts', 2, 0, NULL),
(9, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(10, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(11, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(12, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(13, 'Inserta Aqui tus Scripts', 8, 0, NULL),
(14, 'Inserta Aqui tus Scripts', 9, 0, NULL),
(15, 'Inserta Aqui tus Scripts', 11, 0, NULL),
(16, 'Inserta Aqui tus Scripts', 12, 0, NULL),
(17, 'Inserta Aqui tus Scripts', 13, 0, NULL),
(18, 'Inserta Aqui tus Scripts', 14, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina7`
--

CREATE TABLE `pagina7` (
  `id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `parrafo_id` int(11) NOT NULL,
  `menu_option` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina7`
--

INSERT INTO `pagina7` (`id`, `content`, `user_id`, `parrafo_id`, `menu_option`) VALUES
(7, 'Inserta Aqui tus Scripts', 2, 0, NULL),
(9, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(10, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(11, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(12, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(13, 'Inserta Aqui tus Scripts', 8, 0, NULL),
(14, 'Inserta Aqui tus Scripts', 9, 0, NULL),
(15, 'Inserta Aqui tus Scripts', 11, 0, NULL),
(16, 'Inserta Aqui tus Scripts', 12, 0, NULL),
(17, 'Inserta Aqui tus Scripts', 13, 0, NULL),
(18, 'Inserta Aqui tus Scripts', 14, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina8`
--

CREATE TABLE `pagina8` (
  `id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `parrafo_id` int(11) NOT NULL,
  `menu_option` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina8`
--

INSERT INTO `pagina8` (`id`, `content`, `user_id`, `parrafo_id`, `menu_option`) VALUES
(7, 'Inserta Aqui tus Scripts', 2, 0, NULL),
(9, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(10, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(11, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(12, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(13, 'Inserta Aqui tus Scripts', 8, 0, NULL),
(14, 'Inserta Aqui tus Scripts', 9, 0, NULL),
(15, 'Inserta Aqui tus Scripts', 11, 0, NULL),
(16, 'Inserta Aqui tus Scripts', 12, 0, NULL),
(17, 'Inserta Aqui tus Scripts', 13, 0, NULL),
(18, 'Inserta Aqui tus Scripts', 14, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina9`
--

CREATE TABLE `pagina9` (
  `id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `parrafo_id` int(11) NOT NULL,
  `menu_option` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagina9`
--

INSERT INTO `pagina9` (`id`, `content`, `user_id`, `parrafo_id`, `menu_option`) VALUES
(7, 'Inserta Aqui tus Scripts', 2, 0, NULL),
(9, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(10, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(11, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(12, 'Inserta Aqui tus Scripts', 0, 0, NULL),
(13, 'Inserta Aqui tus Scripts', 8, 0, NULL),
(14, 'Inserta Aqui tus Scripts', 9, 0, NULL),
(15, 'Inserta Aqui tus Scripts', 11, 0, NULL),
(16, 'Inserta Aqui tus Scripts', 12, 0, NULL),
(17, 'Inserta Aqui tus Scripts', 13, 0, NULL),
(18, 'Inserta Aqui tus Scripts', 14, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paragraphs`
--

CREATE TABLE `paragraphs` (
  `id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `paragraph_id` int(11) NOT NULL,
  `menu_option` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `paragraphs`
--

INSERT INTO `paragraphs` (`id`, `content`, `user_id`, `paragraph_id`, `menu_option`) VALUES
(9, 'PAGINA2', 0, 0, NULL),
(10, 'Este es el párrafo 10. Aquí puedes agregar tu propio contenido.', 0, 0, NULL),
(11, 'Este es el párrafo 11. Modifica el texto a tu gusto.', 0, 0, NULL),
(12, 'Este es el párrafo 12. Personaliza este contenido según desees.', 0, 0, NULL),
(18, 'Este es un párrafo por defecto.', 14, 0, NULL),
(19, 'Este es un párrafo por defecto.', 15, 0, NULL),
(21, 'Este es un párrafo por defecto.', 17, 0, NULL),
(22, 'Este es un párrafo por defecto.', 18, 0, NULL),
(24, 'Este es un párrafo por defecto.', 20, 0, NULL),
(25, 'Este es un párrafo por defecto.', 21, 0, NULL),
(26, 'Este es un párrafo por defecto.', 22, 0, NULL),
(27, 'Este es un párrafo por defecto.', 23, 0, NULL),
(28, 'Este es un párrafo por defecto.', 24, 0, NULL),
(29, 'Este es un párrafo por defecto.', 25, 0, NULL),
(30, 'Este es un párrafo por defecto.', 26, 0, NULL),
(31, 'Este es un párrafo por defecto.', 27, 0, NULL),
(32, 'Este es un párrafo por defecto.', 28, 0, NULL),
(33, 'Este es un párrafo por defecto.', 29, 0, NULL),
(34, 'Este es un párrafo por defecto.', 30, 0, NULL),
(35, 'Este es un párrafo por defecto.', 31, 0, NULL),
(36, 'Este es un párrafo por defecto.', 32, 0, NULL),
(37, 'Este es un párrafo por defecto.', 33, 0, NULL),
(38, 'Este es un párrafo por defecto.', 34, 0, NULL),
(39, 'Este es un párrafo por defecto.', 35, 0, NULL),
(40, 'Este es un párrafo por defecto.', 36, 0, NULL),
(41, 'Este es un párrafo por defecto.', 37, 0, NULL),
(42, 'Este es un párrafo por defecto.', 38, 0, NULL),
(43, 'Este es un párrafo por defecto.', 39, 0, NULL),
(44, 'Este es un párrafo por defecto.', 40, 0, NULL),
(45, 'Este es un párrafo por defecto.', 41, 0, NULL),
(46, 'Este es un párrafo por defecto.', 42, 0, NULL),
(47, 'Este es un párrafo por defecto.', 43, 0, NULL),
(48, 'Este es un párrafo por defecto.', 44, 0, NULL),
(49, 'Este es un párrafo por defecto.', 45, 0, NULL),
(50, 'Este es un párrafo por defecto.', 46, 0, NULL),
(51, 'Este es un párrafo por defecto.', 47, 0, NULL),
(52, 'Este es un párrafo por defecto.', 48, 0, NULL),
(53, 'Este es un párrafo por defecto.', 49, 0, NULL),
(54, 'Este es un párrafo por defecto.', 50, 0, NULL),
(55, 'Este es un párrafo por defecto.', 51, 0, NULL),
(56, 'Este es un párrafo por defecto.', 52, 0, NULL),
(57, 'Este es un párrafo por defecto.', 53, 0, NULL),
(58, 'Este es un párrafo por defecto.', 54, 0, NULL),
(59, 'Este es un párrafo por defecto.', 55, 0, NULL),
(60, 'Este es un párrafo por defecto.', 56, 0, NULL),
(61, 'Este es un párrafo por defecto.', 57, 0, NULL),
(62, 'Este es un párrafo por defecto.', 58, 0, NULL),
(63, 'Este es un párrafo por defecto.', 59, 0, NULL),
(64, 'Este es un párrafo por defecto.', 60, 0, NULL),
(65, 'Este es un párrafo por defecto.', 61, 0, NULL),
(66, 'Este es un párrafo por defecto.', 62, 0, NULL),
(67, 'Este es un párrafo por defecto.', 63, 0, NULL),
(68, 'Este es un párrafo por defecto.', 64, 0, NULL),
(69, 'Este es un párrafo por defecto.', 65, 0, NULL),
(70, 'Este es un párrafo por defecto.', 66, 0, NULL),
(71, 'Este es un párrafo por defecto.', 67, 0, NULL),
(72, 'Este es un párrafo por defecto.', 68, 0, NULL),
(73, 'Este es un párrafo por defecto.', 69, 0, NULL),
(74, 'Este es un párrafo por defecto.', 70, 0, NULL),
(75, 'Este es un párrafo por defecto.', 71, 0, NULL),
(76, 'Este es un párrafo por defecto.', 72, 0, NULL),
(77, 'Este es un párrafo por defecto.', 73, 0, NULL),
(78, 'Este es un párrafo por defecto.', 74, 0, NULL),
(79, 'Este es un párrafo por defecto.', 75, 0, NULL),
(80, 'Este es un párrafo por defecto.', 76, 0, NULL),
(81, 'Este es un párrafo por defecto.', 77, 0, NULL),
(82, 'Este es un párrafo por defecto.', 78, 0, NULL),
(83, 'Este es un párrafo por defecto.', 79, 0, NULL),
(84, 'Este es un párrafo por defecto.', 80, 0, NULL),
(85, 'Este es un párrafo por defecto.', 81, 0, NULL),
(86, 'Este es un párrafo por defecto.', 82, 0, NULL),
(87, 'Este es un párrafo por defecto.', 83, 0, NULL),
(88, 'Este es un párrafo por defecto.', 84, 0, NULL),
(89, 'Este es un párrafo por defecto.', 85, 0, NULL),
(90, 'Este es un párrafo por defecto.', 86, 0, NULL),
(91, 'Este es un párrafo por defecto.', 87, 0, NULL),
(92, 'Este es un párrafo por defecto.', 88, 0, NULL),
(93, 'Este es un párrafo por defecto.', 89, 0, NULL),
(94, 'Este es un párrafo por defecto.', 90, 0, NULL),
(95, 'Este es un párrafo por defecto.', 91, 0, NULL),
(96, 'Este es un párrafo por defecto.', 92, 0, NULL),
(97, 'Este es un párrafo por defecto.', 93, 0, NULL),
(98, 'Este es un párrafo por defecto.', 94, 0, NULL),
(99, 'Este es un párrafo por defecto.', 95, 0, NULL),
(100, 'Este es un párrafo por defecto.', 96, 0, NULL),
(101, 'Este es un párrafo por defecto.', 97, 0, NULL),
(102, 'Este es un párrafo por defecto.', 98, 0, NULL),
(103, 'Este es un párrafo por defecto.', 99, 0, NULL),
(104, 'Este es un párrafo por defecto.', 100, 0, NULL),
(105, 'Este es un párrafo por defecto.', 101, 0, NULL),
(106, 'Este es un párrafo por defecto.', 102, 0, NULL),
(107, 'Este es un párrafo por defecto.', 103, 0, NULL),
(108, 'Este es un párrafo por defecto.', 104, 0, NULL),
(109, 'Este es un párrafo por defecto.', 105, 0, NULL),
(110, 'Este es un párrafo por defecto.', 106, 0, NULL),
(111, 'Este es un párrafo por defecto.', 107, 0, NULL),
(112, 'Este es un párrafo por defecto.', 108, 0, NULL),
(113, 'Este es un párrafo por defecto.', 109, 0, NULL),
(114, 'Este es un párrafo por defecto.', 110, 0, NULL),
(115, 'Este es un párrafo por defecto.', 111, 0, NULL),
(116, 'Este es un párrafo por defecto.', 112, 0, NULL),
(117, 'Este es un párrafo por defecto.', 113, 0, NULL),
(118, 'Este es un párrafo por defecto.', 114, 0, NULL),
(119, 'Este es un párrafo por defecto.', 115, 0, NULL),
(120, 'Este es un párrafo por defecto.', 116, 0, NULL),
(121, 'Este es un párrafo por defecto.', 117, 0, NULL),
(122, 'Este es un párrafo por defecto.', 118, 0, NULL),
(123, 'Este es un párrafo por defecto.', 119, 0, NULL),
(124, 'Este es un párrafo por defecto.', 120, 0, NULL),
(125, 'Este es un párrafo por defecto.', 121, 0, NULL),
(126, 'Este es un párrafo por defecto.', 122, 0, NULL),
(127, 'Este es un párrafo por defecto.', 123, 0, NULL),
(128, 'Este es un párrafo por defecto.', 124, 0, NULL),
(129, 'Este es un párrafo por defecto.', 125, 0, NULL),
(130, 'Este es un párrafo por defecto.', 126, 0, NULL),
(131, 'Este es un párrafo por defecto.', 127, 0, NULL),
(132, 'Este es un párrafo por defecto.', 128, 0, NULL),
(133, 'Este es un párrafo por defecto.', 129, 0, NULL),
(134, 'Este es un párrafo por defecto.', 130, 0, NULL),
(135, 'Este es un párrafo por defecto.', 131, 0, NULL),
(136, 'Este es un párrafo por defecto.', 132, 0, NULL),
(137, 'Este es un párrafo por defecto.', 133, 0, NULL),
(138, 'Este es un párrafo por defecto.', 134, 0, NULL),
(139, 'Este es un párrafo por defecto.', 135, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quejas`
--

CREATE TABLE `quejas` (
  `id` int(11) NOT NULL,
  `opcion` varchar(255) NOT NULL,
  `nota` text NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `quejas`
--

INSERT INTO `quejas` (`id`, `opcion`, `nota`, `fecha`) VALUES
(1, 'opcion1', 'sdfsdfsdf', '2024-12-16 09:41:06'),
(2, 'opcion2', 'dgfdfgdfg', '2024-12-16 09:41:15'),
(3, 'opcion1', 'sdfsdfsdf', '2024-12-16 09:43:24'),
(4, 'opcion1', 'sdfsdfsdf', '2024-12-16 09:43:29'),
(5, 'opcion1', 'sdfsdfsdf', '2024-12-16 09:48:52'),
(6, 'opcion1', 'sdfsdfsdf', '2024-12-16 09:49:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `steps`
--

CREATE TABLE `steps` (
  `id` int(11) NOT NULL,
  `flow_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `option_yes_id` int(11) DEFAULT NULL,
  `option_no_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `step_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `steps`
--

INSERT INTO `steps` (`id`, `flow_id`, `title`, `description`, `option_yes_id`, `option_no_id`, `created_at`, `step_order`) VALUES
(1, 3, 'No Navega 1', '<p><i><strong>No Navega 1 xxxxxxxxxxxx</strong></i></p>', 6, 2, '2024-12-10 16:41:20', 0),
(2, 3, 'No Navega 2', '<p><strong>No Navega 2</strong></p>', 6, 6, '2024-12-10 16:41:39', 0),
(3, 2, 'Lentitud', '<h3><strong>Verificar Nivel Cero&nbsp; Lentitud &nbsp; &nbsp;&nbsp;</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</h3>', 4, 4, '2024-12-10 16:42:51', 0),
(4, 2, 'Lentitud', '<h2>Lentitud</h2>', 3, 3, '2024-12-10 16:43:26', 0),
(5, 3, 'Saldos ', '<p>ok&nbsp;&nbsp;</p>', 0, 0, '2024-12-10 18:36:51', 0),
(6, 3, 'No Navega 3', '<p><i>No Navega 3</i></p>', 0, 0, '2024-12-10 18:41:00', 0),
(7, 3, 'PRUEBA', '<p><strong>Prueba</strong></p>', 0, 0, '2024-12-10 18:47:04', 0),
(8, 1, 'Admin', '<p>Admin</p>', 9, 9, '2024-12-10 19:22:15', 0),
(9, 1, 'PASO 2', '<h2>PASO 2</h2>', 8, 8, '2024-12-10 19:51:52', 0),
(10, 4, 'Nivel Cero ONT Dañada', '<h3>Nivel Cero ONT Dañada</h3>', 11, 11, '2024-12-10 20:01:23', 0),
(11, 4, 'Seguir Checklist ONT Dañada', '<ul><li>Seguir Checklist ONT Dañada</li></ul>', 10, 10, '2024-12-10 20:01:43', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `steps1`
--

CREATE TABLE `steps1` (
  `id` int(11) NOT NULL,
  `flow_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `option_yes_id` int(11) DEFAULT NULL,
  `option_no_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `step_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `steps1`
--

INSERT INTO `steps1` (`id`, `flow_id`, `title`, `description`, `option_yes_id`, `option_no_id`, `created_at`, `step_order`) VALUES
(3, 1, 'aaaaaaaaaa', '<p>aaaaaaaaaa</p>', 0, 0, '2024-12-10 21:08:10', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `steps2`
--

CREATE TABLE `steps2` (
  `id` int(11) NOT NULL,
  `flow_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `option_yes_id` int(11) DEFAULT NULL,
  `option_no_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `step_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `steps2`
--

INSERT INTO `steps2` (`id`, `flow_id`, `title`, `description`, `option_yes_id`, `option_no_id`, `created_at`, `step_order`) VALUES
(12, 5, 'Wifi de prueba', '<p>WWWWW</p>', 13, 13, '2024-12-13 17:26:56', 0),
(13, 5, 'WIFI 2', '<p>assasd</p>', 12, 12, '2024-12-13 17:27:07', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `steps3`
--

CREATE TABLE `steps3` (
  `id` int(11) NOT NULL,
  `flow_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `option_yes_id` int(11) DEFAULT NULL,
  `option_no_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `step_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `steps4`
--

CREATE TABLE `steps4` (
  `id` int(11) NOT NULL,
  `flow_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `option_yes_id` int(11) DEFAULT NULL,
  `option_no_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `step_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `steps5`
--

CREATE TABLE `steps5` (
  `id` int(11) NOT NULL,
  `flow_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `option_yes_id` int(11) DEFAULT NULL,
  `option_no_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `step_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `steps6`
--

CREATE TABLE `steps6` (
  `id` int(11) NOT NULL,
  `flow_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `option_yes_id` int(11) DEFAULT NULL,
  `option_no_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `step_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_news`
--

CREATE TABLE `system_news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `system_news`
--

INSERT INTO `system_news` (`id`, `title`, `content`, `created_at`) VALUES
(33, 'asdasd', 'aaaaaaaa', '2024-11-04 03:22:26'),
(34, 'xxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxx', '2024-11-04 03:26:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabs`
--

CREATE TABLE `tabs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tabs`
--

INSERT INTO `tabs` (`id`, `name`) VALUES
(1, 'Inicio'),
(2, 'Acerca de'),
(3, 'Servicios'),
(4, 'Portafolio'),
(5, 'Blog'),
(6, 'Contacto'),
(7, 'Preguntas Frecuentes'),
(8, 'Soporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `texts`
--

CREATE TABLE `texts` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `texts`
--

INSERT INTO `texts` (`id`, `content`) VALUES
(1, 'Este es el texto que se copiará al portapapeles.'),
(2, 'Otro texto que se copiará al portapapeles.'),
(3, 'Este es el tercer texto que se copiará al portapapeles.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipificaciones`
--

CREATE TABLE `tipificaciones` (
  `id` int(11) NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `numero_linea` varchar(50) NOT NULL,
  `factura_con` varchar(255) NOT NULL,
  `problema_detectado` text NOT NULL,
  `pruebas_realizadas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipifications`
--

CREATE TABLE `tipifications` (
  `id` int(11) NOT NULL,
  `call_id` varchar(255) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `line` varchar(255) NOT NULL,
  `reported_problem` text NOT NULL,
  `tests` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipifications`
--

INSERT INTO `tipifications` (`id`, `call_id`, `client_name`, `line`, `reported_problem`, `tests`, `created_at`) VALUES
(1, 'fsdf', 'sdfsdf', 'sdfs', 'sdf', 'sdf', '2024-09-18 02:24:07'),
(2, 'fsdf', 'sdfsdf', 'sdfs', 'asdasd', 'asdasd', '2024-09-18 02:29:18'),
(3, 'fsdf', 'sdfsdf', 'sdfs', 'asdasd', 'asdasd', '2024-09-18 02:30:20'),
(4, 'fsdf', 'sdfsdf', 'sdfsdf', 'sadasd', 'asdasdasd', '2024-09-18 02:40:44'),
(5, 'fsdf', 'sdfsdf', 'sdfsdf', 'sadasd', 'asdasdasd', '2024-09-18 02:41:27'),
(6, 'fsdf', 'sdfsdf', 'sdfs', 'asdads', 'asdasdad', '2024-09-18 02:41:40'),
(7, 'fsdf', 'sdfsdf', 'sdfs', 'asdads', 'asdadad', '2024-09-18 02:42:34'),
(8, 'fsdf', 'sdfsdf', 'sdfs', 'adasd', 'asdasd', '2024-09-18 03:11:17'),
(9, '999999999999', 'ORLANDO', '7786789', 'NO NAVEGA', 'SE DESCONECTA Y CONECTA, SE GENERA AVERIA', '2024-09-18 03:56:14'),
(10, 'asdasd', 'asdasd', 'asdasd', 'asdasd', 'asdasd', '2024-09-26 18:03:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('redes','telefonico','admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_connected` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `created_at`, `name`, `user_id`, `is_connected`) VALUES
(14, 'Pabarbon@zirius.online', '$2y$10$WPMwIGffeZCtB.A7G1XJmOJ6TFd3J2.rFv9kBZTTP30o5lYqoML5u', 'telefonico', '2024-10-01 18:19:09', 'Pablo barbon', 0, 0),
(15, 'Wilbert@zirius.online', '$2y$10$S8iHLo9Ke5tZoTvCl9sGFePhH.agB36lOiN4ex1v2a5l9yerHANq6', 'redes', '2024-10-02 16:38:11', 'Wilbert', 0, 0),
(17, 'sadays.arevalo@zirius.online', '$2y$10$QHit7dt5tMRdttdUiyPLe.VT1RZzaIffrBB6wCcoE4Up68GXudWe.', 'telefonico', '2024-10-04 18:28:49', 'Sadays del Carmen Arevalo Sierra', 0, 0),
(18, 'jdmendoza@zirius.online', '$2y$10$kZIKh3rp.ngY4L.IKupXPu4PSJz695YbpGRVmxz7Jeeg1/iL22.v6', 'telefonico', '2024-10-10 14:14:04', 'Jesus Mendoza', 0, 0),
(20, 'isabel.acosta@zirius.online', '$2y$10$4v.uialUnes.6Sow3L9cQu1iSU98FrG2Bf2YYmTE3oDaiF.l7wZqy', 'telefonico', '2024-10-28 15:35:43', 'ALEXANDRA ISABEL ACOSTA PÉREZ', 0, 0),
(21, 'juans.fernandezr@zirius.online', '$2y$10$a09US9StaXre7oHvnDeFz.az4VpH23UYM77nYwLSz74yTIxZ0uyMO', 'redes', '2024-10-29 15:11:40', 'JUAN FERNANDEZ', 0, 0),
(22, 'daniel.posada@zirius.online', '$2y$10$jxw9CYnyG21uQdb6QXKdDuXTWMnIqf8Z/uASrjcr59s0dWZimf6vu', 'redes', '2024-10-29 15:12:01', 'DANIEL POSADA', 0, 0),
(23, 'adriana.lamby@zirius.online', '$2y$10$sBXV9a/QnZgpevD1nT2YEe2PktAWQJuJMv3UVBQwRFfiyOPuqci0K', 'redes', '2024-10-29 15:15:33', 'ADRIANA LAMBY', 0, 0),
(24, 'zamir.arzuza@zirius.online', '$2y$10$T0qgRQQYNvgq8b6NM6tJ..ewbuvzm7oFC2f7qGnoRRHi3OGkP8rP.', 'redes', '2024-10-29 15:15:54', 'SAMIR ARZUZA', 0, 0),
(25, 'bladimir.arrieta@zirius.online', '$2y$10$3vYxg.UpsaEOOYQ7glTGBuOL7Bm2Upz0qL9M2GlWjjjtcf7mkCTRa', 'redes', '2024-10-29 15:22:25', 'Bladimir Arrieta', 0, 0),
(26, 'daniela.arevalo@zirius.online', '$2y$10$qHu51D2oPtPJjQGsj4VvUe0dIub0F5n./pWzH64wewy5MyrxXPJ5O', 'redes', '2024-10-29 15:22:43', 'Daniela Arévalo', 0, 0),
(27, 'jhon.leon@zirius.online', '$2y$10$vyzwtwpNJpG1xoGjfl6n8ucBVo7GAS2axYKxquMh9.7Bmr9gJLVJu', 'redes', '2024-10-29 15:22:54', 'Jhon Leon', 0, 0),
(28, 'victore.cortes@zirius.online', '$2y$10$PTaGUI0z841YrpYq6SSf4OWRrYbCwnGwqBCAyxYE5pw.qCDPFNvg2', 'redes', '2024-10-29 15:23:05', 'Victor Cortes', 0, 0),
(29, 'leidys.meza@zirius.online', '$2y$10$iYMsO2StdIalBeeVP5ozZecS4DkfJ0QTWuex4FDqQdajb1Ta0Vt0q', 'redes', '2024-10-29 15:23:16', 'Leidys Meza', 0, 0),
(30, 'angie.garcia@zirius.online', '$2y$10$DOrWdGXd24JHKrJBhuwZGOS1M7LtpphwQDnitTggOlHJy5VgHFLH.', 'redes', '2024-10-29 15:23:27', 'Angie Garcia', 0, 0),
(31, 'janeth.blanco@zirius.online', '$2y$10$pMp.nZOlTE7d7UZ0RjwsOOpvcVv.fbq3R4jW4sSuJon.6VczRBI2G', 'redes', '2024-10-29 15:23:37', 'Janeth Blanco', 0, 0),
(32, 'juan.ozuna@zirius.online', '$2y$10$3NaFPi4wQFSjicv3D7kcw.1PdiRl/JbnpvTQUhJYU5emDILlSXXdC', 'redes', '2024-10-29 15:23:49', 'Juan Ozuna', 0, 0),
(33, 'kloren.hlopez@zirius.online', '$2y$10$Sn7xtcEr.icuxObraVNZduOgI7mLHJAxdXsya4DyYDaUrwckE3sbm', 'redes', '2024-10-29 15:23:58', 'Karen Hernandez', 0, 0),
(34, 'laurav.porrasm@zirius.online', '$2y$10$0WrsJqyKH6LL8KtoPMbmFeUYpqcNpvj6Omx.kGD1lO2LqRTmatt/y', 'redes', '2024-10-29 15:24:08', 'Laura Porras', 0, 0),
(35, 'keisly.marquez@zirius.online', '$2y$10$9.O0RkMffaLHiamyMRyWoePyTICC9Jek55dV59ndswK.Wm7BClqsW', 'redes', '2024-10-29 15:24:18', 'Keisly Marquez', 0, 0),
(36, 'juan.ggonzalez@zirius.online', '$2y$10$Fz/x77leAqGilphL4zB7munSD26WVrGRAHr9HFMD5lOgsjaBjU6ye', 'redes', '2024-10-29 15:24:30', 'Juan Gonzalez', 0, 0),
(37, 'maria.avilat@zirius.online', '$2y$10$iC0MOgeyJ3iMaeHnI44rlejnxxaY1stMRWN4RTieRE285J2S/gO7G', 'redes', '2024-10-29 15:24:41', 'Maria Avila', 0, 0),
(38, 'claudia.rodado@zirius.online', '$2y$10$A/P78recjyV84BXMleL2Y.eVqL9jkbxAnKUQZ731BNbKR3NQ1Hqmi', 'redes', '2024-10-29 15:24:51', 'Claudia Rodado', 0, 0),
(39, 'nicoll.ibarra@zirius.online', '$2y$10$SLjkqZ9qICII7LqB1BONXuna7np8rMafAS5p1XGurDvcZcLA8FNei', 'redes', '2024-10-29 15:24:59', 'Nicoll Ibarra', 0, 0),
(40, 'krys.betancourt@zirius.online', '$2y$10$Cmh0rhXgGgEDABOLUWVPaeHwj8UWxXjKqD4KmEkDWkU/UGejP3YGq', 'redes', '2024-10-29 15:25:11', 'Krys Betancourt', 0, 0),
(41, 'sammer.sarmiento@zirius.online', '$2y$10$EIOMha0alkdX.ECoT5OsneHdVJr6luY1hJw68dfOF9CmkVQiZSetC', 'redes', '2024-10-29 15:25:28', 'Sammer Sarmiento', 0, 0),
(42, 'ashley.bohorquez@zirius.online', '$2y$10$m06QVGMUaeNuXVoGaIOF9OlJHFF9qxxLKQD0qjp/6.lwU9UA/hGDu', 'redes', '2024-10-29 15:25:38', 'Ashley Bohorquez', 0, 0),
(43, 'kimberly.marriaga@zirius.online', '$2y$10$lR3m/0YLAkxAR93QBb8Eue02t2wX9reaEOOdy01QmyGzVWSCVWObi', 'redes', '2024-10-29 15:25:56', 'Kimberly Marriaga', 0, 0),
(44, 'ubaldo.palencia@zirius.online', '$2y$10$xq/7NIuUlSok1movxiDdeeITaq4TEkY2FeJ1sB6ktgf.ll0BW/It2', 'redes', '2024-10-29 15:26:06', 'Ubaldo Palencia', 0, 0),
(45, 'gloria.rada@zirius.online', '$2y$10$vl0n9uugR1mtIHvq4KwdJ.w8.LS6t.6DkktGCMnwF5f2KnPfxl7sW', 'redes', '2024-10-29 15:26:20', 'Gloria Rada', 0, 0),
(46, 'jassir.dager@zirius.online', '$2y$10$8if6td9Xj3lf/Vo6Ak6HFuXy3D0/YmjMQBDdlF3qBNfPoZ6BpJQ3.', 'redes', '2024-10-29 15:26:31', 'Jassir Dager', 0, 0),
(47, 'yolis.lora@zirius.online', '$2y$10$mMsyBJWxK/tWPYjC.v2jae0XGBpEpfgUDCVHGnOFjwkKM9HD/B1CS', 'redes', '2024-10-29 15:26:42', 'Yolis Lora', 0, 0),
(48, 'andres.iguaran@zirius.online', '$2y$10$Zz37vmHD1dq.TEBx5..P5Obtf8uNdL3hqVza2wlVDdwKU1jQo3jou', 'redes', '2024-10-29 15:26:55', 'Andres Manjarrez', 0, 0),
(49, 'jorge.laram@zirius.online', '$2y$10$nNZcP03xIFcTPWIIRkYA5eYQzkmEk1QFWOA3hMOxM.LIY4l7KD1z6', 'redes', '2024-10-29 15:27:06', 'Jorge Lara', 0, 0),
(50, 'cearlys.leon@zirius.online', '$2y$10$W5uTRy9cE1u5nIgswZiLKefLWfUM1ZyqLpOeeJJ5RB5RPGmEVDUES', 'redes', '2024-10-29 15:27:14', 'Cearlys Leon', 0, 0),
(51, 'juand.perez@zirius.online', '$2y$10$g51uH3nuq9qQyEWqYVSiSuIqkabmbnebbL6jOg9f.4GfYeBONbI7.', 'telefonico', '2024-10-29 15:27:31', 'Juan Perez', 0, 0),
(52, 'erika.arevalo@zirius.online', '$2y$10$zcGeo1ePvT3GlxCkA75DpeKztr0kvQfZ9zH8QyQKDIP..iomBFMJW', 'telefonico', '2024-10-29 15:27:45', 'Erika Arévalo', 0, 0),
(53, 'juanc.barba@zirius.online', '$2y$10$0/KUYRJCKUchktwvx6cO4Og24uu9AXp7o9Z/soYK0jIpF5xyKdDva', 'telefonico', '2024-10-29 15:27:56', 'Juan Barba', 0, 0),
(54, 'brayan.conrado@zirius.online', '$2y$10$5p7DYHLB7w0tS/kUy6DLFezITJAlGRDsHhWEve3rhN1d4N3.SIVjG', 'telefonico', '2024-10-29 15:31:38', 'Brayan Rodríguez', 0, 0),
(55, 'irenes.menco@zirius.online', '$2y$10$rD7Cv99cSaCTqnM.hs1XV.aarCjngoQRd9Y3nObffz4V5CpgkgXTy', 'telefonico', '2024-10-29 15:31:49', 'Irenes Menco', 0, 0),
(56, 'nina.atencia@zirius.online', '$2y$10$YcSPthBdGiH843Gj/i5Elei6/OnFDTharkzSL10O/weMjXE8drdPy', 'telefonico', '2024-10-29 15:32:02', 'Nina Atencia', 0, 0),
(57, 'roysmask.salgue@zirius.online', '$2y$10$dGfqlLBjbmhMzuecvo2/YO4RV6/LO80jMLEhAt/vJIX65P63vLYcO', 'telefonico', '2024-10-29 15:32:27', 'Roysmask Salguedo', 0, 0),
(58, 'alexander.barreto@zirius.online', '$2y$10$DAKkh3mVwwcGbs.qmV3nDe/aifptVt1JQByEVA1hWyo5b0A4COqtO', 'telefonico', '2024-10-29 15:32:43', 'Alexander Barreto', 0, 0),
(59, 'cindy.donado@zirius.online', '$2y$10$t/4WRGzVb.6x1nAwccp7Ju7LVQRU/LGeyhTcTAuF7csQvag8/hvPC', 'telefonico', '2024-10-29 15:32:55', 'Cindy Donado', 0, 0),
(60, 'esneider.arrieta@zirius.online', '$2y$10$qy8YAB5kwAVn1RA54W4OCei9z45vRFCvKF0vQAPMEMIVvFPYk8UGW', 'telefonico', '2024-10-29 15:33:08', 'Esneider Arrieta', 0, 0),
(61, 'juan.villae@zirius.online', '$2y$10$uwrR3TWLiRosT.Ir1GrdKOOb20734nH5ilp/kL1mVQcAd9tezng72', 'telefonico', '2024-10-29 15:33:22', 'Juan Villa', 0, 0),
(62, 'julyanne.puello@zirius.online', '$2y$10$NnIHzZBuaq/tn7JjeqQ8zO8UdDI6RQ/GuUylqnA2LL4/iTrz3njhG', 'telefonico', '2024-10-29 15:33:32', 'Julyanne Puello', 0, 0),
(63, 'julyeht.villarreal@zirius.online', '$2y$10$9gq2HhZpNDKb0/hgmxyezONlTOcXPUWi6eqcenFZ1NrBnFZOTmxo.', 'telefonico', '2024-10-29 15:33:46', 'Julyeth Villarreal', 0, 0),
(64, 'nayerlis.robledo@zirius.online', '$2y$10$wz2aNQxO.moBYKajaaEsT.MhQ50cgnjYohWwqzEgNZ2My0pE6c84u', 'telefonico', '2024-10-29 15:33:57', 'Nayerlis Robledo', 0, 0),
(65, 'yojana.melendez@zirius.online', '$2y$10$ug/9/P490gY8TKlxX/M3IeZW.EEgzPuiDCNOEFa0kET6NMyEIMWYe', 'telefonico', '2024-10-29 15:34:08', 'Yojana Melendez', 0, 0),
(66, 'yuleidis.yepez@zirius.online', '$2y$10$Eksmh7ctHhuFutDyMlg/nenXrjP/UL1A9wey84zk7Cqsxh.QCbWUe', 'telefonico', '2024-10-29 15:34:19', 'Yuleidys Yepez', 0, 0),
(67, 'nayarid.campos@zirius.online', '$2y$10$RcsSfOKDqpQW7S49aFhjn.QxuMsWpB/6PXpSVuBhoAt16WeDvRy02', 'telefonico', '2024-10-29 15:34:30', 'Nayarid Campos', 0, 0),
(68, 'ricardo.samper@zirius.online', '$2y$10$az7Cz78xTFY5HYRYK9LnXeZSE9mM9paL/fRqor/HLNVeU1zTNGTvy', 'telefonico', '2024-10-29 15:34:43', 'Ricardo Samper', 0, 0),
(69, 'joan.valencia@zirius.online', '$2y$10$PigaN6n.v5EvLBgF44DJ9enz8hS9RrT1ms786Lepp3JRACrh0.X46', 'telefonico', '2024-10-29 15:34:53', 'Joan Valencia', 0, 0),
(70, 'brando.bustos@zirius.online', '$2y$10$W/XsEYPoC2DmeK3DgBIP/O0ZXnCIqaEwlYhdbDkuS9VWQcUvW1R2W', 'telefonico', '2024-10-29 15:35:04', 'Brando Bustos', 0, 0),
(71, 'carlos.carmona@zirius.online', '$2y$10$ds33UbGNuhDwIP78G52EJOMTaxK974Mm6fAwA0EtjLkZGjPuvFj6K', 'telefonico', '2024-10-29 15:35:14', 'Carlos Carmona', 0, 0),
(72, 'david.segura@zirius.online', '$2y$10$vWXYue0oz6lgxiZOOg2QTuq5wkfQBmGU2cs9u7Hh0l7Jg.1/c9PiO', 'telefonico', '2024-10-29 15:35:26', 'David Segura', 0, 0),
(73, 'gisela.demoya@zirius.online', '$2y$10$AWI2iV1wTTCoBIlDqB4G8.dAwYeCAdg.MeOXgty0SAEqPNylET44q', 'telefonico', '2024-10-29 15:35:37', 'Gisela De Moya', 0, 0),
(74, 'liz.florez@zirius.online', '$2y$10$hLICmrtk1GIotO7u6T9Ee.Sl4bLeA0/wjw8Wng10nfyI8ubZac6OG', 'telefonico', '2024-10-29 15:35:50', 'Liz Florez', 0, 0),
(75, 'luz.simanca@zirius.online', '$2y$10$ZpRYOV3AFPC0yp4vdQPVBeYJgUINRSQyQpJVMj.9ROcWXgAipM/Ge', 'telefonico', '2024-10-29 15:36:01', 'Luz Imanca', 0, 0),
(76, 'maria.acevedoc@zirius.online', '$2y$10$L/bzikWJxWivZHm/2yv0kOGhi6O2/vYdUyL6znqzTBpdF5sYwthnu', 'telefonico', '2024-10-29 15:36:13', 'María Acevedo', 0, 0),
(77, 'rosa.maestre@zirius.online', '$2y$10$9foAneoyo8OeOD3hV9eyw.K3Y5jBJT/dHyCGX.C7SknAIBLmtzpPe', 'telefonico', '2024-10-29 15:36:26', 'Rosa Maestre', 0, 0),
(78, 'yaida.perez@zirius.online', '$2y$10$s.hdUTvbgZwfZIF3jleP4OnT.mlWsCEaqCguDhNURP9A4qOrgKwh.', 'telefonico', '2024-10-29 15:36:36', 'Yaida Pérez', 0, 0),
(79, 'yecenia.ramirez@zirius.online', '$2y$10$FQQG2cgs8oGXHgDsC25kOeGmNtI2LGXcik0Zoh0jOJjw22pDG8z4K', 'telefonico', '2024-10-29 15:36:44', 'Yecenia Ramirez', 0, 0),
(80, 'yoselin.mesa@zirius.online', '$2y$10$PaYcxqRT.ZmNEiFoV.TFd.85O96TRkKE/uUC/DqB0fzWZ3iggCDcS', 'telefonico', '2024-10-29 15:36:58', 'Yoselin Mesa', 0, 0),
(81, 'alexandra.medellin@zirius.online', '$2y$10$ta2fd9P2kraowrGnhG.DwOz7G0xDhWN0pQb9EpX/xfnnHzO0bWQQu', 'telefonico', '2024-10-29 15:37:06', 'Alexandra Medellín', 0, 0),
(82, 'jair.lasso@zirius.online', '$2y$10$7AijnjrSm22M3coV2.KrWu0IAtFxwfKMTlG9nK4ksMESgkP.mBjHK', 'telefonico', '2024-10-29 15:37:16', 'Jair Lasso', 0, 0),
(83, 'jerson.diaz@zirius.online', '$2y$10$V3RnxVJvzc30ywRSYOrgbO851RdUpLLFwnrL4tO/dai310e/qKFSq', 'telefonico', '2024-10-29 15:37:27', 'Jerson Diaz', 0, 0),
(84, 'laura.alvareza@zirius.online', '$2y$10$HZRyR91NZ3Gi2Z.Tq7GSpumUCq4Dc4zGR7SbgSRdNStp52FGRNFXq', 'telefonico', '2024-10-29 15:37:57', 'Laura Alvarez', 0, 0),
(85, 'mileydis.espinosa@zirius.online', '$2y$10$tSUshPAxwYLs6E5/lPH3/uWQVTverDObOCXXV4mtfjjJy8itfgTC2', 'telefonico', '2024-10-29 15:38:06', 'Mileydis Espinosa', 0, 0),
(86, 'santiago.molina@zirius.online', '$2y$10$1z0suTpHdF.cWU1r4sgwpOZM65twg2a3g.iS3iceKrySMQKBb6moi', 'telefonico', '2024-10-29 15:38:15', 'Santiago Molina', 0, 0),
(87, 'leidi.barroso@zirius.online', '$2y$10$czl5elTRfbZGzAmkao594uptGwfzSdjpsTyWUhMh.MVM3slz1MeCq', 'telefonico', '2024-10-29 15:38:27', 'Leidi Barroso', 0, 0),
(88, 'oscar.garciaq@zirius.online', '$2y$10$/1R5jK71P9NVUdiM6tXlMOmWq9gCAMfKoHaVD9Shf82MtqgfYMqh6', 'telefonico', '2024-10-29 15:38:39', 'Oscar Garcia', 0, 0),
(89, 'yuranis.cervantes@zirius.online', '$2y$10$JJkZM25CF7B81FcBa5gJPOdWiViR7MWjsOEagABXEvsv8bi4LY9Y6', 'telefonico', '2024-10-29 15:39:29', 'Yuranis Cervantes', 0, 0),
(90, 'alexis.santander@zirius.online', '$2y$10$IMB8nlFlwH9GjBbJ6Zk1xuCnKzZRdxkXgQ07l98KzMER.WsQY2hCu', 'redes', '2024-10-29 15:41:02', 'Alexis Santander', 0, 0),
(91, 'cristian.mercado@zirius.online', '$2y$10$/lJ5kH799miVj7igK.BVH.Dsl6Gy5B4d90ZvatVYRMJGp5OMVDB3i', 'telefonico', '2024-10-29 15:41:17', 'Cristian Mercado', 0, 0),
(92, 'dayana.taborda@zirius.online', '$2y$10$1mI9L9u5o.xwNhId2dX9VexmGHMbI2c9yajCL.89tFbsSraaOsgJK', 'telefonico', '2024-10-29 15:41:28', 'Dayana Taborda', 0, 0),
(93, 'eyber.arguello@zirius.online', '$2y$10$/gJQBWHrWCW/psNUrt4l9.nQ630MXYwJ9Kc2x4VttrtPM.5B16kb2', 'telefonico', '2024-10-29 15:41:42', 'Eyber Arguello', 0, 0),
(94, 'fabian.peinado@zirius.online', '$2y$10$sqVDzn1aUMVP2oYFcw5LSeaPCDukJP.aPnxcRIkVruMvDpTsqxaCK', 'telefonico', '2024-10-29 15:41:51', 'Fabian Peinado', 0, 0),
(95, 'jesus.santiago@zirius.online', '$2y$10$qy//g33xdouUNyGr/8liCeowG0xluIWmCUjcJkmieBkAlrd9DXYq2', 'telefonico', '2024-10-29 15:42:01', 'Jesus Santiago', 0, 0),
(96, 'juan.llanos@zirius.online', '$2y$10$bruuursq1qSO6tshWx.uDOqiJTaAVdbzPV3s57HRmqx4/M1Jh8wfi', 'telefonico', '2024-10-29 15:42:11', 'Juan Llanos', 0, 0),
(97, 'kevin.mendez@zirius.online', '$2y$10$01h1ugNWTefAYPz/KOuNg.fKWijj3ICgQ2javcjertmGXnYZ4QRtK', 'telefonico', '2024-10-29 15:42:20', 'Kevin Del Aguila', 0, 0),
(98, 'lina.ordonez@zirius.online', '$2y$10$nPgoDYHXOzmJpY46Slug1uG8qoGTZ8e1tViOMXFuDLtiYyrvTFlXy', 'telefonico', '2024-10-29 15:42:29', 'Lina Ordoñez', 0, 0),
(99, 'mateo.torres@zirius.online', '$2y$10$Rsd1HmWMVDq560/18bltsuP8gzY5RBQ30CRrOyLi0CcRUh8LRul4i', 'telefonico', '2024-10-29 15:42:40', 'Mateo Torres', 0, 0),
(100, 'wilfrido.rios@zirius.online', '$2y$10$DFvDKgutnf3WnphqleUwLuli4obgjM85eAbRodVdwGfui4B1Ae0bm', 'telefonico', '2024-10-29 15:42:50', 'Wilfrido Rios', 0, 0),
(101, 'yenifer.castro@zirius.online', '$2y$10$QfJTXnOZ8vkZAv26LPduyOoasmB/neE4TlLxz3mO/zDLIefYBjsne', 'telefonico', '2024-10-29 15:42:59', 'Yenifer Castro', 0, 0),
(102, 'hernando.marin@zirius.online', '$2y$10$ZgfkbTRYoT4NP6/xZrZCWOF3hNsmpP5lgf2T8NrGfNbfJWC4vwWSW', 'telefonico', '2024-10-29 15:43:09', 'Hernando Marin', 0, 0),
(103, 'angie.bertel@zirius.online', '$2y$10$KbcptoWQN5NPkCiATs4h0OUFvA2.JKGfn8vM8PPtVk9aggxgCRxZa', 'telefonico', '2024-10-29 15:43:18', 'Angie Bertel', 0, 0),
(104, 'britney.padilla@zirius.online', '$2y$10$ZkRxjP28TeVHZfjONSrFi.9mnyP03kdN.M1T47ePZLXtUvLyWWCZO', 'telefonico', '2024-10-29 15:43:27', 'Britney Padilla', 0, 0),
(105, 'cindy.escudero@zirius.online', '$2y$10$kc9/bnBbsesV.Xzb0j0f7OkvZdU8.kvixjMpngzyhCKqkmrKM1O5O', 'telefonico', '2024-10-29 15:43:36', 'Cindy Escudero', 0, 0),
(106, 'manuela.clavijo@zirius.online', '$2y$10$1zSS9nmUtloe2AU22EyLDe0vSiH4C8ebxPMTFjjhE4LhPB8t.sYV.', 'telefonico', '2024-10-29 15:44:02', 'Manuela Clavijo', 0, 0),
(107, 'nayerlis.sierra@zirius.online', '$2y$10$0KQ86lWRwXkt9hJ84oIIie69cGNt6cOQAXGiOxIUAoAxjimsiSu32', 'telefonico', '2024-10-29 15:44:10', 'Nayerlis Sierra', 0, 0),
(108, 'sheryl.vivanco@zirius.online', '$2y$10$gxzR0H8alBvuoMzXDM4myeRxjw/Wq67Od3ZVDoFRDRIQHsXJl7vs.', 'telefonico', '2024-10-29 15:44:19', 'Sheryl Vivanco', 0, 0),
(109, 'fernando.marenco@zirius.online', '$2y$10$pi0hzVpKOg.UQ3MrQmFt0O03CSjbAE89b/ojZugD1XSC7zmBvT4Ai', 'telefonico', '2024-10-29 15:44:27', 'Fernando Marenco', 0, 0),
(110, 'heidy.hernandezm@zirius.online', '$2y$10$y39.QS2nNrrqw90t11gKC.fKN0OBxHNjDNmiIXIAtUavk7J3lkgfu', 'telefonico', '2024-10-29 15:44:35', 'Heidy Hernandez', 0, 0),
(111, 'ivan.carbono@zirius.online', '$2y$10$GPK05tRVAV52YQP4FugmzO96J667b.xHUgQTChFk2JJ0YTdP4fOQ.', 'telefonico', '2024-10-29 15:44:44', 'Ivan Cañas', 0, 0),
(112, 'julia.izquierdo@zirius.online', '$2y$10$t2jmUMfbD19Shbd5HVOmhO7ArSKE16QaTxiDnNrvTA81h9en5ONbi', 'telefonico', '2024-10-29 15:44:56', 'Julia Izquierdo', 0, 0),
(113, 'liseth.jimenez@zirius.online', '$2y$10$df2aTqf9h4oSgfBMhgD5XuTNO8VCnpr.42kNgLlyUUMNO7Ymlb7d2', 'telefonico', '2024-10-29 15:45:06', 'Liseth Jiménez', 0, 0),
(114, 'yoheenis.calvo@zirius.online', '$2y$10$LIa/N711iy0Vxy4cQCLUPuCRR3gS3E45GzKuIMCqbQIeWzC.ZIq7y', 'telefonico', '2024-10-29 15:45:24', 'Yoheenis Calvo', 0, 0),
(115, 'thais.guerrero@zirius.online', '$2y$10$9IHX4WuJKvU5jaCXqr4LnOLH9soIwQDq4HFVMHcWrfYMF4cBRXyui', 'telefonico', '2024-10-29 15:45:33', 'Tahis Guerrero', 0, 0),
(116, 'yarleys.luna@zirius.online', '$2y$10$H91NzbAePUWsuhbcQuCH1eOyHk67sYo7jqbZjSJEyunlOiSVAKxyO', 'telefonico', '2024-10-29 15:45:42', 'Yarleys Fandiño', 0, 0),
(117, 'stiven.doria@zirius.online', '$2y$10$Ocz29/Xp7ME02sWfFXG4uO7jOXolmHKwqKAO4UVHYIVztwWQPU9PK', 'telefonico', '2024-10-29 15:46:00', 'Stiven Doria', 0, 0),
(118, 'yesid.deleon@zirius.online', '$2y$10$uW3dugvscCWarOtgV1LtUuSD7iQ.cuEmCB4ZXuz4VagkpNjSxBTDO', 'telefonico', '2024-10-29 15:46:12', 'Yesid De Leon', 0, 0),
(119, 'alejandra.ariza@zirius.online', '$2y$10$JchOKeADrmGJ4J7TlLUJE.y6DcvwBWfeoRXMP2EO/miVUwSoSLUSS', 'telefonico', '2024-10-29 15:46:31', 'Alejandra Bocanegra', 0, 0),
(120, 'eloisa.yepes@zirius.online', '$2y$10$XmRp4Yd7y50VqZ5m1ic4ruZTA0Di.2xTnyS5uwedZJOniE25.sFhC', 'telefonico', '2024-10-29 15:46:38', 'Arminda Yepes', 0, 0),
(121, 'angelica.cifuentes@zirius.online', '$2y$10$kW54s0kM84VGhBeSWIK.3.ehAMNRbAF6jb9qO2cutQTXS6/77copi', 'telefonico', '2024-10-29 15:46:47', 'Angélica Cifuentes', 0, 0),
(122, 'yafte.carrillo@zirius.online', '$2y$10$DT4yRrc4rP20GnxovUuc5OhOkqQ4KhT4ygyCkZUIMyTpMuB5oBJ2K', 'telefonico', '2024-10-29 15:46:55', 'Sebastian Carrillo', 0, 0),
(123, 'cristina.herrera@zirius.online', '$2y$10$hzeaBFtmhJquZZSDcXBKluKBhZuHWNQwP6SWKSYdiGVE02vRkXjhW', 'telefonico', '2024-10-29 15:47:07', 'Cristina Herrera', 0, 0),
(124, 'jenifer.murillo@zirius.online', '$2y$10$eNANgcAuI8SNtWg/Yhua3OPdmun81rzgO3fL2M9O.tn5uS2yy2MJy', 'telefonico', '2024-10-29 15:47:15', 'Jenifer Murillo', 0, 0),
(125, 'ginna.munoz@zirius.online', '$2y$10$F7hhwZDHM3CNK7UXoERYqOWBIzdUBnyveAeg7sZD.IyrgHE6KVFjq', 'telefonico', '2024-10-29 15:47:23', 'Ginna Muñoz', 0, 0),
(126, 'karolay.morales@zirius.online', '$2y$10$iMlV8vDnsVeUFXlGb0YOhuEp/.Jwk6aoGlHDWKcms1prKQvOTPXnC', 'telefonico', '2024-10-29 15:47:34', 'Karolay Morales', 0, 0),
(127, 'luis.arzuza@zirius.online', '$2y$10$XXeCSdB3GXIzi3D9LGOyv.Kj5WUFegfSxa0L3PougCFC9YwUVlWci', 'telefonico', '2024-10-29 15:47:45', 'Luis Arzuza', 0, 0),
(128, 'ana.jaramillo@zirius.online', '$2y$10$e.AT7KjY9O5Gf812XIVO6uZBhdcDf1ZwpDUceNboqKpeQRfIDCZJq', 'telefonico', '2024-10-29 15:47:54', 'Ana Jaramillo', 0, 0),
(129, 'maria.campo@zirius.online', '$2y$10$tLNAvUzvzLx68jalEMHm4udARnkcOVe9hNHsi3zn2e33X3ZSYPBRu', 'telefonico', '2024-10-29 15:48:02', 'Maria Campo', 0, 0),
(130, 'pamela.arroyoo@zirius.online', '$2y$10$dfDuwNN/VvSmv9ykHeciz.ohOqcYiLNaT6fz1kBlr7.5GgsarLUKq', 'telefonico', '2024-10-29 15:48:12', 'Pamela Arroyo', 0, 0),
(131, 'andri.lobo@zirius.online', '$2y$10$s9UurjzPZKbg3l/4eZO.DOzbBo67raPhrFioUS0RbDOba5BdT0k7W', 'telefonico', '2024-10-29 15:48:21', 'Andri Lobo', 0, 0),
(132, 'maglobia.pacheco@zirius.online', '$2y$10$ASVpSIn866DvpQUhEDYcne9hC1uBCjRfbnhIOgimIjy9B4kYYl4pK', 'telefonico', '2024-10-29 15:48:30', 'Maglobia Pacheco', 0, 0),
(133, 'telefonico@zirius.online', '$2y$10$lh2pu5ajcF7YIyE6aEDCgeqRCTtCYiBxoRTMr.bWQtivtQIJkmFKm', 'telefonico', '2024-10-29 15:51:36', 'Sop Telefonico', 0, 0),
(134, 'redes@zirius.online', '$2y$10$bl1ntK7sG.AdVp30NyP6dOjHx7pZOY49owM/2t0OOmvWqYiiQ5.Am', 'redes', '2024-10-29 15:56:33', 'Sop. Redes', 0, 0),
(135, 'orzaca@zirius.online', '$2y$10$dBpDCx7vpZedGmHh0mzytu3M0DlHGvl88.9hY6u9koFvnGEhAnkX2', 'admin', '2024-10-31 21:24:03', 'Orlando Zambrano', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_new_paragraphs`
--

CREATE TABLE `user_new_paragraphs` (
  `user_id` int(11) NOT NULL,
  `paragraph_id` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pagina1`
--

CREATE TABLE `user_pagina1` (
  `user_id` int(11) NOT NULL,
  `pagina1_id` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_pagina1`
--

INSERT INTO `user_pagina1` (`user_id`, `pagina1_id`, `content`) VALUES
(3, 7, 'Inserta Aqui tus Scripts.'),
(3, 9, 'Inserta Aqui tus Scripts.'),
(11, 7, 'pagina1\n'),
(13, 7, '33333'),
(14, 7, 'Pablo Es GAY'),
(14, 9, 'Nuvia Perez'),
(14, 10, 'Este es un párrafo por defecto.'),
(14, 11, 'Este es un párrafo por defecto.'),
(14, 12, 'Este es un párrafo por defecto.'),
(15, 9, 'et answers. Find inspiration. Be more productive.\nFree to use. Easy to try. Just ask and ChatGPT can help with writing, learning, brainstorming, and more.'),
(15, 10, 'Este es el párrafo 10. Aquí puedes agregar tu propio contenido.'),
(19, 7, 'aaaaaaaaaa'),
(134, 7, 'ESTE ES UN EJEMPLO'),
(134, 9, 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pagina2`
--

CREATE TABLE `user_pagina2` (
  `user_id` int(11) NOT NULL,
  `pagina2_id` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_pagina2`
--

INSERT INTO `user_pagina2` (`user_id`, `pagina2_id`, `content`) VALUES
(3, 7, 'Inserta Aqui tus Scripts.'),
(3, 9, 'Inserta Aqui tus Scripts.'),
(13, 9, 'asdads'),
(14, 7, 'pagina 2'),
(14, 9, 'asd'),
(15, 7, 'aaaaaaaa'),
(15, 9, 'ssssssss'),
(33, 7, 'Inserta Aqui tus Scripts'),
(134, 7, 'a'),
(134, 9, 'r');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pagina3`
--

CREATE TABLE `user_pagina3` (
  `user_id` int(11) NOT NULL,
  `pagina3_id` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_pagina3`
--

INSERT INTO `user_pagina3` (`user_id`, `pagina3_id`, `content`) VALUES
(3, 7, 'Aqui puedes colocar tus Scripts'),
(3, 9, 'Aqui puedes colocar tus Aqui puedes colocar tus Scripts'),
(13, 9, 'Aqui puedes colocar tus Aqui puedes colocar tus Scripts'),
(14, 7, 'Aqui puedes colocar tus Scripts'),
(14, 9, 'Aqui puedes colocar tus Scripts'),
(15, 7, 'Aqui puedes colocar tus Scripts'),
(15, 9, 'Aqui puedes colocar tus Scripts'),
(134, 7, 'aaaaa\n'),
(134, 9, 'Inserta Aqui tus Scripts.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pagina4`
--

CREATE TABLE `user_pagina4` (
  `user_id` int(11) NOT NULL,
  `pagina4_id` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_pagina4`
--

INSERT INTO `user_pagina4` (`user_id`, `pagina4_id`, `content`) VALUES
(3, 7, 'PAGINA 4'),
(3, 9, 'aaaaaaa'),
(13, 9, 'aaaaaaaa'),
(14, 7, 'pagina 4'),
(14, 9, '99999999'),
(134, 7, '4'),
(134, 11, 'agusto.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pagina5`
--

CREATE TABLE `user_pagina5` (
  `user_id` int(11) NOT NULL,
  `pagina5_id` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_pagina5`
--

INSERT INTO `user_pagina5` (`user_id`, `pagina5_id`, `content`) VALUES
(3, 7, 'pagina 5'),
(13, 9, 'aaaa'),
(14, 7, 'pagina 5'),
(14, 9, '99999999'),
(21, 12, 'Inserta Aqui tus Scripts'),
(134, 7, '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pagina6`
--

CREATE TABLE `user_pagina6` (
  `user_id` int(11) NOT NULL,
  `pagina6_id` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_pagina6`
--

INSERT INTO `user_pagina6` (`user_id`, `pagina6_id`, `content`) VALUES
(3, 7, 'PAGINA6'),
(13, 7, 'a'),
(14, 7, 'pagina 6'),
(14, 9, '99999999'),
(134, 7, '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pagina7`
--

CREATE TABLE `user_pagina7` (
  `user_id` int(11) NOT NULL,
  `pagina7_id` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_pagina7`
--

INSERT INTO `user_pagina7` (`user_id`, `pagina7_id`, `content`) VALUES
(3, 7, 'PAGINA 7'),
(14, 7, 'pagina7\n'),
(14, 9, '99999999'),
(134, 7, '7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pagina8`
--

CREATE TABLE `user_pagina8` (
  `user_id` int(11) NOT NULL,
  `pagina8_id` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_pagina8`
--

INSERT INTO `user_pagina8` (`user_id`, `pagina8_id`, `content`) VALUES
(3, 7, 'PAGINA 8PAGINA 8'),
(14, 7, 'pagina8\n'),
(14, 9, '99999999'),
(134, 7, '8'),
(134, 10, 'Este es un párrafo por defecto.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pagina9`
--

CREATE TABLE `user_pagina9` (
  `user_id` int(11) NOT NULL,
  `pagina9_id` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_pagina9`
--

INSERT INTO `user_pagina9` (`user_id`, `pagina9_id`, `content`) VALUES
(14, 7, 'PAGINA 9'),
(14, 9, '99999999'),
(134, 7, '9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_paragraphs`
--

CREATE TABLE `user_paragraphs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `paragraph_id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `page` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_paragraphs`
--

INSERT INTO `user_paragraphs` (`id`, `user_id`, `paragraph_id`, `content`, `page`) VALUES
(5, 11, 2, 'adsssssssssssssssssssssssss', ''),
(6, 12, 1, 'Fue un gusto haberte atendido, que tengas un excelente día. ?\n\n', ''),
(91, 13, 10, 'Muchas gracias XXXXX, vamos a realizar unas pruebas para validar tu servicio, ¿nos puedes enviar una foto del estado actual de las luces de tu router?📸', ''),
(92, 13, 11, 'Puedes desconectar el Router 🔌, dejarlo 15 segundos desconectado y volver a conectar nuevamente, no importa que ya lo hayas hecho 👈, realice unos cambios al router y esperemos que suba los niveles del servicio. ✔', ''),
(93, 13, 12, '¿Me puedes indicar que mensaje te sale cuando levantas el auricular? 📞', ''),
(94, 13, 13, 'Muchas gracias, me puedes confirmar a qué red wifi de tu servicio te estás conectando 🔍, te recuerdo que tienes dos redes: una de 2.4 G (XXXXX) y otra de 5G (XXXXXX), si en caso tal estás conectado a la 2.4 G, por favor conéctate a la red 5G 📶', ''),
(101, 13, 14, 'Por favor, colócate en frente de la cajita y la TV y siga este sencillo paso 👉 presiona simultáneamente el botón \"mute\" 🔇 y \"flecha hacia la izquierda\" (⬅), por más de tres segundos hasta que el LED indicador parpadee de manera continua. Luego sigue las instrucciones en pantalla.', ''),
(102, 13, 15, 'Gracias, me puedes apoyar a realizar una revisión del cableado, puedes desconectar la caja de la corriente y los cables de la parte de detrás, 🔌 los vuelves a conectar del mismo modo, luego esperas que cargue todo y validas si tienes señal en tu TV 😊✔️', ''),
(103, 13, 7, 'Gracias, me puedes apoyar a realizar una revisión del cableado, puedes desconectar la caja de la corriente y los cables de la parte de detrás, 🔌 los vuelves a conectar del mismo modo, luego esperas que cargue todo y validas si tienes señal en tu TV 😊✔️', ''),
(117, 14, 9, 'aaaaaa', ''),
(118, 14, 15, 'asdasd.', ''),
(119, 14, 14, 'dfghdghdfghdfgh.', ''),
(122, 13, 9, '111ay listo 👏', ''),
(124, 14, 7, 'pagina 3', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_time` datetime NOT NULL,
  `last_access` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  `daily_time_online` time DEFAULT '00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_sessions`
--

INSERT INTO `user_sessions` (`id`, `user_id`, `login_time`, `last_access`, `logout_time`, `daily_time_online`) VALUES
(7, 135, '2024-12-11 17:34:10', '2024-12-11 17:34:10', '2024-12-11 11:36:54', '00:00:00'),
(8, 135, '2024-12-11 11:37:11', '2024-12-11 11:37:11', '2024-12-11 11:37:52', '00:00:00'),
(9, 133, '2024-12-11 11:38:03', '2024-12-11 11:38:03', '2024-12-11 11:38:36', '00:00:00'),
(10, 134, '2024-12-11 11:39:00', '2024-12-11 11:39:00', '2024-12-11 11:42:03', '00:00:00'),
(11, 133, '2024-12-11 11:41:43', '2024-12-11 11:41:43', '2024-12-11 11:41:54', '00:00:00'),
(12, 135, '2024-12-11 11:46:02', '2024-12-11 11:46:02', '2024-12-11 11:58:28', '00:12:26'),
(13, 135, '2024-12-11 11:59:25', '2024-12-11 11:59:25', '2024-12-11 11:59:28', '00:00:03'),
(14, 133, '2024-12-11 13:39:51', '2024-12-11 13:39:51', '2024-12-11 13:40:29', '00:00:38'),
(15, 135, '2024-12-11 13:41:59', '2024-12-11 13:41:59', '2024-12-11 14:02:14', '00:06:34'),
(16, 135, '2024-12-11 13:55:40', '2024-12-11 13:55:40', '2024-12-11 14:02:14', '00:06:34'),
(17, 133, '2024-12-11 14:02:31', '2024-12-11 14:02:31', '2024-12-11 14:17:50', '00:15:19'),
(18, 135, '2024-12-11 14:18:14', '2024-12-11 14:18:14', NULL, '00:00:00'),
(19, 135, '2024-12-13 08:56:19', '2024-12-13 08:56:19', '2024-12-13 13:14:58', '04:18:39'),
(20, 133, '2024-12-13 13:15:08', '2024-12-13 13:15:08', NULL, '00:00:00'),
(21, 135, '2024-12-16 09:59:11', '2024-12-16 09:59:11', '2024-12-16 10:21:18', '00:22:07'),
(22, 133, '2024-12-16 10:21:31', '2024-12-16 10:21:31', '2024-12-16 11:33:42', '00:01:44'),
(23, 133, '2024-12-16 11:23:16', '2024-12-16 11:23:16', '2024-12-16 11:33:42', '00:01:44'),
(24, 133, '2024-12-16 11:31:58', '2024-12-16 11:31:58', '2024-12-16 11:33:42', '00:01:44'),
(25, 135, '2024-12-16 11:34:37', '2024-12-16 11:34:37', '2024-12-16 11:43:59', '00:09:22'),
(26, 133, '2024-12-16 11:44:49', '2024-12-16 11:44:49', '2024-12-16 12:08:16', '00:21:09'),
(27, 133, '2024-12-16 11:47:07', '2024-12-16 11:47:07', '2024-12-16 12:08:16', '00:21:09'),
(28, 135, '2024-12-16 12:08:32', '2024-12-16 12:08:32', '2024-12-16 13:35:42', '00:20:33'),
(29, 135, '2024-12-16 12:10:43', '2024-12-16 12:10:43', '2024-12-16 13:35:42', '00:20:33'),
(30, 135, '2024-12-16 13:03:25', '2024-12-16 13:03:25', '2024-12-16 13:35:42', '00:20:33'),
(31, 135, '2024-12-16 13:15:09', '2024-12-16 13:15:09', '2024-12-16 13:35:42', '00:20:33'),
(32, 133, '2024-12-16 13:35:52', '2024-12-16 13:35:52', '2024-12-16 13:48:30', '00:12:38'),
(33, 135, '2024-12-16 13:48:42', '2024-12-16 13:48:42', '2024-12-16 13:52:48', '00:04:06'),
(34, 133, '2024-12-16 13:53:04', '2024-12-16 13:53:04', '2024-12-16 14:01:54', '00:05:56'),
(35, 133, '2024-12-16 13:55:58', '2024-12-16 13:55:58', '2024-12-16 14:01:54', '00:05:56'),
(36, 135, '2024-12-16 14:02:15', '2024-12-16 14:02:15', '2024-12-16 14:06:43', '00:04:28'),
(37, 133, '2024-12-16 14:07:03', '2024-12-16 14:07:03', '2024-12-16 14:48:57', '00:41:54'),
(38, 135, '2024-12-16 14:11:09', '2024-12-16 14:11:09', '2024-12-16 22:06:37', '00:00:22'),
(39, 135, '2024-12-16 20:25:42', '2024-12-16 20:25:42', '2024-12-16 22:06:37', '00:00:22'),
(40, 133, '2024-12-16 21:49:08', '2024-12-16 21:49:08', '2024-12-16 22:06:06', '00:16:56'),
(41, 133, '2024-12-16 21:49:10', '2024-12-16 21:49:10', '2024-12-16 22:06:06', '00:16:56'),
(42, 135, '2024-12-16 22:06:15', '2024-12-16 22:06:15', '2024-12-16 22:06:37', '00:00:22'),
(43, 133, '2024-12-16 22:06:44', '2024-12-16 22:06:44', NULL, '00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_settings`
--

CREATE TABLE `user_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `setting_key` varchar(255) NOT NULL,
  `setting_value` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `editable_texts`
--
ALTER TABLE `editable_texts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `flows`
--
ALTER TABLE `flows`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `flows1`
--
ALTER TABLE `flows1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `flows2`
--
ALTER TABLE `flows2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `flows3`
--
ALTER TABLE `flows3`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `flows4`
--
ALTER TABLE `flows4`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `flows5`
--
ALTER TABLE `flows5`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `flows6`
--
ALTER TABLE `flows6`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `manuales`
--
ALTER TABLE `manuales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `mensajes_chat`
--
ALTER TABLE `mensajes_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modales`
--
ALTER TABLE `modales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creado_por` (`creado_por`);

--
-- Indices de la tabla `modal_config`
--
ALTER TABLE `modal_config`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `new_paragraphs`
--
ALTER TABLE `new_paragraphs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nombres_pestanas`
--
ALTER TABLE `nombres_pestanas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagina1`
--
ALTER TABLE `pagina1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pagina2`
--
ALTER TABLE `pagina2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pagina3`
--
ALTER TABLE `pagina3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pagina4`
--
ALTER TABLE `pagina4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pagina5`
--
ALTER TABLE `pagina5`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pagina6`
--
ALTER TABLE `pagina6`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pagina7`
--
ALTER TABLE `pagina7`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pagina8`
--
ALTER TABLE `pagina8`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `pagina9`
--
ALTER TABLE `pagina9`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `paragraphs`
--
ALTER TABLE `paragraphs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `quejas`
--
ALTER TABLE `quejas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flow_id` (`flow_id`);

--
-- Indices de la tabla `steps1`
--
ALTER TABLE `steps1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flow_id` (`flow_id`);

--
-- Indices de la tabla `steps2`
--
ALTER TABLE `steps2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flow_id` (`flow_id`);

--
-- Indices de la tabla `steps3`
--
ALTER TABLE `steps3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flow_id` (`flow_id`);

--
-- Indices de la tabla `steps4`
--
ALTER TABLE `steps4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flow_id` (`flow_id`);

--
-- Indices de la tabla `steps5`
--
ALTER TABLE `steps5`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flow_id` (`flow_id`);

--
-- Indices de la tabla `steps6`
--
ALTER TABLE `steps6`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flow_id` (`flow_id`);

--
-- Indices de la tabla `system_news`
--
ALTER TABLE `system_news`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabs`
--
ALTER TABLE `tabs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `texts`
--
ALTER TABLE `texts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipificaciones`
--
ALTER TABLE `tipificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipifications`
--
ALTER TABLE `tipifications`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `user_new_paragraphs`
--
ALTER TABLE `user_new_paragraphs`
  ADD PRIMARY KEY (`user_id`,`paragraph_id`),
  ADD KEY `paragraph_id` (`paragraph_id`);

--
-- Indices de la tabla `user_pagina1`
--
ALTER TABLE `user_pagina1`
  ADD PRIMARY KEY (`user_id`,`pagina1_id`);

--
-- Indices de la tabla `user_pagina2`
--
ALTER TABLE `user_pagina2`
  ADD PRIMARY KEY (`user_id`,`pagina2_id`);

--
-- Indices de la tabla `user_pagina3`
--
ALTER TABLE `user_pagina3`
  ADD PRIMARY KEY (`user_id`,`pagina3_id`);

--
-- Indices de la tabla `user_pagina4`
--
ALTER TABLE `user_pagina4`
  ADD PRIMARY KEY (`user_id`,`pagina4_id`);

--
-- Indices de la tabla `user_pagina5`
--
ALTER TABLE `user_pagina5`
  ADD PRIMARY KEY (`user_id`,`pagina5_id`);

--
-- Indices de la tabla `user_pagina6`
--
ALTER TABLE `user_pagina6`
  ADD PRIMARY KEY (`user_id`,`pagina6_id`);

--
-- Indices de la tabla `user_pagina7`
--
ALTER TABLE `user_pagina7`
  ADD PRIMARY KEY (`user_id`,`pagina7_id`);

--
-- Indices de la tabla `user_pagina8`
--
ALTER TABLE `user_pagina8`
  ADD PRIMARY KEY (`user_id`,`pagina8_id`);

--
-- Indices de la tabla `user_pagina9`
--
ALTER TABLE `user_pagina9`
  ADD PRIMARY KEY (`user_id`,`pagina9_id`);

--
-- Indices de la tabla `user_paragraphs`
--
ALTER TABLE `user_paragraphs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_paragraph` (`user_id`,`paragraph_id`,`page`);

--
-- Indices de la tabla `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `editable_texts`
--
ALTER TABLE `editable_texts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `flows`
--
ALTER TABLE `flows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `flows1`
--
ALTER TABLE `flows1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `flows2`
--
ALTER TABLE `flows2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `flows3`
--
ALTER TABLE `flows3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `flows5`
--
ALTER TABLE `flows5`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `flows6`
--
ALTER TABLE `flows6`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `manuales`
--
ALTER TABLE `manuales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=603;

--
-- AUTO_INCREMENT de la tabla `mensajes_chat`
--
ALTER TABLE `mensajes_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `modales`
--
ALTER TABLE `modales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modal_config`
--
ALTER TABLE `modal_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `new_paragraphs`
--
ALTER TABLE `new_paragraphs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nombres_pestanas`
--
ALTER TABLE `nombres_pestanas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagina1`
--
ALTER TABLE `pagina1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pagina2`
--
ALTER TABLE `pagina2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pagina3`
--
ALTER TABLE `pagina3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pagina4`
--
ALTER TABLE `pagina4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pagina5`
--
ALTER TABLE `pagina5`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pagina6`
--
ALTER TABLE `pagina6`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pagina7`
--
ALTER TABLE `pagina7`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pagina8`
--
ALTER TABLE `pagina8`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pagina9`
--
ALTER TABLE `pagina9`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `paragraphs`
--
ALTER TABLE `paragraphs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT de la tabla `quejas`
--
ALTER TABLE `quejas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `steps`
--
ALTER TABLE `steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `steps1`
--
ALTER TABLE `steps1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `steps2`
--
ALTER TABLE `steps2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `steps3`
--
ALTER TABLE `steps3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `steps4`
--
ALTER TABLE `steps4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `steps5`
--
ALTER TABLE `steps5`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `steps6`
--
ALTER TABLE `steps6`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `system_news`
--
ALTER TABLE `system_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `tabs`
--
ALTER TABLE `tabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `texts`
--
ALTER TABLE `texts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipificaciones`
--
ALTER TABLE `tipificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipifications`
--
ALTER TABLE `tipifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `user_paragraphs`
--
ALTER TABLE `user_paragraphs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de la tabla `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `modales`
--
ALTER TABLE `modales`
  ADD CONSTRAINT `modales_ibfk_1` FOREIGN KEY (`creado_por`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `steps`
--
ALTER TABLE `steps`
  ADD CONSTRAINT `fk_flow_id` FOREIGN KEY (`flow_id`) REFERENCES `flows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_new_paragraphs`
--
ALTER TABLE `user_new_paragraphs`
  ADD CONSTRAINT `user_new_paragraphs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_new_paragraphs_ibfk_2` FOREIGN KEY (`paragraph_id`) REFERENCES `new_paragraphs` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
