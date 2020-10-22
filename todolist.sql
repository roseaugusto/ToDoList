-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 21, 2020 at 08:41 AM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `todolist`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_09_11_101811_projects', 2),
(6, '2020_09_13_001906_update_users_table', 3),
(7, '2020_09_13_010311_add_project_foreignkey_user', 4),
(8, '2020_09_13_030940_add_profilepicture_to_users', 5),
(9, '2020_10_21_054740_create_user_geolocations_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `budget` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `created_at`, `updated_at`, `name`, `description`, `budget`, `user_id`) VALUES
(1, '2020-09-12 17:13:35', '2020-09-17 21:40:10', 'Phalcon Explicit', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the induspublishing software like Aldus PageMaker including versions of Lorem Ipsum.', '100000', 7),
(4, '2020-09-15 05:47:28', '2020-09-15 05:47:28', 'CastSuperb', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the induspublishing software like Aldus PageMaker including versions of Lorem Ipsum.', '234243', 7),
(5, '2020-09-15 05:51:07', '2020-09-15 05:51:07', 'QuailMail', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the induspublishing software like Aldus PageMaker including versions of Lorem Ipsum.', '453534', 7),
(6, '2020-09-15 05:53:49', '2020-09-21 00:57:30', 'PunchTrickLane1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the induspublishing software like Aldus PageMaker including versions of Lorem Ipsum.', '23534', 14),
(7, '2020-09-15 05:55:06', '2020-09-17 21:39:07', 'FruitLoops', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the induspublishing software like Aldus PageMaker including versions of Lorem Ipsum.', '4535', 7),
(8, '2020-09-15 05:56:05', '2020-09-15 05:56:05', 'QuitsPro', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the induspublishing software like Aldus PageMaker including versions of Lorem Ipsum.', '34535', 7),
(10, '2020-09-21 01:07:05', '2020-09-24 22:39:37', 'DOJOMASTER', 'DETTEJTEUOIU34985738974DETTEJTEUOIU34985738974DETTEJTEUOIU34985738974DETTEJTEUOIU34985738974DETTEJTEUOIU34985738974DETTEJTEUOIU34985738974DETTEJTEUOIU34985738974DETTEJTEUOIU34985738974qweqew13', '2342342', 14),
(13, '2020-10-20 22:12:39', '2020-10-20 22:12:39', 'qweqwe', 'sdfsfsrewrwrwerqgeyut34346254ugjhagjhdhjaeyqwte638326482734', '23453453', 7),
(14, '2020-10-20 22:15:43', '2020-10-20 22:15:43', 'hey hqwe', 'qweqeqesjdbfhwgery242312443656675567576', '13132123', 7),
(15, '2020-10-20 22:16:16', '2020-10-20 22:16:16', 'dasdadasd', '353534fsd111```````````````````````````````````````', 'q3343453', 7),
(16, '2020-10-20 22:17:11', '2020-10-20 22:17:11', '1324', '1234567890qweqewqweqweqweqwewqeweqwe', '34534', 7),
(17, '2020-10-20 22:30:28', '2020-10-20 22:30:28', 'nippon', 'aderwuadghbcnzxcjzhczbxczncjzxczbnxcvzxbcvzxbcbnzc', '1334242', 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobileno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `profilepic` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `mobileno`, `address`, `birthday`, `profilepic`) VALUES
(7, 'Sheldon Lee Copper1', 'jim@gmail.com', NULL, '$2y$10$YYoFmMk5EGgeDNWb4t/IweaKVwGMIyiXJbM4gLuOhk.6H.iDkxn7C', 'TitOXcvV2f4An1fIE20k1Are1FO1PS9paYWqSKr4rQj745DCfPRdufacVKXX', '2020-09-12 19:45:07', '2020-09-21 00:54:40', 'pasadena', 'pasadena', NULL, '1600678480fgh.jfif'),
(8, 'Leonard Hoffsteader', 'len@gmail.com', NULL, '123', NULL, '2020-09-12 23:13:59', '2020-09-12 23:34:58', NULL, 'Florida', NULL, '1599981239dragonair.jpg'),
(9, 'Rajesh Krootrapali', 'raj@gmail.com', NULL, '123', NULL, '2020-09-12 23:28:33', '2020-09-12 23:35:14', NULL, 'India', NULL, '1599982113JCU02.png'),
(10, 'Howard Wolowitz', 'w@admin.com', NULL, '123', NULL, '2020-09-12 23:29:50', '2020-09-12 23:35:20', NULL, 'howard str.', NULL, '1599982190arbok.jpg'),
(11, 'Penny', 'penny@gmail.com', NULL, 'qwe', NULL, '2020-09-12 23:32:47', '2020-09-12 23:32:47', NULL, NULL, NULL, '1599982367Pokémon_Togepi_art.png'),
(12, 'Bernadette', 'bern@admin.com', NULL, '123', NULL, '2020-09-12 23:43:45', '2020-09-12 23:43:45', NULL, NULL, NULL, '1599983025em230.jfif'),
(13, 'Amy', 'amy@gmail.com', NULL, '1234', NULL, '2020-09-12 23:44:05', '2020-09-12 23:45:58', NULL, NULL, NULL, '1599983158em331.png'),
(14, 'oxee', 'ox@admin.com', NULL, '$2y$10$YYoFmMk5EGgeDNWb4t/IweaKVwGMIyiXJbM4gLuOhk.6H.iDkxn7C', 'qyl3l0BWhtwsJmBZ3ekYt2z4WukMF0QFdXuIJ2Nt6pnRB2unywWcihN4D884', '2020-09-14 19:32:21', '2020-09-24 20:35:03', NULL, 'pasadena', NULL, '1601008258-em329.png'),
(15, 'CHARMANDER', 'char@admin.com', NULL, 'password', NULL, '2020-09-21 00:49:41', '2020-09-21 00:49:41', NULL, 'camputhaw', NULL, '1600678181em330.png'),
(17, 'bnb', 'bnb@gmail.com', NULL, '$2y$10$R8ZOfAXe1jXseF7.35075.bWRmjnUxlOmqm20z3FyBkJp..y9LpqK', 'LDHvBLIfAxJC3EQdd5K0gHhNMF9H8fYDlUlS43tHwTCBrjlI8WxPaYBmE0hP', '2020-10-20 23:22:39', '2020-10-20 23:22:39', NULL, NULL, NULL, NULL),
(18, 'rocknlee', 'rocknlee@gmail.com', NULL, '$2y$10$.dm3dE/HX.EqiDjoPXR6ceDDrdLIZ6HJcBQ..93qrYR6sry9T3NN2', '0HKAffnzcsPfzJVtAMN9UHTy5L887l3aSShIlJIBUPnmYBHqDjWMMaR4oX6B', '2020-10-20 23:24:55', '2020-10-20 23:24:55', NULL, NULL, NULL, NULL),
(19, 'knm', 'knm@gmail.com', NULL, '$2y$10$zttT3ofA7Lqn5E/669zGM.aVIc0F/AlOSsC185ZOEwXEDLnbRiwt.', 'yGOhhgHhxkdnqPmwocs22WWiK48ySFuEMsteg41O3kseQg3eorwmYeq7BmsG', '2020-10-20 23:29:20', '2020-10-20 23:29:20', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_geolocations`
--

CREATE TABLE `user_geolocations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_geolocations`
--

INSERT INTO `user_geolocations` (`id`, `user_id`, `ip_address`, `country_name`, `currency`, `created_at`, `updated_at`) VALUES
(1, 17, '49.147.192.252', 'Philippines', 'PHP', '2020-10-20 23:22:39', '2020-10-20 23:22:39'),
(2, 18, '49.147.192.252', 'Philippines', 'PHP', '2020-10-20 23:24:55', '2020-10-20 23:24:55'),
(3, 19, '127.0.0.1', 'United States', 'USD', '2020-10-20 23:29:20', '2020-10-20 23:29:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_geolocations`
--
ALTER TABLE `user_geolocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_geolocations_user_id_index` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_geolocations`
--
ALTER TABLE `user_geolocations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_geolocations`
--
ALTER TABLE `user_geolocations`
  ADD CONSTRAINT `user_geolocations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
