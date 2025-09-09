-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 09, 2025 at 07:38 AM
-- Server version: 10.11.13-MariaDB-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `primary`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_10_012722_create_personal_access_tokens_table', 1),
(5, '2025_08_10_014935_create_permission_tables', 1),
(6, '2025_08_24_012720_create_otps_table', 2),
(7, '0001_01_01_000000_create_users_table_update', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `whatsapp_number` varchar(255) NOT NULL,
  `otp_code` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `device_type`, `user_agent`, `ip_address`, `last_used_at`, `expires_at`, `revoked_at`, `created_at`, `updated_at`) VALUES
(28, 'App\\Models\\User', 4, 'auth_token', '53a829e4a6ab66260a5010f12ec5b432a447af0618068c756692fa8d65b038da', '[\"*\"]', NULL, NULL, NULL, '2025-08-26 20:11:33', NULL, NULL, '2025-08-26 20:07:41', '2025-08-26 20:11:33'),
(59, 'App\\Models\\User', 2, 'auth_token', '7703ca8087149c565b7f9aee41a1f6e1013a33e90e2edd18e773bdacf1a000e6', '[\"*\"]', NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-08 23:52:08', '2025-09-08 23:52:08');

-- --------------------------------------------------------

--
-- Table structure for table `primary_karyawan`
--

CREATE TABLE `primary_karyawan` (
  `no_id` int(11) NOT NULL,
  `no_induk_absen` varchar(50) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `status_upah` varchar(50) DEFAULT NULL,
  `status_karyawan` varchar(50) DEFAULT NULL,
  `masuk_kerja` date DEFAULT NULL,
  `masa_kerja` varchar(50) DEFAULT NULL,
  `ditetapkan` date DEFAULT NULL,
  `bagian` varchar(100) DEFAULT NULL,
  `sub_bagian` varchar(100) DEFAULT NULL,
  `kelompok_kerja` varchar(100) DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `alamat_rt_rw` varchar(50) DEFAULT NULL,
  `alamat_desa` varchar(100) DEFAULT NULL,
  `alamat_kecamatan` varchar(100) DEFAULT NULL,
  `alamat_kabupaten` varchar(100) DEFAULT NULL,
  `no_nik` varchar(20) DEFAULT NULL,
  `no_kk` varchar(20) DEFAULT NULL,
  `kelamin` varchar(10) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `pendidikan` varchar(50) DEFAULT NULL,
  `disabilitas` varchar(50) DEFAULT NULL,
  `kpi` varchar(50) DEFAULT NULL,
  `no_bpjs_kes` varchar(30) DEFAULT NULL,
  `no_kpj` varchar(30) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `no_bank` varchar(50) DEFAULT NULL,
  `foto_profile` varchar(255) DEFAULT NULL,
  `foto_formal` varchar(255) DEFAULT NULL,
  `vaksin` varchar(100) DEFAULT NULL,
  `riwayat_kesehatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `primary_karyawan`
--

INSERT INTO `primary_karyawan` (`no_id`, `no_induk_absen`, `nama`, `status_upah`, `status_karyawan`, `masuk_kerja`, `masa_kerja`, `ditetapkan`, `bagian`, `sub_bagian`, `kelompok_kerja`, `pekerjaan`, `alamat_rt_rw`, `alamat_desa`, `alamat_kecamatan`, `alamat_kabupaten`, `no_nik`, `no_kk`, `kelamin`, `tempat_lahir`, `tanggal_lahir`, `umur`, `pendidikan`, `disabilitas`, `kpi`, `no_bpjs_kes`, `no_kpj`, `no_hp`, `email`, `bank`, `no_bank`, `foto_profile`, `foto_formal`, `vaksin`, `riwayat_kesehatan`) VALUES
(1, '78040503', 'Muhammad Budiharto', 'Bulanan', 'PKWTT', '2005-08-01', '19 tahun 11 bulan', '2005-08-01', 'Primary', 'Pengurus', 'Pengurus', 'Kepala Bagian Primary', 'Gondosari rt 3 rw 6', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080204780003', '3319080204780003', 'Laki Laki', 'Kudus', '1978-04-02', 47, 'Sarjana Ekonomi', 'Tidak', 'YA', '0001530658618', '07007840858', '081326747779', 'budeng.pandega@gmail.com', 'BNI', '822106854', 'karyawan/profile/20ff5527-9110-478f-b712-b5a892143e9b.webp', 'karyawan/formal/b737f96d-86e3-4c74-9bb6-db5b2b3a7562.webp', 'v3', NULL),
(2, NULL, 'Ardian setyawan', 'Bulanan', 'PKWTT', '1995-12-23', '29 tahun 6 bulan', NULL, 'Primary', 'KAPEL TEKNIK', NULL, NULL, 'Gondosari rt 3 rw 6', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319081111750001', '3319081111750001', 'Laki Laki', 'Kudus', '1975-11-11', 49, NULL, 'Tidak', 'YA', '0001530659373', '95L50058798', '085225669510', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'Bayu Pornomo', 'Bulanan', 'PKWTT', '2021-02-23', '4 tahun 4 bulan', NULL, 'Primary', 'OPERASIONAL CENGKEH', NULL, NULL, 'Ds Trangkil Rt 04 rw02', 'TRANGKIL', 'TRANGKIL', 'PATI', '3318211309970001', '3318211309970001', 'Laki Laki', 'Pati', '1997-09-13', 27, NULL, 'Tidak', 'YA', '0001875993131', '21057884906', '082248024545', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, 'Adhitya Raka Mahendra', 'Bulanan', 'PKWTT', '2022-12-13', '2 tahun 6 bulan', NULL, 'Primary', 'ADM UMUM', NULL, NULL, 'Perum Tiara Ardi B5 Pandean Ngadirejo Kartosuro', 'NGADIREJO', 'GEBOG', 'KUDUS', '3311022101970001', '3311022101970001', 'Laki Laki', 'Purwodadi', '1997-01-21', 28, NULL, 'Tidak', 'YA', '0002097038957', '22155406337', '082328042803', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, 'DAYAT MUGONO', 'Bulanan', 'PKWTT', '2005-11-01', '19 tahun 8 bulan', NULL, 'Primary', 'KASI PROSES 1', NULL, NULL, 'Beru Wetan RT 07/RW 02', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080812850004', '3319080812850004', 'Laki Laki', 'KUDUS', '1985-12-08', 39, 'SMA', 'Tidak', 'YA', '0001530664378', '10015517252', '085701018584', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, 'MUHAMMAD A\'IDZIN', 'Bulanan', 'PKWTT', '1998-04-16', '27 tahun 2 bulan', NULL, 'Primary', 'KAPEL MANDOR PS 2', NULL, NULL, 'Gondosari RT 03 / RW 01', 'GONDOSARI', 'GEBONG', 'KUDUS', '3319080809780007', '3319080809780007', 'Laki Laki', 'KUDUS', '1978-09-08', 46, 'SLTA', 'Tidak', 'YA', '0001530661162', '20074518679', '085326673406', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, 'NOOR HIDAYAH', 'Bulanan', 'PKWTT', '2005-11-27', '19 tahun 7 bulan', NULL, 'Primary', 'PEL PERSONALIA PS', NULL, NULL, 'Beru Wetan RT 07/RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084704820005', '3319084704820005', 'Perempuan', 'KUDUS', '1982-04-07', 43, 'SLTA', 'Tidak', 'YA', '0001530660835', '10015515819', '085226006645', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, 'MUHAMMAD IRFAN', 'Bulanan', 'PKWT', '2021-11-22', '3 tahun 7 bulan', NULL, 'Primary', 'PEL. PROSES 2', NULL, NULL, 'Cendono RT 05/ RW 04', 'CENDONO', 'DAWE', 'KUDUS', '3319090802000001', '3319090802000001', 'Laki Laki', 'KUDUS', '2000-02-08', 25, 'SMK', 'Tidak', 'YA', '0001529281258', '21063316026', '085877888802', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, 'AYYUB YAHYA', 'Bulanan', 'PKWTT', '2020-01-01', '5 tahun 6 bulan', NULL, 'Primary', 'PEL. PENERIMAAN TBK', NULL, NULL, 'Piji RT 06/RW 03', 'PIJI', 'DAWE', 'KUDUS', '3319093101010004', '3319093101010004', 'Laki Laki', 'KUDUS', '2001-01-31', 24, 'SMK', 'Tidak', 'YA', '0000593403546', '19084031087', '085869336395', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, 'SYAIFUL ANWAR', 'Bulanan', 'PKWTT', '2020-11-08', '4 tahun 8 bulan', NULL, 'Primary', 'PEL, PROSES', NULL, NULL, 'Gondosari RT 03 / RW 10', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082709990004', '3319082709990004', 'Laki Laki', 'KUDUS', '1999-09-27', 25, 'SLTA', 'Tidak', 'YA', '0002580315041', '20074480235', '085869465803', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, NULL, 'AHMAD NURUL ROZAQ', 'Bulanan', 'PKWTT', '2019-06-25', '6 tahun 0 bulan', NULL, 'Primary', 'PEL MANDOR PROSES', NULL, NULL, 'Jurang RT 05/ RW 05', 'JURANG', 'GEBOG', 'KUDUS', '3319081609990005', '3319081609990005', 'Laki Laki', 'KUDUS', '1999-09-16', 25, 'SLTA', 'Tidak', 'YA', '0001025605901', '19061579926', '085743784206', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, NULL, 'MUCHAMAD NAUFAL DZAFIF', 'Bulanan', 'PKWTT', '2019-09-22', '5 tahun 9 bulan', NULL, 'Primary', 'PEL MANDOR PROSES', NULL, NULL, 'Gondosari RT 03 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082305010003', '3319082305010003', 'Laki Laki', 'KUDUS', '2001-05-23', 24, 'SMA', 'Tidak', 'YA', '0002613399546', '19084031103', '087812134846', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, 'SUWIKNO', 'Bulanan', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'PEL MANDOR PROSES', NULL, NULL, 'Kedungsari RT 05 / RW 09', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319080705780008', '3319080705780008', 'Laki Laki', 'KUDUS', '1978-05-07', 47, 'SD', 'Tidak', 'YA', '0001698395589', '10015517013', '085325284120', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, NULL, 'AHMAD SAIFUL ANAM', 'Bulanan', 'PKWT', '2022-03-21', '3 tahun 3 bulan', NULL, 'Primary', 'PEL MANDOR PROSES', NULL, NULL, 'Jurang RT 05 / RW 05', 'JURANG', 'GEBOG', 'KUDUS', '3319081111020005', '3319081111020005', 'Laki Laki', 'KUDUS', '2002-11-11', 22, 'SLTA', 'Tidak', 'YA', '0001025604786', NULL, '085743621603', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, NULL, 'SAMSUL HUDA', 'Bulanan', 'PKWTT', '1998-04-16', '27 tahun 2 bulan', NULL, 'Primary', 'KAPEL G. ROKOK', NULL, NULL, 'Sungging RT 03 / RW 06', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319081108750003', '3319081108750003', 'Laki Laki', 'KUDUS', '1975-08-11', 49, 'SLTA', 'Tidak', 'YA', '0001693859872', '11006816398', '082324767747', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, NULL, 'Suripto', 'Harian', 'PKWTT', '1976-01-01', '49 tahun 6 bulan', NULL, 'Primary', 'HR CENGKEH', 'HR OP CKH', NULL, 'JURANG RT 03 / RW 06', 'JURANG', 'GEBOG', 'KUDUS', '3319081604570002', '3319081604570002', 'Laki Laki', 'KUDUS', '1957-04-16', 68, 'SD', 'Tidak', NULL, '0000093395564', '10015516254', '085229245990', NULL, 'BNI', '0989730157', NULL, NULL, NULL, NULL),
(25, NULL, 'Busari', 'Borong', NULL, NULL, NULL, NULL, 'Primary', 'BR CENGKEH', 'BR CKH', NULL, 'GONDOSARI RT 05 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080305650005', '3319080305650005', 'Laki Laki', 'KUDUS', '1965-05-03', 60, NULL, 'Tidak', NULL, '0002299764914', '18030384285', '082134585650', NULL, 'BNI', '1939678518', NULL, NULL, NULL, NULL),
(66, NULL, 'Sudarno', 'Borong', NULL, NULL, NULL, NULL, 'Primary', 'BR CENGKEH', 'BR CKH', NULL, 'GONDOSARI RT 03 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080507660001', '3319080507660001', 'Laki Laki', 'KUDUS', '1966-07-05', 59, NULL, 'Tidak', NULL, NULL, '18030384251', '081329168062', NULL, 'BRI', '592401032501530', NULL, NULL, NULL, NULL),
(67, NULL, 'Samian', 'Harian', 'PKWTT', '1995-10-23', '29 tahun 8 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'GONDOSARI RT 07 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080509730002', '3319080509730002', 'Laki Laki', 'KUDUS', '1973-09-05', 51, 'SD', 'Tidak', NULL, '0003288924145', '14040342868', '087843542840', NULL, 'BNI', '1938831126', NULL, NULL, NULL, NULL),
(69, NULL, 'Supriyono', 'Harian', 'PKWTT', '1996-01-25', '29 tahun 5 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'GONDOSARI RT 03 / RW 06', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080708730004', '3319080708730004', 'Laki Laki', 'KUDUS', '1973-08-07', 51, 'SD', 'Tidak', NULL, '0001699098524', '14040342777', '082323031397', NULL, 'BNI', '0989730204', NULL, NULL, NULL, NULL),
(70, NULL, 'Lukito', 'Harian', 'PKWTT', '1996-01-25', '29 tahun 5 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'GONDOSARI RT 01 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080608780005', '3319080608780005', 'Laki Laki', 'KUDUS', '1978-08-06', 46, 'SMP', 'Tidak', NULL, '0001699097578', '14040342926', '085326281123', NULL, 'BNI', '1938949081', NULL, NULL, NULL, NULL),
(71, NULL, 'Pasri', 'Harian', 'PKWTT', '1996-01-25', '29 tahun 5 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'KAJAR RT 05 / RW 02', 'KAJAR', 'DAWE', 'KUDUS', '3319092002730004', '3319092002730004', 'Laki Laki', 'KUDUS', '1973-02-20', 52, 'SD', 'Tidak', NULL, NULL, '14040342785', '081288220121', NULL, 'BRI', '592201040129536', NULL, NULL, NULL, NULL),
(72, NULL, 'Santoso', 'Harian', 'PKWTT', '1996-01-25', '29 tahun 5 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'GONDOSARI RT 01 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082006740002', '3319082006740002', 'Laki Laki', 'KUDUS', '1974-06-20', 51, 'SD', 'Tidak', NULL, NULL, '14040342827', '08983333778', NULL, 'BNI', '1939827164', NULL, NULL, NULL, NULL),
(73, NULL, 'Masudin', 'Harian', 'PKWTT', '1996-01-25', '29 tahun 5 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'MENAWAN RT 03 / RW 03', 'MENAWAN', 'GEBOG', 'KUDUS', '3319081511720005', '3319081511720005', 'Laki Laki', 'KUDUS', '1972-11-15', 52, 'SMP', 'Tidak', NULL, NULL, '14040342843', '085725395370', NULL, 'BNI', '1938932066', NULL, NULL, NULL, NULL),
(74, NULL, 'Sutrisno', 'Harian', 'PKWTT', '1996-01-25', '29 tahun 5 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'GONDOSARI RT 06 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319081011730007', '3319081011730007', 'Laki Laki', 'KUDUS', '1973-11-10', 51, 'SMA', 'Tidak', NULL, '0001699098243', '14040342835', '087843542840', NULL, 'BRI', '592401023339530', NULL, NULL, NULL, NULL),
(76, NULL, 'Edi Kiswoyo', 'Harian', 'PKWTT', '1996-01-25', '29 tahun 5 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'GONDOSARI RT 02 / RW 09', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319081507700004', '3319081507700004', 'Laki Laki', 'KUDUS', '1970-07-15', 54, 'SMP', 'Tidak', NULL, NULL, '14040342793', '085892373619', NULL, 'BNI', '1939678507', NULL, NULL, NULL, NULL),
(77, NULL, 'Asrofi', 'Borong', NULL, NULL, NULL, NULL, 'Primary', 'BR CENGKEH', 'BR CKH', NULL, 'GONDOSARI RT 02 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082005740004', '3319082005740004', 'Laki Laki', 'KUDUS', '1974-05-20', 51, NULL, 'Tidak', NULL, '0002299764813', '18030384293', '085883079149', NULL, 'BNI', '1938805050', NULL, NULL, NULL, NULL),
(79, NULL, 'Fatur Ronji', 'Harian', 'PKWTT', '1996-12-01', '28 tahun 7 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'GONDOSARI RT 03 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319081611700002', '3319081611700002', 'Laki Laki', 'KUDUS', '1970-11-16', 54, 'SLTP', 'Tidak', NULL, NULL, '14040342801', '085225991764', NULL, 'BNI', '1939678494', NULL, NULL, NULL, NULL),
(82, NULL, 'Ahmad Abdul Haq', 'Harian', 'PKWTT', '1999-10-01', '25 tahun 9 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'GONDOSARI RT 01 / RW 06', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082802820011', '3319082802820011', 'Laki Laki', 'KUDUS', '1982-02-28', 43, 'SD', 'Tidak', NULL, '0001699097466', '14040342850', '085225382835', NULL, 'BRI', '592331317427537', NULL, NULL, NULL, NULL),
(283, NULL, 'Sadirin', 'Harian', 'PKWTT', '1974-11-14', '50 tahun 7 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 05 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080112570002', '3319080112570002', 'Laki Laki', 'KUDUS', '1957-12-01', 67, NULL, 'Tidak', NULL, '0001698396355', '10015517096', '085293233784', NULL, 'BNI', '0988862721', NULL, NULL, NULL, NULL),
(686, NULL, 'Kusnan', 'Harian', 'PKWTT', '1994-12-01', '30 tahun 7 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'BENDANPETE RT 04 / RW 01', 'BENDAN PETE', 'NALUMSARI', 'JEPARA', '3320121107710002', '3320121107710002', 'Laki Laki', 'KUDUS', '1971-07-11', 53, NULL, 'Tidak', NULL, NULL, '10015517005', '085725164447', NULL, 'BRI', '589001026131530', NULL, NULL, NULL, NULL),
(739, NULL, 'Suwarti', 'Harian', 'PKWTT', '1986-02-15', '39 tahun 4 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'CENDONO RT 01 / RW 08', 'CENDONO', 'GEBOG', 'KUDUS', '3319096601590001', '3319096601590001', 'Perempuan', 'PATI', '1959-01-26', 66, NULL, 'Tidak', NULL, '0001698396524', '10015515496', '085875621286', NULL, 'BNI', '1938282685', NULL, NULL, NULL, NULL),
(788, NULL, 'Masrini', 'Harian', 'PKWTT', '1982-01-01', '43 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 03 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112660243', '3319087112660243', 'Perempuan', 'KUDUS', '1966-12-31', 58, NULL, 'Tidak', NULL, NULL, '10015515579', '085795506482', NULL, 'BRI', '592401044979533', NULL, NULL, NULL, NULL),
(793, NULL, 'Surati', 'Harian', 'PKWTT', '1970-07-17', '54 tahun 11 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'SAMIREJO RT 03 / RW 03', 'SAMIREJO', 'DAWE', 'KUDUS', '3319094111660001', '3319094111660001', 'Perempuan', 'KUDUS', '1968-11-01', 56, NULL, 'Tidak', NULL, '0001698396568', '10015515611', '08564049027', NULL, 'BNI', '1939679102', NULL, NULL, NULL, NULL),
(869, NULL, 'Suliyono', 'Harian', 'PKWTT', '1994-12-01', '30 tahun 7 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'KEDUNGSARI RT 02 / RW 09', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319080501770005', '3319080501770005', 'Perempuan', 'KUDUS', '1977-01-05', 48, NULL, 'Tidak', NULL, NULL, '10015517583', '087821463022', NULL, 'BRI', '003801033725537', NULL, NULL, NULL, NULL),
(870, NULL, 'Sukinah', 'Harian', 'PKWTT', '1995-01-01', '30 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 01 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112680216', '3319087112680216', 'Perempuan', 'KUDUS', '1968-12-31', 56, NULL, 'Tidak', NULL, '0000590717518', '10015517625', '081578025846', NULL, 'BRI', '592201062224532', NULL, NULL, NULL, NULL),
(872, NULL, 'Kamari', 'Harian', 'PKWTT', '1995-01-01', '30 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 03 / RW 10', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084507720005', '3319084507720005', 'Perempuan', 'KUDUS', '1972-07-05', 53, NULL, 'Tidak', NULL, '0001698396096', '10015515868', '085225727116', NULL, 'BRI', '592401036147532', NULL, NULL, NULL, NULL),
(873, NULL, 'Sri Mulyati', 'Harian', 'PKWTT', '1995-01-01', '30 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 01 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112690081', '3319087112690081', 'Perempuan', 'KUDUS', '1969-12-31', 55, NULL, 'Tidak', NULL, '0001698396131', '10015517070', '085870812297', NULL, 'BRI', '592401009635530', NULL, NULL, NULL, NULL),
(982, NULL, 'Sukirman', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'KEDUNGSARI RT 07 / RW 08', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319080905700002', '3319080905700002', 'Laki Laki', 'KUDUS', '1970-05-09', 55, NULL, 'Tidak', NULL, NULL, '10015517294', '087865947976', NULL, 'BRI', '592401044973537', NULL, NULL, NULL, NULL),
(990, NULL, 'Sumarni', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 03 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112730153', '3319087112730153', 'Perempuan', 'KUDUS', '1973-12-12', 51, NULL, 'Tidak', NULL, '0001698396028', '10015517310', '085741954185', NULL, 'MANDIRI', '1840010465746', NULL, NULL, NULL, NULL),
(995, NULL, 'Mukatun', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 04 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319085506730010', '3319085506730010', 'Perempuan', 'KUDUS', '1973-06-15', 52, NULL, 'Tidak', NULL, '0001529336283', '10015516957', '085870232219', NULL, 'BRI', '3801111823500', NULL, NULL, NULL, NULL),
(998, NULL, 'Rubiah', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 03 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319086006780003', '3319086006780003', 'Perempuan', 'KUDUS', '1978-06-20', 47, NULL, 'Tidak', NULL, '0001698395692', '10015517732', '085848454316', NULL, 'BRI', '592401034703536', NULL, NULL, NULL, NULL),
(999, NULL, 'Waniti', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 03 / RW 10', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319086212730004', '3319086212730004', 'Perempuan', 'KUDUS', '1973-12-22', 51, NULL, 'Tidak', NULL, '0002065258989', '10015517526', '085815244075', NULL, 'BRI', '592401032074533', NULL, NULL, NULL, NULL),
(1000, NULL, 'Suandah', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 02 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084905720002', '3319084905720002', 'Perempuan', 'KUDUS', '1972-05-09', 53, NULL, 'Tidak', NULL, '0001025614348', '10015517542', '085313020673', NULL, 'BNI', '1938701232', NULL, NULL, NULL, NULL),
(1002, NULL, 'Surinah', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 04 / RW 06', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112570115', '3319087112570115', 'Perempuan', 'KUDUS', '1957-12-31', 67, NULL, 'Tidak', NULL, NULL, '10015515892', '089646937755', NULL, 'BRI', '592401044883538', NULL, NULL, NULL, NULL),
(1006, NULL, 'Siti Salamah', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'KEDUNGSARI RT 04 / RW 01', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319086708740006', '3319086708740006', 'Perempuan', 'KUDUS', '1974-08-21', 50, NULL, 'Tidak', NULL, '0001698395668', '10015517641', '087830894807', NULL, 'BRI', '592401044961530', NULL, NULL, NULL, NULL),
(1007, NULL, 'Zuliati', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 04 / RW 05', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084810770004', '3319084810770004', 'Perempuan', 'KUDUS', '1977-10-08', 47, NULL, 'Tidak', NULL, '0001698395545', '10015517658', '0895422460540', NULL, 'BRI', '592401009717502', NULL, NULL, NULL, NULL),
(1008, NULL, 'Muslikah', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 02 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084403730004', '3319084403730004', 'Perempuan', 'KUDUS', '1973-03-04', 52, NULL, 'Tidak', NULL, '0001025609769', '10015517666', '085290542955', NULL, 'BRI', '592401044958537', NULL, NULL, NULL, NULL),
(1014, NULL, 'Musyarofah', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'KEDUNGSARI RT 02 / RW 10', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319085102790004', '3319085102790004', 'Perempuan', 'KUDUS', '1979-02-11', 46, NULL, 'Tidak', NULL, '0001698395567', '10015515934', '085290980288', NULL, 'BRI', '592401044930539', NULL, NULL, NULL, NULL),
(1207, NULL, 'Sholikatun', 'Harian', 'PKWTT', '2000-03-02', '25 tahun 4 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 02 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319085004830006', '3319085004830006', 'Perempuan', 'KUDUS', '1983-04-10', 42, NULL, 'Tidak', NULL, '0001699098568', '11006816513', '085725233805', NULL, 'BRI', '592401012094537', NULL, NULL, NULL, NULL),
(1213, NULL, 'Sutiyono', 'Harian', 'PKWTT', '2007-03-01', '18 tahun 4 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'KEDUNGSARI RT 02 / RW 03', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319082910780002', '3319082910780002', 'Laki Laki', 'KUDUS', '1978-10-29', 46, 'SD', 'Tidak', NULL, NULL, '10015515835', '085860355153', NULL, 'BNI', '1158751700', NULL, NULL, NULL, NULL),
(1215, '78040503', 'Mahmudi', 'Bulanan', 'PKWTT', '2007-03-01', '18 tahun 4 bulan', NULL, 'Primary', 'MANDOR CKH', NULL, NULL, 'Samirejo Rt 2 Rw 3', 'SAMIREJO', 'DAWE', 'KUDUS', '3319093101740002', '3319093101740002', 'Laki Laki', 'KUDUS', '1974-01-31', 51, NULL, 'Tidak', 'YA', NULL, '10015515850', '085228903034', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1216, NULL, 'Muhammad Infijarunniami', 'Bulanan', 'PKWTT', '2022-09-05', '2 tahun 10 bulan', NULL, 'Primary', 'MANDOR CKH', NULL, NULL, 'Dk Pelang Margorejo RT 01 Rw 4', 'PELANG', 'DAWE', 'KUDUS', '3319091711020001', '3319091711020001', 'Laki Laki', 'KUDUS', '2002-11-17', 22, NULL, 'Tidak', 'YA', '0000592466332', '22097621050', '085707496030', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1235, NULL, 'Mukaromah', 'Harian', 'PKWTT', '2008-07-25', '16 tahun 11 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 02 / RW 04', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319085411850005', '3319085411850005', 'Perempuan', 'KUDUS', '1985-11-14', 39, NULL, 'Tidak', NULL, '0001698395905', '10015515942', '082257732442', NULL, 'BRI', '592401043008531', NULL, NULL, NULL, NULL),
(1299, NULL, 'Khumaedah', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 03 / RW 07', 'GONDOSARI', 'DAWE', 'KUDUS', '3319085511630002', '3319085511630002', 'Perempuan', 'KUDUS', '1963-11-15', 61, NULL, 'Tidak', NULL, '0001025618286', '16047122516', '081390314475', NULL, 'BRI', '592301024799535', NULL, NULL, NULL, NULL),
(1302, NULL, 'Rubiah', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 05 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112620329', '3319087112620329', 'Perempuan', 'KUDUS', '1957-07-05', 68, NULL, 'Tidak', NULL, NULL, '16047122557', '081239331970', NULL, 'BNI', '1939678472', NULL, NULL, NULL, NULL),
(1303, NULL, 'Sariyati', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 06 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112680258', '3319087112680258', 'Perempuan', 'KUDUS', '1968-12-31', 56, NULL, 'Tidak', NULL, NULL, '16047122425', '085770043056', NULL, 'BNI', '0988862754', NULL, NULL, NULL, NULL),
(1307, NULL, 'Suneki', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 04 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112590127', '3319087112590127', 'Perempuan', 'KUDUS', '1959-12-31', 65, NULL, 'Tidak', NULL, '0001698396344', '16047122532', '085293528771', NULL, 'BNI', '1912279875', NULL, NULL, NULL, NULL),
(1311, NULL, 'Sunarti', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 01 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112650213', '3319087112650213', 'Perempuan', 'KUDUS', '1965-12-31', 59, NULL, 'Tidak', NULL, '0001698396333', '16047122458', '085339181273', NULL, 'BRI', '592301024823538', NULL, NULL, NULL, NULL),
(1314, NULL, 'Sumiatun', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 02/ RW 10', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084907670002', '3319084907670002', 'Perempuan', 'KUDUS', '1967-07-08', 58, NULL, 'Tidak', NULL, '0000592483555', '16047122441', '088216203351', NULL, 'BNI', '1938117279', NULL, NULL, NULL, NULL),
(1321, NULL, 'Sulastri', 'Harian', 'PKWTT', '2018-11-01', '6 tahun 8 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'SAMIREJO RT 01 / RW 03', 'SAMIREJO', 'DAWE', 'KUDUS', '3319097112530156', '3319097112530156', 'Perempuan', 'KUDUS', '1953-12-31', 71, 'SLTP', 'Tidak', NULL, '0001529279087', '18030384335', '081325498832', NULL, 'BNI', '0717455784', NULL, NULL, NULL, NULL),
(1322, NULL, 'Sarini', 'Harian', 'PKWTT', '2018-11-01', '6 tahun 8 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'GONDOSARI RT 05 / RW 08', 'GONDOSARI', 'DAWE', 'KUDUS', '3319087112650145', '3319087112650145', 'Perempuan', 'KUDUS', '1965-12-31', 59, 'SD', 'Tidak', NULL, '0002894978823', '18030384426', '082337674450', NULL, 'BNI', '1938856924', NULL, NULL, NULL, NULL),
(1323, NULL, 'Sumijah', 'Harian', 'PKWTT', '2018-11-01', '6 tahun 8 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'SAMIREJO RT 01 / RW 03', 'SAMIREJO', 'DAWE', 'KUDUS', '3319094208620002', '3319094208620002', 'Perempuan', 'KUDUS', '1962-08-02', 62, 'SD', 'Tidak', NULL, '0002580287411', '18030384418', '085640242479', NULL, 'BNI', '1938957784', NULL, NULL, NULL, NULL),
(1324, NULL, 'Sulasmi', 'Harian', 'PKWTT', '2018-11-01', '6 tahun 8 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'PIJI RT 06 / RW 09', 'PIJI', 'DAWE', 'KUDUS', '3319096512680003', '3319096512680003', 'Perempuan', 'KUDUS', '1968-12-25', 56, 'SD', 'Tidak', NULL, '0000592606552', '18030384327', '085700587042', NULL, 'BRI', '592201040155537', NULL, NULL, NULL, NULL),
(1325, NULL, 'Aslikah', 'Harian', 'PKWTT', '2018-11-01', '6 tahun 8 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'KARANGBENER RT 01 / RW 08', 'KARANGBENER', 'NALUMSARI', 'JEPARA', '3319077112650059', '3319077112650059', 'Perempuan', 'JEPARA', '1965-11-30', 59, 'SD', 'Tidak', NULL, '0002351810711', '18030384319', '081225815121', NULL, 'BNI', '1939827222', NULL, NULL, NULL, NULL),
(1327, NULL, 'Sunarsih', 'Harian', 'PKWTT', '2018-11-01', '6 tahun 8 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OPP CKH', NULL, 'GONDOSARI RT 05 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319086903740004', '3319086903740004', 'Perempuan', 'KUDUS', '1974-03-29', 51, 'SD', 'Tidak', NULL, '0002578254175', '18030384442', '085335026450', NULL, 'BRI', '592401035274530', NULL, NULL, NULL, NULL),
(1416, NULL, 'Nurul Huda', 'Harian', 'PKWTT', '2020-11-08', '4 tahun 8 bulan', NULL, 'Primary', 'HR TEK. PS 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 06 / RW 03', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319081604000001', '3319081604000001', 'Perempuan', 'KUDUS', '2000-04-16', 25, NULL, 'Tidak', NULL, '0002767319662', '20074512193', '089504521584', NULL, 'BNI', '1266935138', NULL, NULL, NULL, NULL),
(1470, NULL, 'Hendra Aditia Permana', 'Harian', 'PKWTT', '2022-01-25', '3 tahun 5 bulan', NULL, 'Primary', 'HR TAMAG CENGKEH', 'HR MESIN TAMAG', NULL, 'GONDOSARI RT 01 RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319081705020004', '3319081705020004', 'Laki Laki', 'KUDUS', '2002-05-17', 23, 'SMK', 'Tidak', NULL, '0000592019739', '22022790426', '087784222784', NULL, 'BRI', '592401009610506', NULL, NULL, NULL, NULL),
(1471, NULL, 'Elang Kariyanto', 'Harian', 'PKWTT', '2022-01-25', '3 tahun 5 bulan', NULL, 'Primary', 'HR TAMAG CENGKEH', 'HR MESIN TAMAG', NULL, 'GONDOSARI RT 02 / RW 09', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080311990005', '3319080311990005', 'Laki Laki', 'KUDUS', '1999-11-03', 25, 'SMK', 'Tidak', NULL, '0000592032971', '22022790418', '085641789008', NULL, 'MANDIRI', '1840001268430', NULL, NULL, NULL, NULL),
(1472, NULL, 'Rizqi Maulana', 'Harian', 'PKWTT', '2022-01-25', '3 tahun 5 bulan', NULL, 'Primary', 'HR TAMAG CENGKEH', 'HR MESIN TAMAG', NULL, 'LAU RT 03 / RW 04', 'LAU', 'DAWE', 'KUDUS', '3319091807030006', '3319091807030006', 'Laki Laki', 'KUDUS', '2003-07-18', 21, 'SMK', 'Tidak', NULL, '0002613397329', '22022790400', '085954261027', NULL, 'BRI', '592301040671537', NULL, NULL, NULL, NULL),
(1481, NULL, 'Nia Fitriyani', 'Harian', 'PKWTT', '2022-07-22', '2 tahun 11 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 03 / RW 06', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084302970003', '3319084302970003', 'Perempuan', 'KUDUS', '1997-02-03', 28, NULL, 'Tidak', NULL, '0001693173047', '22039234525', '085602710597', NULL, 'BNI', '1936498142', NULL, NULL, NULL, NULL),
(1494, NULL, 'Zainal Abdul Ghoni', 'Harian', 'PKWTT', '2022-04-08', '3 tahun 3 bulan', NULL, 'Primary', 'HR TAMAG CENGKEH', 'HR MESIN TAMAG', NULL, 'GONDOSARI RT 06 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082412970001', '3319082412970001', 'Laki Laki', 'KUDUS', '1997-12-24', 27, 'SMK', 'Tidak', NULL, '0002228422162', NULL, '085712890151', NULL, 'BRI', '592401042999537', NULL, NULL, NULL, NULL),
(1504, NULL, 'Verdi Aditiya Ivanda', 'Harian', 'PKWTT', '2022-11-27', '2 tahun 7 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR TEK CKH', NULL, 'PRAMBATAN LOR RT 01 / RW 04', 'PRAMBATAN', 'KALIWUNGU', 'KUDUS', '3320030404020001', '3320030404020001', 'Laki Laki', 'JEPARA', '2002-04-04', 23, 'SMK', 'Tidak', NULL, '0003056200301', '22097621043', '088227761723', NULL, 'BRI', '003801026507532', NULL, NULL, NULL, NULL),
(1507, NULL, 'Muhammad Yuda Kencana', 'Harian', 'PKWTT', '2022-12-22', '2 tahun 6 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR OP CKH', NULL, 'GONDOSARI RT 08 / RW 02', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080805030002', '3319080805030002', 'Laki Laki', 'KUDUS', '2003-05-08', 22, 'SMK', 'Tidak', NULL, '0001529332121', '22109573455', '08970534190', NULL, 'BNI', '1803433275', NULL, NULL, NULL, NULL),
(1517, NULL, 'Vrengki Vandana', 'Harian', 'PKWTT', '2023-02-06', '2 tahun 5 bulan', NULL, 'Primary', 'HR TAMAG CENGKEH', 'HR MESIN TAMAG', NULL, 'KEDUNGSARI RT 06 / RW 03', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319080612020003', '3319080612020003', 'Laki Laki', 'KUDUS', '2002-12-06', 22, NULL, 'Tidak', NULL, '0002700676124', '23020910842', '08978272508', NULL, 'BRI', '589001059788534', NULL, NULL, NULL, NULL),
(1528, NULL, 'Nursa Amelia Anggreani', 'Harian', 'PKWTT', '2023-07-02', '2 tahun 0 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'JURANG RT 01 / RW 03', 'JURANG', 'GEBOG', 'KUDUS', '3319085501020003', '3319085501020003', 'Perempuan', 'KUDUS', '2002-01-15', 23, NULL, 'Tidak', NULL, NULL, '23033143357', '088806104347', NULL, 'BNI', '1150561079', NULL, NULL, NULL, NULL),
(1529, NULL, 'Sutoyo', 'Harian', 'PKWTT', '2023-07-01', '2 tahun 0 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR CKH', NULL, 'GONDOSARI RT 03 / RW 06', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319091911790002', '3319091911790002', 'Laki Laki', 'KUDUS', '1979-11-19', 45, 'SLTA', 'Tidak', NULL, NULL, NULL, '085860355153', NULL, 'BNI', '1158751700', NULL, NULL, NULL, NULL),
(1530, NULL, 'Aditya Naba Purnomo', 'Harian', 'PELATIHAN', '2025-05-17', '0 tahun 1 bulan', NULL, 'Primary', 'HR CENGEKEH', 'HR CKH', NULL, 'GETAS PEJATEN RT 02 / RW 01', 'GETAS PEJATEN', 'JATI', 'KUDUS', '3319032009060003', '3319032009060003', 'Laki Laki', 'KUDUS', '2006-09-20', 18, 'SMK', 'Tidak', NULL, NULL, NULL, '087733242740', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1550, NULL, 'Hudallah', 'Harian', 'PKWTT', '2023-12-02', '1 tahun 7 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 05 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080505920005', '3319080505920005', 'Laki Laki', 'KUDUS', '1992-05-05', 33, NULL, 'Tidak', NULL, NULL, '23200390559', '085803795558', NULL, 'BNI', '1939678438', NULL, NULL, NULL, NULL),
(1557, NULL, 'Arni Fitrianti', 'Harian', 'PKWTT', '2023-12-16', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 02 / RW 04', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087001030004', '3319087001030004', 'Perempuan', 'KUDUS', '2003-01-30', 22, NULL, 'Tidak', NULL, NULL, '21092147608', '081325788181', NULL, 'BNI', '1813826935', NULL, NULL, NULL, NULL),
(1573, NULL, 'Muhammad Farah Adibah', 'Harian', NULL, '2024-01-06', '1 tahun 6 bulan', NULL, 'Primary', 'HR TAMAG CENGKEH', 'HR MESIN TAMAG', NULL, 'SAMIREJO RT 02 / RW 03', 'SAMIREJO', 'DAWE', 'KUDUS', '3319091008050001', '3319091008050001', 'Laki Laki', 'KUDUS', '2005-08-10', 19, NULL, 'Tidak', NULL, NULL, NULL, '085602735132', NULL, 'BRI', '592201056742534', NULL, NULL, NULL, NULL),
(1582, NULL, 'Miftahur Rohmah', 'Harian', 'PKWTT', NULL, NULL, NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 03/RW 05', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084203020002', '3319084203020002', 'Perempuan', 'KUDUS', '2002-03-02', 23, NULL, 'Tidak', NULL, '0000592284914', '24049039159', '085866722621', NULL, 'MANDIRI', '1840002773297', NULL, NULL, NULL, NULL),
(5331, NULL, 'Noor Rohim', 'Borong', NULL, NULL, NULL, NULL, 'Primary', 'BR CENGKEH', 'BR CKH', NULL, 'JURANG RT 01 / RW 06', 'JURANG', 'GEBOG', 'KUDUS', '3319082001910002', '3319082001910002', 'Laki Laki', 'KUDUS', '1991-01-20', 34, NULL, 'Tidak', NULL, '0001837136992', '21018239083', '0856415833353', NULL, 'BRI', '592401035313538', NULL, NULL, NULL, NULL),
(5332, NULL, 'Rokhim Efendi', 'Borong', NULL, NULL, NULL, NULL, 'Primary', 'BR CENGKEH', 'BR CKH', NULL, 'GONDOSARI RT 02 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082708970003', '3319082708970003', 'Laki Laki', 'KUDUS', '1997-08-27', 27, NULL, 'Tidak', NULL, '0002452223711', '21018239109', '082134585650', NULL, 'BNI', '1266931847', NULL, NULL, NULL, NULL),
(5333, NULL, 'Ahmad Syafi\'i', 'Borong', NULL, NULL, NULL, NULL, 'Primary', 'BR CENGKEH', 'BR CKH', NULL, 'GONDOSARI RT 05 / RW 02', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082403910005', '3319082403910005', 'Laki Laki', 'KUDUS', '1991-03-24', 34, NULL, 'Tidak', NULL, '0000592090424', '21018239091', '081916615927', NULL, 'BNI', '1939678529', NULL, NULL, NULL, NULL),
(5334, '992', 'Ningsih', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 03 / RW 09', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084808710006', '3319084808710006', 'Perempuan', 'BANDUNG', '1971-08-08', 53, NULL, 'Tidak', NULL, '0000591864928', '10015515801', '088221487760', NULL, 'BRI', '592401044967536', NULL, NULL, NULL, NULL),
(5335, '1908', 'Sumiati', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 05 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084502820001', '3319084502820001', 'Perempuan', 'KUDUS', '1982-02-06', 43, NULL, 'Tidak', NULL, '0002578312424', '18041997349', '081326643247', NULL, 'BRI', '592401032958533', NULL, NULL, NULL, NULL),
(5336, '1409', 'Sri Hartini', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 01 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319086711690001', '3319086711690001', 'Perempuan', 'KUDUS', '1969-11-27', 55, NULL, 'Tidak', NULL, '0000592784403', '18035973763', '085871489450', NULL, 'BRI', '592401023858532', NULL, NULL, NULL, NULL),
(5337, '1551', 'Ahmad Mifdholi Amin', 'Harian', 'PKWTT', '2023-12-02', '1 tahun 7 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'KEDUNGSARI RT 05 / RW 10', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319081909040002', '3319081909040002', 'Laki Laki', 'KUDUS', '2004-09-19', 20, NULL, 'Tidak', NULL, NULL, '23200390433', '081329260022', NULL, 'BNI', '1545873285', NULL, NULL, NULL, NULL),
(5338, '1518', 'Ayu Maharani', 'Harian', 'PKWTT', '2023-02-25', '2 tahun 4 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'SIDOMULYO 03/03, DAREN', 'SIDOMULYO', 'NALUMSARI', 'JEPARA', '3319095608950001', '3319095608950001', 'Perempuan', 'KUDUS', '1995-08-16', 29, NULL, 'Tidak', NULL, '0000592506955', '23033143357', '085867239471', NULL, 'BRI', '003801121509502', NULL, NULL, NULL, NULL),
(5339, '1559', 'Angga Ulil Fahmi', 'Harian', 'PKWTT', '2023-12-16', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'KEDUNGSARI RT 05 / RW 09', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319081709030002', '3319081709030002', 'Laki Laki', 'KUDUS', '2003-09-17', 21, NULL, 'Tidak', NULL, NULL, '24008029571', '085878312283', NULL, 'BNI', '1813814023', NULL, NULL, NULL, NULL),
(5340, '1561', 'Adi Kusworo', 'Harian', 'PKWTT', '2023-12-16', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'JURANG RT 06 / RW 05', 'JURANG', 'GEBOG', 'KUDUS', '3319081105890005', '3319081105890005', 'Laki Laki', 'KUDUS', '1989-05-11', 36, NULL, 'Tidak', NULL, NULL, '24008029597', '085867752009', NULL, 'BRI', '003801033783535', NULL, NULL, NULL, NULL),
(5341, '1560', 'Muhammad Habibunnajar', 'Harian', 'PKWTT', '2023-12-16', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 02 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319081801000008', '3319081801000008', 'Laki Laki', 'KUDUS', '2000-01-18', 25, NULL, 'Tidak', NULL, NULL, '24008029589', '085701492986', NULL, 'BNI', '1813764206', NULL, NULL, NULL, NULL),
(5342, '1558', 'Ahmad Anang Romadon', 'Harian', 'PKWTT', '2023-12-16', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 1', NULL, 'GONDOSARI RT 01 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082601980002', '3319082601980002', 'Laki Laki', 'KUDUS', '1998-01-25', 27, NULL, 'Tidak', NULL, NULL, '24008029613', '085601744164', NULL, 'MANDIRI', '1840004374607', NULL, NULL, NULL, NULL),
(5343, '218', 'Suyono', 'Harian', 'PKWTT', '1984-05-06', '41 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'LAU RT 05 / RW 07', 'LAU', 'DAWE', 'KUDUS', '3319091010690001', '3319091010690001', 'Laki Laki', 'KUDUS', '1969-10-10', 55, NULL, 'Tidak', NULL, NULL, '10015517088', '089517704081', NULL, 'BNI', '09888662709', NULL, NULL, NULL, NULL),
(5344, '864', 'Suparman', 'Harian', 'PKWTT', '1994-12-01', '30 tahun 7 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'KEDUNGSARI RT 05 / RW 10', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319082011780002', '3319082011780002', 'Laki Laki', 'KUDUS', '1978-11-20', 46, NULL, 'Tidak', NULL, '0001698395657', '10015517203', '085236498094', NULL, 'BRI', '592401025024539', NULL, NULL, NULL, NULL),
(5345, '1454', 'Uswatun Khasanah', 'Harian', 'PKWTT', '2022-02-22', '3 tahun 4 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'KEDUNGSARI RT 04 / RW 06', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319086005980004', '3319086005980004', 'Perempuan', 'KUDUS', '1998-05-20', 27, NULL, 'Tidak', NULL, '0000592728074', '21096320243', '085077020037', NULL, 'BRI', '592301033821531', NULL, NULL, NULL, NULL),
(5346, NULL, 'M. Kharis Fanianto', 'Harian', 'PKWTT', '2023-11-25', '1 tahun 7 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'MURYOLOBO / RT 01 / RW 04', 'MURYOLOBO', 'NALUMSARI', 'JEPARA', '3320122009030001', '3320122009030001', 'Laki Laki', 'JEPARA', '2003-09-20', 21, NULL, 'Tidak', NULL, NULL, '23200390427', '088225299789', NULL, 'BNI', '1811449583', NULL, NULL, NULL, NULL),
(5347, '1386', 'M. Misbahul Munir', 'Harian', 'PKWTT', '2019-10-01', '5 tahun 9 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'KEDUNGSARI RT 04 / RW 02', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319080801030003', '3319080801030003', 'Laki Laki', 'KUDUS', '2003-01-08', 22, NULL, 'Tidak', NULL, '0001025627523', '20020909451', '085876200821', NULL, 'BNI', '1939827233', NULL, NULL, NULL, NULL),
(5348, NULL, 'Kholish Iqbal Afthori', 'Harian', 'PKWTT', '2023-11-25', '1 tahun 7 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'CENDONO RT 01 / RW 01', 'CENDONO', 'DAWE', 'KUDUS', '3319093012050002', '3319093012050002', 'Laki Laki', 'KUDUS', '2005-12-30', 19, NULL, 'Tidak', NULL, NULL, '23200390500', '0895402471697', NULL, 'BNI', '1938621175', NULL, NULL, NULL, NULL),
(5349, '1305', 'Sunarsih', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 09 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112710110', '3319087112710110', 'Perempuan', 'KUDUS', '1971-12-31', 53, NULL, 'Tidak', NULL, '0001693860006', '16047122466', '089617136900', NULL, 'BNI', '1938665237', NULL, NULL, NULL, NULL),
(5350, '1308', 'Kasipah', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 06 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112590094', '3319087112590094', 'Perempuan', 'KUDUS', '1959-12-31', 65, NULL, 'Tidak', NULL, '0001698396366', '16047122391', '08293328000', NULL, 'BNI', '1939678450', NULL, NULL, NULL, NULL),
(5351, '877', 'Keminah', 'Harian', 'PKWTT', '1995-01-01', '30 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 03 / RW 06', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112760059', '3319087112760059', 'Perempuan', 'KUDUS', '1976-12-31', 48, NULL, 'Tidak', NULL, '0001698395938', '10015517211', '082336593012', NULL, 'BNI', '0988863054', NULL, NULL, NULL, NULL),
(5352, '829', 'Sutiyem', 'Harian', 'PKWTT', '1988-03-01', '37 tahun 4 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'MENAWAN RT 02 / RW 02', 'MENAWAN', 'GEBOG', 'KUDUS', '3319084503700002', '3319084503700002', 'Perempuan', 'KUDUS', '1970-03-05', 55, NULL, 'Tidak', NULL, '0001025635588', '10015516627', '085852283942', NULL, 'BRI', '592401044986530', NULL, NULL, NULL, NULL),
(5353, '1003', 'Supatmi', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 04 / RW 09', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084409790006', '3319084409790006', 'Perempuan', 'KUDUS', '1979-09-04', 45, NULL, 'Tidak', NULL, '0000591704662', '10015517237', '085878398003', NULL, 'BNI', '1938752618', NULL, NULL, NULL, NULL),
(5354, '1001', 'Warsini', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 04 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087103750001', '3319087103750001', 'Perempuan', 'KUDUS', '1976-03-31', 49, NULL, 'Tidak', NULL, '0003307219389', '10015517591', '085865378963', NULL, 'BNI', '1938637470', NULL, NULL, NULL, NULL),
(5355, '1313', 'Sutini', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'JURANG RT 05 / RW 05', 'JURANG', 'GEBOG', 'KUDUS', '3319085804790005', '3319085804790005', 'Perempuan', 'KUDUS', '1979-04-18', 46, NULL, 'Tidak', NULL, '0001698396074', '16047122417', '085869015608', NULL, 'BRI', '592401044380530', NULL, NULL, NULL, NULL),
(5356, '211', 'Mardi', 'Harian', 'PKWTT', '1979-12-27', '45 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'KEDUNGSARI RT 06 / RW 08', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319081711540001', '3319081711540001', 'Laki Laki', 'KUDUS', '1954-11-17', 70, NULL, 'Tidak', NULL, '0001698396208', '11021256018', '081233492080', NULL, 'BNI', '1939678802', NULL, NULL, NULL, NULL),
(5357, '971', 'Sriyatun', 'Harian', 'PKWTT', '1983-01-01', '42 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'SAMIREJO RT 03 / RW 03', 'SAMIREJO', 'DAWE', 'KUDUS', '3319097112640244', '3319097112640244', 'Perempuan', 'KUDUS', '1964-12-31', 60, NULL, 'Tidak', NULL, '0001698396491', '10015517054', '085758765987', NULL, 'BRI', '592201053988539', NULL, NULL, NULL, NULL),
(5358, '834', 'Sutiah', 'Harian', 'PKWTT', '1983-01-01', '42 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'PUYOH RT 01 / RW 03', 'PUYOH', 'DAWE', 'KUDUS', '3319097112660168', '3319097112660168', 'Perempuan', 'KUDUS', '1966-12-31', 58, NULL, 'Tidak', NULL, '0001698396445', '10015516676', '081238866037', NULL, 'BNI', '1938941333', NULL, NULL, NULL, NULL),
(5359, '810', 'Sulasih', 'Harian', 'PKWTT', '1988-03-01', '37 tahun 4 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'MENAWAN RT 06 / RW 03', 'MENAWAN', 'GEBOG', 'KUDUS', '3319087112730121', '3319087112730121', 'Perempuan', 'KUDUS', '1973-12-31', 51, NULL, 'Tidak', NULL, '0001698395883', '10015516452', '085290552049', NULL, 'BNI', '1938588590', NULL, NULL, NULL, NULL),
(5360, '795', 'Rukani', 'Harian', 'PKWTT', '1986-03-21', '39 tahun 3 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'MLATI NOROWITO RT 01 / RW 09', 'MLATI NOROWITO', 'KOTA', 'KUDUS', '3319027112690075', '3319027112690075', 'Perempuan', 'KUDUS', '1969-12-31', 55, NULL, 'Tidak', NULL, '0001167651101', '10015515645', '087824582811', NULL, 'BNI', '09833363112', NULL, NULL, NULL, NULL),
(5361, '1418', 'Beni Setiawan', 'Harian', 'PKWTT', '2020-11-04', '4 tahun 8 bulan', NULL, 'Primary', 'HR TEK. PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 05 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319081710990011', '3319081710990011', 'Laki Laki', 'KUDUS', '1999-10-17', 25, NULL, 'Tidak', NULL, '0003056451895', '20074512201', '081215851404', NULL, 'BRI', '592401030065538', NULL, NULL, NULL, NULL),
(5362, '987', 'Sumini', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'SAMIREJO RT 02 / RW 03', 'SAMIREJO', 'DAWE', 'KUDUS', '3319094101720007', '3319094101720007', 'Perempuan', 'PATI', '1972-01-01', 53, NULL, 'Tidak', NULL, '0001698396489', '10015516932', '081234380562', NULL, 'BNI', '1939679113', NULL, NULL, NULL, NULL),
(5363, '1010', 'Maimanah', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 04 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112690099', '3319087112690099', 'Perempuan', 'KUDUS', '1969-12-31', 55, NULL, 'Tidak', NULL, '0000591976181', '10015515926', '081392956439', NULL, 'BRI', '592401009713508', NULL, NULL, NULL, NULL),
(5364, '1312', 'Umi Sulaikhah', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'SAMIREJO RT 03 / RW 03', 'SAMIREJO', 'DAWE', 'KUDUS', '3319096003690001', '3319096003690001', 'Perempuan', 'KUDUS', '1969-03-20', 56, NULL, 'Tidak', NULL, '0001530663783', '16047122433', '082125577689', NULL, 'BRI', '592201053988539', NULL, NULL, NULL, NULL),
(5365, '1017', 'Wijiarti', 'Harian', 'PKWTT', '1996-04-12', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 03 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319085812710001', '3319085812710001', 'Perempuan', 'KUDUS', '1971-12-18', 53, NULL, 'Tidak', NULL, '0001529331772', '10015514374', '085877087709', NULL, 'BRI', '592201040138535', NULL, NULL, NULL, NULL),
(5366, '716', 'Sunarsih', 'Harian', 'PKWTT', '1983-01-01', '42 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GRIBIG RT 04 / RW 07', 'GRIBIG', 'GEBOG', 'KUDUS', '3319085505690004', '3319085505690004', 'Perempuan', 'KUDUS', '1969-05-15', 56, NULL, 'Tidak', NULL, '0001296159208', '10015515082', '085700205089', NULL, 'BNI', '0988863076', NULL, NULL, NULL, NULL),
(5367, '1301', 'Hamidah', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 04 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319085808710003', '3319085808710003', 'Perempuan', 'CIANJUR', '1971-05-18', 54, NULL, 'Tidak', NULL, '0001698396298', '16047122540', '085977591282', NULL, 'BRI', '592401042318537', NULL, NULL, NULL, NULL),
(5368, '1023', 'Tumari', 'Harian', 'PKWTT', '1996-04-12', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 02 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319085002740001', '3319085002740001', 'Perempuan', 'KUDUS', '1974-02-10', 51, NULL, 'Tidak', NULL, '0000591758212', '10015514457', '088221740455', NULL, 'BRI', '592301010421506', NULL, NULL, NULL, NULL),
(5369, NULL, 'Khidhir Khoirul Fais', 'Harian', 'PKWTT', '2023-12-02', '1 tahun 7 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'KEDUNGSARI RT 07 / RW 08', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319082410050002', '3319082410050002', 'Laki Laki', 'KUDUS', '2005-10-24', 19, NULL, 'Tidak', NULL, NULL, '23200390450', '085602719732', NULL, 'BNI', '1812322236', NULL, NULL, NULL, NULL),
(5370, '876', 'Supatmi', 'Harian', 'PKWTT', '1995-01-01', '30 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 02 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087011770005', '3319087011770005', 'Perempuan', 'KUDUS', '1977-11-30', 47, NULL, 'Tidak', NULL, '0000591838716', '10015517229', '085803303268', NULL, 'BNI', '1939678461', NULL, NULL, NULL, NULL),
(5371, '997', 'Sri Hartatik', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 07 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112640222', '3319087112640222', 'Perempuan', 'KUDUS', '1964-12-31', 60, NULL, 'Tidak', NULL, '0001698396186', '10015516965', '085325225633', NULL, 'BNI', '0986180648', NULL, NULL, NULL, NULL),
(5372, '1453', 'Khusnul Khotimah', 'Harian', 'PKWTT', '2022-02-22', '3 tahun 4 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 06 / RW 03', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084306020006', '3319084306020006', 'Perempuan', 'KUDUS', '2002-06-03', 23, NULL, 'Tidak', NULL, '0001530662174', '21096320292', '082324361404', NULL, 'BNI', '1861282578', NULL, NULL, NULL, NULL),
(5373, '1009', 'Sugiarti', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 02 / RW 09', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112650132', '3319087112650132', 'Perempuan', 'KUDUS', '1965-12-31', 59, NULL, 'Tidak', NULL, NULL, '10015517021', '081329436679', NULL, 'BNI', '0478602831', NULL, NULL, NULL, NULL),
(5374, '1464', 'Mokhamat Deni Suryana', 'Harian', 'PKWTT', '2022-03-12', '3 tahun 3 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 03 / RW 10', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319081901020004', '3319081901020004', 'Laki Laki', 'KUDUS', '2002-01-19', 23, NULL, 'Tidak', NULL, '0000591998411', '21096320326', '081466715178', NULL, 'BNI', '1909547910', NULL, NULL, NULL, NULL),
(5375, '1013', 'Nuryamah', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'LAU RT 02 / RW 06', 'LAU', 'DAWE', 'KUDUS', '3319095708770001', '3319095708770001', 'Perempuan', 'KUDUS', '1977-08-17', 47, NULL, 'Tidak', NULL, '0001698396502', '10015517062', '082119691253', NULL, 'BNI', '1938565298', NULL, NULL, NULL, NULL);
INSERT INTO `primary_karyawan` (`no_id`, `no_induk_absen`, `nama`, `status_upah`, `status_karyawan`, `masuk_kerja`, `masa_kerja`, `ditetapkan`, `bagian`, `sub_bagian`, `kelompok_kerja`, `pekerjaan`, `alamat_rt_rw`, `alamat_desa`, `alamat_kecamatan`, `alamat_kabupaten`, `no_nik`, `no_kk`, `kelamin`, `tempat_lahir`, `tanggal_lahir`, `umur`, `pendidikan`, `disabilitas`, `kpi`, `no_bpjs_kes`, `no_kpj`, `no_hp`, `email`, `bank`, `no_bank`, `foto_profile`, `foto_formal`, `vaksin`, `riwayat_kesehatan`) VALUES
(5376, '942', 'Siti Nariyah', 'Harian', 'PKWTT', '1995-08-18', '29 tahun 10 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'CENDONO RT 05 / RW 04', 'CENDONO', 'DAWE', 'KUDUS', '3319095804770001', '3319095804770001', 'Perempuan', 'KUDUS', '1977-04-18', 48, NULL, 'Tidak', NULL, NULL, '10015514119', '085741624375', NULL, 'BRI', '592301040781536', NULL, NULL, NULL, NULL),
(5377, '832', 'Ammah', 'Harian', 'PKWTT', '1988-03-01', '37 tahun 4 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GRIBIG RT 02 / RW 02', 'GRIBIG', 'GEBOG', 'KUDUS', '3319086606670001', '3319086606670001', 'Perempuan', 'KUDUS', '1967-06-26', 58, NULL, 'Tidak', NULL, '0001698396085', '10015516650', '085647923034', NULL, 'BNI', '1938671580', NULL, NULL, NULL, NULL),
(5378, '1397', 'Sunarti', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 06 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084407650007', '3319084407650007', 'Perempuan', 'KUDUS', '1965-07-04', 60, NULL, 'Tidak', NULL, '0002288013939', '18042004525', '081328924102', NULL, 'BNI', '19396784833', NULL, NULL, NULL, NULL),
(5379, '1412', 'Tulipah', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 01 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112750067', '3319087112750067', 'Perempuan', 'KUDUS', '1975-12-31', 49, NULL, 'Tidak', NULL, '0002578297768', '10841987928', '082326585301', NULL, 'BNI', '1938710338', NULL, NULL, NULL, NULL),
(5380, '1411', 'Sawinah', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 07 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319085210680005', '3319085210680005', 'Perempuan', 'KUDUS', '1968-10-12', 56, NULL, 'Tidak', NULL, '0001025619647', '18042000374', NULL, NULL, 'BNI', '1000648851', NULL, NULL, NULL, NULL),
(5381, '1534', 'Tri Meiliana', 'Harian', 'PKWTT', '2023-09-09', '1 tahun 10 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'PIJI RT 05 / RW 09', 'PIJI', 'DAWE', 'KUDUS', '3319094805950003', '3319094805950003', 'Perempuan', 'KUDUS', '1995-05-08', 30, NULL, 'Tidak', NULL, NULL, '23140337256', '085878848944', NULL, 'BRI', '592201054712533', NULL, NULL, NULL, NULL),
(5382, '1533', 'Adi Noor Irvan', 'Harian', 'PKWTT', '2023-09-09', '1 tahun 10 bulan', NULL, 'Primary', 'HR TEK PS 1', 'HR KELOMPOK 2', NULL, 'PRAMBATAN LOR RT 05 / RW 03', 'PRAMBATAN', 'KALIWUNGU', 'KUDUS', '3319010307010003', '3319010307010003', 'Laki Laki', 'KUDUS', '2001-07-03', 24, NULL, 'Tidak', NULL, NULL, '23140337231', '0895349606430', NULL, 'BNI', '1909529322', NULL, NULL, NULL, NULL),
(5383, '1555', 'Adi Pramono Putra', 'Harian', 'PKWTT', '2023-12-16', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'GONDOSARI RT 05 / RW 02', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319090509030006', '3319090509030006', 'Laki Laki', 'KUDUS', '2003-03-05', 22, NULL, 'Tidak', NULL, NULL, '24008029555', '081393172532', NULL, 'BNI', '1813539361', NULL, NULL, NULL, NULL),
(5384, '1556', 'Muhammad Azizul Ghoffar', 'Harian', 'PKWTT', '2023-12-16', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'SAMIREJO RT 02 / RW 04', 'SAMIREJO', 'DAWE', 'KUDUS', '3319092611050002', '3319092611050002', 'Laki Laki', 'KUDUS', '2005-11-26', 19, NULL, 'Tidak', NULL, NULL, '24008029605', '082136500183', NULL, 'BNI', '1813539338', NULL, NULL, NULL, NULL),
(5385, '1583', 'Uli Anisa', 'Harian', 'PKWTT', NULL, NULL, NULL, 'Primary', 'HR PROSES 1', 'HR KELOMPOK 2', NULL, 'LAU RT 02 / RW 06', 'LAU', 'DAWE', 'KUDUS', '331908630960005', '331908630960005', 'Perempuan', 'KUDUS', '1996-10-23', 28, NULL, 'Tidak', NULL, NULL, '24049039183', '085600690313', NULL, 'BRI', '592301040693539', NULL, NULL, NULL, NULL),
(5386, '1212', 'Ngatri', 'Harian', 'PKWTT', '2007-03-01', '18 tahun 4 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'KEDUNGSARI RT 04 / RW 10', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319086011780002', '3319086011780002', 'Perempuan', 'KUDUS', '1978-11-20', 46, NULL, 'Tidak', NULL, '0000591877787', '10015515827', '085325610631', NULL, 'BRI', '131401012738530', NULL, NULL, NULL, NULL),
(5387, '475', 'Abdul Aziz', 'Harian', 'PKWTT', '1977-08-20', '47 tahun 10 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'KARANGMALANG RT 01 / RW 09', 'KARANGAMALANG', 'GEBOG', 'KUDUS', '3319080109570002', '3319080109570002', 'Laki Laki', 'KUDUS', '1957-09-01', 67, NULL, 'Tidak', NULL, NULL, '10015516858', '085725919576', NULL, 'BRI', '592401043554539', NULL, NULL, NULL, NULL),
(5388, '653', 'Sumadi', 'Harian', 'PKWTT', '1978-01-01', '47 tahun 6 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 01 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082111590002', '3319082111590002', 'Laki Laki', 'KUDUS', '1959-11-21', 65, NULL, 'Tidak', NULL, '0000591800747', '10015515744', '082327005656', NULL, 'BNI', '1939678449', NULL, NULL, NULL, NULL),
(5389, '996', 'Saginah', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 09 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084812700001', '3319084812700001', 'Perempuan', 'KUDUS', '1970-12-08', 54, NULL, 'Tidak', NULL, '0000592502545', '10015515900', '085702409330', NULL, 'BRI', '592201053888533', NULL, NULL, NULL, NULL),
(5390, '1390', 'Muhammad Sholikhan', 'Harian', 'PKWTT', '2020-01-01', '5 tahun 6 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 03 / RW 03', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319081604010002', '3319081604010002', 'Laki Laki', 'KUDUS', '2001-04-16', 24, NULL, 'Tidak', NULL, '0002614020221', '19084031079', '082313830079', NULL, 'BRI', '003801019869537', NULL, NULL, NULL, NULL),
(5391, '1298', 'Sugirah', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 05 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112620382', '3319087112620382', 'Perempuan', 'KUDUS', '1962-12-31', 62, NULL, 'Tidak', NULL, '0000591869777', '16047122490', '081916051690', NULL, 'BRI', '131401030317504', NULL, NULL, NULL, NULL),
(5392, '1306', 'Darsi', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'PUYOH RT 02 / RW 03', 'PUYOH', 'DAWE', 'KUDUS', '3319097112710089', '3319097112710089', 'Perempuan', 'KUDUS', '1971-12-31', 53, NULL, 'Tidak', NULL, '0001699100043', '16047122508', '081335333596436', NULL, 'BRI', '592201027384539', NULL, NULL, NULL, NULL),
(5393, '1310', 'Munzaenah', 'Harian', 'PKWTT', '2016-10-22', '8 tahun 8 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 04 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112700189', '3319087112700189', 'Perempuan', 'KUDUS', '1970-12-31', 54, NULL, 'Tidak', NULL, NULL, '16047122482', '085801388315', NULL, 'BNI', '1938778217', NULL, NULL, NULL, NULL),
(5394, '694', 'Ngatijah', 'Harian', 'PKWTT', '1970-01-01', '55 tahun 6 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 07 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112590216', '3319087112590216', 'Perempuan', 'KUDUS', '1959-12-31', 65, NULL, 'Tidak', NULL, '0001699098614', '10015514994', '085640202342', NULL, 'BRI', '592201040148530', NULL, NULL, NULL, NULL),
(5395, '923', 'Muhammad Abdul Wahid', 'Harian', 'PKWTT', '1995-07-01', '30 tahun 0 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'KARANGMALANG RT 02 / RW 06', 'KARANGMALANG', 'GEBOG', 'KUDUS', '3319082011780003', '3319082011780003', 'Laki Laki', 'KUDUS', '1976-11-20', 48, NULL, 'Tidak', NULL, '0001698395949', '10015514028', '081617680129', NULL, 'BNI', '0988862823', NULL, NULL, NULL, NULL),
(5396, '1393', 'Sukarni', 'Harian', 'PKWTT', '2020-04-26', '5 tahun 2 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'NGETUK RT 03 / RW 06', 'NGETUK', 'NALUMSARI', 'JEPARA', '3320124410630004', '3320124410630004', 'Perempuan', 'JEPARA', '1963-10-04', 61, NULL, 'Tidak', NULL, NULL, '18035972986', '085842671072', NULL, 'BRI', '592401009719504', NULL, NULL, NULL, NULL),
(5397, '1105', 'Solikati', 'Harian', 'PKWTT', '1997-01-01', '28 tahun 6 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 08 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084108720007', '3319084108720007', 'Perempuan', 'KUDUS', '1970-12-08', 54, NULL, 'Tidak', NULL, '0001699099446', '11006816091', '0881010278531', NULL, 'BRI', '592401023854530', NULL, NULL, NULL, NULL),
(5398, '729', 'Sriyatun', 'Harian', 'PKWTT', '1984-01-15', '41 tahun 5 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'SAMIREJO RT 03 / RW 05', 'SAMIREJO', 'DAWE', 'KUDUS', '3319095210650001', '3319095210650001', 'Perempuan', 'KUDUS', '1965-10-12', 59, NULL, 'Tidak', NULL, '0001699100381', '10015615462', '081325212800', NULL, 'BNI', '1938790158', NULL, NULL, NULL, NULL),
(5399, '871', 'Noor Asiyah', 'Harian', 'PKWTT', '1995-01-01', '30 tahun 6 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 01 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319086103800003', '3319086103800003', 'Perempuan', 'KUDUS', '1980-03-21', 45, NULL, 'Tidak', NULL, '0001699099097', '10015517617', '082231607529', NULL, 'BNI', '1938788180', NULL, NULL, NULL, NULL),
(5400, '1985', 'Sumarlan', 'Harian', 'PKWTT', '1975-01-01', '50 tahun 6 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'BESITO RT 04 / RW 06', 'BESITO', 'GEBOG', 'KUDUS', '3319080111530005', '3319080111530005', 'Laki Laki', 'KUDUS', '1953-11-01', 71, NULL, 'Tidak', NULL, '0000592617216', '16036831887', '089514838264', NULL, 'BNI', '0988863496', NULL, NULL, NULL, NULL),
(5401, '1206', 'Sri Masmi', 'Harian', 'PKWTT', '2000-03-02', '25 tahun 4 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 04 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319086701820001', '3319086701820001', 'Perempuan', 'KUDUS', '1982-01-27', 43, NULL, 'Tidak', NULL, '0000592049981', '11006816505', '085728827180', NULL, 'BRI', '592401044955539', NULL, NULL, NULL, NULL),
(5402, '851', 'Sukarmi', 'Harian', 'PKWTT', '1986-02-12', '39 tahun 4 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'KEDUNGSARI RT 04 / RW 02', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319085503680004', '3319085503680004', 'Perempuan', 'KUDUS', '1968-03-15', 57, NULL, 'Tidak', NULL, '0000592739829', '10015517328', '085876434522', NULL, 'BNI', '0988863521', NULL, NULL, NULL, NULL),
(5403, '789', 'Sutarmi', 'Harian', 'PKWTT', '1980-11-06', '44 tahun 8 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 09 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112630271', '3319087112630271', 'Perempuan', 'KUDUS', '1963-12-31', 61, NULL, 'Tidak', NULL, '0001529332503', '10015615595', '085743670276', NULL, 'BNI', '1938880899', NULL, NULL, NULL, NULL),
(5404, '843', 'Saripah', 'Harian', 'PKWTT', '1988-03-01', '37 tahun 4 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 01 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084305710003', '3319084305710003', 'Perempuan', 'KUDUS', '1971-05-03', 54, NULL, 'Tidak', NULL, '0001699097444', '10015516775', '085227027440', NULL, 'BNI', '0988863510', NULL, NULL, NULL, NULL),
(5405, '858', 'Suroso', 'Harian', 'PKWTT', '1994-08-01', '30 tahun 11 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 09 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080101680008', '3319080101680008', 'Laki Laki', 'KUDUS', '1968-01-01', 57, NULL, 'Tidak', NULL, '0001699099323', '10015517369', '081328407539', NULL, 'BNI', '0988863383', NULL, NULL, NULL, NULL),
(5406, '1347', 'Sawinah', 'Harian', 'PKWTT', '2018-11-01', '6 tahun 8 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'MARGOREJO RT 02 / RW 07', 'MARGOREJO', 'DAWE', 'KUDUS', '3319097112640144', '3319097112640144', 'Perempuan', 'KUDUS', '1964-12-31', 60, NULL, 'Tidak', NULL, '0000592497448', '18030384210', '085867146272', NULL, 'BNI', '1938740771', NULL, NULL, NULL, NULL),
(5407, '1348', 'Kholifah', 'Harian', 'PKWTT', '2018-11-01', '6 tahun 8 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'PUYOH RT 01 / RW 03', 'PUYOH', 'DAWE', 'KUDUS', '3319094102660001', '3319094102660001', 'Perempuan', 'KUDUS', '1966-02-01', 59, NULL, 'Tidak', NULL, '0002452486757', '15014774077', '085326305499', NULL, 'BNI', '0988863441', NULL, NULL, NULL, NULL),
(5408, '1349', 'Sulip', 'Harian', 'PKWTT', '2018-11-01', '6 tahun 8 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'PUYOH RT 03 / RW 03', 'PUYOH', 'DAWE', 'KUDUS', '3319097112700020', '3319097112700020', 'Perempuan', 'KUDUS', '1970-12-31', 54, NULL, 'Tidak', NULL, '0000592245134', '18030384194', '085325200713', NULL, 'BNI', '1917469373', NULL, NULL, NULL, NULL),
(5409, '1351', 'Siti Sukayati', 'Harian', 'PKWTT', '2018-11-01', '6 tahun 8 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'JURANG RT 04 / RW 05', 'JURANG', 'GEBOG', 'KUDUS', '3319087112630253', '3319087112630253', 'Perempuan', 'KUDUS', '1963-12-31', 61, NULL, 'Tidak', NULL, '0000591838727', '18030384228', '0882006874226', NULL, 'BRI', '592401035326531', NULL, NULL, NULL, NULL),
(5410, '1398', 'Sumini', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'PUYOH RT 01 / RW 01', 'PUYOH', 'DAWE', 'KUDUS', '3319097112660190', '3319097112660190', 'Perempuan', 'KUDUS', '1966-12-31', 58, NULL, 'Tidak', NULL, '0000592380538', '18041991185', '081327674074', NULL, 'BRI', '592201040159531', NULL, NULL, NULL, NULL),
(5411, '1410', 'Sunah', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'PUYOH RT 02 / RW 01', 'PUYOH', 'DAWE', 'KUDUS', '3319097112650091', '3319097112650091', 'Perempuan', 'KUDUS', '1965-12-31', 59, NULL, 'Tidak', NULL, '0000592415447', '18042001372', '85712122163', NULL, 'BNI', '003801111788506', NULL, NULL, NULL, NULL),
(5412, '1399', 'Ngatminah', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'MURYOLOBO RT 01 / RW 04', 'MURYOLOBO', 'NALUMSARI', 'JEPARA', '3320124901650002', '3320124901650002', 'Perempuan', 'JEPARA', '1965-01-09', 60, NULL, 'Tidak', NULL, NULL, '18041992969', '088225299789', NULL, 'BRI', '592401009740505', NULL, NULL, NULL, NULL),
(5413, '1400', 'Karti', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'SAMIREJO RT 01 / RW 03', 'SAMIREJO', 'DAWE', 'KUDUS', '3319095002570002', '3319095002570002', 'Perempuan', 'KUDUS', '1957-02-10', 68, NULL, 'Tidak', NULL, NULL, '18041994767', '085876889369', NULL, 'BRI', '592201040196533', NULL, NULL, NULL, NULL),
(5414, '1401', 'Sukinah', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'PUYOH RT 07 / RW 03', 'PUYOH', 'DAWE', 'KUDUS', '3319097112690027', '3319097112690027', 'Perempuan', 'KUDUS', '1969-12-31', 55, NULL, 'Tidak', NULL, '0002299763463', '18041994023', '085225074182', NULL, 'BNI', '1938750927', NULL, NULL, NULL, NULL),
(5415, '1402', 'Siti Hayati', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'KEDUNGSARI RT 07 / RW 03', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319085605610001', '3319085605610001', 'Perempuan', 'KUDUS', '1961-05-16', 64, NULL, 'Tidak', NULL, '0001532156242', '18041988322', '082324076107', NULL, 'BRI', '592401009714504', NULL, NULL, NULL, NULL),
(5416, '1403', 'Rusmini', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'PUYOH RT 01 / RW 04', 'PUYOH', 'DAWE', 'KUDUS', '3319097112710057', '3319097112710057', 'Perempuan', 'KUDUS', '1971-12-31', 53, NULL, 'Tidak', NULL, '0002578136567', '18041999444', '082323561885', NULL, 'BNI', '0986414613', NULL, NULL, NULL, NULL),
(5417, '1404', 'Kasimah', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'SAMIREJO RT 02 / RW 03', 'SAMIREJO', 'DAWE', 'KUDUS', '3319095204670004', '3319095204670004', 'Perempuan', 'KUDUS', '1967-04-12', 58, NULL, 'Tidak', NULL, '0000593107885', '18041988272', '082327022284', NULL, 'BNI', '1939679077', NULL, NULL, NULL, NULL),
(5418, '1405', 'Sulikah', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'SOCO RT 06 / RW 03', 'SOCO', 'DAWE', 'KUDUS', '3319094108790008', '3319094108790008', 'Perempuan', 'KUDUS', '1979-08-01', 45, NULL, 'Tidak', NULL, '0002453657523', '18042003782', '081210756586', NULL, 'BNI', '1938750701', NULL, NULL, NULL, NULL),
(5419, '1407', 'Sri Haryati', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 03 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319086304740002', '3319086304740002', 'Perempuan', 'KUDUS', '1974-04-23', 51, NULL, 'Tidak', NULL, '0001532156242', '18041989379', '085600429236', NULL, 'BNI', '1938594310', NULL, NULL, NULL, NULL),
(5420, '989', 'Basini', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR NON SHIFT', NULL, 'GONDOSARI RT 02 / RW 10', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319085507770006', '3319085507770006', 'Perempuan', 'KUDUS', '1977-07-15', 47, NULL, 'Tidak', NULL, '0001530659384', '10015516940', '085523972520', NULL, 'BNI', '19138251689', NULL, NULL, NULL, NULL),
(5421, '993', 'Munzaroah', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR NON SHIFT', NULL, 'KEDUNGSARI RT 04/ RW 10', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319086608700002', '3319086608700002', 'Perempuan', 'KUDUS', '1970-08-26', 54, NULL, 'Tidak', NULL, '0001698396129', '10015515884', '081390228942', NULL, 'BRI', '592401009712502', NULL, NULL, NULL, NULL),
(5422, '1180', 'Kasmi', 'Harian', 'PKWTT', '2001-06-15', '24 tahun 0 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR NON SHIFT', NULL, 'GONDOSARI RT 01 / RW 06', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319087112590143', '3319087112590143', 'Perempuan', 'KUDUS', '1959-12-31', 65, NULL, 'Tidak', NULL, '0001698396175', '10015515793', '087776693211', NULL, 'MANDIRI', '1840010464160', NULL, NULL, NULL, NULL),
(5423, '961', 'Sirih', 'Harian', 'PKWTT', '1995-11-14', '29 tahun 7 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR NON SHIFT', NULL, 'GONDOSARI RT 01 / RW 05', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084206540003', '3319084206540003', 'Perempuan', 'KUDUS', '1954-08-02', 70, NULL, 'Tidak', NULL, '0001699098671', '11030980376', '087846138048', NULL, 'BNI', '1916249246', NULL, NULL, NULL, NULL),
(5424, '1542', 'Istiqomah', 'Harian', 'PKWTT', NULL, NULL, NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'GONDOSARI RT 01 / RW 03', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084403700001', '3319084403700001', 'Perempuan', 'KUDUS', '1970-03-04', 55, NULL, 'Tidak', NULL, NULL, '16036832307', '085713715384', NULL, 'BNI', '1938215674', NULL, NULL, NULL, NULL),
(5425, '1598', 'Maulana Dias Ismail', 'Harian', 'PKWTT', NULL, NULL, NULL, 'Primary', 'HR PROSES NS', 'HR NON SHIFT', NULL, 'LEMAH SAWAH RT05/RW 05', 'LEMAH SAWAH', NULL, NULL, '3319082112040001', '3319082112040001', 'Laki Laki', 'KUDUS', '2004-12-21', 20, NULL, 'Tidak', NULL, NULL, '24120644349', '085795506340', NULL, 'BRI', '592401009701501', NULL, NULL, NULL, NULL),
(5426, '1611', 'Tresna Yudistira', 'Harian', 'PKWTT', '2025-01-13', '0 tahun 5 bulan', NULL, 'Primary', 'HR PROSES', 'HR NON SHIFT', NULL, NULL, 'LAU', NULL, NULL, '3319092504020003', '3319092504020003', 'Laki Laki', 'KUDUS', '2002-04-25', 23, NULL, 'Tidak', NULL, NULL, '25008187343', '085867415610', NULL, 'BNI', '12211403659', NULL, NULL, NULL, NULL),
(5427, '1465', 'Rahmad Afandi', 'Harian', 'PKWTT', '2022-03-12', '3 tahun 3 bulan', NULL, 'Primary', 'HR PROSES', 'HR NON SHIFT', NULL, 'REJOSARI RT 05/RW 03', 'REJOSARI', 'DAWE', 'KUDUS', '3319092802960004', '3319092802960004', 'Laki Laki', 'KUDUS', '1996-02-28', 29, NULL, 'Tidak', NULL, '0000592284914', '21096320284', '085865090689', NULL, 'BRI', '592401009626507', NULL, NULL, NULL, NULL),
(5428, '1585', 'M Nova Khoirun N', 'Harian', 'PKWTT', '2024-02-25', '1 tahun 4 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR NON SHIFT', NULL, 'SAMIREJO RT 01/ RW 06', 'SAMIREJO', 'DAWE', 'KUDUS', '3319092306040000', '3319092306040000', 'Laki Laki', 'KUDUS', '2004-06-23', 21, NULL, 'Tidak', NULL, NULL, '24049039068', '089501220950', NULL, 'BNI', '1939827380', NULL, NULL, NULL, NULL),
(5429, '1617', 'Ana Khoirun Nisa\'', 'Harian', 'PKWTT', '2025-02-25', '0 tahun 4 bulan', NULL, 'Primary', 'HR PROSES 1', 'HR NON SHIFT', NULL, 'KEDUNGSARI RT 07 / RW 02', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319087008060004', '3319087008060004', 'Perempuan', 'KUDUS', '2006-08-30', 18, NULL, 'Tidak', NULL, NULL, '25033399111', '085647268839', NULL, 'BNI', '1933393323', NULL, NULL, NULL, NULL),
(5430, NULL, 'Abistha Nuri Tsaqif', 'Harian', 'PELATIHAN', NULL, NULL, NULL, 'Primary', 'HR PROSES 1', 'HR NON SHIFT', NULL, 'GARUNG LOR RT 02/RW 01', 'GARUNG LOR', NULL, 'KUDUS', '3319010404090022', '3319010404090022', 'Laki Laki', 'KUDUS', '2006-06-16', 19, NULL, 'Tidak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5431, '1458', 'Ulil Fahmi', 'Harian', 'PKWTT', '2021-11-07', '3 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 2', 'SAUS', NULL, 'GONDOSARI RT 02 / RW 09', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082411020002', '3319082411020002', 'Laki Laki', 'KUDUS', '2002-11-24', 22, NULL, 'Tidak', NULL, '0000591837456', '21096320359', '085700252256', NULL, 'BRI', '592401039566531', NULL, NULL, NULL, NULL),
(5432, '785', 'Kunarsih', 'Harian', 'PKWTT', '1986-05-25', '39 tahun 1 bulan', NULL, 'Primary', 'HR PROSES 2', 'SAUS', NULL, 'GONDOSARI RT 01 / RW 06', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319085006630003', '3319085006630003', 'Perempuan', 'KUDUS', '1963-06-10', 62, NULL, 'Tidak', NULL, '0001530512921', '10015515546', '085742349299', NULL, 'BRI', '592401009716506', NULL, NULL, NULL, NULL),
(5433, NULL, 'Miftakhul Huda', 'Harian', 'PKWTT', '2023-11-25', '1 tahun 7 bulan', NULL, 'Primary', 'HR PROSES 2', 'SAUS', NULL, 'GONDOSARI RT 01 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319081103030001', '3319081103030001', 'Laki Laki', 'KUDUS', '2003-03-11', 22, NULL, 'Tidak', NULL, NULL, '23200390468', '085820245672', NULL, 'BNI', '1811364823', NULL, NULL, NULL, NULL),
(5434, '1506', 'Moh Fahris Ahsan', 'Harian', 'PKWTT', '2022-09-07', '2 tahun 10 bulan', NULL, 'Primary', 'HR PROSES 2', 'SAUS', NULL, 'PIJI RT 05 / RW 09', 'PIJI', 'DAWE', 'KUDUS', '3319061910940001', '3319061910940001', 'Laki Laki', 'KUDUS', '1994-10-19', 30, NULL, 'Tidak', NULL, '0002014326538', '22109573497', '085727850566', NULL, 'BRI', '592201051234536', NULL, NULL, NULL, NULL),
(5435, '1430', 'Praharsini', 'Harian', 'PKWTT', '2021-11-06', '3 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 2', 'SAUS', NULL, 'GONDOSARI RT 05 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084608700004', '3319084608700004', 'Perempuan', 'JAKARTA', '1970-08-06', 54, NULL, 'Tidak', NULL, '0002165050293', '22017813944', '085293839090', NULL, 'BNI', '1000650393', NULL, NULL, NULL, NULL),
(5436, '1219', 'Kiswati', 'Harian', 'PKWTT', '2008-01-26', '17 tahun 5 bulan', NULL, 'Primary', 'HR PROSES 2', 'SAUS', NULL, 'GONDOSARI RT 02 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084202840003', '3319084202840003', 'Perempuan', 'KUDUS', '1984-02-02', 41, NULL, 'Tidak', NULL, '0000592055774', '10015516049', '085226499331', NULL, 'BNI', '0988863655', NULL, NULL, NULL, NULL),
(5437, '1220', 'Mas\'adah', 'Harian', 'PKWTT', '2008-01-26', '17 tahun 5 bulan', NULL, 'Primary', 'HR PROSES 2', 'SAUS', NULL, 'KEDUNGSARI RT 03 / RW 08', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319094406820004', '3319094406820004', 'Perempuan', 'KUDUS', '1982-06-04', 43, NULL, 'Tidak', NULL, '0001698395826', '10015516056', '0882006914129', NULL, 'BRI', '592201055020531', NULL, NULL, NULL, NULL),
(5438, '817', 'Sarmini', 'Harian', 'PKWTT', '1985-01-01', '40 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'SAUS', NULL, 'MENAWAN RT 01 / RW 04', 'MENAWAN', 'GEBOG', 'KUDUS', '3319085404700001', '3319085404700001', 'Perempuan', 'KUDUS', '1970-04-14', 55, NULL, 'Tidak', NULL, '0001698395602', '10015516528', '082223030739', NULL, 'BNI', '1939209205', NULL, NULL, NULL, NULL),
(5439, '823', 'Sutiah', 'Harian', 'PKWTT', '1988-03-01', '37 tahun 4 bulan', NULL, 'Primary', 'HR PROSES 2', 'SAUS', NULL, 'JURANG RT 05 / RW 03', 'JURANG', 'GEBOG', 'KUDUS', '3319086412700003', '3319086412700003', 'Perempuan', 'KUDUS', '1970-12-24', 54, NULL, 'Tidak', NULL, '0001699099918', '10015516585', '085728412966', NULL, 'BRI', '592401044945534', NULL, NULL, NULL, NULL),
(5440, '732', 'Sulikah', 'Harian', 'PKWTT', '1984-05-05', '41 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 2', 'SAUS', NULL, 'KEDUNGSARI RT 04 / RW 06', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319084501670001', '3319084501670001', 'Perempuan', 'KUDUS', '1967-01-05', 58, NULL, 'Tidak', NULL, NULL, '10015515504', '081210756586', NULL, 'BNI', '0500390783', NULL, NULL, NULL, NULL),
(5441, '1527', 'Noor Itsna Hidayani', 'Harian', 'PKWTT', '2023-07-02', '2 tahun 0 bulan', NULL, 'Primary', 'HR PROSES 2', 'SAUS', NULL, 'GONDOSARI RT 01 / RW 03', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084610030002', '3319084610030002', 'Perempuan', 'KUDUS', '2003-10-06', 21, NULL, 'Tidak', NULL, NULL, '23097596730', '085882747466', NULL, 'BRI', '002201087817509', NULL, NULL, NULL, NULL),
(5442, '1515', 'Akhmad Siril Aufa', 'Harian', 'PKWTT', '2022-12-12', '2 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'MENAWAN RT 02 / RW 01', 'MENAWAN', 'GEBOG', 'KUDUS', '3319080806040008', '3319080806040008', 'Laki Laki', 'KUDUS', '2004-06-08', 21, NULL, 'Tidak', NULL, '0002059209854', '22155406352', '087743977209', NULL, 'BRI', '592401040090531', NULL, NULL, NULL, NULL),
(5443, '327', 'Masudi', 'Harian', 'PKWTT', '1976-07-07', '49 tahun 0 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'KEDUNGSARI RT 05 / RW 08', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319081212590002', '3319081212590002', 'Laki Laki', 'KUDUS', '1959-12-12', 65, NULL, 'Tidak', NULL, '0001025628726', '10015516064', '081388589293', NULL, 'BNI', '0988863677', NULL, NULL, NULL, NULL),
(5444, '1452', 'Mohammad Rafla Arfenda', 'Harian', 'PKWTT', '2021-11-06', '3 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'GONDOSARI RT 01 / RW 05', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082608020003', '3319082608020003', 'Laki Laki', 'KUDUS', '2002-08-26', 22, NULL, 'Tidak', NULL, '0002234991789', '21096320334', '087734603374', NULL, 'BNI', '1904445970', NULL, NULL, NULL, NULL),
(5445, '1535', 'Bagas Prasetyo', 'Harian', 'PKWTT', '2023-09-09', '1 tahun 10 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'TRITIS RT 13 / RW 03', 'TRITIS', 'NALUMSARI', 'JEPARA', '3320122004040001', '3320122004040001', 'Laki Laki', 'JEPARA', '2004-04-20', 21, NULL, 'Tidak', NULL, NULL, '23140337249', '081952420151', NULL, 'BRI', '589001054712538', NULL, NULL, NULL, NULL),
(5446, '984', 'Giyanto', 'Harian', 'PKWTT', '1996-04-15', '29 tahun 2 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'KEDUNGSARI RT 05 / RW 09', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319082006760008', '3319082006760008', 'Laki Laki', 'KUDUS', '1976-06-20', 49, NULL, 'Tidak', NULL, '0001698396041', '10015516114', '085600479498', NULL, 'BNI', '1939827255', NULL, NULL, NULL, NULL),
(5447, '708', 'Sugiyati', 'Harian', 'PKWTT', '1983-01-01', '42 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'NGETUK RT 03 / RW 08', 'NGETUK', 'NALUMSARI', 'JEPARA', '3320124107650225', '3320124107650225', 'Perempuan', 'JEPARA', '1965-07-01', 60, NULL, 'Tidak', NULL, NULL, '10015515041', '081391376952', NULL, 'BNI', '0988863713', NULL, NULL, NULL, NULL),
(5448, '1100', 'Rustini', 'Harian', 'PKWTT', '1997-01-01', '28 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'GONDOSARI RT 09 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319084710800004', '3319084710800004', 'Perempuan', 'KUDUS', '1980-10-07', 44, NULL, 'Tidak', NULL, '0000591963164', '11006816042', '087722434476', NULL, 'BRI', '592401044913537', NULL, NULL, NULL, NULL),
(5449, '1406', 'Siti Umiyati', 'Harian', 'PKWTT', '2020-08-06', '4 tahun 11 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'GONDOSARI RT 05 / RW 02', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319094803730004', '3319094803730004', 'Perempuan', 'KUDUS', '1973-03-08', 52, NULL, 'Tidak', NULL, '0000592544485', '18041990955', '085868502047', NULL, 'BNI', '1938893376', NULL, NULL, NULL, NULL),
(5450, '1429', 'Kasmirah', 'Harian', 'PKWTT', '2021-11-06', '3 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'SAMIREJO RT 02 / RW 05', 'SAMIREJO', 'DAWE', 'KUDUS', '3319097108600002', '3319097108600002', 'Perempuan', 'KUDUS', '1960-08-31', 64, NULL, 'Tidak', NULL, '0000591937828', '22017813886', '088229707743', NULL, 'BRI', '592201062672531', NULL, NULL, NULL, NULL),
(5451, '1428', 'Noor Hayati', 'Harian', 'PKWTT', '2021-11-06', '3 tahun 8 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'BESITO RT 04 / RW 03', 'BESITO', 'GEBOG', 'KUDUS', '3319085503740002', '3319085503740002', 'Perempuan', 'KUDUS', '1974-03-15', 51, NULL, 'Tidak', NULL, '0002580303442', '22017813829', '0895418020317', NULL, 'BNI', '0986413982', NULL, NULL, NULL, NULL),
(5452, '1562', 'Indra Setiawan', 'Harian', 'PKWTT', '2024-01-07', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'GONDOSARI RT 01 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082205040003', '3319082205040003', 'Laki Laki', 'KUDUS', '2004-05-22', 21, NULL, 'Tidak', NULL, NULL, '24008029738', '081578025846', NULL, 'BNI', '1816218551', NULL, NULL, NULL, NULL),
(5453, '1563', 'Retno Suryani', 'Harian', 'PKWTT', '2024-01-07', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'MLATI NOROWITO RT 01 / RW 09', 'MLATI NOROWITO', 'KOTA KUDUS', 'KUDUS', '3319025801020002', '3319025801020002', 'Perempuan', 'KUDUS', '2002-01-18', 23, NULL, 'Tidak', NULL, NULL, '24008029696', '085727657691', NULL, 'BNI', '0961538218', NULL, NULL, NULL, NULL),
(5454, '1564', 'Anis Izzatin Nisak', 'Harian', 'PKWTT', '2024-01-07', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'SAMIREJO RT 01 / RW 05', 'SAMIREJO', 'DAWE', 'KUDUS', '3319095012910006', '3319095012910006', 'Perempuan', 'KUDUS', '1991-12-10', 33, NULL, 'Tidak', NULL, NULL, '24008029720', '088980078546', NULL, 'BRI', '592401039219532', NULL, NULL, NULL, NULL),
(5455, '1565', 'Hendra Novianto', 'Harian', 'PKWTT', '2024-01-07', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'GONDOSARI RT 06 / RW 08', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319080111990003', '3319080111990003', 'Laki Laki', 'KUDUS', '1999-11-01', 25, NULL, 'Tidak', NULL, NULL, '24008029642', '081229140607', NULL, 'BNI', '1477351969', NULL, NULL, NULL, NULL),
(5456, '1566', 'Umaratun Nisa\'', 'Harian', 'PKWTT', '2024-01-08', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'CENDONO RT 02 / RW 05', 'CENDONO', 'DAWE', 'KUDUS', '3319096210950003', '3319096210950003', 'Perempuan', 'KUDUS', '1995-10-22', 29, NULL, 'Tidak', NULL, NULL, '24008029654', '088215381572', NULL, 'BNI', '0830871280', NULL, NULL, NULL, NULL),
(5457, '1567', 'Risma Khoirunisa', 'Harian', 'PKWTT', '2024-01-08', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'GONDOSARI RT 03 / RW 11', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319086006000005', '3319086006000005', 'Perempuan', 'KUDUS', '2000-06-20', 25, NULL, 'Tidak', NULL, NULL, '24008029712', '085743255780', NULL, 'BNI', '1816218562', NULL, NULL, NULL, NULL),
(5458, '1568', 'Ahmad Ainun Najib', 'Harian', 'PKWTT', '2024-01-08', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'PUYOH RT 06 / RW 03', 'PUYOH', 'DAWE', 'KUDUS', '3319091808000002', '3319091808000002', 'Perempuan', 'KUDUS', '2000-08-18', 24, NULL, 'Tidak', NULL, NULL, '24008029704', '082261447611', NULL, 'MANDIRI', '1840010064747', NULL, NULL, NULL, NULL),
(5459, '1569', 'Muhammad Firman Sah', 'Harian', 'PKWTT', '2024-01-08', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'SAMIREJO RT 03 / RW 02', 'SAMIREJO', 'DAWE', 'KUDUS', '3319090509050001', '3319090509050001', 'Laki Laki', 'KUDUS', '2005-09-05', 19, NULL, 'Tidak', NULL, NULL, '24008029746', '085640867787', NULL, 'BRI', '592301010330501', NULL, NULL, NULL, NULL),
(5460, '1570', 'Selamet Fanny Riyanto', 'Harian', 'PKWTT', '2024-01-08', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'GONDOSARI RT 05 / RW 07', 'GONDOSARI', 'GEBOG', 'KUDUS', '3319082312020001', '3319082312020001', 'Laki Laki', 'KUDUS', '2002-12-23', 22, NULL, 'Tidak', NULL, NULL, '24008029688', '081916051690', NULL, 'BRI', '003801170836508', NULL, NULL, NULL, NULL),
(5461, '1571', 'Muhamad Abdul Ghofur', 'Harian', 'PKWTT', '2024-01-09', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'KEDUNGSARI RT 05 / RW 10', 'KEDUNGSARI', 'GEBOG', 'KUDUS', '3319082310010004', '3319082310010004', 'Laki Laki', 'KUDUS', '2001-10-23', 23, NULL, 'Tidak', NULL, NULL, '24008029753', '085864606782', NULL, 'BNI', '1816218540', NULL, NULL, NULL, NULL),
(5462, '1572', 'Moh Emil Farqi', 'Harian', 'PKWTT', '2024-01-09', '1 tahun 6 bulan', NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, 'NGETUK RT 03 / RW 02', 'NGETUK', 'NALUMSARI', 'JEPARA', '3320322311040001', '3320322311040001', 'Laki Laki', 'JEPARA', '2004-11-23', 20, NULL, 'Tidak', NULL, NULL, '24008029662', '082314988989', NULL, 'BRI', '592401009739504', NULL, NULL, NULL, NULL),
(5463, '1577', 'Adi Setyawan', 'Harian', 'PKWTT', NULL, NULL, NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, NULL, NULL, NULL, NULL, '3319082812020003', '3319082812020003', 'Laki Laki', 'KUDUS', '2002-12-28', 22, NULL, 'Tidak', NULL, NULL, '24049039035', '0882007943362', NULL, 'BNI', '1908149148', NULL, NULL, NULL, NULL),
(5464, '1578', 'Andika P', 'Harian', 'PKWTT', NULL, NULL, NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, NULL, NULL, NULL, NULL, '3320121805030001', '3320121805030001', 'Laki Laki', 'JEPARA', '1994-03-21', 31, NULL, 'Tidak', NULL, NULL, '24049039134', '085601127390', NULL, 'BNI', '1822441569', NULL, NULL, NULL, NULL),
(5465, '1579', 'Mohammad Romadhon', 'Harian', 'PKWTT', NULL, NULL, NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, NULL, NULL, NULL, NULL, '3319080301000004', '3319080301000004', 'Laki Laki', 'KUDUS', '2000-01-03', 25, NULL, 'Tidak', NULL, NULL, '24049039050', '085712441311', NULL, 'BRI', '592401025368535', NULL, NULL, NULL, NULL),
(5466, '1580', 'Nofa Ariyanto', 'Harian', 'PKWTT', NULL, NULL, NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, NULL, NULL, NULL, NULL, '3319081311040003', '3319081311040003', 'Laki Laki', 'KUDUS', '2004-11-13', 20, NULL, 'Tidak', NULL, NULL, '24049039076', '087876501396', NULL, 'BNI', '1822397539', NULL, NULL, NULL, NULL),
(5467, '1577', 'Abdullah Aniq', 'Harian', 'PKWTT', NULL, NULL, NULL, 'Primary', 'HR PROSES 2', 'NYAWUT', NULL, NULL, NULL, NULL, NULL, '3320122103940001', '3320122103940001', 'Laki Laki', 'KUDUS', '1994-03-21', 31, NULL, 'Tidak', NULL, NULL, '24049039167', '085950378042', NULL, 'BNI', '1822429993', NULL, NULL, NULL, NULL);

--
-- Triggers `primary_karyawan`
--
DELIMITER $$
CREATE TRIGGER `trg_set_masakerja_before_insert` BEFORE INSERT ON `primary_karyawan` FOR EACH ROW BEGIN
  DECLARE tahun INT;
  DECLARE bulan INT;

  SET tahun = TIMESTAMPDIFF(YEAR, NEW.masuk_kerja, CURDATE());
  SET bulan = TIMESTAMPDIFF(MONTH, NEW.masuk_kerja, CURDATE()) % 12;

  SET NEW.masa_kerja = CONCAT(tahun, ' tahun ', bulan, ' bulan');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_set_masakerja_before_update` BEFORE UPDATE ON `primary_karyawan` FOR EACH ROW BEGIN
  DECLARE tahun INT;
  DECLARE bulan INT;

  IF NEW.masuk_kerja <> OLD.masuk_kerja THEN
    SET tahun = TIMESTAMPDIFF(YEAR, NEW.masuk_kerja, CURDATE());
    SET bulan = TIMESTAMPDIFF(MONTH, NEW.masuk_kerja, CURDATE()) % 12;

    SET NEW.masa_kerja = CONCAT(tahun, ' tahun ', bulan, ' bulan');
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_set_umur_before_insert` BEFORE INSERT ON `primary_karyawan` FOR EACH ROW BEGIN
  SET NEW.umur = TIMESTAMPDIFF(YEAR, NEW.tanggal_lahir, CURDATE());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_set_umur_before_update` BEFORE UPDATE ON `primary_karyawan` FOR EACH ROW BEGIN
  -- Hanya update umur jika tanggal_lahir berubah
  IF NEW.tanggal_lahir <> OLD.tanggal_lahir THEN
    SET NEW.umur = TIMESTAMPDIFF(YEAR, NEW.tanggal_lahir, CURDATE());
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user', 'web', '2025-08-09 19:04:48', '2025-08-09 19:04:48'),
(2, 'admin', 'web', '2025-08-09 19:04:48', '2025-08-09 19:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('cpOs3m23JrHaojTLYTi88Bp4EBfEn2OInVi3RUn9', NULL, '192.168.3.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY29nQVNZc1g0ZFZSclY4d3I2cjNuN1AyclcwS3QyWXhFWlZKUXZGZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xOTIuMTY4LjMuMjUzOjgxL2RlZmF1bHQtYXZhdGFyLnBuZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1757400715),
('GHQsumnGbo1yyAf2LYQ6tSBxxivqtx6vFE82bfBH', NULL, '192.168.3.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1NHamlnS2pVbmF2ZHUzbEIyeUF2d0lsd3FHbDJsdnNKR3N5NDdPTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xOTIuMTY4LjMuMjUzOjgxL2thcnlhd2FuL2VkaXQvMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1757321027),
('hxnkKbozMPn6d4OIJFYIzRnojQiJqpLy32cNdffS', NULL, '192.168.3.253', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHpOZEJKZ1huRWc0b1d3eE52M2hkcEpyWU0wU2xHak53dUdHS2lKUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly9wcmltYXJ5LnBhcmpvcy54eXoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1757397066),
('NygEl7R8u0OpTJlRbnyGnSBNRzkCkHsDiTbnSiLj', NULL, '192.168.3.100', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3FIMjFobENaYUlCUXBYT002VjRRUmc0MHRMYXlBM1gxR2JMRDlpeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xOTIuMTY4LjMuMjUzOjgxL2thcnlhd2FuL3VwbG9hZC1mb3RvIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1757318042),
('QgqmejUYTazrXBNcpgD3PqGoo6V95l5DwoRc0UV1', NULL, '192.168.3.87', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHRUb2t1TkJ4YkltQ3Zya3lJM1hpMmo4ejlQaDJoSEZCRlJabUFtdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly8xOTIuMTY4LjMuMjUzOjgxIjt9fQ==', 1757390421);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `whatsapp_number` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `whatsapp_number`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'budeng', 'i71yRtIHHX@example.com', '081326747779', NULL, '$2y$12$g06R62EVj30siFQbArq1y.AtisnObv3qNRAJc/1cD1Edw7g4j52s.', NULL, '2025-08-24 02:04:02', '2025-08-24 02:04:02'),
(2, 'tes', 'tes@tes.com', NULL, NULL, '$2y$12$qqN2/KICfqT3bkwgcXnfDeJQ1wiJ2/Q0wNbzNy6B0klLjS5aD7ux2', NULL, '2025-08-24 17:37:29', '2025-08-24 17:37:29'),
(3, 'ANA KHOIRUN NISA', 'l2iinIppMh@example.com', '085647268839', NULL, '$2y$12$6CavcJeFWZ5FPrdasFbpsuv13iL7rE0zIgSCq/ItSqcf78prXvijS', NULL, '2025-08-26 20:05:18', '2025-08-26 20:05:18'),
(4, 'Ana khoirun nisa', 'sukunsejahtera@gmail.com', NULL, NULL, '$2y$12$/zVy9cqZJMEZp/r8/3eBi..VOuXo5ziB2gq/pk8WVaBpbcMBiJzBa', NULL, '2025-08-26 20:07:21', '2025-08-26 20:07:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `otps_whatsapp_number_unique` (`whatsapp_number`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `primary_karyawan`
--
ALTER TABLE `primary_karyawan`
  ADD PRIMARY KEY (`no_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_whatsapp_number_unique` (`whatsapp_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `primary_karyawan`
--
ALTER TABLE `primary_karyawan`
  MODIFY `no_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5468;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
