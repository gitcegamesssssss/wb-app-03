-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2020 at 04:22 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wbdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `mod_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `token` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`id`, `name`, `username`, `hash`, `tel`, `email`, `agent_id`, `mod_date`, `token`, `type`) VALUES
(1, 'root', 'root', '5C3CD6BECF2A8B5EDC93BDADFF5FE62B873BB5AE18FBDBC08A03057348CCE3FD', '0935260404', 'tanapon.se.game@gmail.com', NULL, '2019-08-15 14:41:37', '25EAAD4D5F965D6F86FBB78C7E0DC73FCED7952D5A7CADB6FB7FEC0A0343F8BA', 2),
(2, 'Thanapon Puechnukul', 'cegamessssss', '1675BC07C25C01D629B2D37FEE341B40E12958A0061E205FB34519499D7C92C8', '0817682626', 'tanapon.game@gmail.com', 1, '2019-10-28 18:11:15', 'A198BF8967D3D3231A874BEFD2175ADD57362629EB299A19AB360E8C09D6291A', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `point` int(11) DEFAULT '0',
  `agent_id` int(11) NOT NULL,
  `mod_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `discount` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `tel`, `email`, `point`, `agent_id`, `mod_date`, `discount`) VALUES
(1, 'GUEST', '0', NULL, 0, 1, '2019-08-15 14:48:57', '0'),
(3, 'Game', '0812601037', NULL, 10, 1, '2020-01-08 11:21:36', '0'),
(4, 'Kaew', '0854599693', NULL, 10, 1, '2020-01-08 11:22:25', '0');

-- --------------------------------------------------------

--
-- Table structure for table `done_trans`
--

CREATE TABLE `done_trans` (
  `id` int(11) NOT NULL,
  `order_id` int(255) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `mod_item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abs_cost` float NOT NULL,
  `unit` int(11) DEFAULT '1',
  `agent_id` int(11) NOT NULL,
  `add_date` datetime DEFAULT NULL,
  `item_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `done_trans`
--

INSERT INTO `done_trans` (`id`, `order_id`, `cus_id`, `item_id`, `mod_item`, `abs_cost`, `unit`, `agent_id`, `add_date`, `item_details`) VALUES
(32, 143, 3, 1, '', 30, 1, 1, '2020-01-09 12:09:36', 'bev_01(hot)'),
(33, 144, 3, 1, '', 30, 1, 1, '2020-01-10 23:09:36', 'bev_01(hot)'),
(34, 146, 3, 6, '1,3', 50, 2, 1, '2020-01-10 12:59:25', 'mocha(ice)/ vanilla syrup/ less sweet'),
(35, 146, 3, 3, '', 45, 1, 1, '2020-01-10 12:59:25', 'dish_01'),
(36, 147, 1, 4, '', 25, 1, 1, '2020-01-10 16:07:27', 'snack_01'),
(37, 148, 1, 1, '', 30, 1, 1, '2020-01-11 10:28:15', 'bev_01(hot)'),
(38, 148, 1, 1, '', 30, 1, 1, '2020-01-11 10:28:15', 'bev_01(hot)'),
(39, 148, 1, 3, '', 45, 1, 1, '2020-01-11 10:28:15', 'dish_01'),
(40, 149, 1, 1, '', 30, 1, 1, '2020-01-11 10:29:30', 'bev_01(hot)'),
(41, 150, 1, 3, '', 45, 1, 1, '2020-01-11 10:29:42', 'dish_01'),
(42, 150, 1, 6, '1,3', 50, 2, 1, '2020-01-11 10:29:42', 'mocha(ice)/ vanilla syrup/ less sweet'),
(43, 151, 1, 4, '', 25, 1, 1, '2020-01-11 10:30:03', 'snack_01'),
(44, 152, 1, 1, '', 30, 1, 1, '2020-01-11 12:37:03', 'bev_01(hot)'),
(45, 152, 1, 1, '', 30, 1, 1, '2020-01-11 12:37:03', 'bev_01(hot)'),
(46, 152, 1, 1, '', 30, 1, 1, '2020-01-11 12:37:03', 'bev_01(hot)'),
(47, 152, 1, 1, '', 30, 1, 1, '2020-01-11 12:37:03', 'bev_01(hot)'),
(48, 152, 1, 1, '', 30, 1, 1, '2020-01-11 12:37:03', 'bev_01(hot)'),
(49, 152, 1, 1, '', 30, 1, 1, '2020-01-11 12:37:03', 'bev_01(hot)'),
(50, 152, 1, 1, '', 30, 1, 1, '2020-01-11 12:37:03', 'bev_01(hot)'),
(51, 152, 1, 1, '', 30, 1, 1, '2020-01-11 12:37:03', 'bev_01(hot)'),
(52, 152, 1, 1, '', 30, 1, 1, '2020-01-11 12:37:03', 'bev_01(hot)'),
(53, 153, 3, 1, '', 30, 1, 2, '2020-01-11 16:58:54', 'bev_01(hot)'),
(54, 154, 4, 3, '', 45, 1, 2, '2020-01-11 16:59:10', 'dish_01'),
(55, 154, 4, 3, '', 45, 1, 2, '2020-01-11 16:59:10', 'dish_01'),
(56, 155, 1, 1, '', 30, 1, 1, '2020-01-13 09:40:31', 'bev_01(hot)'),
(57, 155, 1, 3, '', 45, 1, 1, '2020-01-13 09:40:31', 'dish_01'),
(58, 155, 1, 4, '', 25, 2, 1, '2020-01-13 09:40:31', 'snack_01'),
(59, 156, 4, 4, '', 25, 1, 1, '2020-01-13 09:40:57', 'snack_01'),
(60, 156, 4, 4, '', 25, 1, 1, '2020-01-13 09:40:57', 'snack_01'),
(61, 159, 3, 4, '', 25, 1, 1, '2020-01-13 09:45:43', 'snack_01'),
(62, 160, 1, 6, '3', 45, 2, 1, '2020-01-14 13:41:02', 'mocha(ice)/ less sweet'),
(63, 161, 1, 1, '', 30, 1, 1, '2020-01-14 16:11:05', 'bev_01(hot)'),
(64, 163, 1, 4, '', 25, 1, 1, '2020-01-14 16:14:06', 'snack_01'),
(65, 164, 1, 1, '', 30, 1, 1, '2020-01-15 13:21:59', 'bev_01(hot)'),
(66, 164, 1, 1, '', 30, 1, 1, '2020-01-15 13:21:59', 'bev_01(hot)'),
(67, 165, 3, 6, '3', 45, 2, 1, '2020-01-19 14:05:50', 'mocha(ice)/ less sweet'),
(68, 165, 3, 1, '1,5', 35, 1, 1, '2020-01-19 14:05:50', 'bev_01(hot)/ vanilla syrup/ not sweet'),
(69, 165, 3, 3, '1,2', 55, 3, 1, '2020-01-19 14:05:50', 'dish_01/ mod_dish01/ mod_dish02'),
(70, 166, 1, 1, '', 30, 1, 1, '2020-01-19 14:06:42', 'bev_01(hot)'),
(71, 167, 1, 4, '', 25, 1, 1, '2020-01-19 14:49:11', 'snack_01'),
(72, 168, 1, 2, '', 25, 1, 1, '2020-01-19 15:09:42', 'bev_02(hot)'),
(73, 169, 1, 6, '', 30, 2, 1, '2020-01-19 16:07:53', 'mocha(hot)'),
(74, 170, 1, 2, '', 25, 1, 1, '2020-01-19 16:27:08', 'bev_02(hot)'),
(75, 171, 1, 7, '1,3', 35, 1, 1, '2020-01-19 16:30:09', 'late(hot)/ vanilla syrup/ less sweet'),
(76, 172, 1, 8, '1', 55, 1, 1, '2020-01-19 16:41:15', 'dish_02/ mod_dish01'),
(77, 172, 1, 9, '1', 55, 2, 1, '2020-01-19 16:41:15', 'dish_03/ mod_dish01'),
(78, 173, 1, 4, '', 25, 2, 1, '2020-01-19 16:48:57', 'snack_01'),
(79, 173, 1, 10, '', 15, 2, 1, '2020-01-19 16:48:57', 'snack_02'),
(80, 173, 1, 11, '', 30, 4, 1, '2020-01-19 16:48:57', 'snack_03'),
(81, 174, 1, 12, '', 15, 1, 1, '2020-01-19 18:11:38', 'snack_04'),
(82, 175, 1, 3, '', 45, 5, 1, '2020-01-19 18:19:12', 'dish_01'),
(83, 176, 3, 1, '4', 60, 1, 1, '2020-01-24 06:16:21', 'bev_01(fepp)/ more sweet'),
(84, 177, 1, 6, '', 30, 1, 1, '2020-01-24 09:17:20', 'mocha(hot)'),
(85, 177, 1, 3, '', 45, 1, 1, '2020-01-24 12:17:20', 'dish_01'),
(86, 177, 1, 7, '', 30, 1, 1, '2020-01-24 08:17:20', 'late(hot)'),
(87, 177, 1, 4, '', 25, 1, 1, '2020-01-24 12:17:20', 'snack_01'),
(88, 178, 1, 12, '', 15, 2, 1, '2020-01-24 12:17:56', 'snack_04'),
(89, 179, 1, 1, '', 30, 2, 1, '2020-01-24 13:19:04', 'bev_01(hot)'),
(90, 180, 1, 6, '3', 45, 4, 1, '2020-01-24 15:00:00', 'mocha(ice)/ less sweet'),
(91, 181, 1, 1, '', 30, 1, 1, '2020-01-26 18:43:10', 'bev_01(hot)'),
(92, 182, 3, 6, '', 30, 1, 1, '2020-01-26 18:44:30', 'mocha(hot)'),
(93, 183, 1, 3, '', 45, 1, 1, '2020-01-26 18:58:06', 'dish_01'),
(94, 183, 1, 4, '', 25, 1, 1, '2020-01-26 18:58:06', 'snack_01'),
(95, 184, 1, 1, '1', 35, 1, 1, '2020-01-26 18:58:26', 'bev_01(hot)/ vanilla syrup'),
(96, 185, 1, 7, '', 30, 1, 1, '2020-01-26 19:26:59', 'late(hot)'),
(97, 185, 1, 2, '', 25, 1, 1, '2020-01-26 19:26:59', 'bev_02(hot)'),
(98, 186, 1, 8, '', 45, 1, 1, '2020-01-26 19:27:28', 'dish_02'),
(99, 186, 1, 9, '', 45, 1, 1, '2020-01-26 19:27:28', 'dish_03'),
(100, 187, 1, 3, '', 45, 3, 1, '2020-01-26 19:30:52', 'dish_01'),
(101, 204, 1, 1, '', 30, 1, 1, '2020-01-26 20:35:20', 'bev_01(hot)'),
(102, 204, 1, 1, '', 30, 1, 1, '2020-01-26 20:35:20', 'bev_01(hot)'),
(103, 204, 1, 1, '', 30, 1, 1, '2020-01-26 20:35:20', 'bev_01(hot)'),
(104, 214, 1, 1, '', 30, 1, 1, '2020-01-28 16:30:12', 'bev_01(hot)'),
(105, 214, 1, 3, '', 45, 1, 1, '2020-01-28 16:30:12', 'dish_01'),
(106, 214, 1, 4, '', 25, 2, 1, '2020-01-28 16:30:12', 'snack_01'),
(107, 215, 3, 1, '', 30, 1, 1, '2020-01-29 14:18:10', 'bev_01(hot)'),
(108, 215, 3, 6, '4', 45, 1, 1, '2020-01-29 14:18:10', 'mocha(ice)/ more sweet'),
(109, 215, 3, 8, '1', 55, 2, 1, '2020-01-29 14:18:10', 'dish_02/ mod_dish01'),
(110, 215, 3, 11, '', 30, 1, 1, '2020-01-29 14:18:10', 'snack_03'),
(111, 217, 1, 1, '', 60, 7, 1, '2020-01-31 17:12:55', 'bev_01(fepp)'),
(112, 218, 1, 1, '', 30, 1, 1, '2020-02-02 12:57:15', 'bev_01(hot)'),
(113, 218, 1, 1, '', 30, 1, 1, '2020-02-02 12:57:15', 'bev_01(hot)'),
(114, 221, 1, 7, '1', 50, 1, 2, '2020-02-02 14:41:23', 'late(ice)/ vanilla syrup');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_type` int(11) NOT NULL,
  `cost` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `agent_id` int(11) NOT NULL,
  `mod_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `item_type`, `cost`, `supplier_id`, `agent_id`, `mod_date`) VALUES
(1, 'bev_01', 1, '30,45,60', NULL, 1, '2019-08-15 14:45:01'),
(2, 'bev_02', 1, '25,30,45', NULL, 1, '2019-08-15 14:45:21'),
(3, 'dish_01', 2, '45', NULL, 1, '2019-08-15 14:45:40'),
(4, 'snack_01', 3, '25', NULL, 1, '2019-08-15 14:45:56'),
(6, 'mocha', 1, '30,45,55', NULL, 1, '2019-11-20 14:29:42'),
(7, 'late', 1, '30,45,55', NULL, 1, '2020-01-19 16:29:40'),
(8, 'dish_02', 2, '45', NULL, 1, '2020-01-19 16:40:44'),
(9, 'dish_03', 2, '45', NULL, 1, '2020-01-19 16:40:44'),
(10, 'snack_02', 3, '15', NULL, 1, '2020-01-19 16:46:04'),
(11, 'snack_03', 3, '30', NULL, 1, '2020-01-19 16:46:04'),
(12, 'snack_04', 3, '15', NULL, 1, '2020-01-19 18:11:27');

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE `item_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `agent_id` int(11) NOT NULL,
  `mod_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`id`, `name`, `agent_id`, `mod_date`) VALUES
(1, 'bev', 1, '2019-08-15 14:44:04'),
(2, 'dish', 1, '2019-08-15 14:44:04'),
(3, 'snack', 1, '2019-08-15 14:44:04');

-- --------------------------------------------------------

--
-- Table structure for table `mod_bev`
--

CREATE TABLE `mod_bev` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cost` float NOT NULL,
  `agent_id` int(11) NOT NULL,
  `mod_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mod_bev`
--

INSERT INTO `mod_bev` (`id`, `name`, `cost`, `agent_id`, `mod_date`) VALUES
(1, 'vanilla syrup', 5, 1, '2019-08-19 14:10:56'),
(2, 'hazelnut syrup', 10, 1, '2019-08-19 15:54:51'),
(3, 'less sweet', 0, 1, '2019-11-20 14:31:34'),
(4, 'more sweet', 0, 1, '2019-11-20 14:31:34'),
(5, 'not sweet', 0, 1, '2019-11-20 14:31:34');

-- --------------------------------------------------------

--
-- Table structure for table `mod_dish`
--

CREATE TABLE `mod_dish` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cost` float NOT NULL,
  `agent_id` int(11) NOT NULL,
  `mod_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mod_dish`
--

INSERT INTO `mod_dish` (`id`, `name`, `cost`, `agent_id`, `mod_date`) VALUES
(1, 'mod_dish01', 10, 1, '2019-09-09 16:46:41'),
(2, 'mod_dish02', 0, 1, '2019-09-09 16:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `proc_trans`
--

CREATE TABLE `proc_trans` (
  `id` int(11) NOT NULL,
  `order_id` int(255) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `mod_item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abs_cost` float NOT NULL,
  `unit` int(11) DEFAULT '1',
  `work_stat` int(11) DEFAULT '0',
  `agent_id` int(11) NOT NULL,
  `add_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `item_details` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `cur_order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `cur_order_id`) VALUES
(1, 231);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_id` int(11) NOT NULL,
  `mod_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `done_trans`
--
ALTER TABLE `done_trans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_type` (`item_type`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `item_type`
--
ALTER TABLE `item_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `mod_bev`
--
ALTER TABLE `mod_bev`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `mod_dish`
--
ALTER TABLE `mod_dish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `proc_trans`
--
ALTER TABLE `proc_trans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `done_trans`
--
ALTER TABLE `done_trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `item_type`
--
ALTER TABLE `item_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mod_bev`
--
ALTER TABLE `mod_bev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mod_dish`
--
ALTER TABLE `mod_dish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proc_trans`
--
ALTER TABLE `proc_trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agent`
--
ALTER TABLE `agent`
  ADD CONSTRAINT `agent_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

--
-- Constraints for table `done_trans`
--
ALTER TABLE `done_trans`
  ADD CONSTRAINT `done_trans_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `done_trans_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `done_trans_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`item_type`) REFERENCES `item_type` (`id`),
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `items_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

--
-- Constraints for table `item_type`
--
ALTER TABLE `item_type`
  ADD CONSTRAINT `item_type_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

--
-- Constraints for table `mod_bev`
--
ALTER TABLE `mod_bev`
  ADD CONSTRAINT `mod_bev_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

--
-- Constraints for table `mod_dish`
--
ALTER TABLE `mod_dish`
  ADD CONSTRAINT `mod_dish_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

--
-- Constraints for table `proc_trans`
--
ALTER TABLE `proc_trans`
  ADD CONSTRAINT `proc_trans_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `proc_trans_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `proc_trans_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
