-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2020 at 03:50 AM
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
(1, 'root', 'root', '5C3CD6BECF2A8B5EDC93BDADFF5FE62B873BB5AE18FBDBC08A03057348CCE3FD', '0935260404', 'tanapon.se.game@gmail.com', NULL, '2019-08-15 14:41:37', 'BE6A07C97957B10F23070BC53E67BAE5A90A8DA5DE0D08D749372FD2AA5CC3B1', 2),
(2, 'Thanapon Puechnukul', 'cegamessssss', '1675BC07C25C01D629B2D37FEE341B40E12958A0061E205FB34519499D7C92C8', '0817682626', 'tanapon.game@gmail.com', 1, '2019-10-28 18:11:15', '8E126832515D36B89E3CFE17F9BFD3A54B31FF9B01CF2576792387D3F2B530DC', 1);

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
(3, 'Game', '0812601037', NULL, 7, 1, '2020-01-08 11:21:36', '244,0'),
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
(1, 2, 1, 1, '1,4', 55, 1, 1, '2020-03-08 14:39:44', 'Espresso(fepp)/ less sweet/ Banana zyrup'),
(2, 2, 1, 10, '', 30, 1, 1, '2020-03-08 14:39:44', 'Red Velvet Cake'),
(3, 2, 1, 8, '2', 55, 1, 1, '2020-03-08 14:39:44', 'Green Curry/ Omelet');

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
(1, 'Espresso', 1, '35,40,50', NULL, 1, '2019-08-15 14:45:01'),
(2, 'Late', 1, '35,40,50', NULL, 1, '2019-08-15 14:45:21'),
(3, 'Fried Basil', 2, '45', NULL, 1, '2019-08-15 14:45:40'),
(4, 'Chocolate Cake', 3, '25', NULL, 1, '2019-08-15 14:45:56'),
(6, 'Cappuccino', 1, '35,40,50', NULL, 1, '2019-11-20 14:29:42'),
(7, 'Mocha', 1, '35,40,50', NULL, 1, '2020-01-19 16:29:40'),
(8, 'Green Curry', 2, '45', NULL, 1, '2020-01-19 16:40:44'),
(9, 'Fried Rice', 2, '45', NULL, 1, '2020-01-19 16:40:44'),
(10, 'Red Velvet Cake', 3, '30', NULL, 1, '2020-01-19 16:46:04'),
(13, 'Thai Coffee', 1, '35,40,50', NULL, 1, '2020-03-08 14:23:05'),
(14, 'Chocano', 1, '35,40,50', NULL, 1, '2020-03-08 14:23:05'),
(15, 'Milk Tea', 1, '30,35,45', NULL, 1, '2020-03-08 14:29:45'),
(16, 'Milk Green Tea', 1, '30,35,45', NULL, 1, '2020-03-08 14:29:45'),
(17, 'ChocMilk Tea', 1, '30,40,50', NULL, 1, '2020-03-08 14:29:45'),
(18, 'Peach Tea', 1, '30,35,45', NULL, 1, '2020-03-08 14:29:45'),
(19, 'Massa man', 2, '45', NULL, 1, '2020-03-08 14:34:46');

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
(1, 'less sweet', 0, 1, '2019-08-19 14:10:56'),
(2, 'more sweet', 0, 1, '2019-08-19 15:54:51'),
(3, 'not sweet', 0, 1, '2019-11-20 14:31:34'),
(4, 'Banana zyrup', 5, 1, '2019-11-20 14:31:34'),
(5, 'Caramel zyrup', 5, 1, '2019-11-20 14:31:34'),
(6, 'Vanilla zyrup', 5, 1, '2020-03-08 14:25:14'),
(7, 'White choc zyrup', 5, 1, '2020-03-08 14:25:14'),
(8, 'Hazelnut zyrup', 5, 1, '2020-03-08 14:26:41'),
(9, 'Coffee Shot', 15, 1, '2020-03-08 14:26:41');

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
(1, 'Fried Egg', 10, 1, '2019-09-09 16:46:41'),
(2, 'Omelet', 10, 1, '2019-09-09 16:49:59');

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
(1, 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `item_type`
--
ALTER TABLE `item_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mod_bev`
--
ALTER TABLE `mod_bev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
