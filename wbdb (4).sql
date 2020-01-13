-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2020 at 03:56 AM
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
  `token` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`id`, `name`, `username`, `hash`, `tel`, `email`, `agent_id`, `mod_date`, `token`) VALUES
(1, 'root', 'root', '5C3CD6BECF2A8B5EDC93BDADFF5FE62B873BB5AE18FBDBC08A03057348CCE3FD', '0935260404', 'tanapon.se.game@gmail.com', NULL, '2019-08-15 14:41:37', '0FC655DFF9136D0D996F067F349BD0C71D3BBE4D7531D8A71E9ADEA4A480913F'),
(2, 'Thanapon Puechnukul', 'cegamessssss', '1675BC07C25C01D629B2D37FEE341B40E12958A0061E205FB34519499D7C92C8', '0817682626', 'tanapon.game@gmail.com', 1, '2019-10-28 18:11:15', '4D4DA8EC25D2FF4A61FA194CCA62305944514EA451811AA6C34016C4270E3C1C');

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
(1, 'GUEST', '0935260404', NULL, 0, 1, '2019-08-15 14:48:57', '0'),
(3, 'Game', '0812601037', NULL, 10, 1, '2020-01-08 11:21:36', '0'),
(4, 'Kaew', '0854599693', NULL, 0, 1, '2020-01-08 11:22:25', '0');

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
(61, 159, 3, 4, '', 25, 1, 1, '2020-01-13 09:45:43', 'snack_01');

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
(6, 'mocha', 1, '30,45,55', NULL, 1, '2019-11-20 14:29:42');

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

--
-- Dumping data for table `proc_trans`
--

INSERT INTO `proc_trans` (`id`, `order_id`, `cus_id`, `item_id`, `mod_item`, `abs_cost`, `unit`, `work_stat`, `agent_id`, `add_date`, `item_details`) VALUES
(2, 141, 3, 1, NULL, 30, 1, 0, 1, '2020-01-09 17:41:58', 'bev_01(hot)');

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
(1, 159);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
