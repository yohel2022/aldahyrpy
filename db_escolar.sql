-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 18, 2020 at 07:49 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_escolar`
--

-- --------------------------------------------------------

--
-- Table structure for table `administratives`
--

DROP TABLE IF EXISTS `administratives`;
CREATE TABLE IF NOT EXISTS `administratives` (
  `user` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `surnames` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `curp` varchar(18) COLLATE utf8_spanish2_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish2_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `level_studies` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `documentation` int(1) NOT NULL,
  `observations` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `administratives`
--

INSERT INTO `administratives` (`user`, `name`, `surnames`, `curp`, `rfc`, `address`, `phone`, `level_studies`, `documentation`, `observations`) VALUES
('admin', 'Diego', 'Carmona Bernal', 'CABD970405CSRRG03', 'CABD9704052K5', 'Av Francisco Sarabia', '9613864928', 'Ingenieria', 1, ''),
('admin_25dd2', 'MoisÃ©s', 'Gomez Melendez', 'CONOCIDA', 'CONOCIDA', 'Plan Chiapas', '9612901878', 'Licenciatura', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id_group` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `school_period` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `semester` int(2) NOT NULL,
  `subjects` varchar(400) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id_group`, `school_period`, `name`, `semester`, `subjects`) VALUES
('1207', '2020-2', 'Desarrollo de Software 1207', 1, 'cal_dif_a1,'),
('1205', '2020-2', 'Desarrollo de Software 1205', 1, 'cal_dif_a1,'),
('1206', '2020-2', 'Desarrollo de Software 1206', 1, 'cal_dif_a1,cal_int_a1,'),
('3206', '2019-1', 'Desarrollo de Software 3206', 3, 'ing_bas_a3,');

-- --------------------------------------------------------

--
-- Table structure for table `groups_students`
--

DROP TABLE IF EXISTS `groups_students`;
CREATE TABLE IF NOT EXISTS `groups_students` (
  `id_group` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `school_period` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `user_student` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `groups_students`
--

INSERT INTO `groups_students` (`id_group`, `school_period`, `user_student`) VALUES
('1207', '2020-2', 'student_58330'),
('1206', '2020-2', 'student_3abaf'),
('1206', '2020-2', 'student_123bb'),
('1205', '2020-2', 'student_3abaf'),
('1205', '2020-2', 'student_123bb'),
('3206', '2019-1', 'student_12542');

-- --------------------------------------------------------

--
-- Table structure for table `school_periods`
--

DROP TABLE IF EXISTS `school_periods`;
CREATE TABLE IF NOT EXISTS `school_periods` (
  `school_period` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `active` int(1) NOT NULL,
  `current` int(1) NOT NULL,
  PRIMARY KEY (`school_period`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `school_periods`
--

INSERT INTO `school_periods` (`school_period`, `start_date`, `end_date`, `active`, `current`) VALUES
('2020-2', '2020-07-07', '2020-12-10', 1, 1),
('2019-1', '2020-05-17', '2020-05-17', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `user` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `school_period` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `surnames` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `curp` varchar(18) COLLATE utf8_spanish2_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish2_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `level_studies` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `documentation` int(1) NOT NULL,
  `observations` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`user`, `school_period`, `name`, `surnames`, `curp`, `rfc`, `address`, `phone`, `level_studies`, `documentation`, `observations`) VALUES
('student_123bb', '2020-2', 'Carlos', 'Albores Nigenda', 'CONOCIDA', 'CONOCIDA', 'Conocido', '9617272727', 'Licenciatura', 1, ''),
('student_3abaf', '2020-2', 'JosÃ© Guillermo', 'Monroy Palacios', 'CONOCIDA', 'CONOCIDA', 'Conocido', '9716277272', 'Licenciatura', 1, ''),
('student_58330', '2020-2', 'Fabricio', 'Lopez Torres', 'CONOCIDA', 'CONOCIDA', 'Conocido', '9616542222', 'Ingenieria', 0, ''),
('student_12542', '2019-1', 'Vladimir', 'CastaÃ±eda Cuevas', 'CONOCIDA', 'CONOCIDA', 'Conocido', '9287272782', 'Ingenieria', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `subject` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `school_period` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `description` text COLLATE utf8_spanish2_ci NOT NULL,
  `semester` int(2) NOT NULL,
  `user_teacher` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject`, `school_period`, `name`, `description`, `semester`, `user_teacher`) VALUES
('cal_int_a1', '2020-2', 'CÃ¡lculo integral', 'La integraciÃ³n es un concepto fundamental del cÃ¡lculo y del anÃ¡lisis matemÃ¡tico.\r\n\r\nBÃ¡sicamente, una integral es una generalizaciÃ³n de la suma de infinitos sumandos, infinitesimalmente pequeÃ±os: una suma continua.\r\n\r\nLa integral es la operaciÃ³n inversa a la derivada.', 1, 'teacher_991d7'),
('cal_dif_a1', '2020-2', 'CÃ¡lculo diferencial', 'El cÃ¡lculo diferencial es una parte del cÃ¡lculo infinitesimal y del anÃ¡lisis matemÃ¡tico que estudia cÃ³mo cambian las funciones continuas segÃºn sus variables cambian de estado.\r\n\r\nEl principal objeto de estudio en el cÃ¡lculo diferencial es la derivada.', 1, 'teacher_df949'),
('ing_bas_1', '2020-2', 'Ingles BÃ¡sico I', '', 2, 'teacher_7c46b'),
('ing_bas_a3', '2019-1', 'Ingles', '', 3, 'teacher_7c46b');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `user` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `surnames` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `curp` varchar(18) COLLATE utf8_spanish2_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish2_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `level_studies` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `documentation` int(1) NOT NULL,
  `observations` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`user`, `name`, `surnames`, `curp`, `rfc`, `address`, `phone`, `level_studies`, `documentation`, `observations`) VALUES
('teacher_991d7', 'Ricardo', 'Cruz Sarmiento', 'CONOCIDA', 'CONOCIDA', 'Conocido', '9716272278', 'Licenciatura', 1, ''),
('teacher_7c46b', 'JesÃºs Antonio', 'Olvera Galvez', 'JAOG9897678JDKDKDK', 'JAOG989767888', '9a Sur Ote 2761', '9616541519', 'Maestria', 1, ''),
('teacher_df949', 'Gerardo', 'Nanguluru Furi', 'CONOCIDA', 'CONOCIDA', 'Conocido', '9173783883', 'Licenciatura', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `pass` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `permissions` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `image` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user`, `pass`, `permissions`, `image`) VALUES
('admin', 'root', 'admin', 'user.png');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
