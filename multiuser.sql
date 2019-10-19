-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2019 at 05:25 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multiuser`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Subscriber', 'cse.delwarhossain@gmail.com', '$2y$10$tRarP9mDPvl1ZdK839dloOJ8OcBDI5F3Sj0igirfPssDUcoKOcGgi', NULL, '2019-03-04 02:14:06', '2019-03-04 02:14:06'),
(3, 'Subscriber', 'akla.arifhossain@gmail.com', '$2y$10$kdtOXxIsB/LGrFAaTZDmV.MWkGe7wjXxpB6pLF7VfXfF9Twxkam6G', NULL, '2019-03-04 02:15:07', '2019-03-04 02:15:07'),
(4, 'visitor', 'abu@gmail.com', '$2y$10$q90kNS7gaO56MOrFJwHBkeF84G46X6Os8NmIzXOYkyyzOxAQc7HsC', NULL, '2019-03-04 02:16:33', '2019-03-04 02:16:48'),
(5, 'admin', 'abu1@gmail.com', '$2y$10$TIttfGzAgtbV.cGjgyk9X.Tzj9sVlhinBQ1BGfPRbrv9Uy6l5EOfy', NULL, '2019-03-04 02:20:08', '2019-03-04 02:20:08'),
(6, 'super admin', 'kayes@gmail.com', '$2y$10$Dz.10pfn4UvsrmGSZ.Q00.GHKu1SGTYT.0dxtAgHiozxGNRm6uLdC', NULL, '2019-03-25 00:19:32', '2019-03-25 00:19:32'),
(7, 'Super Admin', 'super@admin.com', '$2y$04$sJbJqpv7TH5RrgTPq0raburfQ6g1XOQtgd59Dgz.VCGlr8f5gUvm6', 'VEqKKiFk6oRxKCDDFuKi4DlJxvcAvqBahHrlSXwMEHDT0onrdqPu2kW4zRVM', '2019-10-18 09:37:34', '2019-10-18 09:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`id`, `role_id`, `admin_id`) VALUES
(2, 2, 2),
(3, 2, 3),
(4, 3, 4),
(5, 4, 5),
(6, 1, 6),
(7, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2014_10_12_000000_create_users_table', 1),
(17, '2014_10_12_100000_create_password_resets_table', 1),
(18, '2017_03_06_023521_create_admins_table', 1),
(19, '2017_03_06_053834_create_admin_role_table', 1),
(20, '2018_03_06_023523_create_roles_table', 1),
(23, '2019_03_23_083348_create_students_table', 2),
(24, '2019_10_18_151954_create_teachers_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'super', '2019-03-04 02:10:46', '2019-03-04 02:10:46'),
(2, 'subscriber', '2019-03-04 02:13:25', '2019-03-04 02:13:25'),
(3, 'visitor', '2019-03-04 02:13:37', '2019-03-04 02:13:37'),
(4, 'admin', '2019-03-04 02:18:37', '2019-03-04 02:18:37');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Delwar', 'cse.delwarhossain@gmail.com', '$2y$10$E4PblGOBeY4.KWmA2rdC9OWMCcGRHHCPMDqKCansUr5feMV8FFp1y', NULL, '2019-10-18 09:33:14', '2019-10-18 09:33:14'),
(2, 'Delwar', 'cse.del1warhfdossain@gmail.com', '$2y$10$IvHooEqo5gW3UBlx1GsNFOMlyZ6ntglrhIayebn8CFAQrWUWRmNrW', NULL, '2019-10-18 10:15:38', '2019-10-18 10:15:38'),
(3, 'Delwar', 'csdelwarhossain@gmail.com', '$2y$10$VxrK6.2FX89zcM/BLGlz/O7ykkkom.2T7uGD0EVgYXmUF63hqlbR6', NULL, '2019-10-18 10:41:53', '2019-10-18 10:41:53'),
(4, 'Delwar', 'cse.del1warhklossain@gmail.com', '$2y$10$R7jH3PGVppPyi2RbG16WJ.5mXWB6yS7WA84wWq8uEtxx9UV.4cdLy', NULL, '2019-10-18 10:48:47', '2019-10-18 10:48:47'),
(5, 'Delwar', 'cse.dedfsl1warhossain@gmail.com', '$2y$10$W59XC5zwjiAfiu38vqBvZOn/Flm13XLX2RQmEygmXWmkW2wKoownu', NULL, '2019-10-18 10:58:14', '2019-10-18 10:58:14'),
(6, 'jdkl', 'sdsfds@gmail.com', '$2y$10$RoZSlBiYpOOYgGJ0m840.ePXff7gM1dsdu9B0NS1eakyqpj1sucV6', NULL, '2019-10-19 09:01:25', '2019-10-19 09:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Delwar', 'cse.delwarhossain@gmail.com', NULL, '$2y$10$zliUov2xAqxOgz3hYWaUjOV14T7zeuvgcUycod1bqxiB9Ywa6VzRu', NULL, '2019-06-27 02:07:26', '2019-06-27 02:07:26'),
(2, 'nirob', 'wow.example000@gmail.com', NULL, '$2y$10$2XS2XT2zD0ltSgeMPPXQU.RqKn0aYJ2xFzwXIG7FjavtLLDIEKkDa', NULL, '2019-06-27 02:08:27', '2019-06-27 02:08:27'),
(3, 'Delwar', '1cse.delwarhossain@gmail.com', NULL, '$2y$10$2HqYOAZgs.vYZqQs9Ul1Re7n9JvZoAC23gA6Cf0lnC8TgPKD.FEey', NULL, '2019-10-18 09:45:41', '2019-10-18 09:45:41'),
(4, 'Delwar', 'cse.delwadfsrhossain@gmail.com', NULL, '$2y$10$W2BR5hHlUvlOVNuKxUsXhevNdKNJJ8AG4bJ045H3nwFNrBAvPW2u.', NULL, '2019-10-18 10:13:20', '2019-10-18 10:13:20'),
(5, 'Delwar', 'lolsdsa@gmail.com', NULL, '$2y$10$/aPfGbQzgD03tNOqur3lPu.iYsHdshBY7w9fylMyg/x3IV6fIzlIO', NULL, '2019-10-18 10:15:10', '2019-10-18 10:15:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_role_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_email_unique` (`email`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD CONSTRAINT `admin_role_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
