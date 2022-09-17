-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2022 at 04:43 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node`
--

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `room_id` int(11) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user_id`, `room_id`, `message`) VALUES
(263, '6264074509', 10, 'jygh'),
(264, '6264074509', 10, 'scs'),
(265, '6264074509', 10, 'rhrd'),
(266, '6264074509', 10, 'jtrnt'),
(267, '6264074509', 10, 'drjrt'),
(268, '9589033187', 10, 'vsb fx'),
(269, '9589033187', 10, 'bd'),
(270, '6264074509', 10, 'f'),
(271, '6264074509', 11, 'hi'),
(272, '6264074509', 12, 'dv'),
(273, '6264074509', 13, 'b f'),
(274, '6264074509', 14, 'fndg'),
(275, '9584376325', 14, 'n f'),
(276, '6264074509', 14, 'ngn'),
(277, '6264074509', 10, 'bfbf'),
(278, '9589033187', 10, 'vsd'),
(279, '6264074509', 10, 'f df'),
(280, '9589033187', 15, 'dse'),
(281, '9584376325', 15, 'ss'),
(282, '9589033187', 15, 'sa s'),
(283, '9584376325', 15, 'svd'),
(284, '9589033187', 15, 'v'),
(285, '9589033187', 20, 'bfbfcg'),
(286, '9584376325', 20, 'bsbd'),
(287, '9589033187', 10, 'bdrbd'),
(288, '9584376325', 20, 'bf');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `postId` int(11) NOT NULL,
  `responseTo` int(11) DEFAULT NULL,
  `content` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `postId`, `responseTo`, `content`, `name`) VALUES
(33, 15, NULL, 'good bro', 'rahul'),
(34, 15, NULL, 'hi bhai', 'vijay'),
(35, 15, 33, 'thnx', 'badru'),
(36, 15, 35, 'menson not', 'rahul'),
(37, 15, 34, 'hi vijaye', 'aju'),
(38, 15, 34, 'ka bai', 'vijay'),
(39, 15, 38, 'kha hay', 'aju'),
(40, 15, 37, 'bye', 'shubham'),
(41, 15, NULL, 'oepifoew', 'wagesrf'),
(42, 15, 41, 'WAFSDV', 'jsodkb'),
(43, 15, NULL, 'szv', 'zsdv'),
(44, 15, 33, 'xdgbf', 'xdbf'),
(45, 15, 44, 'superman', 'dc'),
(46, 15, 33, 'batman', 'dc'),
(47, 17, NULL, 'done', 'badru'),
(48, 17, NULL, 'ok thx', 'yes'),
(49, 17, 47, 'con', 'rakesh'),
(50, 20, NULL, 'purchase', 'badru'),
(51, 20, NULL, 'done', 'rahul'),
(52, 20, 51, 'tnx', 'badru'),
(53, 20, NULL, 'done ', 'vijay'),
(54, 20, 50, 'frt', 'an'),
(55, 33, NULL, 'huk', 'banner'),
(56, 33, 55, 'thor', 'lool'),
(57, 33, 55, 'thor', 'lool'),
(58, 33, 57, 'kjg', 'kjhg'),
(59, 33, NULL, 'kjgukvj', 'kjyjhkbhj'),
(60, 33, 59, 'jhfu', ',jjk'),
(61, 33, 55, 'bjkb', ',bkjln'),
(62, 38, NULL, 'dhoom', 'badru'),
(63, 38, 62, 'dhoom 2', 'arman'),
(64, 38, 62, 'kya huwa', 'rahul'),
(65, 38, NULL, 'thid to ha', 'vijay'),
(66, 32, NULL, 'done', 'hulk'),
(67, 32, 66, 'what', 'thor'),
(68, 32, NULL, 'yes ', 'ironman'),
(69, 27, NULL, 'good', 'badru'),
(70, 27, 69, 'thx', 'arman'),
(71, 27, 70, 'ok', 'badru'),
(72, 27, NULL, 'yoo', 'shoib');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `contact_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `user_id`, `contact_id`) VALUES
(39, 'Oggy', '6264074509', '9589033187'),
(40, 'Badru', '9589033187', '6264074509'),
(46, 'anam', '6264074509', '9584376325'),
(47, 'Arman', '9584376325', '6264074509'),
(54, 'casz', '9589033187', '9584376325'),
(55, 'Kapil', '9584376325', '9589033187');

-- --------------------------------------------------------

--
-- Table structure for table `crud`
--

CREATE TABLE `crud` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `des` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `des`, `image`) VALUES
(15, 'Apple', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js', '339.jpg'),
(17, 'Honda', 'Multer will process only those form which are multipart (multipart/form-data). So whenever you use multer, make sure you put multipart in form.', 'rm373batch16-52.jpg'),
(19, 'Mahindra', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', '21770.jpg'),
(20, 'Hitachi', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', '10e2840b-af0d-46b5-9bdd-9c0ed8fecaca.avif'),
(21, 'Google', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js', '3456488.png'),
(22, 'Noick', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js', 'istockphoto-1209051929-2048x2048.jpg'),
(23, 'Mango', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js', 'young-male-doctor-specialist-looking-ray-scan-isolated-white-background-185396452.jpg'),
(24, 'Messi', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', 'scan-01.png'),
(25, 'Virat', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', '3landers-doodle-character-nfts-web-3-nft-avatar-registered-on-smart-contract-cute-colorful-art-collectibles-cartoon-vector-illustration-2HXCN8P.jpg'),
(26, 'Moon', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', '01-photoshop-pixel-art.jpg'),
(27, 'Zombi', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', 'bored_ape_hack_opensea_large_1645512277876.webp'),
(28, 'Thor', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', 'armed-forces-ukraine-ukrainian-armed-forces-ukraine-ukrainian-soldier-ukrainian-army-ukrainian-flag-military-uniform-242938916.jpg'),
(29, 'Batman', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', 'desktop-screen-mockup_157104-639.webp'),
(30, 'Spiderman', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', 'seascape-zombie-nft-binance-1280x720.jpg'),
(32, 'Superman', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', 'bnrdc2.0.png'),
(33, 'Hulk', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', 'bnr-01.png'),
(35, 'Toystory', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', 'quiz.png'),
(36, 'Line King', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', 'follow-ups.png'),
(37, 'Dani Daniel', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', 'conjuringscreen0.jpg'),
(38, 'Gia Paige', 'After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.After that, you can just create a folder and add a file for example index.js, To run this file you need to run the following command.', 'dhoom3screen5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `left_side` varchar(255) NOT NULL,
  `right_side` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `left_side`, `right_side`) VALUES
(10, '6264074509', '9589033187'),
(14, '6264074509', '9584376325'),
(20, '9589033187', '9584376325');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`) VALUES
(1, 'badru', '6264074509'),
(2, 'Arman', '9589033187'),
(3, 'ankita', '9584376325');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crud`
--
ALTER TABLE `crud`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `crud`
--
ALTER TABLE `crud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
