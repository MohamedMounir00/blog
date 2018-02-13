-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2018 at 09:50 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `cats`
--

CREATE TABLE `cats` (
  `id` int(10) UNSIGNED NOT NULL,
  `cat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dec` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cats`
--

INSERT INTO `cats` (`id`, `cat`, `dec`, `created_at`, `updated_at`) VALUES
(1, 'mohamed', 'vvvvvvvvvvvvvvvbf ', NULL, NULL),
(2, 'asi', 'bbbbbbbbbbbbbbb', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coments`
--

CREATE TABLE `coments` (
  `id` int(10) UNSIGNED NOT NULL,
  `posts_id` int(11) NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coments`
--

INSERT INTO `coments` (`id`, `posts_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 7, ' السلام عليكم ورحمه الله وبركاته', NULL, NULL),
(2, 8, 'nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn', NULL, NULL),
(3, 7, 'hjgggggg', '2018-01-04 20:07:29', '2018-01-04 20:07:29'),
(4, 7, 'mmmmmmmmmmmmmmmmmmm', '2018-01-04 20:07:37', '2018-01-04 20:07:37'),
(5, 7, ',,,,', '2018-01-04 20:07:49', '2018-01-04 20:07:49');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `posts_id` int(11) NOT NULL,
  `like` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `posts_id`, `like`, `created_at`, `updated_at`) VALUES
(3, 2, 7, 1, NULL, NULL),
(4, 2, 9, 0, NULL, NULL),
(5, 3, 10, 1, NULL, NULL),
(6, 3, 8, 0, NULL, NULL),
(7, 3, 7, 0, NULL, NULL),
(15, 1, 10, 1, '2018-01-09 07:49:25', '2018-01-09 07:49:25'),
(60, 1, 7, 1, '2018-01-09 09:08:55', '2018-01-09 09:08:55'),
(64, 1, 9, 1, '2018-01-09 09:21:50', '2018-01-09 09:21:50'),
(65, 1, 8, 1, '2018-01-09 09:22:20', '2018-01-09 09:22:20');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_01_02_190948_create_posts_table', 1),
(4, '2018_01_02_225559_add_url_to_posts', 2),
(5, '2018_01_03_204155_create_coments_table', 3),
(6, '2018_01_05_183246_create_cats_table', 4),
(7, '2018_01_05_183830_add_cat_to_posts', 5),
(8, '2018_01_08_051609_create_roles_table', 6),
(9, '2018_01_08_052111_create_user_role_table', 7),
(10, '2018_01_09_045957_create_likes_table', 8),
(11, '2018_01_10_052054_create_sattings_table', 9);

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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created_at`, `updated_at`, `url`, `cat_id`) VALUES
(7, 'sara', 'Stay up to date on the development of Bootstrap and reach out to the community with these helpful resources.', '2018-01-02 19:16:58', '2018-01-02 19:16:58', '', 1),
(8, 'lena', 'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', '2018-01-02 21:41:19', '2018-01-02 21:41:19', '1514936479.jpg', 2),
(9, 'test', 'Database tables are often related to one another. For example, a blog post may have many comments, or an order could be related to the user who placed it. Eloquent makes managing and working with these relationships easy, and supports several different types of relationships:', '2018-01-09 03:09:47', '2018-01-09 03:09:47', '1515474587.jpg', 1),
(10, 'bmw 2017', 'Eloquent relationships are defined as methods on your Eloquent model classes. Since, like Eloquent models themselves, relationships also serve as powerful query builders, defining relationships as methods provides powerful method chaining and querying capabilities. For example, we may chain additional constraints on this posts relationship:', '2018-01-09 03:10:29', '2018-01-09 03:10:29', '1515474629.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dec` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `dec`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'this is admin have all roles', NULL, NULL),
(2, 'Editor', 'have a some rloes', NULL, NULL),
(3, 'user', 'no have a rols', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sattings`
--

CREATE TABLE `sattings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sattings`
--

INSERT INTO `sattings` (`id`, `name`, `value`, `desc`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'stop_comment', '1', '', 1, NULL, '2018-01-10 04:05:36'),
(2, 'stop_regster', '0', '', 1, NULL, '2018-01-10 04:05:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'mohamed', 'mohamedmounir703@gmail.com', '$2y$10$vL6SUS5xSNfgu0GNQkDHMeWELBvvoI9VdeTnuCZ9.VgL37obry3hG', 'Xx8FnQ9BqITB6dGr0R62ssiEcyOyVqZuGSH0CiOsfnazraInEzxYnkFGXIBZ', '2018-01-06 19:13:44', '2018-01-06 19:13:44'),
(2, 'lena', 'lena@gmail.com', '$2y$10$3lse.Gl7r2XSa2.z3Yi1uuEWkjpUbG24qPmln5eXoe7xaKn0ZdiYK', 'mbqP2fIYQs0qJ2WYJjlYAoZJ6XJpvRU8xRQlXGhY4eH98RjqnLMt4Bdg8dwu', '2018-01-08 03:39:14', '2018-01-08 03:39:14'),
(3, 'sara', 'sara@gmail.com', '$2y$10$24aU37PHKCKD6E/DLr8Aw.YsRx47Fu/mac1QIWEPLQYyUpDjulFka', 'rbE6gf4L2pIyE3VdKw1BwAlrcJyRVtVYQz3iR19kenmMIYYlvCcBwH0laIZZ', '2018-01-08 03:40:01', '2018-01-08 03:40:01'),
(9, 'asi', 'asi@gmail.com', '$2y$10$z/QBPnitI4lolWZKOVOUguhg5353LIf6tADjBunaiIpNkpDfWvxRK', 'isUQdzGrOma5dyUvYIqvzSUZmD3sX6Itl09XnCS8wXYMaueIb55FL64aRtzR', '2018-01-08 05:20:34', '2018-01-08 05:20:34'),
(10, 'admin', 'admin@gmail.com', '$2y$10$NvrpBYRFcirCFPzHrpTbMOl6qVa10OYibiQ.43Sya9bzy6yKpXlbi', 'r824ZMcKI8FiPzH68MeeLH7H4ai3kOKHjs7lnXJRTnLpmTtmob5wVPc5R59L', '2018-01-08 06:53:45', '2018-01-08 06:53:45'),
(11, 'mmm', 'test@test.com', '123456', 'lZgUZngjseokkdIyWZNMFvW8PMWoKh7UYSn44nwZQySiZKB5GCZqOWlQTj0H', '2018-01-08 07:09:17', '2018-01-08 07:09:17'),
(12, 'mam', 'mam@m.com', '$2y$10$WKbmaFxR6/p2xd6uuAdXE.f/h2sPcZ3a2Xc8uODKZKJEYPaQF3HFW', 'gavqk6JEbp1tnt9irYdE1WsE6Vcr3VPTRAQUZlGZIjfGrzOswxMGNx6mtITc', '2018-01-08 07:32:34', '2018-01-08 07:32:34'),
(13, 'aa', 'aa@aa.com', '$2y$10$QiKJghxAg0tnM7jvPluxheUDNBXWaPfsbv7KD2CBQ5psNGmxF2Vl2', '5loYt8o0e7coOVxlW7t76CnZh6zjqcTEVHLHrVNGidIQ2qXTqTqFKHWl5RPA', '2018-01-08 07:35:25', '2018-01-08 07:35:25'),
(14, 'nn', 'nn@nn.com', '$2y$10$QoavYJjDG4xfWfJqxnJPvOQqV0jDJoBoJPzKACI32qjgr2Gun.9om', NULL, '2018-01-08 07:40:45', '2018-01-08 07:40:45'),
(15, 'bbb', 'ss@ss.com', '$2y$10$sM5LrVzunE5uIzGwWDemLOn1ybJ.SyCsnd6KyK.jKLxj5VGkMr31e', NULL, '2018-01-08 08:38:38', '2018-01-08 08:38:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES
(11, 9, 3),
(12, 9, 2),
(13, 10, 3),
(14, 11, 3),
(15, 1, 3),
(16, 1, 1),
(22, 2, 2),
(23, 2, 1),
(29, 3, 3),
(30, 3, 2),
(31, 3, 1),
(33, 12, 3),
(34, 12, 1),
(35, 13, 3),
(36, 14, 3),
(38, 15, 3),
(39, 15, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cats`
--
ALTER TABLE `cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coments`
--
ALTER TABLE `coments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sattings`
--
ALTER TABLE `sattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cats`
--
ALTER TABLE `cats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coments`
--
ALTER TABLE `coments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sattings`
--
ALTER TABLE `sattings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
