-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2025 at 11:14 AM
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
-- Database: `tokobuku`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_transaksi` (IN `p_id_pelanggan` INT, IN `p_id_buku` INT, IN `p_jumlah` INT)   BEGIN
    DECLARE v_harga DECIMAL(10,2);
    DECLARE v_stok INT;
    DECLARE v_total DECIMAL(10,2);

    -- Ambil harga dan stok buku
    SELECT harga, stok INTO v_harga, v_stok
    FROM buku
    WHERE id_buku = p_id_buku;

    -- Cek jumlah stok buku
    IF v_stok < p_jumlah THEN
        SELECT CONCAT('Stok tidak cukup. Stok buku hanya tersedia ', v_stok) AS pesan;
    ELSE
        -- Hitung total harga
        SET v_total = v_harga * p_jumlah;

        -- Kurangi stok buku
        UPDATE buku
        SET stok = stok - p_jumlah
        WHERE id_buku = p_id_buku;

        -- Tambahkan data ke tabel transaksi
        INSERT INTO transaksi (id_pelanggan, id_buku, jumlah, total_harga, tanggal_transaksi)
        VALUES (p_id_pelanggan, p_id_buku, p_jumlah, v_total, CURDATE());

        -- Tambahkan ke total belanja pelanggan
        UPDATE pelanggan
        SET total_belanja = total_belanja + v_total
        WHERE id_pelanggan = p_id_pelanggan;

        -- Tampilkan pesan sukses
        SELECT 'Transaksi berhasil' AS pesan;
    END IF;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hitung_diskon` (`total_belanja` DECIMAL(10,2)) RETURNS DECIMAL(5,2) DETERMINISTIC BEGIN
	DECLARE diskon DECIMAL(5,2);
    -- Diskon berdasarkan total_belanja
    IF total_belanja < 1000000 THEN
    	SET diskon = 0.00;
    ELSEIF total_belanja <5000000 THEN
    	SET diskon = 0.05;
    ELSE 
    	SET diskon = 0.10;
    END IF;
    RETURN diskon;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `Judul` varchar(100) DEFAULT NULL,
  `Penulis` varchar(100) DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `Judul`, `Penulis`, `Harga`, `Stok`) VALUES
(1, 'Bumi', 'Tere Liye', 99000.00, 8),
(2, 'A+', 'Ananda Putri', 100000.00, 0),
(3, 'Harry Potter', 'J.K.Rowling', 500000.00, 15),
(4, 'Laut Bercerita', 'Leila S.Chudori', 150000.00, 8),
(5, 'Lemon Trees Grow', 'Zoulfa Katouh', 220000.00, 11);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `Total_belanja` decimal(10,2) DEFAULT 0.00,
  `Status_member` enum('REGULER','GOLD','PLATINUM') DEFAULT 'REGULER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `Nama`, `Total_belanja`, `Status_member`) VALUES
(1, 'Lala', 3000000.00, 'GOLD'),
(2, 'Yaya', 4000000.00, 'GOLD'),
(3, 'Sasa', 1296000.00, 'GOLD'),
(4, 'Udin', 450000.00, 'REGULER'),
(5, 'Kiki', 800000.00, 'REGULER');

--
-- Triggers `pelanggan`
--
DELIMITER $$
CREATE TRIGGER `updateStatusMember` BEFORE UPDATE ON `pelanggan` FOR EACH ROW BEGIN
    IF NEW.total_belanja >= 5000000 THEN
        SET NEW.status_member = 'PLATINUM';
    ELSEIF NEW.total_belanja >= 1000000 THEN
        SET NEW.status_member = 'GOLD';
    ELSE
        SET NEW.status_member = 'REGULER';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `Total_harga` decimal(10,2) DEFAULT NULL,
  `Tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `id_buku`, `Jumlah`, `Total_harga`, `Tanggal_transaksi`) VALUES
(1, 1, 3, 10, 50000000.00, '2025-05-12'),
(2, 2, 5, 3, 6600000.00, '2025-05-18'),
(3, 3, 1, 2, 198000.00, '2025-06-01'),
(4, 4, 4, 1, 150000.00, '2025-06-05'),
(5, 5, 2, 5, 500000.00, '2025-06-10'),
(6, 3, 1, 4, 396000.00, '2025-06-17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_buku` (`id_buku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
