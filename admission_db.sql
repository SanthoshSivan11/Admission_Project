-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2025 at 01:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admission_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `otp_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `name`, `email`, `otp`, `otp_expiry`) VALUES
(1, 'username', 'password', NULL, 'shuffysanthosh@gmail.com', '239883', '2025-06-22 11:16:14'),
(2, 'santhosh', 'sivan', 'Santhosh', 'shuffysanthosh@gmail.com', '239883', '2025-06-22 11:16:14');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `group_name`, `duration`) VALUES
(21, 'B.E', 'Computer Science', '4 Years'),
(23, 'B.Tech', 'Information Technology', '4 Years'),
(24, 'B.E', 'Civil Engineering', '4 Years'),
(26, 'B.Sc', 'Computer Science', '3 Years');

-- --------------------------------------------------------

--
-- Table structure for table `durations`
--

CREATE TABLE `durations` (
  `id` int(11) NOT NULL,
  `duration_text` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `student_group` varchar(50) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `course` varchar(50) DEFAULT NULL,
  `marksheet` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','Accepted','Rejected') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `gender`, `email`, `phone`, `dob`, `address`, `student_group`, `total_marks`, `course`, `marksheet`, `photo`, `created_at`, `status`) VALUES
(1, 'Santhosh', 'Sivan H', 'Male', 'ssiva@gmail.com', '9028282828', '2025-06-06', 'Madurai', 'Computer Science', 590, 'B.E', 'uploads/marksheet_68566248f12c5_Screenshot (14).png', 'uploads/photo_68566248f12cd_Screenshot (13).png', '2025-06-21 07:42:00', 'Accepted'),
(2, 'Barath', 'K B', 'Male', 'bk11@gmail.com', '9878867575', '2014-07-22', 'Virudhunagar', 'Computer Science', 590, 'B.E', 'uploads/marksheet_6857e94a8c130_SPIDER_MAN_superhero_marvel_spider_man_action_spiderman_5333x3333.jpg', 'uploads/photo_6857e94a8c135_images (31).jpeg', '2025-06-22 11:30:18', 'Rejected'),
(3, 'Dhinesh', 'Kumar B', 'Male', 'dheenadhinesh@gmail.com', '8976767667', '2021-11-22', 'Madurai', 'Mechanical', 590, 'B.E', 'uploads/marksheet_685803e7d9a0f_SPIDER_MAN_superhero_marvel_spider_man_action_spiderman_5333x3333.jpg', 'uploads/photo_685803e7d9a19_images (31).jpeg', '2025-06-22 13:23:51', 'Accepted'),
(4, 'Sanjay', 'U', 'Male', 'sanjay@gamil.com', '9878867575', '2025-06-13', 'Madurai', 'Computer Science', 570, 'B.Sc', 'uploads/marksheet_6858fe34dee24_20200811_130822.jpg', 'uploads/photo_6858fe34dee3c_IMG-20200906-WA0003.jpg', '2025-06-23 07:11:48', 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `durations`
--
ALTER TABLE `durations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `durations`
--
ALTER TABLE `durations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
