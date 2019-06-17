-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2019 at 06:01 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warehouse`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `barang_keluar` (IN `id` VARCHAR(25), IN `jumlah` INT(11))  BEGIN
declare stok int(11);
 select stok_barang into stok from barang where id_barang = id;
 set stok = stok - jumlah;
 update barang set stok_barang = stok where id_barang = id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_stok` (IN `idbarang` VARCHAR(25), IN `stok` INT(11))  BEGIN
declare stoklama int(11);
select stok_barang into stoklama from barang where id_barang = idbarang;
set stoklama = stoklama + stok;
update barang set stok_barang = stoklama where id_barang = idbarang;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id`, `password`) VALUES
('dinul', 'dinul'),
('yusriantoni', 'yusriantoni'),
('destri', 'destri');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(10) NOT NULL,
  `harga_barang` int(10) NOT NULL,
  `stok_barang` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga_barang`, `stok_barang`) VALUES
('001', 'Kelapa', 10000, 9),
('002', 'Mangga', 56000, 2),
('003', 'Anggur', 60000, 20),
('004', 'Jeruk', 30000, 10),
('005', 'Meja', 500000, 10),
('006', 'Kursi', 300000, 10),
('007', 'Sepeda', 1000000, 5),
('008', 'Laptop', 5000000, 20),
('009', 'Kemeja', 50000, 100),
('010', 'Jaket', 150000, 30),
('011', 'Beras', 100000, 30),
('012', 'Mouse', 200000, 40),
('013', 'Keyboard', 500000, 20),
('014', 'Printer', 1000000, 10),
('015', 'Charger', 100000, 20),
('016', 'Tas', 200000, 20),
('017', 'Apel', 56000, 3),
('018', 'Spidol', 10000, 100),
('019', 'Penghapus', 5000, 50),
('020', 'Rautan', 4000, 100),
('097', 'Tipex', 5400, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
