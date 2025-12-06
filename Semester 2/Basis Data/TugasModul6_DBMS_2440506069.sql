-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Mar 2025 pada 09.52
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
-- Database: `untid`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ambil_mk`
--

CREATE TABLE `ambil_mk` (
  `NIM` char(3) NOT NULL,
  `kode_mk` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ambil_mk`
--

INSERT INTO `ambil_mk` (`NIM`, `kode_mk`) VALUES
('101', 'PTI447'),
('103', 'TKI333'),
('104', 'PTI333'),
('104', 'PTI777'),
('105', 'PTI123'),
('107', 'PTI777');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `kode_dosen` char(2) NOT NULL,
  `Nama_dosen` varchar(20) DEFAULT NULL,
  `Alamat_dosen` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`kode_dosen`, `Nama_dosen`, `Alamat_dosen`) VALUES
('10', 'Suharto', 'Jl.Jombang'),
('11', 'Martono', 'Jl.Kalpataru'),
('12', 'Rahmawati', 'Jl.Jakarta'),
('13', 'Bambang', 'Jl.Bandung'),
('14', 'Nurul', 'Jl.Raya Tidar'),
('23', 'Siti', 'Jl.Asih'),
('33', 'Setiawan', 'Jl.kenanga'),
('99', 'wawan', 'Jl.mawar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jurusan` char(2) NOT NULL,
  `nama_jurusan` varchar(20) DEFAULT NULL,
  `kode_dosen` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`, `kode_dosen`) VALUES
('TE', 'Teknik Elektro', '10'),
('TM', 'Teknik Mesin', '13'),
('TS', 'Teknik Sipil', '23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` char(3) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `jenis_kelamin` enum('l','p') DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `nama`, `jenis_kelamin`, `alamat`) VALUES
('101', 'Arif', 'l', 'Jl.Kenangan'),
('102', 'Budi', 'l', 'Jl.Jombang'),
('103', 'Wati', 'p', 'Jl.Surabaya'),
('104', 'Ika', 'p', 'Jl.Jombang'),
('105', 'Tono', 'l', 'Jl.Jakarta'),
('106', 'Iwan', 'l', 'Jl.Bandung'),
('107', 'Sari', 'p', 'Jl.Malang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkul`
--

CREATE TABLE `matkul` (
  `kode_mk` char(6) NOT NULL,
  `nama_mk` varchar(30) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `kode_dosen` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `matkul`
--

INSERT INTO `matkul` (`kode_mk`, `nama_mk`, `sks`, `semester`, `kode_dosen`) VALUES
('PTI123', 'Grafika Multimedia', 3, 5, '12'),
('PTI333', 'Basis Data Terdistribusi', 3, 5, '10'),
('PTI447', 'Praktikum Basis Data', 1, 2, '11'),
('PTI777', 'Sistem Informasi', 2, 3, '99'),
('TKI123', 'Jaringan Komputer', 2, 5, '33'),
('TKI333', 'Sistem Oprasai', 3, 5, '10'),
('TKI342', 'Praktikum Basis Data', 1, 2, '11');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD PRIMARY KEY (`NIM`,`kode_mk`),
  ADD KEY `kode_mk` (`kode_mk`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode_dosen`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jurusan`),
  ADD KEY `kode_dosen` (`kode_dosen`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indeks untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`kode_mk`),
  ADD KEY `kode_dosen` (`kode_dosen`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD CONSTRAINT `ambil_mk_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `ambil_mk_ibfk_2` FOREIGN KEY (`kode_mk`) REFERENCES `matkul` (`kode_mk`);

--
-- Ketidakleluasaan untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`kode_dosen`) REFERENCES `dosen` (`kode_dosen`);

--
-- Ketidakleluasaan untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD CONSTRAINT `matkul_ibfk_1` FOREIGN KEY (`kode_dosen`) REFERENCES `dosen` (`kode_dosen`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
