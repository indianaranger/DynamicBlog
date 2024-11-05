-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2024 at 03:58 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `admins` (
  `s_no` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `admins`

INSERT INTO `admins` (`s_no`, `name`, `email`, `username`, `password`) VALUES
(1, 'Ajay Cyriac', 'ajaycyriac@gmail.com', 'adminAjay', '$2y$10$YnhXL6M0LYV40laqjF7sYexAqOmXDJEd.Ihf6yxMuqWmeXqUPRFOO'),
(2, 'Edwin Rajesh', 'edwinrajesh@gmail.com', 'adminEdwin', '$2y$10$XuD61Roea1y/N9HXQEyT5OZ0TefiXgBzdkmDXAiNNR25je0NKKSTi');

-- Table structure for table `allblogs`

CREATE TABLE `allblogs` (
  `blog_sno` int(11) NOT NULL,
  `username` text NOT NULL,
  `email` text NOT NULL,
  `blog_title` text NOT NULL,
  `blog_subtitle` text NOT NULL,
  `blog_content` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `allblogs`

INSERT INTO `allblogs` (`blog_sno`, `username`, `email`, `blog_title`, `blog_subtitle`, `blog_content`, `time`) VALUES
(83, 'Aman', 'aman123@gmail.com', 'Nothing is Eternal', 'Freedom', 'Why? Why do we need more freedom? ...', '2024-11-11 10:15:23'),
(88, 'Amal', 'amal123@gmail.com', 'Forever Meant Never', 'Literature', 'Sounds of leaves uttering by shoes of passengers ...', '2024-11-11 12:22:45'),
(89, 'Ajay Cyriac', 'ajaycyriac@gmail.com', 'Poetry', 'Tyler Knott Gregson', 'They asked me what poetry was, and as few things have, it stole my speech ...', '2024-11-11 14:34:12'),
(90, 'Tobin Thomas', 'tobin123@gmail.com', 'The Good and the Difficult', 'Poetry', 'You always hand over the good things first ...', '2024-11-11 16:45:55');

-- Table structure for table `allusers`

CREATE TABLE `allusers` (
  `s_no` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `allusers`

INSERT INTO `allusers` (`s_no`, `name`, `email`, `username`, `password`) VALUES
(1, 'Ajay Cyriac', 'ajaycyriac@gmail.com', 'ajay', '$2y$10$1yjoinj143d17j1sNoqpoOptNol1SI7c6mmgyfJ3rhJloDec798De'),
(4, 'Edwin Rajesh', 'edwinrajesh@gmail.com', 'edwin', '$2y$10$eGi355mYXY61e8p/TmgjuuGyfD5oDJ/pzXH9A5sk0SrG/ltHilCDe'),
(5, 'Amal', 'amal123@gmail.com', 'amal', '$2y$10$bd0d20TRrGzqNVBeYgXER.LTRtHnWs.7I5ZbLpMAJliuusVwkfbj.'),
(6, 'Aman', 'aman123@gmail.com', 'aman', '$2y$10$zDoZttwfVU3G7vkaeQubVeOWTc3EF0MmIYAQHcc2dmib.lUfyjxNy'),
(7, 'Alan Peter', 'alanpeter123@gmail.com', 'alanpeter', '$2y$10$IDCf3EiESG.46tVLYh9AMuxGTTRx7OBzXvN002pWtY7vQ.qkVhiFW');

-- Table structure for table `contacus`

CREATE TABLE `contacus` (
  `s_no` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `mssg` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `contacus`

INSERT INTO `contacus` (`s_no`, `name`, `email`, `mssg`, `time`) VALUES
(1, 'Ajay Cyriac', 'ajaycyriac@gmail.com', 'Hello', '2024-11-11 09:00:00'),
(2, 'Jithmon P Cherian', 'jithmon123@gmail.com', 'I have forgotten my password, please help me', '2024-11-11 13:45:32');

-- Indexes for dumped tables

-- Indexes for table `admins`
ALTER TABLE `admins`
  ADD PRIMARY KEY (`s_no`),
  ADD UNIQUE KEY `email` (`email`) USING HASH,
  ADD UNIQUE KEY `username` (`username`) USING HASH;

-- Indexes for table `allblogs`
ALTER TABLE `allblogs`
  ADD PRIMARY KEY (`blog_sno`);

-- Indexes for table `allusers`
ALTER TABLE `allusers`
  ADD PRIMARY KEY (`s_no`),
  ADD UNIQUE KEY `email` (`email`) USING HASH,
  ADD UNIQUE KEY `username` (`username`) USING HASH;

-- Indexes for table `contacus`
ALTER TABLE `contacus`
  ADD PRIMARY KEY (`s_no`);

-- AUTO_INCREMENT for dumped tables

-- AUTO_INCREMENT for table `admins`
ALTER TABLE `admins`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- AUTO_INCREMENT for table `allblogs`
ALTER TABLE `allblogs`
  MODIFY `blog_sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

-- AUTO_INCREMENT for table `allusers`
ALTER TABLE `allusers`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

-- AUTO_INCREMENT for table `contacus`
ALTER TABLE `contacus`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

COMMIT;

