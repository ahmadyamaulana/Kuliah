-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2025 at 01:47 PM
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
-- Database: `invmaster`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `kategori` varchar(30) DEFAULT NULL,
  `satuan` varchar(15) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `harga` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori`, `satuan`, `stok`, `harga`) VALUES
(1, 'Pensil 2B', 'ATK', 'Pack', 10, 22000.00),
(2, 'Pulpen Standard AE7', 'ATK', 'Pack', 8, 18500.00),
(3, 'Penggaris', 'ATK', 'Unit', 20, 2500.00),
(4, 'Buku Tulis', 'ATK', 'Pack', 5, 31500.00),
(5, 'Spidol Snowman', 'ATK', 'Unit', 30, 8000.00);

-- --------------------------------------------------------

--
-- Table structure for table `detail_distribusi`
--

CREATE TABLE `detail_distribusi` (
  `id_detail` int(11) NOT NULL,
  `id_distribusi` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_distribusi`
--

INSERT INTO `detail_distribusi` (`id_detail`, `id_distribusi`, `id_barang`, `jumlah`) VALUES
(1, 1, 1, 5),
(2, 2, 5, 15),
(3, 3, 2, 4),
(4, 4, 3, 12),
(5, 5, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pengadaan`
--

CREATE TABLE `detail_pengadaan` (
  `id_detail` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga_satuan` decimal(15,2) DEFAULT NULL,
  `id_pengadaan` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_pengadaan`
--

INSERT INTO `detail_pengadaan` (`id_detail`, `jumlah`, `harga_satuan`, `id_pengadaan`, `id_barang`) VALUES
(1, 10, 22000.00, 1, 1),
(2, 8, 18500.00, 2, 2),
(3, 20, 2500.00, 3, 3),
(4, 5, 31500.00, 4, 4),
(5, 30, 8000.00, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `distribusi`
--

CREATE TABLE `distribusi` (
  `id_distribusi` int(11) NOT NULL,
  `tanggal_distribusi` date DEFAULT NULL,
  `tujuan` varchar(100) DEFAULT NULL,
  `id_pengguna` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `distribusi`
--

INSERT INTO `distribusi` (`id_distribusi`, `tanggal_distribusi`, `tujuan`, `id_pengguna`) VALUES
(1, '2025-04-17', 'Koperasi', 5),
(2, '2025-04-19', 'Gudang Cabang', 1),
(3, '2025-04-22', 'Divisi Umum', 2),
(4, '2025-05-03', 'Toko A', 3),
(5, '2025-05-05', 'Gudang', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pengadaan`
--

CREATE TABLE `pengadaan` (
  `id_pengadaan` int(11) NOT NULL,
  `tanggal_pengadaan` date DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `total_harga` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengadaan`
--

INSERT INTO `pengadaan` (`id_pengadaan`, `tanggal_pengadaan`, `id_supplier`, `total_harga`) VALUES
(1, '2025-01-04', 1, 220000.00),
(2, '2025-02-02', 2, 148000.00),
(3, '2025-02-10', 3, 50000.00),
(4, '2025-03-15', 4, 157500.00),
(5, '2025-04-07', 5, 240000.00);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(30) DEFAULT NULL,
  `username` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama_pengguna`, `username`) VALUES
(1, 'Admin Gudang', 'Admin'),
(2, 'Staf 1', 'Staf1'),
(3, 'Staf 2', 'Staf2'),
(4, 'Suppervisor', 'Supervisor'),
(5, 'Opperator Distribusi', 'Opdis');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat`, `telepon`) VALUES
(1, 'PT Cipta Makmur', 'Jl. Beringin V, Bogor', '085956788943'),
(2, 'PT Cipta Makmur', 'Jl. Beringin V, Bogor', '085956788943'),
(3, 'PT Cahaya Purnama', 'Jl. Ketepeng, Surabaya', '089444567223'),
(4, 'PT Sinar Mentari', 'Jl. Cubung, Sukoharjo', '081223344556'),
(5, 'PT Nipponjin', 'Jl. Merdeka N0.45, Jakarta', '081170819450');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `detail_distribusi`
--
ALTER TABLE `detail_distribusi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_distribusi` (`id_distribusi`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `detail_pengadaan`
--
ALTER TABLE `detail_pengadaan`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_pengadaan` (`id_pengadaan`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `distribusi`
--
ALTER TABLE `distribusi`
  ADD PRIMARY KEY (`id_distribusi`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `pengadaan`
--
ALTER TABLE `pengadaan`
  ADD PRIMARY KEY (`id_pengadaan`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `detail_distribusi`
--
ALTER TABLE `detail_distribusi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `detail_pengadaan`
--
ALTER TABLE `detail_pengadaan`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `distribusi`
--
ALTER TABLE `distribusi`
  MODIFY `id_distribusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengadaan`
--
ALTER TABLE `pengadaan`
  MODIFY `id_pengadaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_distribusi`
--
ALTER TABLE `detail_distribusi`
  ADD CONSTRAINT `detail_distribusi_ibfk_1` FOREIGN KEY (`id_distribusi`) REFERENCES `distribusi` (`id_distribusi`),
  ADD CONSTRAINT `detail_distribusi_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `detail_pengadaan`
--
ALTER TABLE `detail_pengadaan`
  ADD CONSTRAINT `detail_pengadaan_ibfk_1` FOREIGN KEY (`id_pengadaan`) REFERENCES `pengadaan` (`id_pengadaan`),
  ADD CONSTRAINT `detail_pengadaan_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `distribusi`
--
ALTER TABLE `distribusi`
  ADD CONSTRAINT `distribusi_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`);

--
-- Constraints for table `pengadaan`
--
ALTER TABLE `pengadaan`
  ADD CONSTRAINT `pengadaan_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
