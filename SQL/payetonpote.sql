-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 01, 2019 at 06:55 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payetonpote`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

CREATE TABLE `campaign` (
  `id` varchar(32) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `goal` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaign`
--

INSERT INTO `campaign` (`id`, `title`, `content`, `created_at`, `updated_at`, `goal`, `name`) VALUES
('3a1e34e2d667d24a03ebfae2593a344b', 'Hell Fest Apero', 'Apero Music Metal ect...', NULL, NULL, 600, 'Xavier'),
('dd65bda13f6f9ecd861c5cc18826276a', 'Apero BBQ', 'Apero BBQ la total on se met bien', NULL, NULL, 1850, 'Cedric');

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `campaign_id` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`id`, `name`, `email`, `campaign_id`) VALUES
(1, 'Xavier', 'xavier@gmail.com', '3a1e34e2d667d24a03ebfae2593a344b'),
(2, 'Nico', 'nico@gmail.com', '3a1e34e2d667d24a03ebfae2593a344b'),
(3, 'Axel', 'axel@gmail.com', '3a1e34e2d667d24a03ebfae2593a344b'),
(4, 'Cedric', 'Cedric@gmail.com', '3a1e34e2d667d24a03ebfae2593a344b'),
(5, 'Kylian', 'Kilyan@gmail.com', '3a1e34e2d667d24a03ebfae2593a344b'),
(6, 'Alex', 'alex@gmal.com', '3a1e34e2d667d24a03ebfae2593a344b'),
(8, 'Rodrigues', 'rodrigues@gmal.com', '3a1e34e2d667d24a03ebfae2593a344b'),
(9, 'azerty', 'azert@ty.fr', 'dd65bda13f6f9ecd861c5cc18826276a');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `participant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `amount`, `created_at`, `updated_at`, `participant_id`) VALUES
(1, 15, NULL, NULL, 1),
(2, 25, NULL, NULL, 2),
(5, 60, NULL, NULL, 3),
(6, 200, NULL, NULL, 4),
(7, 25, NULL, NULL, 5),
(8, 10, NULL, NULL, 6),
(10, 15, NULL, NULL, 8),
(11, 250, NULL, NULL, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_participant_campaign1_idx` (`campaign_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payment_participant1_idx` (`participant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `fk_participant_campaign1_idx` FOREIGN KEY (`campaign_id`) REFERENCES `campaign` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_participant1` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
