-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2025 at 02:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `universitas`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_mhs_simple` ()   BEGIN
	SELECT NPM, Nama, No_hp
    FROM mahasiswa;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `tambah` (`angka1` INT, `angka2` INT) RETURNS INT(11)  BEGIN
	RETURN angka1 + angka2;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NPM` char(5) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` varchar(30) DEFAULT NULL,
  `Id_kelurahan` int(11) DEFAULT NULL,
  `Jenis_kelamin` enum('L','P') DEFAULT NULL,
  `No_hp` varchar(15) DEFAULT NULL,
  `Kode_prodi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NPM`, `Nama`, `Alamat`, `Id_kelurahan`, `Jenis_kelamin`, `No_hp`, `Kode_prodi`) VALUES
('12345', 'Imam Adi Nata', 'Kajen', 1, 'L', '081215529989', 1),
('12346', 'Budi Sugandhi', 'Bekasi', 109, 'L', '085643433321', 2),
('12347', 'Toha Sitohang', 'Medan', 103, 'L', '08989787876', 2),
('12348', 'Megawati', 'Condong Catur', 107, 'P', '0839303058', 1),
('12349', 'PRABOWO SUBIYANTO', 'JKT', 107, 'L', '08132809811', NULL),
('12780', 'Anis Baswedan', 'Jakarta', 234, 'L', '09898877663', NULL),
('12786', 'GANJAR PRANOWO', 'JAWA TENGAH', 123, 'L', '087656356622', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NPM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
