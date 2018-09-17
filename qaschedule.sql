-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2018 at 03:55 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qaschedule`
--

-- --------------------------------------------------------

--
-- Table structure for table `consultants`
--

CREATE TABLE `consultants` (
  `consultant_id` int(6) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultants`
--

INSERT INTO `consultants` (`consultant_id`, `name`, `group_id`) VALUES
(1, 'Trainer 1', 1),
(2, 'Trainer 2', 1),
(3, 'Trainer 3', 1),
(4, 'Trainer 4', 1),
(5, 'Trainer 5', 1),
(6, 'Trainer 6', 1),
(7, 'Trainer 7', 2),
(8, 'Trainer 8', 2),
(9, 'Trainer 9', 2),
(10, 'Trainer 10', 2);

-- --------------------------------------------------------

--
-- Table structure for table `group_information`
--

CREATE TABLE `group_information` (
  `group_id` int(6) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_information`
--

INSERT INTO `group_information` (`group_id`, `name`) VALUES
(1, 'BAE 1'),
(2, 'BAE 2'),
(3, 'BAE 3'),
(4, 'BAE 4'),
(5, 'BAE 5');

-- --------------------------------------------------------

--
-- Table structure for table `room_information`
--

CREATE TABLE `room_information` (
  `room_id` int(6) NOT NULL,
  `title` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_information`
--

INSERT INTO `room_information` (`room_id`, `title`, `capacity`) VALUES
(1, 'Room 1', 20),
(2, 'Room 2', 25),
(3, 'Room 3', 30),
(4, 'Room 4', 30);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(6) NOT NULL,
  `room_id` int(6) NOT NULL,
  `trainer_id` int(6) NOT NULL,
  `group_id` int(6) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `room_id`, `trainer_id`, `group_id`, `date`) VALUES
(1, 1, 1, 1, '2018-09-24');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(6) NOT NULL,
  `skill` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skill_id`, `skill`) VALUES
(1, 'Java'),
(2, 'SQL'),
(3, 'HTML');

-- --------------------------------------------------------

--
-- Table structure for table `trainer_information`
--

CREATE TABLE `trainer_information` (
  `trainer_id` int(6) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trainer_information`
--

INSERT INTO `trainer_information` (`trainer_id`, `name`) VALUES
(1, 'Shafeeq'),
(2, 'John');

-- --------------------------------------------------------

--
-- Table structure for table `trainer_skills`
--

CREATE TABLE `trainer_skills` (
  `trainer_id` int(6) NOT NULL,
  `skill_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trainer_skills`
--

INSERT INTO `trainer_skills` (`trainer_id`, `skill_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consultants`
--
ALTER TABLE `consultants`
  ADD PRIMARY KEY (`consultant_id`),
  ADD KEY `groups` (`group_id`);

--
-- Indexes for table `group_information`
--
ALTER TABLE `group_information`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `room_information`
--
ALTER TABLE `room_information`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `rooms1` (`room_id`),
  ADD KEY `trainers1` (`trainer_id`),
  ADD KEY `groups1` (`group_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `trainer_information`
--
ALTER TABLE `trainer_information`
  ADD PRIMARY KEY (`trainer_id`);

--
-- Indexes for table `trainer_skills`
--
ALTER TABLE `trainer_skills`
  ADD KEY `trainers` (`trainer_id`),
  ADD KEY `skills` (`skill_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trainer_information`
--
ALTER TABLE `trainer_information`
  MODIFY `trainer_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consultants`
--
ALTER TABLE `consultants`
  ADD CONSTRAINT `groups` FOREIGN KEY (`group_id`) REFERENCES `group_information` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `groups1` FOREIGN KEY (`group_id`) REFERENCES `group_information` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rooms1` FOREIGN KEY (`room_id`) REFERENCES `room_information` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `trainers1` FOREIGN KEY (`trainer_id`) REFERENCES `trainer_information` (`trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `trainer_skills`
--
ALTER TABLE `trainer_skills`
  ADD CONSTRAINT `skills` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `trainers` FOREIGN KEY (`trainer_id`) REFERENCES `trainer_information` (`trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
