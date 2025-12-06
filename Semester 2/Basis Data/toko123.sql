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
-- Database: `toko123`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(3) NOT NULL,
  `nama_barang` varchar(20) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `stok`) VALUES
('A11', 'Keyboard', 35),
('A12', 'DVD R-W', 10),
('A13', 'Modem', 6);

--
-- Triggers `barang`
--
DELIMITER $$
CREATE TRIGGER `deleteChild` AFTER DELETE ON `barang` FOR EACH ROW DELETE FROM pembelian
WHERE id_barang = OLD.id_barang
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inkremenStok2` BEFORE INSERT ON `barang` FOR EACH ROW SET NEW.stok = NEW.stok +1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pem` int(11) NOT NULL,
  `id_barang` char(3) DEFAULT NULL,
  `jml_beli` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pem`, `id_barang`, `jml_beli`) VALUES
(3, 'A11', 20);

--
-- Triggers `pembelian`
--
DELIMITER $$
CREATE TRIGGER `updateStok` AFTER INSERT ON `pembelian` FOR EACH ROW UPDATE barang 
SET stok = stok + NEW.jml_beli
WHERE id_barang = NEW.id_barang
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateStokEdit` AFTER UPDATE ON `pembelian` FOR EACH ROW UPDATE barang
SET stok = stok + (NEW.jml_beli - OLd.jml_beli)
WHERE id_barang = NEW.id_barang
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pem`),
  ADD KEY `fk_id_barang` (`id_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `fk_id_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
