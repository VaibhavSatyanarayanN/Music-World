-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2023 at 02:12 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music_world`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `ALID` int(11) NOT NULL,
  `ALNAME` varchar(255) NOT NULL DEFAULT 'UNKNOWN_ALBUM',
  `ALTYPE` char(1) NOT NULL,
  `ALIMAGE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`ALID`, `ALNAME`, `ALTYPE`, `ALIMAGE`) VALUES
(2, 'JUBIN NAUTIYAL HIT\'S', 'A', 'chitthi.jpg'),
(4, 'AASHIQUI 2', 'M', 'aashiqui2.jpg'),
(12, 'Kantara', 'M', 'Kantara_x.jpeg'),
(13, 'Ramleela', 'M', 'ramleela.jpg'),
(14, 'Shreya Hits', 'A', 'shreya.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `AID` int(11) NOT NULL,
  `ANAME` varchar(255) NOT NULL DEFAULT 'UNKNOWN_ARTIST',
  `AGENDER` char(1) NOT NULL,
  `AIMAGE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`AID`, `ANAME`, `AGENDER`, `AIMAGE`) VALUES
(1, 'ARIJIT SINGH', 'M', 'arijith.jpg'),
(2, 'SHREYA GHOSHAL', 'F', 'shreya.jpg'),
(3, 'JUBIN NAUTIYAL', 'M', 'jibin.png'),
(4, 'EMINEM', 'M', 'eminem.jpg'),
(5, 'ANANYA BHAT', 'F', 'ananya bhat.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

CREATE TABLE `song` (
  `S_ID` int(11) NOT NULL,
  `SNAME` varchar(255) NOT NULL DEFAULT 'UNKNOWN_SONG',
  `YEAR` char(4) NOT NULL,
  `ALID` int(11) DEFAULT NULL,
  `AID` int(11) DEFAULT NULL,
  `PATHS` varchar(255) NOT NULL,
  `IMAGE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `song`
--

INSERT INTO `song` (`S_ID`, `SNAME`, `YEAR`, `ALID`, `AID`, `PATHS`, `IMAGE`) VALUES
(57, 'singara siriye   ', '2022', 12, 5, './Songs/Singara-Siriye(PagalWorldl).mp3', 'Kantara_x.jpeg'),
(58, 'Humava ', '2018', 2, 3, './Songs/HUMNAVA-MERE.mp3', 'Humnava_Mere.jpg'),
(67, 'Varaha-Roopam ', '2022', 12, 5, './Songs/Varaha-Roopam(PagalWorldl).mp3', 'Kantara_x.jpeg'),
(73, 'Vaa-Poruluya ', '2022', 12, 5, './Songs/Vaa-Poruluya.mp3', 'Kantara_x.jpeg'),
(74, 'Rebel ', '2022', 12, 5, './Songs/Rebel.mp3', 'Kantara_x.jpeg'),
(76, 'Bewafa ', '2016', 2, 3, './Songs/Tera-Masoom-Chehra.mp3', 'Bewafa-Tera-Masoom-Chehra.jpg'),
(77, 'Ahista ', '2002', 14, 2, './Songs/Ahista-Ahista.mp3', 'ahista.jpg'),
(78, 'Asa-nhi-yaha ', '2012', 4, 1, './Songs/Aasan-Nahin-Yahan.mp3', 'aashiqui2.jpg'),
(79, 'Chahun-main ', '2012', 14, 4, './Songs/Chahun-me-yana.mp3', 'aashiqui2.jpg'),
(80, 'Deewani-mastani ', '2019', 14, 1, './Songs/Deewani_Mastani.mp3', 'bajirao.jpg'),
(81, 'Thoda-thoda ', '2014', 2, 3, './Songs/Thoda-Thoda.mp3', 'Thoda-Thoda-Pyaar.jpg'),
(82, 'Sun-raha-hain ', '2012', 4, 1, './Songs/Sunn-Raha-Hai.mp3', 'aashiqui2.jpg'),
(83, 'Nagada_Sang_Dol ', '2010', 13, 2, './Songs/Nagada_Sang_Dol.mp3', 'ramleela.jpg');

--
-- Triggers `song`
--
DELIMITER $$
CREATE TRIGGER `counter` AFTER INSERT ON `song` FOR EACH ROW UPDATE song_count
SET COUNT=COUNT+1
WHERE C_ID=1
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reducer` AFTER DELETE ON `song` FOR EACH ROW UPDATE song_count
SET COUNT=COUNT-1
WHERE C_ID=1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `song_count`
--

CREATE TABLE `song_count` (
  `C_ID` int(11) NOT NULL,
  `COUNT` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `song_count`
--

INSERT INTO `song_count` (`C_ID`, `COUNT`) VALUES
(1, '13');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL DEFAULT 'UNKNOWN',
  `AGE` int(11) NOT NULL,
  `GENDER` char(1) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UID`, `NAME`, `AGE`, `GENDER`, `EMAIL`, `password`) VALUES
(1, 'RAY', 12, 'M', 'RAY123@GMAIL.COM', '1234'),
(2, 'EMMA', 11, 'F', 'EMMA345@GMIAL.COM', '1234'),
(4, 'EREN', 15, 'M', 'ERENYEAGER@GMAIL.COM', '1234'),
(5, 'HINATA', 18, 'F', 'HINATANARUTO@GMAIL.COM', '1234'),
(6, 'MIKASA', 14, 'F', 'MIKASAACKERMAN@GMAIL.COM', '1234'),
(12, '', 0, 'm', '', ''),
(13, 'tanishka', 20, 'f', 'tanishka@gmail.com', '12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`ALID`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`AID`);

--
-- Indexes for table `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`S_ID`),
  ADD KEY `ALID` (`ALID`),
  ADD KEY `AID` (`AID`);

--
-- Indexes for table `song_count`
--
ALTER TABLE `song_count`
  ADD PRIMARY KEY (`C_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `ALID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `AID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `song`
--
ALTER TABLE `song`
  MODIFY `S_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `song_count`
--
ALTER TABLE `song_count`
  MODIFY `C_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `song_ibfk_1` FOREIGN KEY (`ALID`) REFERENCES `album` (`ALID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `song_ibfk_2` FOREIGN KEY (`AID`) REFERENCES `artist` (`AID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
