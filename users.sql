-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2022 at 04:10 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nadhifood`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latlng` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_mob_no` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhaar_no` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_login` tinyint(1) NOT NULL DEFAULT 1,
  `c_time` datetime NOT NULL,
  `m_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `ref_id`, `latlng`, `user_type`, `mobile_no`, `alt_mob_no`, `aadhaar_no`, `status`, `is_login`, `c_time`, `m_time`, `created_at`, `updated_at`) VALUES
(16, 'saba', 'saba123@gmail.com', '$2y$10$Mu2ybwTcpwZU.1rZbxp37eMjgOVpGkPrzTc38JHts5hdv3dXN9eAK', '12553', 'adk4', 'admin', '9955886622', 'NULL', '9988456322', 1, 1, '2022-05-04 13:17:24', NULL, '2022-05-04 07:47:24', '2022-05-04 07:47:24'),
(17, 'saga', 'saga123@gmail.com', '$2y$10$EWF8I/FkM.PWjF5An2ovU.NadQo3s4iFwrzkiUJKtK7B3z6KAX39m', '111111', 'adk4', 'admin', '9955886622', 'NULL', 'NULL', 1, 0, '2022-05-04 13:18:20', NULL, '2022-05-04 07:48:20', '2022-05-04 07:50:23'),
(18, 'cibiss', 'gurucsss@gmail.com', '$2y$10$w55lwcAckcj9FsaeRqfL0.03uYuRok6eeD2.YB.TuvhoPKHdguVKe', '12553', 'adk4', 'admin', '9955886622', '7565464564', '9988456322', 1, 1, '2022-05-05 05:32:12', NULL, '2022-05-05 00:02:12', '2022-05-05 00:02:12'),
(19, 'ciss', 'gss@gmail.com', '$2y$10$qIRAwmh7hHBIViBa4v.e3O.42h9I1V2O4qkU8uzGvtSVvOF8DBZyy', '12553', 'adk4', 'admin', '9955886622', '7565464564', '9988456322', 1, 1, '2022-05-05 05:36:50', NULL, '2022-05-05 00:06:50', '2022-05-05 00:07:08'),
(20, 'ciss', 'gsss@gmail.com', '$2y$10$KYYiZjfwKsdcIbyr/cMedeng64SMTeuORCav/BYt2Sz.76kNqj9FG', '12553', 'adk4', 'admin', '9955886622', '7565464564', '9988456322', 1, 1, '2022-05-06 06:54:53', NULL, '2022-05-06 01:24:53', '2022-05-06 01:24:53'),
(21, 'ciss', 'admin@gmail.com', '$2y$10$fHhGAZcaUu8dhq0LHSKZpOTl1TgfmxVHzgtBaFxp6cAmIcsNUs1Ha', '12553', 'adk4', 'admin', '9955886622', '7565464564', '9988456322', 1, 1, '2022-05-06 06:55:44', NULL, '2022-05-06 01:25:44', '2022-05-06 02:21:02'),
(22, 'ciss', 'admins@gmail.com', '$2y$10$kIy373v6WlRaX//3zafO4Or0KNgZhYu1GnBdu2NxnSCmInT6ua9t.', '12553', 'adk4', 'admin', '9955886622', '7565464564', '9988456322', 1, 1, '2022-05-06 07:44:07', NULL, '2022-05-06 02:14:07', '2022-05-06 02:20:48'),
(23, 'ciss', 'adminss@gmail.com', '$2y$10$j1uvAckEKWEnN0g/yQXEROpsFbCNn2uraTgg86a87jF3hZcQ3QytG', '12553', 'adk4', 'admin', '9955886622', '7565464564', '9988456322', 1, 0, '2022-05-11 05:19:35', NULL, '2022-05-10 23:49:35', '2022-05-10 23:55:13'),
(24, 'ciss', 'hariks@gmail.com', '$2y$10$w5zPrQopulrmDIkUpSfu2.stH2RuQGjVg0mzvD6lfmZo6pHF2hUV2', '12553', 'adk4', 'admin', '9955886622', '7565464564', '9988456322', 1, 0, '2022-05-11 05:28:27', NULL, '2022-05-10 23:58:27', '2022-05-10 23:59:25'),
(25, 'ciss', 'harikss@gmail.com', '$2y$10$Zk/JDs24iyWguCF6WCf8jeQDQd9XSw7jn6DgKWQ4WKGz09008ndYO', '12553', 'adk4', 'admin', '9955886622', '7565464564', '9988456322', 1, 1, '2022-05-11 05:40:09', NULL, '2022-05-11 00:10:09', '2022-05-11 00:10:23'),
(26, 'ciss', 'dhiyana@gmail.com', '$2y$10$jfMb1rcXdRyVKg2EJjJOQuPjYLDW8NM0dC5cIb7.Zt2S5e7fLd2tq', '12553', 'adk4', 'admin', '9955886622', '7565464564', '9988456322', 1, 1, '2022-05-11 09:39:08', NULL, '2022-05-11 04:09:08', '2022-05-11 04:09:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
