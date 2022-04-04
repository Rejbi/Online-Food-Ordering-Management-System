-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2022 at 07:38 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food-order`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(19, 'Niloy Roy', 'roy', '15de21c670ae7c3f6f3f1f37029303c9'),
(26, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(28, 'Gr Opu', 'gropu', '6838b713279667aff1bbe99215d74904'),
(29, 'Farhadul Hasan Hasbir', 'hasbir', 'ca1fb28e322b9b6f9670574ffedd9053');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(9, 'Pizza', 'Food_Category_835.jpg', 'YES', 'YES'),
(14, 'Burger', 'Food_Category_333.jpg', 'YES', 'YES'),
(15, 'MoMo', 'Food_Category_17.jpg', 'YES', 'YES'),
(19, 'Pasta', 'Food_Category_338.jpg', 'Yes', 'Yes'),
(20, 'Sandwich', 'Food_Category_288.jpg', 'Yes', 'Yes'),
(21, 'Spaghetti', 'Food_Category_68.jpg', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` char(200) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(7, 'Burger', 'Hot Burger', '9.00', 'Food-Name-5698.jpg', 14, 'Yes', 'Yes'),
(8, 'MoMo', 'Enjoy your momos', '15.00', 'Food-Name-2315.jpg', 15, 'Yes', 'Yes'),
(9, 'Smoky BBQ Pizza', 'Best Firewood Pizza in town', '6.00', 'Food-Name-6676.jpg', 9, 'Yes', 'Yes'),
(13, 'Grilled Cheese Sandwich', 'Grilled cheese sandwich or grilled cheese is a hot sandwich made with more varieties of cheese cooked on the gril', '8.00', 'Food-Name-7948.jpg', 20, 'Yes', 'Yes'),
(18, 'Spaghetti Carbonara', 'Just spaghetti and the carbonara is made with pancetta or bacon, eggs,', '12.00', 'Food-Name-5533.jpg', 21, 'Yes', 'Yes'),
(19, 'Hot Pizza', 'Jalei jadu', '14.00', 'Food-Name-1386.jpg', 9, 'Yes', 'Yes'),
(20, 'Detroit-Style Pizza', 'A thick, square-cut pizza with a crunchy, fried bottom layer of crust overflowing with delicious melted cheese', '17.00', 'Food-Name-303.jpg', 9, 'Yes', 'Yes'),
(22, 'Ham Burger', ' The Epic Ham and Cheese Stuffed Bacon Burger is hands down the best', '5.00', 'Food-Name-6435.jpg', 14, 'Yes', 'Yes'),
(23, 'Ham Burger', ' The Epic Ham and Cheese Stuffed Bacon Burger is hands down the best', '5.00', 'Food-Name-2529.jpg', 14, 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_contact` varchar(20) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`) VALUES
(1, 'MoMo', '15.00', 6, '6.00', '2022-04-01 06:07:48', 'Delivered', 'Robin Mohajon', '789695415454', 'niloyroy0632@gmail.com', 'Chattogram, Bangladesh'),
(2, 'Smoky BBQ Pizza', '6.00', 2, '4.00', '2022-04-01 06:12:14', 'Delivered', 'Rakesh Barua', '789695415454', 'niloyroy740@yahoo.com', 'Chattogram, Bangladesh'),
(3, 'Burger', '9.00', 2, '6.00', '2022-04-01 06:21:14', 'Delivered', 'Robin Mohajon', '01878362057', 'niloyroy0632@gmail.com', 'Dhaka Bangladesh'),
(4, 'MoMo', '15.00', 7, '28.00', '2022-04-01 09:11:31', 'Cancelled', 'Niloy Roy', '01878362057', 'fastestone56@gmail.com', 'Rangunia, Bangladesh'),
(5, 'pizza', '3.00', 5, '25.00', '2022-04-02 03:58:49', 'On Delivery', 'Rakesh Barua', '01878362057', 'niloyroy740@yahoo.com', 'Chattogram, Bangladesh'),
(6, 'Grilled Cheese Sandwich', '8.00', 6, '36.00', '2022-04-02 04:30:42', 'Delivered', 'Gr Opu', '01822616607', 'gropu789@gmail.com', 'Fatikchari, Bangladesh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
