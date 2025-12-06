-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Mar 2025 pada 18.56
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NPM` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NPM`, `nama`, `jurusan`) VALUES
(1, 'Ahmada', 'Teknologi_informasi'),
(2, 'Nopal', 'Teknologi_informasi'),
(3, 'Zulfa', 'Industri'),
(4, 'eko', 'Industri'),
(5, 'Anggita', 'Elektro'),
(6, 'Apin', 'Elektro');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa_nilai`
--

CREATE TABLE `mahasiswa_nilai` (
  `NPM` char(1) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jurusan` varchar(30) NOT NULL,
  `mata_kuliah` varchar(30) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa_nilai`
--

INSERT INTO `mahasiswa_nilai` (`NPM`, `nama`, `jurusan`, `mata_kuliah`, `nilai`) VALUES
('1', 'Ahmada', 'Teknologi_informasi', 'Biologi', 95),
('1', 'Ahmada', 'Teknologi_informasi', 'Fisika', 70),
('1', 'Ahmada', 'Teknologi_informasi', 'Kimia', 80),
('2', 'Nopal', 'Teknologi_informasi', 'Biologi', 90),
('2', 'Nopal', 'Teknologi_informasi', 'Fisika', 85),
('2', 'Nopal', 'Teknologi_informasi', 'Kimia', 85),
('3', 'Zulfa', 'Industri', 'Pemrograman', 95),
('3', 'Zulfa', 'Industri', 'Aljabar', 95),
('4', 'eko', 'Industri', 'Pemrograman', 70),
('4', 'eko', 'Industri', 'Aljabar', 80),
('5', 'Anggita', 'Elektro', 'Kalkulus', 80),
('5', 'Anggita', 'Elektro', 'Pancasila', 85),
('6', 'Apin', 'Elektro', 'Kalkulus', 95),
('6', 'Apin', 'Elektro', 'Pancasila', 75);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `NPM` int(11) NOT NULL,
  `mata_kuliah` varchar(40) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `NPM`, `mata_kuliah`, `nilai`) VALUES
(1, 1, 'Biologi', 95),
(2, 1, 'Fisika', 80),
(3, 1, 'Kimia', 70),
(4, 2, 'Biologi', 90),
(5, 2, 'Fisika', 85),
(6, 2, 'Kimia', 85),
(7, 3, 'Pemrograman', 95),
(8, 3, 'Aljabar', 95),
(9, 4, 'Pemrograman', 70),
(10, 4, 'Aljabar', 80),
(11, 5, 'Kalkulus', 80),
(12, 5, 'Pancasila', 85),
(13, 6, 'Pancasila', 75),
(14, 6, 'Kalkulus', 95);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NPM`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `NPM` (`NPM`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `NPM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`NPM`) REFERENCES `mahasiswa` (`NPM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
