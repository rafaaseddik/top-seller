-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2018 at 03:04 PM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `topseller`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parentID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parentID`) VALUES
(1, 'Electronics', NULL),
(2, 'Handmade', NULL),
(3, 'Clothing', NULL),
(4, 'Entertainment', NULL),
(5, 'Vehicules', NULL),
(6, 'Beauty & Health', NULL),
(7, 'Home & Garden', NULL),
(8, 'TV & Video', 1),
(9, 'Cameras', 1),
(10, 'Computers & Laptops', 1),
(11, 'Phones & Tablets', 1),
(12, 'Audio', 1),
(13, 'Video-Games & Consoles', 1),
(14, 'Computer Devices', 1),
(15, 'Men', 3),
(16, 'Women', 3),
(17, 'Boys', 3),
(18, 'Girls', 3),
(19, 'Baby', 3),
(20, 'Jewelry', 3),
(21, 'Shoes', 3),
(22, 'Accessories', 3),
(23, 'Jewelry', 2),
(24, 'Home Decor', 2),
(25, 'Art', 2),
(26, 'Wedding', 2);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `email` varchar(64) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `imgURL` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `productID`, `imgURL`) VALUES
(1, 8, 'gsmarena_001.jpg'),
(2, 8, 'iphone-x-kf-device-tab-d-18-improved-cameras.png'),
(3, 8, 'iphone-x-quad.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text NOT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(30) NOT NULL,
  `creation_date` date DEFAULT NULL,
  `categoryID` int(11) NOT NULL,
  `shopID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `quantity`, `description`, `closed`, `status`, `creation_date`, `categoryID`, `shopID`) VALUES
(1, 'Samsung Galaxy J3', 15, 1, 'New Smartphone by Samsung', 0, 'NEW', '2018-02-02', 2, 1),
(3, 'iPhone X', 7, 50, 'the most fragile phnoe ever', 0, 'BARELY_USED', '2018-02-02', 11, 1),
(8, 'iPhone X', 30, 50, 'The most expensive phone ever', 0, 'BARELY_USED', '2018-02-02', 2, 1),
(5, 'iPhone X', 50, 50, 'The most expensive phone ever', 0, 'BARELY_USED', '2018-02-02', 5, 15),
(6, 'iPhone X', 26.36, 50, 'The most expensive phone ever', 1, 'BARELY_USED', '2018-02-02', 2, 15),
(7, 'iPhone X', 26.36, 50, 'The most expensive phone ever', 0, 'BARELY_USED', '2018-02-02', 2, 15),
(9, 'iPhone X', 26.36, 50, 'The most expensive phone ever', 0, 'USED', '2018-02-02', 6, 15),
(10, 'iPhone X', 48, 50, 'The most expensive phone ever', 0, 'BARELY_USED', '2018-02-02', 11, 15),
(11, 'iPhone X', 26.36, 50, 'The most expensive phone ever', 0, 'BARELY_USED', '2018-02-02', 2, 15),
(12, 'iPhone X', 5, 50, 'The most expensive phone ever', 0, 'BARELY_USED', '2018-02-02', 6, 15),
(13, 'iPhone X', 10, 50, 'The most expensive phone ever', 0, 'BARELY_USED', '2018-02-02', 2, 15),
(14, 'iPhone X', 26.36, 50, 'The most expensive phone ever', 0, 'BARELY_USED', '2018-02-02', 2, 15);

-- --------------------------------------------------------

--
-- Table structure for table `productreport`
--

CREATE TABLE `productreport` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `validated` tinyint(1) NOT NULL DEFAULT '0',
  `productID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreport`
--

INSERT INTO `productreport` (`id`, `description`, `validated`, `productID`, `userID`) VALUES
(1, 'descr', 0, 1, 6),
(2, 'descr', 0, 1, 6),
(3, 'descr', 0, 1, 6),
(4, 'descr', 0, 1, 6),
(5, 'descr', 0, 1, 6),
(6, 'descr', 0, 1, 6),
(7, 'descr', 0, 1, 6),
(8, 'descr', 0, 1, 6),
(9, 'descr', 0, 1, 6),
(10, 'descr', 0, 1, 6),
(11, 'descr', 0, 1, 6),
(12, 'descr', 0, 1, 6),
(13, 'descr', 0, 1, 6),
(14, 'descr', 0, 1, 6),
(15, 'descr', 0, 1, 6),
(16, 'descr', 0, 1, 6),
(17, 'descr', 0, 1, 6),
(18, 'descr', 0, 1, 6),
(19, 'descr', 0, 1, 6),
(20, 'Hakkeka', 0, 3, 15);

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `shopID` int(11) NOT NULL,
  `date` date NOT NULL,
  `score` int(11) NOT NULL,
  `comment` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`id`, `userID`, `shopID`, `date`, `score`, `comment`) VALUES
(1, 1, 1, '2018-02-13', 5, NULL),
(2, 2, 1, '2018-02-21', 2, NULL),
(3, 2, 2, '2018-02-21', 3, NULL),
(4, 15, 3, '2018-02-05', 5, 'j\'ai un commentaire'),
(5, 15, 3, '2018-02-05', 2, 'bonjour'),
(6, 15, 3, '2018-02-05', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `cover_url` varchar(255) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL,
  `categoryID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`id`, `name`, `logo_url`, `cover_url`, `creation_date`, `address`, `phone`, `longitude`, `latitude`, `closed`, `userID`, `categoryID`) VALUES
(1, 'SAMSUNG Store', NULL, NULL, '2018-01-30', 'North Urban Center, Tunis', NULL, 36.844587, 10.19711, 0, 6, 5),
(2, 'SAMSUNG Store 2', NULL, NULL, '2018-01-30', 'North Urban Center, Nabeul', NULL, 36.844587, 10.19711, 0, 6, 11),
(3, 'Apple Store ', NULL, NULL, '2018-01-30', 'North Urban Center, Nabeul', NULL, 36.844587, 10.19711, 0, 6, 11);

-- --------------------------------------------------------

--
-- Table structure for table `shopreport`
--

CREATE TABLE `shopreport` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `shopID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shopreport`
--

INSERT INTO `shopreport` (`id`, `description`, `shopID`, `userID`) VALUES
(1, 'Hakkeka', 3, 15);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `value` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `foreignKey` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `avatar_url` varchar(500) NOT NULL,
  `nb_strikes` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fname`, `lname`, `email`, `password`, `region`, `avatar_url`, `nb_strikes`, `type`, `phone`) VALUES
(1, 'Rafaa', 'Seddik', 'rafaaseddik@yahoo.fr', 'testtest12', 'TUNIS', '', 0, 'VISITOR', ''),
(2, 'Rafaa', 'rafaa', 'rafaaseddik@gmail.fr', 'rafaapro', 'tunis', 'http://localhost/fileupload/topseller/c:/wamp64/www/fileupload/topseller/15172324495071.4.png', 0, 'CLIENT', '45646'),
(3, 'Rafaa', 'rafaa', 'rafaaseddik@gmail.fr', 'rafaapro', 'tunis', 'http://localhost/fileupload/topseller/c:/wamp64/www/fileupload/topseller/15172324495071.4.png', 0, 'CLIENT', '45646'),
(4, 'Rafaa', 'rafaa', 'rafaaseddik@yahoo.com', 'rafaapro', 'rafaa', 'http://localhost/fileupload/topseller/15172414288971.4.png', 0, 'CLIENT', '2541'),
(5, 'Rafaa', 'rafaa', 'rafaaseddik@yahoo.com', 'rafaapro', 'rafaa', 'http://localhost/fileupload/topseller/15172414288971.4.png', 0, 'CLIENT', '2541'),
(6, 'Rafaa', 'rafaa', 'rafaaseddik@outlook.fr', 'raazeazeaze', 'tunis', '15172418270171.4.png', 0, 'CLIENT', '45646');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreport`
--
ALTER TABLE `productreport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shopreport`
--
ALTER TABLE `shopreport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`value`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `productreport`
--
ALTER TABLE `productreport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `shopreport`
--
ALTER TABLE `shopreport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
