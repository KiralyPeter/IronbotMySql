-- phpMyAdmin SQL Dump
-- version 5.2.1-2.fc39
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 04, 2024 at 01:37 PM
-- Server version: 10.5.23-MariaDB
-- PHP Version: 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Ironbot`
--
CREATE DATABASE IF NOT EXISTS `Ironbot` DEFAULT CHARACTER SET latin2 COLLATE latin2_hungarian_ci;
USE `Ironbot`;

-- --------------------------------------------------------

--
-- Table structure for table `shortuser`
--

CREATE TABLE `shortuser` (
  `Id` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

--
-- Dumping data for table `shortuser`
--

INSERT INTO `shortuser` (`Id`, `Username`, `Password`, `Email`, `TimeStamp`) VALUES
(1, 'peter', '12345', 'peter@valahol.com', '2024-01-30 05:52:03'),
(3, 'peter', '12345', 'peter@gmail.com', '2024-01-30 05:58:52'),
(4, 'petyko', '12345', 'petyko@gmail.com', '2024-02-03 08:23:57'),
(5, 'petike', '34211', 'petike@gmail.com', '2024-02-03 10:01:18'),
(6, 'palika', '34211', 'palika@gmail.com', '2024-02-03 10:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `Id` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(100) NOT NULL COMMENT 'MD5 hashed pswd',
  `PasswordSalt` varchar(100) NOT NULL COMMENT 'MD5 hash-salt',
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Mobile` varchar(20) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Zip` varchar(5) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `BillingAddressId` int(11) DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT 0 COMMENT '0: Validating, 1: Enabled, 2: Deleted',
  `IsValidated` bit(1) NOT NULL DEFAULT b'0',
  `ValidationUrl` varchar(250) NOT NULL,
  `IsAdmin` bit(1) NOT NULL DEFAULT b'0',
  `TimeStamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`Id`, `Username`, `PasswordHash`, `PasswordSalt`, `Email`, `Phone`, `Mobile`, `FirstName`, `LastName`, `Country`, `City`, `Zip`, `Address`, `BillingAddressId`, `Status`, `IsValidated`, `ValidationUrl`, `IsAdmin`, `TimeStamp`) VALUES
(1, 'peter', 'pwhas', 'pwsalt', 'peter@gmail.com', '12345', '123443', 'Peter', 'Kiraly', 'Hungary', 'MiklosCty', '2310', 'Iskola street', 1, 0, b'0', 'url', b'0', '2024-01-29 18:29:28'),
(3, 'peter', 'pwhas', 'pwsalt', 'pista@gmail.com', '12345', '123443', 'Peter', 'Kiraly', 'Hungary', 'MiklosCty', '2310', 'Iskola street', 1, 0, b'0', '1', b'0', '2024-01-29 20:04:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shortuser`
--
ALTER TABLE `shortuser`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `shortuser`
--
ALTER TABLE `shortuser`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
