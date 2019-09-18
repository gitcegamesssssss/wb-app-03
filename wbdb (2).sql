-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2019 at 03:05 AM
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
  `tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `mod_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`id`, `name`, `tel`, `email`, `agent_id`, `mod_date`) VALUES
(1, 'root', '0935260404', NULL, NULL, '2019-08-15 14:41:37');

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
  `mod_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `tel`, `email`, `point`, `agent_id`, `mod_date`) VALUES
(1, 'GUEST', '0935260404', NULL, NULL, 1, '2019-08-15 14:48:57');

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
  `add_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(4, 'snack_01', 3, '25', NULL, 1, '2019-08-15 14:45:56');

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
(1, 'mod_bev_01', 5, 1, '2019-08-19 14:10:56'),
(2, 'mod_bev_02', 10, 1, '2019-08-19 15:54:51');

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
(19, 1, 1, 1, '1,2', 45, 1, 0, 1, '2019-09-13 18:19:20', 'bev_01(hot)/ mod_bev_01/ mod_bev_02'),
(20, 1, 1, 3, NULL, 45, 1, 0, 1, '2019-09-13 18:19:20', 'dish_01'),
(21, 1, 1, 3, NULL, 45, 1, 0, 1, '2019-09-13 18:19:20', 'dish_01'),
(22, 2, 1, 1, NULL, 60, 1, 0, 1, '2019-09-13 18:19:41', 'bev_01(fepp)'),
(23, 2, 1, 4, NULL, 25, 1, 0, 1, '2019-09-13 18:19:41', 'snack_01'),
(24, 3, 1, 1, NULL, 30, 1, 0, 1, '2019-09-13 18:20:24', 'bev_01(hot)'),
(25, 3, 1, 3, '1,2', 110, 2, 0, 1, '2019-09-13 18:20:24', 'dish_01/ mod_dish01/ mod_dish02'),
(26, 3, 1, 4, NULL, 75, 3, 0, 1, '2019-09-13 18:20:24', 'snack_01'),
(27, 4, 1, 1, NULL, 30, 1, 0, 1, '2019-09-13 19:09:38', 'bev_01(hot)');

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
(1, 4);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `done_trans`
--
ALTER TABLE `done_trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `item_type`
--
ALTER TABLE `item_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mod_bev`
--
ALTER TABLE `mod_bev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mod_dish`
--
ALTER TABLE `mod_dish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proc_trans`
--
ALTER TABLE `proc_trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
