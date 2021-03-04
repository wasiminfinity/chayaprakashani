-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2020 at 08:24 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chayaprakashani`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `coursedate` datetime DEFAULT NULL,
  `coursefee` int(11) DEFAULT NULL,
  `coursename` varchar(255) DEFAULT NULL,
  `courseteacher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `coursedate`, `coursefee`, `coursename`, `courseteacher`) VALUES
(140, '2020-10-08 17:33:28', 6000, 'Java', 'Styajit Banerjee'),
(141, '2020-10-19 17:33:30', 26000, 'SAAP', 'Upama Nirjharini'),
(142, '2020-11-13 17:33:30', 13000, 'DataScience', 'Pratima Jaya'),
(143, '2020-12-13 17:33:22', 15000, 'CyberSecurity', 'Charchita Mandal'),
(144, '2021-01-01 17:33:30', 6200, 'AngularJs', 'Sumona pal'),
(145, '2021-02-08 17:33:30', 7000, 'Cisco', 'Dixon Jana'),
(146, '2020-01-19 17:33:30', 16000, 'MachineLearning', 'Martha Nielson'),
(147, '2020-02-19 17:33:30', 8000, 'Python', 'Adam Radcliffe'),
(148, '2020-01-29 17:33:30', 6200, 'Docker', 'Eva Jonas'),
(149, '2020-03-19 17:33:30', 7600, 'Android', 'Fatema Begam'),
(150, '2020-04-19 17:33:30', 7600, 'Os', 'Jonas Adam');

-- --------------------------------------------------------

--
-- Table structure for table `serialno_seq`
--

CREATE TABLE `serialno_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `serialno_seq`
--

INSERT INTO `serialno_seq` (`next_val`) VALUES
(13);

-- --------------------------------------------------------

--
-- Table structure for table `studentid_seq`
--

CREATE TABLE `studentid_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studentid_seq`
--

INSERT INTO `studentid_seq` (`next_val`) VALUES
(7);

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `student_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roles` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`student_id`, `email`, `first_name`, `last_name`, `mobile`, `password`, `roles`) VALUES
(0, 'ADMIN@GMAIL.COM', 'ADMIN', 'ADMIN', '7894561230', 'admin123', 'ROLE_ADMIN'),
(1, 'haldarhiji@gmail.com', 'Hijibiji', 'Haldar', '9540725519', 'wedf', 'ROLE_USER'),
(2, 'dev12@gmail.com', 'Ram', 'Dev', '8240725519', 'dev12', 'ROLE_USER'),
(3, 'Jaitrashyam@gmail.com', 'Shyam', 'Jaitra', '8270725519', '1028', 'ROLE_USER'),
(4, 'sanylradhika@gmail.com', 'Radhika', 'Sanyal', '9670725519', 'ujlo', 'ROLE_USER'),
(5, 'padmekar@gmail.com', 'Bhumi', 'Padmekar', '8270725519', 'pa23', 'ROLE_USER'),
(6, 'batbokisna@gmail.com', 'Rumi', 'Bhattyacharya', '9880725519', 'bhy0', 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `stud_courses`
--

CREATE TABLE `stud_courses` (
  `serial_no` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `coursename` varchar(255) DEFAULT NULL,
  `studcourse_id_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stud_courses`
--

INSERT INTO `stud_courses` (`serial_no`, `course_id`, `coursename`, `studcourse_id_fk`) VALUES
(1, 142, 'DataScience', 1),
(2, 141, 'SAAP', 1),
(3, 140, 'Java', 2),
(4, 150, 'Os', 2),
(5, 144, 'AngularJs', 3),
(6, 141, 'SAAP', 3),
(7, 145, 'Cisco', 4),
(8, 141, 'SAAP', 4),
(9, 140, 'Java', 5),
(10, 149, 'Android', 5),
(11, 140, 'Java', 6),
(12, 149, 'CyberSecurity', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `stud_courses`
--
ALTER TABLE `stud_courses`
  ADD PRIMARY KEY (`serial_no`),
  ADD KEY `FKsn1aawbmubi25eorw8mdhlgj4` (`studcourse_id_fk`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stud_courses`
--
ALTER TABLE `stud_courses`
  ADD CONSTRAINT `FKsn1aawbmubi25eorw8mdhlgj4` FOREIGN KEY (`studcourse_id_fk`) REFERENCES `student_details` (`student_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
