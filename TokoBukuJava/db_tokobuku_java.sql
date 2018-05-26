-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2018 at 05:12 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tokobuku_java`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jual`
--

CREATE TABLE `tb_jual` (
  `id_pelanggan` int(10) NOT NULL,
  `id_novel` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `stok` int(10) NOT NULL,
  `total` int(10) NOT NULL,
  `uang` int(10) NOT NULL,
  `kembalian` int(10) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jual`
--

INSERT INTO `tb_jual` (`id_pelanggan`, `id_novel`, `judul`, `stok`, `total`, `uang`, `kembalian`, `tanggal`) VALUES
(1, 'BOOK001', 'OK', 1, 40000, 45000, 5000, '2018-02-15'),
(2, 'BOOK001', 'OK', 2, 80000, 90000, 10000, '2018-02-24'),
(3, 'BOOK001', 'OK', 3, 120000, 200000, 80000, '2018-05-23'),
(4, 'BOOK001', 'OK', 1, 40000, 40000, 0, '2018-05-23'),
(5, 'BOOK001', 'OK', 3, 120000, 150000, 30000, '2018-05-23'),
(6, 'BOOK002', 'Ganti Presiden', 10, 500000, 600000, 100000, '2018-05-24'),
(7, 'BOOK002', 'Ganti Presiden', 10, 500000, 500100, 100, '2018-05-24');

--
-- Triggers `tb_jual`
--
DELIMITER $$
CREATE TRIGGER `jual_barang` AFTER INSERT ON `tb_jual` FOR EACH ROW BEGIN
UPDATE tb_stok
SET stok = stok - NEW.stok
WHERE
id_novel = NEW.id_novel;END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kasir`
--

CREATE TABLE `tb_kasir` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kasir`
--

INSERT INTO `tb_kasir` (`username`, `password`) VALUES
('kasir', 'kasir');

-- --------------------------------------------------------

--
-- Table structure for table `tb_stok`
--

CREATE TABLE `tb_stok` (
  `id_novel` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `tahun` date NOT NULL,
  `stok` int(8) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_stok`
--

INSERT INTO `tb_stok` (`id_novel`, `judul`, `pengarang`, `tahun`, `stok`, `kategori`, `harga`) VALUES
('BOOK001', 'OK', 'Hashfi Ihkammudin', '2015-05-01', 90, 'Comedy', 40000),
('BOOK002', 'Ganti Presiden', 'Huhu', '2018-05-01', 80, 'Comedy', 50000),
('BOOK003', 'Hashfi', 'Hashfii', '2018-03-01', 100, 'Romance', 100000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_jual`
--
ALTER TABLE `tb_jual`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD PRIMARY KEY (`id_novel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_jual`
--
ALTER TABLE `tb_jual`
  MODIFY `id_pelanggan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
