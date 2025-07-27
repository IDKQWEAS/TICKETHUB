-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 26, 2025 at 02:59 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tickethub_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int NOT NULL,
  `tipe_kereta` varchar(50) NOT NULL,
  `nama_kereta` varchar(100) NOT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `stasiun_asal` varchar(100) NOT NULL,
  `stasiun_tujuan` varchar(100) NOT NULL,
  `waktu_berangkat` datetime NOT NULL,
  `waktu_tiba` datetime DEFAULT NULL,
  `harga` int DEFAULT NULL,
  `sisa_kursi` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id`, `tipe_kereta`, `nama_kereta`, `kelas`, `stasiun_asal`, `stasiun_tujuan`, `waktu_berangkat`, `waktu_tiba`, `harga`, `sisa_kursi`) VALUES
(1, 'Jarak Jauh', 'Argo Bromo', 'Eksekutif', 'Gambir (GMR)', 'Surabaya Pasarturi (SBI)', '2025-08-10 08:00:00', '2025-08-10 17:30:00', 650000, 49),
(2, 'Jarak Jauh', 'Taksaka', 'Eksekutif', 'Gambir (GMR)', 'Yogyakarta (YK)', '2025-08-11 20:45:00', '2025-08-12 04:15:00', 450000, 30),
(3, 'Commuter', 'KRL Commuter Line (KA 601)', NULL, 'Palur', 'Yogyakarta', '2025-07-25 06:05:00', NULL, NULL, NULL),
(4, 'Commuter', 'KRL Commuter Line (KA 601)', NULL, 'Solo Jebres', 'Yogyakarta', '2025-07-25 06:12:00', NULL, NULL, NULL),
(5, 'Commuter', 'KRL Commuter Line (KA 601)', NULL, 'Solo Balapan', 'Yogyakarta', '2025-07-25 06:20:00', NULL, NULL, NULL),
(6, 'Commuter', 'KRL Commuter Line (KA 601)', NULL, 'Purwosari', 'Yogyakarta', '2025-07-25 06:28:00', NULL, NULL, NULL),
(7, 'Commuter', 'KRL Commuter Line (KA 601)', NULL, 'Gawok', 'Yogyakarta', '2025-07-25 06:36:00', NULL, NULL, NULL),
(8, 'Commuter', 'KRL Commuter Line (KA 601)', NULL, 'Delanggu', 'Yogyakarta', '2025-07-25 06:44:00', NULL, NULL, NULL),
(9, 'Commuter', 'KRL Commuter Line (KA 601)', NULL, 'Ceper', 'Yogyakarta', '2025-07-25 06:52:00', NULL, NULL, NULL),
(10, 'Commuter', 'KRL Commuter Line (KA 601)', NULL, 'Klaten', 'Yogyakarta', '2025-07-25 07:00:00', NULL, NULL, NULL),
(11, 'Commuter', 'KRL Commuter Line (KA 601)', NULL, 'Srowot', 'Yogyakarta', '2025-07-25 07:08:00', NULL, NULL, NULL),
(12, 'Commuter', 'KRL Commuter Line (KA 601)', NULL, 'Brambanan', 'Yogyakarta', '2025-07-25 07:16:00', NULL, NULL, NULL),
(13, 'Commuter', 'KRL Commuter Line (KA 601)', NULL, 'Maguwo', 'Yogyakarta', '2025-07-25 07:24:00', NULL, NULL, NULL),
(14, 'Commuter', 'KRL Commuter Line (KA 601)', NULL, 'Lempuyangan', 'Yogyakarta', '2025-07-25 07:32:00', NULL, NULL, NULL),
(15, 'Commuter', 'KRL Commuter Line (KA 702)', NULL, 'Yogyakarta', 'Palur', '2025-07-25 06:30:00', NULL, NULL, NULL),
(16, 'Commuter', 'KRL Commuter Line (KA 702)', NULL, 'Lempuyangan', 'Palur', '2025-07-25 06:38:00', NULL, NULL, NULL),
(17, 'Commuter', 'KRL Commuter Line (KA 702)', NULL, 'Maguwo', 'Palur', '2025-07-25 06:46:00', NULL, NULL, NULL),
(18, 'Commuter', 'KRL Commuter Line (KA 702)', NULL, 'Brambanan', 'Palur', '2025-07-25 06:54:00', NULL, NULL, NULL),
(19, 'Commuter', 'KRL Commuter Line (KA 702)', NULL, 'Srowot', 'Palur', '2025-07-25 07:02:00', NULL, NULL, NULL),
(20, 'Commuter', 'KRL Commuter Line (KA 702)', NULL, 'Klaten', 'Palur', '2025-07-25 07:10:00', NULL, NULL, NULL),
(21, 'Commuter', 'KRL Commuter Line (KA 702)', NULL, 'Ceper', 'Palur', '2025-07-25 07:18:00', NULL, NULL, NULL),
(22, 'Commuter', 'KRL Commuter Line (KA 702)', NULL, 'Delanggu', 'Palur', '2025-07-25 07:26:00', NULL, NULL, NULL),
(23, 'Commuter', 'KRL Commuter Line (KA 702)', NULL, 'Gawok', 'Palur', '2025-07-25 07:34:00', NULL, NULL, NULL),
(24, 'Commuter', 'KRL Commuter Line (KA 702)', NULL, 'Purwosari', 'Palur', '2025-07-25 07:42:00', NULL, NULL, NULL),
(25, 'Commuter', 'KRL Commuter Line (KA 702)', NULL, 'Solo Balapan', 'Palur', '2025-07-25 07:50:00', NULL, NULL, NULL),
(26, 'Commuter', 'KRL Commuter Line (KA 702)', NULL, 'Solo Jebres', 'Palur', '2025-07-25 07:58:00', NULL, NULL, NULL),
(27, 'Commuter', 'KRL Commuter Line (KA 603)', NULL, 'Palur', 'Yogyakarta', '2025-07-25 08:15:00', NULL, NULL, NULL),
(28, 'Commuter', 'KRL Commuter Line (KA 603)', NULL, 'Solo Jebres', 'Yogyakarta', '2025-07-25 08:22:00', NULL, NULL, NULL),
(29, 'Commuter', 'KRL Commuter Line (KA 603)', NULL, 'Solo Balapan', 'Yogyakarta', '2025-07-25 08:30:00', NULL, NULL, NULL),
(30, 'Commuter', 'KRL Commuter Line (KA 603)', NULL, 'Purwosari', 'Yogyakarta', '2025-07-25 08:38:00', NULL, NULL, NULL),
(31, 'Commuter', 'KRL Commuter Line (KA 603)', NULL, 'Gawok', 'Yogyakarta', '2025-07-25 08:46:00', NULL, NULL, NULL),
(32, 'Commuter', 'KRL Commuter Line (KA 603)', NULL, 'Delanggu', 'Yogyakarta', '2025-07-25 08:54:00', NULL, NULL, NULL),
(33, 'Commuter', 'KRL Commuter Line (KA 603)', NULL, 'Ceper', 'Yogyakarta', '2025-07-25 09:02:00', NULL, NULL, NULL),
(34, 'Commuter', 'KRL Commuter Line (KA 603)', NULL, 'Klaten', 'Yogyakarta', '2025-07-25 09:10:00', NULL, NULL, NULL),
(35, 'Commuter', 'KRL Commuter Line (KA 603)', NULL, 'Srowot', 'Yogyakarta', '2025-07-25 09:18:00', NULL, NULL, NULL),
(36, 'Commuter', 'KRL Commuter Line (KA 603)', NULL, 'Brambanan', 'Yogyakarta', '2025-07-25 09:26:00', NULL, NULL, NULL),
(37, 'Commuter', 'KRL Commuter Line (KA 603)', NULL, 'Maguwo', 'Yogyakarta', '2025-07-25 09:34:00', NULL, NULL, NULL),
(38, 'Commuter', 'KRL Commuter Line (KA 603)', NULL, 'Lempuyangan', 'Yogyakarta', '2025-07-25 09:42:00', NULL, NULL, NULL),
(39, 'Commuter', 'KRL Commuter Line (KA 704)', NULL, 'Yogyakarta', 'Palur', '2025-07-25 09:00:00', NULL, NULL, NULL),
(40, 'Commuter', 'KRL Commuter Line (KA 704)', NULL, 'Lempuyangan', 'Palur', '2025-07-25 09:08:00', NULL, NULL, NULL),
(41, 'Commuter', 'KRL Commuter Line (KA 704)', NULL, 'Maguwo', 'Palur', '2025-07-25 09:16:00', NULL, NULL, NULL),
(42, 'Commuter', 'KRL Commuter Line (KA 704)', NULL, 'Brambanan', 'Palur', '2025-07-25 09:24:00', NULL, NULL, NULL),
(43, 'Commuter', 'KRL Commuter Line (KA 704)', NULL, 'Srowot', 'Palur', '2025-07-25 09:32:00', NULL, NULL, NULL),
(44, 'Commuter', 'KRL Commuter Line (KA 704)', NULL, 'Klaten', 'Palur', '2025-07-25 09:40:00', NULL, NULL, NULL),
(45, 'Commuter', 'KRL Commuter Line (KA 704)', NULL, 'Ceper', 'Palur', '2025-07-25 09:48:00', NULL, NULL, NULL),
(46, 'Commuter', 'KRL Commuter Line (KA 704)', NULL, 'Delanggu', 'Palur', '2025-07-25 09:56:00', NULL, NULL, NULL),
(47, 'Commuter', 'KRL Commuter Line (KA 704)', NULL, 'Gawok', 'Palur', '2025-07-25 10:04:00', NULL, NULL, NULL),
(48, 'Commuter', 'KRL Commuter Line (KA 704)', NULL, 'Purwosari', 'Palur', '2025-07-25 10:12:00', NULL, NULL, NULL),
(49, 'Commuter', 'KRL Commuter Line (KA 704)', NULL, 'Solo Balapan', 'Palur', '2025-07-25 10:20:00', NULL, NULL, NULL),
(50, 'Commuter', 'KRL Commuter Line (KA 704)', NULL, 'Solo Jebres', 'Palur', '2025-07-25 10:28:00', NULL, NULL, NULL),
(51, 'Commuter', 'KRL Commuter Line (KA 605)', NULL, 'Palur', 'Yogyakarta', '2025-07-25 10:45:00', NULL, NULL, NULL),
(52, 'Commuter', 'KRL Commuter Line (KA 605)', NULL, 'Solo Jebres', 'Yogyakarta', '2025-07-25 10:52:00', NULL, NULL, NULL),
(53, 'Commuter', 'KRL Commuter Line (KA 605)', NULL, 'Solo Balapan', 'Yogyakarta', '2025-07-25 11:00:00', NULL, NULL, NULL),
(54, 'Commuter', 'KRL Commuter Line (KA 605)', NULL, 'Purwosari', 'Yogyakarta', '2025-07-25 11:08:00', NULL, NULL, NULL),
(55, 'Commuter', 'KRL Commuter Line (KA 706)', NULL, 'Yogyakarta', 'Palur', '2025-07-25 11:20:00', NULL, NULL, NULL),
(56, 'Commuter', 'KRL Commuter Line (KA 706)', NULL, 'Lempuyangan', 'Palur', '2025-07-25 11:28:00', NULL, NULL, NULL),
(57, 'Commuter', 'KRL Commuter Line (KA 706)', NULL, 'Maguwo', 'Palur', '2025-07-25 11:36:00', NULL, NULL, NULL),
(58, 'Commuter', 'KRL Commuter Line (KA 706)', NULL, 'Brambanan', 'Palur', '2025-07-25 11:44:00', NULL, NULL, NULL),
(59, 'Commuter', 'KRL Commuter Line (KA 607)', NULL, 'Palur', 'Yogyakarta', '2025-07-25 12:50:00', NULL, NULL, NULL),
(60, 'Commuter', 'KRL Commuter Line (KA 607)', NULL, 'Solo Balapan', 'Yogyakarta', '2025-07-25 13:05:00', NULL, NULL, NULL),
(61, 'Commuter', 'KRL Commuter Line (KA 607)', NULL, 'Klaten', 'Yogyakarta', '2025-07-25 13:30:00', NULL, NULL, NULL),
(62, 'Commuter', 'KRL Commuter Line (KA 708)', NULL, 'Yogyakarta', 'Palur', '2025-07-25 13:40:00', NULL, NULL, NULL),
(63, 'Commuter', 'KRL Commuter Line (KA 708)', NULL, 'Lempuyangan', 'Palur', '2025-07-25 13:48:00', NULL, NULL, NULL),
(64, 'Commuter', 'KRL Commuter Line (KA 708)', NULL, 'Klaten', 'Palur', '2025-07-25 14:15:00', NULL, NULL, NULL),
(65, 'Commuter', 'KRL Commuter Line (KA 609)', NULL, 'Palur', 'Yogyakarta', '2025-07-25 15:10:00', NULL, NULL, NULL),
(66, 'Commuter', 'KRL Commuter Line (KA 609)', NULL, 'Solo Balapan', 'Yogyakarta', '2025-07-25 15:25:00', NULL, NULL, NULL),
(67, 'Commuter', 'KRL Commuter Line (KA 609)', NULL, 'Klaten', 'Yogyakarta', '2025-07-25 15:50:00', NULL, NULL, NULL),
(68, 'Commuter', 'KRL Commuter Line (KA 609)', NULL, 'Maguwo', 'Yogyakarta', '2025-07-25 16:10:00', NULL, NULL, NULL),
(69, 'Commuter', 'KRL Commuter Line (KA 710)', NULL, 'Yogyakarta', 'Palur', '2025-07-25 16:30:00', NULL, NULL, NULL),
(70, 'Commuter', 'KRL Commuter Line (KA 710)', NULL, 'Lempuyangan', 'Palur', '2025-07-25 16:38:00', NULL, NULL, NULL),
(71, 'Commuter', 'KRL Commuter Line (KA 710)', NULL, 'Klaten', 'Palur', '2025-07-25 17:05:00', NULL, NULL, NULL),
(72, 'Commuter', 'KRL Commuter Line (KA 710)', NULL, 'Solo Balapan', 'Palur', '2025-07-25 17:30:00', NULL, NULL, NULL),
(73, 'Commuter', 'KRL Commuter Line (KA 611)', NULL, 'Palur', 'Yogyakarta', '2025-07-25 18:05:00', NULL, NULL, NULL),
(74, 'Commuter', 'KRL Commuter Line (KA 611)', NULL, 'Solo Balapan', 'Yogyakarta', '2025-07-25 18:20:00', NULL, NULL, NULL),
(75, 'Commuter', 'KRL Commuter Line (KA 611)', NULL, 'Klaten', 'Yogyakarta', '2025-07-25 18:45:00', NULL, NULL, NULL),
(76, 'Commuter', 'KRL Commuter Line (KA 611)', NULL, 'Lempuyangan', 'Yogyakarta', '2025-07-25 19:10:00', NULL, NULL, NULL),
(77, 'Commuter', 'KRL Commuter Line (KA 712)', NULL, 'Yogyakarta', 'Palur', '2025-07-25 19:15:00', NULL, NULL, NULL),
(78, 'Commuter', 'KRL Commuter Line (KA 712)', NULL, 'Lempuyangan', 'Palur', '2025-07-25 19:23:00', NULL, NULL, NULL),
(79, 'Commuter', 'KRL Commuter Line (KA 712)', NULL, 'Maguwo', 'Palur', '2025-07-25 19:31:00', NULL, NULL, NULL),
(80, 'Commuter', 'KRL Commuter Line (KA 712)', NULL, 'Klaten', 'Palur', '2025-07-25 19:55:00', NULL, NULL, NULL),
(81, 'Commuter', 'KRL Commuter Line (KA 712)', NULL, 'Purwosari', 'Palur', '2025-07-25 20:20:00', NULL, NULL, NULL),
(82, 'Commuter', 'KRL Commuter Line (KA 613)', NULL, 'Palur', 'Yogyakarta', '2025-07-25 20:53:00', NULL, NULL, NULL),
(83, 'Commuter', 'KRL Commuter Line (KA 613)', NULL, 'Solo Balapan', 'Yogyakarta', '2025-07-25 21:08:00', NULL, NULL, NULL),
(84, 'Commuter', 'KRL Commuter Line (KA 613)', NULL, 'Klaten', 'Yogyakarta', '2025-07-25 21:33:00', NULL, NULL, NULL),
(85, 'Commuter', 'KRL Commuter Line (KA 714)', NULL, 'Yogyakarta', 'Palur', '2025-07-25 22:01:00', NULL, NULL, NULL),
(86, 'Commuter', 'KRL Commuter Line (KA 714)', NULL, 'Lempuyangan', 'Palur', '2025-07-25 22:09:00', NULL, NULL, NULL),
(87, 'Commuter', 'KRL Commuter Line (KA 714)', NULL, 'Klaten', 'Palur', '2025-07-25 22:35:00', NULL, NULL, NULL),
(88, 'Jarak Jauh', 'Argo Bromo', 'Eksekutif', 'Gambir (GMR)', 'Surabaya Pasarturi (SBI)', '2025-08-10 08:00:00', '2025-08-10 17:30:00', 650000, 50),
(89, 'Jarak Jauh', 'Taksaka', 'Eksekutif', 'Gambir (GMR)', 'Yogyakarta (YK)', '2025-08-11 20:45:00', '2025-08-12 04:15:00', 450000, 30),
(90, 'Jarak Jauh', 'Argo Lawu', 'Eksekutif', 'Gambir (GMR)', 'Solo Balapan (SLO)', '2025-08-12 20:00:00', '2025-08-13 04:30:00', 550000, 40),
(91, 'Jarak Jauh', 'Argo Wilis', 'Eksekutif', 'Bandung (BD)', 'Surabaya Gubeng (SGU)', '2025-08-12 07:00:00', '2025-08-12 19:00:00', 600000, 35),
(92, 'Jarak Jauh', 'Gajayana', 'Eksekutif', 'Gambir (GMR)', 'Malang (ML)', '2025-08-13 18:40:00', '2025-08-14 08:20:00', 700000, 25),
(93, 'Jarak Jauh', 'Lodaya Pagi', 'Bisnis', 'Bandung (BD)', 'Solo Balapan (SLO)', '2025-08-13 07:20:00', '2025-08-13 16:00:00', 350000, 60),
(94, 'Jarak Jauh', 'Sancaka', 'Ekonomi', 'Yogyakarta (YK)', 'Surabaya Gubeng (SGU)', '2025-08-14 17:10:00', '2025-08-14 21:45:00', 220000, 80);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int NOT NULL,
  `kode_booking` varchar(20) NOT NULL,
  `id_user` int NOT NULL,
  `id_jadwal` int NOT NULL,
  `jumlah_tiket` int NOT NULL,
  `total_harga` int NOT NULL,
  `tanggal_pesan` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT 'Menunggu Pembayaran',
  `metode_pembayaran` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `kode_booking`, `id_user`, `id_jadwal`, `jumlah_tiket`, `total_harga`, `tanggal_pesan`, `status`, `metode_pembayaran`) VALUES
(1, 'TH-TLJ90UZ6', 1, 1, 1, 650000, '2025-07-26 14:56:50', 'Menunggu Pembayaran', 'Gerai Alfamart');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(80) NOT NULL,
  `nama_lengkap` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `nama_lengkap`, `email`, `password_hash`) VALUES
(1, 'zidan', 'zidan', 'zidan@zidan', 'scrypt:32768:8:1$GYBL9YAVehTibkrb$a8a5e209acb15112fececea08054d0452deeb9a35933b5539717eb56fbb72c728487ba2236f119c4a0e9480de23f003efb7af2f0540601c3b11135606eb463e1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_booking` (`kode_booking`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
