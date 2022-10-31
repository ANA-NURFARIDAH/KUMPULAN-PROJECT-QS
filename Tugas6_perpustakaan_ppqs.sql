-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2022 at 03:39 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan_ppqs`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `kode_anggota` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` set('Laki-Laki','Perempuan') NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` bigint(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `kode_anggota`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `no_telp`, `email`) VALUES
(1, 'PPQS1', 'Ana Nurfarida', 'Perempuan', 'Kebumen', '2002-06-20', 'Kebumen', 89533035171, 'ana@gmail.com'),
(2, 'PPQS2', 'Miyanti', '', 'Wonosobo', '1999-06-20', 'Wonosobo', 8953303545241, 'mia@gmail.com'),
(3, 'PPQS3', 'Puput Septiana', '', 'Blitar', '2003-09-07', 'Blitar', 8953303545241, 'puput@gmail.com'),
(4, 'PPQS4', 'Fina Aliatul', '', 'Blitar', '2003-05-10', 'Blitar', 8953303545241, 'fina@gmail.com'),
(5, 'PPQS5', 'Arum Latifah', '', 'Kebumen', '2001-01-12', 'Kebumen', 8953303545241, 'arum@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `kode_buku` varchar(10) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `jumlah_buku` int(3) NOT NULL,
  `tahun_terbit` int(4) NOT NULL,
  `sinopsis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `kode_buku`, `judul_buku`, `pengarang`, `jumlah_buku`, `tahun_terbit`, `sinopsis`) VALUES
(1, 'BK1', 'filsafat ilmu', 'Dr.H. Nunu Burhanuddin', 7, 2012, 'Filsafat ilmu adalah bagian dari filsafat yang menjawab beberapa pertanyaan mengenai hakikat ilmu. Filsafat ilmu memiliki cabang-cabang filsafat yang berkaitan dengan dasar, metode, asumsi dan implikasi ilmu pengetahuan dari ilmu yang termasuk di dalamnya antara lain ilmu alam dan ilmu sosial.'),
(2, 'BK2', 'kumpulan puisi', 'desti suci restiana', 10, 1966, 'Puisi merupakan salah satu jenis karya sastra yang gaya bahasanya sangat ditentukan oleh irama, rima, serta penyusunan larik dan bait.'),
(3, 'BK3', 'filosofi kehidupan', 'husni mubarok', 7, 2019, 'Filosofi kehidupan sendiri merupakan setiap sikap atau pandangan seseorang yang berkaitan dengan kebermaknaan akan kehidupan atau tentang bagaimana menjalani hidup seharusnya. Di mana filosofi kehidupan berfungsi sebagai landasan seseorang setiap melakukan sesuatu dalam hidupnya.'),
(4, 'BK4', 'kesehatan masyarakat', 'prof. dr. soekidjo', 8, 2011, 'Kesehatan masyarakat (bahasa Inggris: public health) didefinisikan sebagai \"ilmu dan seni mencegah penyakit\", memperpanjang hidup, dan meningkatkan kualitas hidup dengan melakukan upaya-upaya terorganisasi dan memberi pilihan informasi kepada masyarakat, organisasi (publik dan swasta), komunitas, dan individu.'),
(5, 'BK5', 'pejuang subuh', 'wahyu qolbu', 5, 2019, 'jadilah pejuang sholat subuh, pantang tidur kemalaman agar tak bangun kesiangan');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `lama_pinjam` int(7) NOT NULL,
  `anggota_id` int(11) NOT NULL,
  `jumlah_pinjam` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `tanggal_pinjam`, `lama_pinjam`, `anggota_id`, `jumlah_pinjam`) VALUES
(1, '2022-10-01', 5, 1, 2),
(2, '2022-10-01', 1, 2, 2),
(3, '2022-10-04', 7, 3, 3),
(4, '2022-10-05', 4, 4, 1),
(5, '2022-10-07', 2, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id` int(11) NOT NULL,
  `peminjaman_id` int(11) NOT NULL,
  `tanggal_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id`, `peminjaman_id`, `tanggal_kembali`) VALUES
(1, 1, '2022-10-06'),
(2, 1, '2022-10-02'),
(3, 1, '2022-10-11'),
(4, 1, '2022-10-09'),
(5, 1, '2022-10-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
