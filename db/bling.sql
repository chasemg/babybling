-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2014 at 11:17 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bling`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

CREATE TABLE IF NOT EXISTS `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_address`
--

INSERT INTO `oc_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `company_id`, `tax_id`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`) VALUES
(1, 1, 'dfghfg', 'fghfdg', '', '', '', 'gdfgdfgdf', '', 'dfgdfg', '', 16, 302),
(2, 2, 'jocel', 'malacas', 'sadsad', 'sadasd', '', 'dasdasdasdas', 'dsadsadsa', 'dasdsadsa', 'admin', 168, 2575);

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed'),
(1, 2, 'Description'),
(2, 2, 'No. of Cores'),
(4, 2, 'test 1'),
(5, 2, 'test 2'),
(6, 2, 'test 3'),
(7, 2, 'test 4'),
(8, 2, 'test 5'),
(9, 2, 'test 6'),
(10, 2, 'test 7'),
(11, 2, 'test 8'),
(3, 2, 'Clockspeed');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(3, 2, 'Memory'),
(4, 2, 'Technical'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Samsung Tab', 1),
(8, 'Manufacturers', 1),
(9, 'Start 2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=126 ;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`) VALUES
(54, 7, 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'data/demo/samsung_banner.jpg'),
(77, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'data/demo/hp_banner.jpg'),
(116, 8, '', 'data/demo/start/manufacturers/200x80/lg4-200x80.jpg'),
(115, 8, '', 'data/demo/start/manufacturers/200x80/lg3-200x80.jpg'),
(114, 8, '', 'data/demo/start/manufacturers/200x80/lg2-200x80.jpg'),
(113, 8, '', 'data/demo/start/manufacturers/200x80/lg1-200x80.jpg'),
(117, 8, '', 'data/demo/start/manufacturers/200x80/lg5-200x80.jpg'),
(118, 8, '', 'data/demo/start/manufacturers/200x80/lg6-200x80.jpg'),
(119, 8, '', 'data/demo/start/manufacturers/200x80/lg7-200x80.jpg'),
(120, 9, '', 'data/demo/start/manufacturers/105x25/lg_01.png'),
(121, 9, '', 'data/demo/start/manufacturers/105x25/lg_02.png'),
(122, 9, '', 'data/demo/start/manufacturers/105x25/lg_03.png'),
(123, 9, '', 'data/demo/start/manufacturers/105x25/lg_04.png'),
(124, 9, '', 'data/demo/start/manufacturers/105x25/lg_05.png'),
(125, 9, '', 'data/demo/start/manufacturers/105x25/lg_06.png');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(54, 1, 7, 'Samsung Tab 10.1'),
(77, 1, 6, 'HP Banner'),
(119, 2, 8, 'Logo 07'),
(119, 1, 8, 'Logo 07'),
(118, 2, 8, 'Logo 06'),
(54, 2, 7, 'Samsung Tab 10.1'),
(77, 2, 6, 'HP Banner'),
(118, 1, 8, 'Logo 06'),
(117, 2, 8, 'Logo 05'),
(117, 1, 8, 'Logo 05'),
(116, 2, 8, 'Logo 04'),
(116, 1, 8, 'Logo 04'),
(115, 2, 8, 'Logo 03'),
(115, 1, 8, 'Logo 03'),
(114, 2, 8, 'Logo 02'),
(114, 1, 8, 'Logo 02'),
(113, 2, 8, 'Logo 01'),
(113, 1, 8, 'Logo 01'),
(120, 1, 9, 'Facebook'),
(120, 2, 9, 'Facebook'),
(121, 1, 9, 'Twitter'),
(121, 2, 9, 'Twitter'),
(122, 1, 9, 'Smashing'),
(122, 2, 9, 'Smashing'),
(123, 1, 9, 'Dribbble'),
(123, 2, 9, 'Dribbble'),
(124, 1, 9, 'Envato'),
(124, 2, 9, 'Envato'),
(125, 1, 9, 'Behance'),
(125, 2, 9, 'Behance');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE IF NOT EXISTS `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=96 ;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(59, 'data/demo/start/categories/270x270/8.jpg', 0, 1, 1, 0, 1, '2014-05-29 00:44:16', '2014-06-18 19:04:15'),
(60, 'data/demo/start/products/870x1110/image1-09-c.jpg', 59, 0, 1, 0, 1, '2014-05-29 00:44:53', '2014-06-18 19:28:11'),
(61, 'data/demo/start/products/870x1110/image1-17-c.jpg', 59, 0, 1, 0, 1, '2014-05-29 00:45:15', '2014-06-18 19:28:39'),
(62, 'data/demo/start/products/870x1110/image1-03-c.jpg', 59, 0, 1, 0, 1, '2014-05-29 00:45:50', '2014-06-18 19:27:49'),
(63, 'data/demo/start/categories/270x270/1.jpg', 0, 0, 1, 0, 1, '2014-05-29 00:46:20', '2014-06-18 19:03:38'),
(64, 'data/demo/start/products/870x1110/image1-02-c.jpg', 63, 0, 1, 0, 1, '2014-05-29 00:47:06', '2014-06-18 19:26:00'),
(65, 'data/demo/start/products/870x1110/pants-01-c.jpg', 63, 0, 1, 0, 1, '2014-05-29 00:47:31', '2014-06-18 19:26:37'),
(66, 'data/demo/start/products/870x1110/pants-06-a.jpg', 63, 0, 1, 0, 1, '2014-05-29 00:47:45', '2014-06-18 19:27:29'),
(67, 'data/demo/start/categories/270x270/4.jpg', 0, 1, 1, 0, 1, '2014-05-29 00:48:13', '2014-06-18 19:02:53'),
(68, 'data/demo/start/products/870x1110/back-pack-01-a.jpg', 67, 0, 1, 0, 1, '2014-05-29 00:48:50', '2014-06-18 19:23:12'),
(69, 'data/demo/start/products/870x1110/watch-01-b.jpg', 67, 0, 1, 0, 1, '2014-05-29 00:49:05', '2014-06-18 19:24:31'),
(71, 'data/demo/start/products/870x1110/back-pack-01-b.jpg', 67, 0, 1, 0, 1, '2014-05-29 00:49:38', '2014-06-18 19:24:01'),
(72, 'data/demo/start/categories/270x270/3.jpg', 0, 1, 1, 0, 1, '2014-05-29 00:49:57', '2014-06-18 19:04:33'),
(73, 'data/demo/start/products/870x1110/pants-06-a.jpg', 72, 0, 1, 0, 1, '2014-05-29 00:50:21', '2014-06-18 19:30:16'),
(74, 'data/demo/start/products/870x1110/shoes-01-a.jpg', 72, 0, 1, 0, 1, '2014-05-29 00:50:39', '2014-06-18 19:29:05'),
(75, 'data/demo/start/products/870x1110/shoes-03-a.jpg', 72, 0, 1, 0, 1, '2014-05-29 00:50:58', '2014-06-18 19:29:39'),
(76, 'data/demo/start/categories/270x270/6.jpg', 0, 1, 1, 0, 1, '2014-05-29 00:57:06', '2014-06-18 19:06:22'),
(77, 'data/demo/start/products/870x1110/image2-18-c.jpg', 76, 0, 1, 0, 1, '2014-05-29 00:58:13', '2014-06-18 19:35:59'),
(78, 'data/demo/start/products/870x1110/image2-01-c.jpg', 76, 0, 1, 0, 1, '2014-05-29 00:58:36', '2014-06-18 19:36:18'),
(79, 'data/demo/start/products/870x1110/image2-15-c.jpg', 76, 0, 1, 0, 1, '2014-05-29 00:58:50', '2014-06-18 19:35:26'),
(80, 'data/demo/start/categories/270x270/2.jpg', 0, 1, 1, 0, 1, '2014-05-29 00:59:18', '2014-06-18 19:05:29'),
(81, 'data/demo/start/products/870x1110/image2-03-c.jpg', 80, 0, 1, 0, 1, '2014-05-29 00:59:52', '2014-06-18 19:32:10'),
(82, 'data/demo/start/products/870x1110/image2-11-c.jpg', 80, 0, 1, 0, 1, '2014-05-29 01:00:13', '2014-06-18 19:33:16'),
(83, 'data/demo/start/products/870x1110/image2-16-c.jpg', 80, 0, 1, 0, 1, '2014-05-29 01:00:39', '2014-06-18 19:32:36'),
(84, 'data/demo/start/categories/270x270/5.jpg', 0, 0, 1, 0, 1, '2014-05-29 01:00:58', '2014-06-18 19:05:03'),
(85, 'data/demo/start/products/870x1110/hat-01-a.jpg', 84, 0, 1, 0, 1, '2014-05-29 01:01:13', '2014-06-18 19:30:35'),
(86, 'data/demo/start/products/870x1110/hat-02-a.jpg', 84, 0, 1, 0, 1, '2014-05-29 01:01:32', '2014-06-18 19:31:20'),
(87, 'data/demo/start/products/870x1110/image2-08-c.jpg', 84, 0, 1, 0, 1, '2014-05-29 01:02:55', '2014-06-18 19:31:47'),
(88, 'data/demo/start/products/870x1110/hat-01-a.jpg', 84, 0, 1, 0, 1, '2014-05-29 01:03:06', '2014-06-18 19:31:00'),
(89, 'data/demo/start/categories/270x270/7.jpg', 0, 0, 1, 0, 1, '2014-05-29 01:03:24', '2014-06-18 19:06:01'),
(90, 'data/demo/start/products/870x1110/shoes-05-a.jpg', 89, 0, 1, 0, 1, '2014-05-29 01:03:41', '2014-06-18 19:34:58'),
(91, 'data/demo/start/products/870x1110/shoes-02-a.jpg', 89, 0, 1, 0, 1, '2014-05-29 01:03:58', '2014-06-18 19:33:57'),
(92, 'data/demo/start/products/870x1110/shoes-04-a.jpg', 89, 0, 1, 0, 1, '2014-05-29 01:04:18', '2014-06-18 19:34:36'),
(93, '', 68, 0, 1, 0, 1, '2014-06-18 02:25:42', '2014-06-18 02:25:42'),
(94, '', 68, 0, 1, 0, 1, '2014-06-18 02:26:38', '2014-06-18 02:26:38'),
(95, '', 94, 0, 1, 0, 1, '2014-06-18 02:27:55', '2014-06-18 02:27:55');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(69, 1, 'Watch', '&lt;p&gt;&lt;strong&gt;Start&lt;/strong&gt;&amp;nbsp;bring forth a range of watches that capture both directional and classic styles. Classic analogue watches from sought after names such as &lt;strong&gt;Boss &lt;/strong&gt;by &lt;strong&gt;Hugo Boss &lt;/strong&gt;and &lt;strong&gt;Michael Kors&lt;/strong&gt;, sit alongside digital watches from &lt;strong&gt;G-Shock &lt;/strong&gt;and directional designs from our own &lt;strong&gt;Start &lt;/strong&gt;brand.&lt;/p&gt;\r\n', '', ''),
(63, 2, 'MEN’S PANTS', '&lt;p&gt;Fusce sit amet placerat diam. Donec convallis magna ac nisl viverra.&lt;/p&gt;\r\n', '', ''),
(64, 2, 'Jeans', '', '', ''),
(71, 2, 'Wallets', '', '', ''),
(72, 1, 'MEN’S SHOES', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(78, 2, 'T-shirt', '', '', ''),
(80, 1, 'WOMEN’S BOTTOM', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(73, 1, 'Sport ', '&lt;p&gt;With a diverse edit of classic through to contemporary styles, &lt;strong&gt;Start &lt;/strong&gt;offers a huge range of shoes, boots and trainers. Timeless brogues and loafers from H by Hudson and Start Brand align with Converse hi-tops, Fred Perry plimsolls and old-school Nike trainers, as hard-wearing desert boots and formal shoes edge across the smart casual divide.&lt;/p&gt;\r\n', '', ''),
(74, 2, 'Dr Martens', '', '', ''),
(75, 1, 'Sneaker', '&lt;p&gt;With a diverse edit of classic through to contemporary styles, Start offers a huge range of shoes, boots and trainers. Timeless brogues and loafers from H by Hudson and Start Brand align with Converse hi-tops, Fred Perry plimsolls and old-school Nike trainers, as hard-wearing desert boots and formal shoes edge across the smart casual divide.&lt;/p&gt;\r\n', '', ''),
(76, 1, 'WOMEN’S TOP', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(77, 1, 'Shirt', '&lt;p&gt;Let’s get top-heavy. Freshen up your jersey basics in summer lovin’ shades or keep things super cute in lace camis, bandeau bra tops and printed girly t-shirts. Cooling down? Don’t sweat it with some of our lightweight layers.&lt;/p&gt;\r\n', '', ''),
(79, 1, 'Crop Top', '&lt;p&gt;Let’s get top-heavy. Freshen up your jersey basics in summer lovin’ shades or keep things super cute in lace camis, bandeau bra tops and printed girly t-shirts. Cooling down? Don’t sweat it with some of our lightweight layers.&lt;/p&gt;\r\n', '', ''),
(81, 1, 'Jeans', '&lt;p&gt;A hands-down wardrobe hero, jeans are getting the full on focus this season as we’re swimming in an ocean of blue. If you’re in boyfriend jeans you better hope he’s a skater – think Cheap Monday for shredded and super loose. Sticking with skinny? Then go for ankle grazing ultra-skinny jeans for the coolest fit.&lt;/p&gt;\r\n', '', ''),
(82, 1, 'Skirt', '&lt;p&gt;Let’s not skirt the issue – we love statement minis, midis and maxis. Say high-low to hem play, leather up in pastel pencils or ramp up the volume with full skirts and peplums. Pleats please? Oh go on then.&lt;/p&gt;\r\n', '', ''),
(83, 1, 'Short', '&lt;p&gt;Shorts are our favourite way of showing some leg, from tailored shorts that make workwear dressing a breeze to your festival BFF - the denim cut-off. New season shapes to get to grips with? The latest comeback kids are culottes and High waisted shorts.&lt;/p&gt;\r\n', '', ''),
(84, 2, 'WOMEN’S ACCESSORIES', '&lt;p&gt;Fusce sit amet placerat diam. Donec convallis magna ac nisl viverra.&lt;/p&gt;\r\n', '', ''),
(85, 1, 'Hats &amp; Caps', '&lt;p&gt;Headwear has seriously come into its own - caps and hats are at their peak shall we say? If we''re talking timeless you can''t better a &lt;strong&gt;Polo Ralph Lauren&lt;/strong&gt; baseball cap or chill-beating beanie, while the suavest of hat-wearers show a penchant for flat caps and trilbies.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(86, 1, 'Scarves &amp; Snoods', '&lt;p&gt;Tip your cap (or fedora) to summer with our next-level accessories. Say it in sorbet shades, with fondant fanciful belts, scarves and hats. Festival vibes? Garlands and headscarves are our most-wanted.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(87, 1, 'Shock', '&lt;p&gt;Let your legs lead the way with the &lt;strong&gt;Start&amp;nbsp;&lt;/strong&gt;edit of socks and tights. Flash some colour with multipacks of &lt;strong&gt;&lt;span style=&quot;font-size: 13px;&quot;&gt;Start&lt;/span&gt; &lt;/strong&gt;socks, fake it in mock sock tights or strike out in patterned suspender tights. Plus-size girls get in on the action with the newest line of &lt;strong&gt;&lt;span style=&quot;font-size: 13px;&quot;&gt;Start&lt;/span&gt; &lt;/strong&gt;Curve tights, which sits alongside a cheeky range of novelty ankle socks and favourite labels including Wolford, Calvin Klein, Happy Socks and Falke. Step it up!&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(88, 1, 'Jewelry', '&lt;p&gt;Tip your cap (or fedora) to summer with our next-level accessories. Say it in sorbet shades, with fondant fanciful belts, scarves and hats. Festival vibes? Garlands and headscarves are our most-wanted.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(89, 2, 'WOMEN’S SHOES', '&lt;p&gt;Fusce sit amet placerat diam. Donec convallis magna ac nisl viverra.&lt;/p&gt;\r\n', '', ''),
(90, 1, 'Sport ', '&lt;p&gt;Be the best in shoes, whether that’s barely-there sandals or sky high-heels. Go boyish in plimsolls and retro kicks by &lt;strong&gt;Nike &lt;/strong&gt;and &lt;strong&gt;New Balance &lt;/strong&gt;or show some FUG love for &lt;strong&gt;Start&lt;/strong&gt; faves Birkenstock and Swedish Hasbeens. Ankle boots hit refresh with heavy hardware, chunky heels and cleated soles.&lt;/p&gt;\r\n', '', ''),
(91, 1, 'Dr Martens', '&lt;p&gt;Be the best in shoes, whether that’s barely-there sandals or sky high-heels. Go boyish in plimsolls and retro kicks by &lt;strong&gt;Nike &lt;/strong&gt;and &lt;strong&gt;New Balance &lt;/strong&gt;or show some FUG love for &lt;strong&gt;Start &lt;/strong&gt;faves Birkenstock and Swedish Hasbeens. Ankle boots hit refresh with heavy hardware, chunky heels and cleated soles.&lt;/p&gt;\r\n', '', ''),
(92, 1, 'Sneaker', '&lt;p&gt;Be the best in shoes, whether that’s barely-there sandals or sky high-heels. Go boyish in plimsolls and retro kicks by &lt;strong&gt;Nike &lt;/strong&gt;and &lt;strong&gt;New Balance &lt;/strong&gt;or show some FUG love for &lt;strong&gt;Start &lt;/strong&gt;faves Birkenstock and Swedish Hasbeens. Ankle boots hit refresh with heavy hardware, chunky heels and cleated soles.&lt;/p&gt;\r\n', '', ''),
(68, 2, 'Back Pack', '&lt;p&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.&lt;/p&gt;\r\n', '', ''),
(69, 2, 'Watch', '', '', ''),
(62, 2, 'Jackets &amp; Coats', '', '', ''),
(60, 2, 'Polo Shirt', '', '', ''),
(75, 2, 'Sneaker', '', '', ''),
(68, 1, 'Back Pack', '&lt;p&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.&lt;/p&gt;\r\n', '', ''),
(67, 2, 'MEN’S ACCESSORIES', '&lt;p&gt;Fusce sit amet placerat diam. Donec convallis magna ac nisl viverra.&lt;/p&gt;\r\n', '', ''),
(71, 1, 'Wallets', '&lt;p&gt;Our collection of wallets carries both classic and contemporary styles, from top designer name&lt;strong&gt; Paul Smith&lt;/strong&gt; and established heritage labels including &lt;strong&gt;Ben Sherman&lt;/strong&gt; and &lt;strong&gt;Fred Perry&lt;/strong&gt;. Bold interior linings add an off-beat twist to &lt;strong&gt;Ted Baker''s&lt;/strong&gt; classic designs, whilst &lt;strong&gt;Diesel''s&lt;/strong&gt; utility style wallets reference current workwear influences.&lt;/p&gt;\r\n', '', ''),
(63, 1, 'MEN’S PANTS', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(64, 1, 'Jeans', '&lt;p&gt;Delivering a huge range of jeans, &lt;strong&gt;Start &lt;/strong&gt;offers&amp;nbsp;premium, dry selvedge and denim jeans, ideal for breaking in. A range of washes, finishes and natural fading effects add to the collection.&lt;/p&gt;\r\n', '', ''),
(65, 1, 'Short', '&lt;p&gt;Offering the most directional edit of the best styles of shorts, &lt;strong&gt;Start&amp;nbsp;&lt;/strong&gt;offers relaxed and rugged designs alongside well tailored casual shorts. Chino shorts from brands such as &lt;strong&gt;Polo Ralph Lauren&lt;/strong&gt;, as well as our own &lt;strong&gt;Start&lt;/strong&gt; brand, offer a preppy vibe, whilst Denim shorts can be seen in labels such as &lt;strong&gt;G-Star&lt;/strong&gt;.&lt;/p&gt;\r\n', '', ''),
(66, 1, 'Sweatpant', '&lt;p&gt;Constructed in super comfortable jersey fabrics, our selection of sweatpants are all about the collegiate detail. Chill out in our applique adorned sweatpants or get retro inspired with our track suit styles&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(59, 2, 'MEN’S SHIRT', '&lt;p&gt;Fusce sit amet placerat diam. Donec convallis magna ac nisl viverra.&lt;/p&gt;\r\n', '', ''),
(59, 1, 'MEN’S SHIRT', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(62, 1, 'Jackets &amp; Coats', '&lt;p&gt;Our outerwear options have never been more bountiful and these are the jacket and coats you''re going to need when the mercury dips. Lifetime-lasting leather jackets, downpour-ready rain coats and parkas will bear the brunt of any uneasy weather, while wool coats and pea coats have you covered when things need to sharpen up.&lt;/p&gt;\r\n', '', ''),
(60, 1, 'Polo Shirt', '&lt;p&gt;The polo shirt has been a wardrobe staple since its introduction in the 1930s. Our range of polo shirts and long sleeved rugby shirts carries brands such as,&lt;strong&gt; Polo Ralph Lauren, Lacoste, Fred Perry&lt;/strong&gt; and our own &lt;strong&gt;Start &lt;/strong&gt;label.&lt;/p&gt;\r\n', '', ''),
(61, 1, 'T-shirt', '&lt;p&gt;The backbone of your wardrobe. Pick from the classic plain tee to prints of bands, cityscapes, films, pop culture, slogans and all-overs by big brands including American Apparel, Cheap Monday and &lt;strong&gt;Start&lt;/strong&gt;.&lt;/p&gt;\r\n', '', ''),
(72, 2, 'MEN’S SHOES', '&lt;p&gt;Fusce sit amet placerat diam. Donec convallis magna ac nisl viverra.&lt;/p&gt;\r\n', '', ''),
(74, 1, 'Dr Martens', '&lt;p&gt;With a diverse edit of classic through to contemporary styles, &lt;strong&gt;Start&lt;/strong&gt; offers a huge range of shoes, boots and trainers. Timeless brogues and loafers from H by Hudson and Start Brand align with Converse hi-tops, Fred Perry plimsolls and old-school Nike trainers, as hard-wearing desert boots and formal shoes edge across the smart casual divide.&lt;/p&gt;\r\n', '', ''),
(84, 1, 'WOMEN’S ACCESSORIES', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(80, 2, 'WOMEN’S BOTTOM', '&lt;p&gt;Fusce sit amet placerat diam. Donec convallis magna ac nisl viverra.&lt;/p&gt;\r\n', '', ''),
(89, 1, 'WOMEN’S SHOES', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(76, 2, 'WOMEN’S TOP', '&lt;p&gt;Fusce sit amet placerat diam. Donec convallis magna ac nisl viverra.&lt;/p&gt;\r\n', '', ''),
(78, 1, 'T-shirt', '&lt;p&gt;Let’s get top-heavy. Freshen up your jersey basics in summer lovin’ shades or keep things super cute in lace camis, bandeau bra tops and printed girly t-shirts. Cooling down? Don’t sweat it with some of our lightweight layers.&lt;/p&gt;\r\n', '', ''),
(67, 1, 'MEN’S ACCESSORIES', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar. Fusce ut tincidunt risus. Nulla tellus libero, aliquet ac dui non, tincidunt pellentesque nulla. Ut vitae odio blandit sem posuere ultricies. Nulla consectetur venenatis malesuada. Aenean euismod convallis risus, quis euismod diam interdum quis. Fusce auctor, diam sed hendrerit blandit, urna diam bibendum orci, ut hendrerit leo justo a lacus. In ac lobortis ligula, quis fermentum massa. Phasellus tempor felis a mi sollicitudin, et vestibulum sapien molestie. Vestibulum scelerisque leo vel placerat sagittis. Nunc sed augue consequat, faucibus lorem quis, interdum nibh.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porta felis sed mauris consectetur, sed fringilla arcu pulvinar.&amp;nbsp;&lt;/p&gt;\r\n', '', ''),
(93, 1, 'EMBELLISH', '', '', ''),
(93, 2, 'EMBELLISH', '', '', ''),
(94, 1, 'LEE&amp;TEE', '', '', ''),
(94, 2, 'LEE&amp;TEE', '', '', ''),
(95, 1, 'RIVER ISLAND', '', '', ''),
(95, 2, 'RIVER ISLAND', '', '', ''),
(65, 2, 'Short', '', '', ''),
(66, 2, 'Sweatpant', '', '', ''),
(61, 2, 'T-shirt', '', '', ''),
(73, 2, 'Sport ', '', '', ''),
(85, 2, 'Hats &amp; Caps', '', '', ''),
(88, 2, 'Jewelry', '', '', ''),
(86, 2, 'Scarves &amp; Snoods', '', '', ''),
(87, 2, 'Shock', '', '', ''),
(81, 2, 'Jeans', '', '', ''),
(83, 2, 'Short', '', '', ''),
(82, 2, 'Skirt', '', '', ''),
(91, 2, 'Dr Martens', '', '', ''),
(92, 2, 'Sneaker', '', '', ''),
(90, 2, 'Sport ', '', '', ''),
(79, 2, 'Crop Top', '', '', ''),
(77, 2, 'Shirt', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE IF NOT EXISTS `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE IF NOT EXISTS `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(94, 68, 1),
(95, 95, 3),
(95, 94, 2),
(95, 68, 1),
(95, 67, 0),
(94, 94, 2),
(94, 67, 0),
(93, 93, 2),
(59, 59, 0),
(60, 59, 0),
(60, 60, 1),
(61, 59, 0),
(61, 61, 1),
(62, 59, 0),
(62, 62, 1),
(63, 63, 0),
(64, 63, 0),
(64, 64, 1),
(65, 63, 0),
(65, 65, 1),
(66, 63, 0),
(66, 66, 1),
(67, 67, 0),
(68, 67, 0),
(68, 68, 1),
(69, 67, 0),
(69, 69, 1),
(93, 68, 1),
(93, 67, 0),
(71, 67, 0),
(71, 71, 1),
(72, 72, 0),
(73, 72, 0),
(73, 73, 1),
(74, 72, 0),
(74, 74, 1),
(75, 72, 0),
(75, 75, 1),
(76, 76, 0),
(77, 76, 0),
(77, 77, 1),
(78, 76, 0),
(78, 78, 1),
(79, 76, 0),
(79, 79, 1),
(80, 80, 0),
(81, 80, 0),
(81, 81, 1),
(82, 80, 0),
(82, 82, 1),
(83, 80, 0),
(83, 83, 1),
(84, 84, 0),
(85, 84, 0),
(85, 85, 1),
(86, 84, 0),
(86, 86, 1),
(87, 84, 0),
(87, 87, 1),
(88, 84, 0),
(88, 88, 1),
(89, 89, 0),
(90, 89, 0),
(90, 90, 1),
(91, 89, 0),
(91, 91, 1),
(92, 89, 0),
(92, 92, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE IF NOT EXISTS `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=252 ;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(240, 'Jersey', 'JE', 'JEY', '', 1, 1),
(241, 'Guernsey', 'GG', 'GGY', '', 1, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE IF NOT EXISTS `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2011-01-01', '2012-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2009-03-01', '2009-08-31', 10, '10', 1, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '1970-11-01', '2020-11-01', 100000, '10000', 1, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE IF NOT EXISTS `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.62199998, 1, '2014-10-07 19:38:39'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2014-10-07 19:38:39'),
(3, 'Euro', 'EUR', '', '€', '2', 0.79119998, 1, '2014-10-07 19:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE IF NOT EXISTS `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `customer_group_id`, `ip`, `status`, `approved`, `token`, `date_added`) VALUES
(1, 0, 'dfghfg', 'fghfdg', 'fhgfd@dfssdf.com', '3435645', '', '78f2238339e37fa3cd9cc3f45ffebea2f0f98f62', 'bc030d423', 'a:2:{s:5:"101::";i:1;s:4:"96::";i:1;}', 'a:0:{}', 0, 1, 1, '78.75.111.172', 1, 1, '', '2014-08-21 01:45:44'),
(2, 0, 'jocel', 'malacas', 'jclmalacas@hotmail.com', '09159967772', '', '8d24dbac699d5cae44f8dbdd3b26f2f70dea78f7', 'b306a882d', 'a:0:{}', '', 0, 2, 1, '127.0.0.1', 1, 1, '', '2014-10-07 17:27:37');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_field`
--

CREATE TABLE IF NOT EXISTS `oc_customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `company_id_display`, `company_id_required`, `tax_id_display`, `tax_id_required`, `sort_order`) VALUES
(1, 0, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test'),
(1, 2, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE IF NOT EXISTS `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '36.85.77.70', '2014-08-21 01:45:47'),
(2, 1, '78.75.111.172', '2014-08-28 01:53:11'),
(3, 2, '127.0.0.1', '2014-10-07 17:27:38');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE IF NOT EXISTS `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE IF NOT EXISTS `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE IF NOT EXISTS `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=442 ;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(413, 'module', 'category'),
(411, 'module', 'affiliate'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(438, 'module', 'latest'),
(429, 'module', 'kuler_contact_form'),
(428, 'module', 'kuler_cp'),
(430, 'module', 'kuler_advanced_html'),
(431, 'module', 'kuler_layer_slider'),
(432, 'module', 'kuler_tabs'),
(433, 'module', 'kuler_slides'),
(434, 'module', 'kuler_menu'),
(435, 'module', 'kbm'),
(436, 'module', 'kbm_mod_recent_article'),
(437, 'module', 'kuler_accordion'),
(439, 'module', 'kuler_filter'),
(440, 'module', 'kuler_testimonial');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE IF NOT EXISTS `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE IF NOT EXISTS `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE IF NOT EXISTS `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`) VALUES
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n'),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n'),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n'),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n'),
(4, 2, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n'),
(5, 2, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n'),
(3, 2, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n'),
(6, 2, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_article`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `viewed` int(5) NOT NULL DEFAULT '0',
  `featured_image` varchar(255) DEFAULT NULL,
  `date_added` int(10) unsigned NOT NULL,
  `date_modified` int(10) unsigned NOT NULL,
  `date_published` int(10) unsigned NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_kbm_article`
--

INSERT INTO `oc_kbm_article` (`article_id`, `author_id`, `viewed`, `featured_image`, `date_added`, `date_modified`, `date_published`, `sort_order`, `status`) VALUES
(1, 1, 35, 'data/demo/start/blog/170x126/blog_start2_01.jpg', 1401870180, 1412703240, 1401903268, 0, 0),
(2, 1, 18, 'data/demo/start/blog/170x126/blog_start2_03.jpg', 1401931560, 1412703300, 1401989715, 0, 0),
(3, 1, 18, 'data/demo/start/blog/170x126/blog_start2_02.jpg', 1401931620, 1412703300, 1401989731, 0, 0),
(4, 1, 33, 'data/demo/start/blog/170x126/blog_start2_04.jpg', 1401931680, 1412703300, 1401989759, 0, 0),
(5, 1, 8, '', 1394418480, 1412703300, 1407432945, 0, 0),
(6, 1, 9, 'data/baby5.png', 1401931740, 1412703000, 1401989461, 0, 1),
(7, 1, 7, 'data/redflower.png', 1401931800, 1412703060, 1401989589, 0, 1),
(8, 1, 8, 'data/start/blog/blog_04.jpg', 1401931800, 1412703180, 1401989630, 0, 0),
(9, 1, 8, 'data/start/blog/blog_01.jpg', 1401931860, 1412703240, 1401989648, 0, 0),
(10, 1, 9, 'data/start/blog/blog_02.jpg', 1401931860, 1412703240, 1401989696, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_article_description`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_article_description` (
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_kbm_article_description`
--

INSERT INTO `oc_kbm_article_description` (`article_id`, `language_id`, `name`, `description`, `meta_keyword`, `meta_description`, `tags`) VALUES
(1, 2, 'Vestibulum auctor tortor', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.&lt;br /&gt;\r\nAliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Etiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Aenean aliquet mi ligula, et vehicula eros tempor at. Integer neque mi, scelerisque vel felis ac, convallis varius nibh. Quisque eget blandit ante. Vivamus vestibulum dolor dapibus arcu mattis placerat. Morbi blandit at magna nec vestibulum. Integer malesuada facilisis orci et adipiscing. Nunc sollicitudin mollis nunc scelerisque auctor. Donec vehicula pretium dolor sed hendrerit. In egestas tortor dui, id porta ipsum bibendum nec. Donec posuere nibh odio. Morbi eget tempor lectus, at laoreet erat. Mauris facilisis luctus nibh, vitae tincidunt nisi suscipit ut. In hac habitasse platea dictumst. Cras non dolor elit. Nulla ultrices massa nec eros mattis bibendum.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nam pellentesque ipsum ac tincidunt elementum. Maecenas eu metus sit amet nunc rhoncus dictum vitae non felis. Praesent consequat placerat velit nec vehicula. Aliquam nec varius nisi. In sollicitudin ac velit ac sodales. Nulla interdum lacus quis placerat semper. Suspendisse at sollicitudin lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Donec commodo commodo gravida. Nullam vel bibendum elit, eget eleifend massa. Cras tincidunt elementum augue, et volutpat dolor tincidunt in. Mauris non nunc odio. Suspendisse augue libero, sagittis non posuere a, molestie nec orci. Duis turpis quam, faucibus sed augue nec, imperdiet pretium tortor. Aliquam feugiat accumsan urna, sed sollicitudin nisl gravida nec. Aliquam vitae tincidunt erat, id bibendum magna. Proin sed sapien est. Quisque non felis arcu.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue. Nunc feugiat arcu ac nisl accumsan fringilla. Sed laoreet, libero vel molestie bibendum, nulla tellus fermentum libero, gravida eleifend libero sem eget urna. Nunc eget gravida felis. Nullam semper risus ultrices neque blandit, id venenatis diam blandit. Donec dui lacus, lacinia ac condimentum ut, congue eu ipsum. Suspendisse euismod nunc eu tellus molestie iaculis. Aliquam suscipit feugiat fermentum. Donec tempor urna nisl, eu feugiat tortor lobortis nec. Etiam ut tortor justo.&lt;/p&gt;\r\n', '', '', ''),
(2, 2, 'Tincidunt elementum', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Maecenas eu metus sit amet nunc rhoncus dictum vitae non felis. Praesent consequat placerat velit nec vehicula. Aliquam nec varius nisi. In sollicitudin ac velit ac sodales. Nulla interdum lacus quis placerat semper. Suspendisse at sollicitudin lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Donec commodo commodo gravida. Nullam vel bibendum elit, eget eleifend massa. Cras tincidunt elementum augue, et volutpat dolor tincidunt in. Mauris non nunc odio. Suspendisse augue libero, sagittis non posuere a, molestie nec orci. Duis turpis quam, faucibus sed augue nec, imperdiet pretium tortor. Aliquam feugiat accumsan urna, sed sollicitudin nisl gravida nec. Aliquam vitae tincidunt erat, id bibendum magna. Proin sed sapien est. Quisque non felis arcu.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue. Nunc feugiat arcu ac nisl accumsan fringilla. Sed laoreet, libero vel molestie bibendum, nulla tellus fermentum libero, gravida eleifend libero sem eget urna. Nunc eget gravida felis. Nullam semper risus ultrices neque blandit, id venenatis diam blandit. Donec dui lacus, lacinia ac condimentum ut, congue eu ipsum. Suspendisse euismod nunc eu tellus molestie iaculis. Aliquam suscipit feugiat fermentum. Donec tempor urna nisl, eu feugiat tortor lobortis nec. Etiam ut tortor justo.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Sed pellentesque commodo magna, eget tincidunt magna condimentum lobortis. Integer facilisis ipsum sem, sit amet aliquet sem iaculis in. Vivamus at accumsan ante. Donec vitae diam eu magna tincidunt rutrum. Nullam interdum lacinia lobortis. Duis eget lobortis augue, id sollicitudin justo. Aenean sollicitudin elit ut egestas viverra. Mauris tempus mollis velit, cursus pulvinar lectus auctor eget. Quisque eget arcu iaculis, tempus tellus id, semper augue. Vivamus facilisis imperdiet consectetur. Proin ac magna ante. Phasellus nec sagittis tellus. Mauris cursus, mi eget mollis dignissim, lectus nibh placerat lorem, at lobortis tellus nulla vitae arcu. Ut sit amet orci ac sapien porta porta. Mauris facilisis sollicitudin pharetra. Phasellus rutrum nisi quam, quis congue nisi vehicula ac.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Aenean aliquet mi ligula, et vehicula eros tempor at. Integer neque mi, scelerisque vel felis ac, convallis varius nibh. Quisque eget blandit ante. Vivamus vestibulum dolor dapibus arcu mattis placerat. Morbi blandit at magna nec vestibulum. Integer malesuada facilisis orci et adipiscing. Nunc sollicitudin mollis nunc scelerisque auctor. Donec vehicula pretium dolor sed hendrerit. In egestas tortor dui, id porta ipsum bibendum nec. Donec posuere nibh odio. Morbi eget tempor lectus, at laoreet erat. Mauris facilisis luctus nibh, vitae tincidunt nisi suscipit ut. In hac habitasse platea dictumst. Cras non dolor elit. Nulla ultrices massa nec eros mattis bibendum.Nam pellentesque ipsum ac tincidunt elementum.&lt;/p&gt;\r\n', '', '', ''),
(3, 2, 'Aenean aliquet mi ligula', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Shoes of Prey is a global online retail brand that allows women (including Carly Rae Jepsen!) to design their own shoes which we hand-make and deliver to them. We’re changing the way women shop for shoes and we’re on track to become a significant international retailer within the next 5 years. As our business continues to grow we''re looking for a passionate Marketing and Product Management Intern to assist Todd, our Senior Product Manager improving our website conversion rate whilst also managing and propelling forward the Shoes of Prey presence in the French market.&lt;br /&gt;\r\nShoes of Prey has created one of the best shoe design experiences on the internet. With such a bright group of engineers, creatives and marketing specialists behind this website, there is much you can learn from an internship with us!&lt;br /&gt;\r\nShoes of Prey internships are full-time and based in Sydney, Australia. Internships typically last between 4 and 6 months. The internship is unpaid however, we do provide lunch daily and partial reimbursement for housing and/or travel expenses, depending on your relevant experience:&lt;br /&gt;\r\nYour Key Responsibilities:&lt;br /&gt;\r\nManage French market presence, including website content updates, email marketing, social media management, blogger outreach, and public relations efforts. Seeking out prospects for effective business partners within the French market.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Assisting the product management team in the coordination of website development and technology initiatives. Including managing design life cycle by conduct brainstorms, prototyping, design reviews, user testing, etc. Writing functional specifications and mock website enhancements. Also, administering our JIRA project management platform.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Review marketing and website analytics, manage internal company dashboard reporting.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Attend weekly production meetings with Engineering, Creative, and Marketing teams.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Applicants for this position should be fluent in both English and French. Working knowledge of Spanish or German are also appreciated. Candidates should have achieved or be pursuing a degree in business and/or engineering.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Strong organisational and analytical skills with a persistent attention to detail.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;A great attitude and team player mentality.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Time-management skills: multi-tasking, prioritising, organising and planning&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Technical aptitude:- you don''t need to know how to code (although that would be an asset) but you must be able to convey complex, technical product requirements to engineers, and then translate these complicated details to non-technical colleagues&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Creativity and an enthusiasm for technology or e-commerce in the fashion sector&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;An interest in marketing and social media&lt;br /&gt;\r\nTo apply for this role please email a cover letter and resume to joinourteam@shoesofprey.com with the subject line &quot;YOUR NAME - MARKETING AND PRODUCT MANAGEMENT INTERN&quot;. This is essential to ensure applications are reviewed by the correct department.&lt;/p&gt;\r\n', '', '', ''),
(4, 2, 'Curabitur pretium tincidunt', '&lt;p style=&quot;font-size: 13px;&quot;&gt;In hac habitasse platea dictumst. Nulla dapibus ultricies pede. Quisque augue risus, porttitor nec, suscipit ut, pellentesque quis, lacus. Duis adipiscing purus eu metus pharetra porttitor. Aenean sapien nisi, sodales non, facilisis nec, ultricies et, erat. Cras aliquam. Maecenas mi. Sed lacus arcu, malesuada id, ultricies et, ornare non, dolor. Maecenas turpis lacus, vehicula nec, blandit in, laoreet a, nibh. Donec aliquet. In et leo tincidunt tortor rhoncus convallis. Nulla facilisi. Praesent bibendum semper eros. Morbi risus. Nam tellus leo, ullamcorper egestas, venenatis quis, viverra ac, mauris. In hac habitasse platea dictumst. Curabitur at velit vel sem auctor hendrerit. Integer mauris orci, vehicula eu, feugiat ac, hendrerit ut, dolor. Fusce elit nulla, gravida quis, vulputate eu, rutrum vel, lectus. Integer cursus luctus nisl. Quisque quam. Aliquam lectus urna, porta in, viverra eu, pellentesque a, massa. Etiam eros sapien, porta et, aliquam et, bibendum sit amet, erat. Sed condimentum interdum lacus. In ut ante non felis tincidunt porta. Aenean aliquet ornare sem. Nunc dignissim, erat sit amet vulputate cursus, elit magna facilisis massa, quis hendrerit nunc odio id dui. Proin interdum dictum arcu. Pellentesque erat ante, ultricies ac, porttitor ac, dictum et, purus. Donec enim odio, gravida ut, imperdiet quis, rutrum ut, lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Etiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;&lt;br /&gt;\r\nSuspendisse aliquet sem ut nulla. Cras mollis ornare nisl. Morbi ac mi. Nunc eget nisi. Donec at enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed diam. Ut sagittis ultrices urna. Suspendisse eget erat non purus varius sodales. Aliquam imperdiet lobortis libero. Suspendisse scelerisque sagittis odio. Phasellus imperdiet interdum dolor. Mauris ante ante, gravida at, consectetuer quis, ullamcorper ornare, magna. Duis sed mauris sed libero tincidunt rutrum. In vulputate pretium dolor.Nullam ac erat. Donec a ipsum. Nullam tristique leo id lacus. Sed sed pede non arcu ornare interdum. Maecenas justo elit, rutrum in, adipiscing id, laoreet in, libero. Fusce quam. Donec a urna a enim gravida dictum. Nunc elementum, mauris sit amet imperdiet iaculis, dolor metus consectetuer mi, et tempor elit enim at massa. Duis ac nisl. Nullam pulvinar. Curabitur quam sapien, lobortis eu, luctus vitae, volutpat ac, metus. Nam elementum. Fusce fringilla. Praesent pulvinar turpis vitae justo cursus pulvinar. In hac habitasse platea dictumst. Nunc fermentum tellus interdum libero. Phasellus eros. Vestibulum euismod nunc at eros. Pellentesque nec ligula non tellus accumsan molestie. Pellentesque felis massa, tincidunt at, pulvinar id, placerat nec, velit.&lt;/p&gt;\r\n', '', '', ''),
(5, 2, 'Vitae justo cursus pulvinar', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Aenean aliquet mi ligula, et vehicula eros tempor at. Integer neque mi, scelerisque vel felis ac, convallis varius nibh. Quisque eget blandit ante. Vivamus vestibulum dolor dapibus arcu mattis placerat. Morbi blandit at magna nec vestibulum. Integer malesuada facilisis orci et adipiscing. Nunc sollicitudin mollis nunc scelerisque auctor. Donec vehicula pretium dolor sed hendrerit. In egestas tortor dui, id porta ipsum bibendum nec. Donec posuere nibh odio. Morbi eget tempor lectus, at laoreet erat. Mauris facilisis luctus nibh, vitae tincidunt nisi suscipit ut. In hac habitasse platea dictumst. Cras non dolor elit. Nulla ultrices massa nec eros mattis bibendum.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nam pellentesque ipsum ac tincidunt elementum. Maecenas eu metus sit amet nunc rhoncus dictum vitae non felis. Praesent consequat placerat velit nec vehicula. Aliquam nec varius nisi. In sollicitudin ac velit ac sodales. Nulla interdum lacus quis placerat semper. Suspendisse at sollicitudin lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Donec commodo commodo gravida. Nullam vel bibendum elit, eget eleifend massa. Cras tincidunt elementum augue, et volutpat dolor tincidunt in. Mauris non nunc odio. Suspendisse augue libero, sagittis non posuere a, molestie nec orci. Duis turpis quam, faucibus sed augue nec, imperdiet pretium tortor. Aliquam feugiat accumsan urna, sed sollicitudin nisl gravida nec. Aliquam vitae tincidunt erat, id bibendum magna. Proin sed sapien est. Quisque non felis arcu.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue. Nunc feugiat arcu ac nisl accumsan fringilla. Sed laoreet, libero vel molestie bibendum, nulla tellus fermentum libero, gravida eleifend libero sem eget urna. Nunc eget gravida felis. Nullam semper risus ultrices neque blandit, id venenatis diam blandit. Donec dui lacus, lacinia ac condimentum ut, congue eu ipsum. Suspendisse euismod nunc eu tellus molestie iaculis. Aliquam suscipit feugiat fermentum. Donec tempor urna nisl, eu feugiat tortor lobortis nec. Etiam ut tortor justo.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Sed pellentesque commodo magna, eget tincidunt magna condimentum lobortis. Integer facilisis ipsum sem, sit amet aliquet sem iaculis in. Vivamus at accumsan ante. Donec vitae diam eu magna tincidunt rutrum. Nullam interdum lacinia lobortis. Duis eget lobortis augue, id sollicitudin justo. Aenean sollicitudin elit ut egestas viverra. Mauris tempus mollis velit, cursus pulvinar lectus auctor eget. Quisque eget arcu iaculis, tempus tellus id, semper augue. Vivamus facilisis imperdiet consectetur. Proin ac magna ante. Phasellus nec sagittis tellus. Mauris cursus, mi eget mollis dignissim, lectus nibh placerat lorem, at lobortis tellus nulla vitae arcu. Ut sit amet orci ac sapien porta porta. Mauris facilisis sollicitudin pharetra. Phasellus rutrum nisi quam, quis congue nisi vehicula ac.&lt;/p&gt;\r\n', '', '', ''),
(6, 1, 'Sed posuere vestibulum nisl', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Morbi ac mi. Nunc eget nisi. Donec at enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed diam. Ut sagittis ultrices urna. Suspendisse eget erat non purus varius sodales. Aliquam imperdiet lobortis libero. Suspendisse scelerisque sagittis odio. Phasellus imperdiet interdum dolor. Mauris ante ante, gravida at, consectetuer quis, ullamcorper ornare, magna. Duis sed mauris sed libero tincidunt rutrum. In vulputate pretium dolor.Nullam ac erat. Donec a ipsum. Nullam tristique leo id lacus. Sed sed pede non arcu ornare interdum. Maecenas justo elit, rutrum in, adipiscing id, laoreet in, libero. Fusce quam. Donec a urna a enim gravida dictum. Nunc elementum, mauris sit amet imperdiet iaculis, dolor metus consectetuer mi, et tempor elit enim at massa. Duis ac nisl. Nullam pulvinar. Curabitur quam sapien, lobortis eu, luctus vitae, volutpat ac, metus. Nam elementum. Fusce fringilla. Praesent pulvinar turpis vitae justo cursus pulvinar. In hac habitasse platea dictumst. Nunc fermentum tellus interdum libero. Phasellus eros. Vestibulum euismod nunc at eros. Pellentesque nec ligula non tellus accumsan molestie. Pellentesque felis massa, tincidunt at, pulvinar id, placerat nec, velit.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Cras rhoncus ipsum ac dolor. In hac habitasse platea dictumst. Nulla dapibus ultricies pede. Quisque augue risus, porttitor nec, suscipit ut, pellentesque quis, lacus. Duis adipiscing purus eu metus pharetra porttitor. Aenean sapien nisi, sodales non, facilisis nec, ultricies et, erat. Cras aliquam. Maecenas mi. Sed lacus arcu, malesuada id, ultricies et, ornare non, dolor. Maecenas turpis lacus, vehicula nec, blandit in, laoreet a, nibh. Donec aliquet. In et leo tincidunt tortor rhoncus convallis. Nulla facilisi. Praesent bibendum semper eros. Morbi risus. Nam tellus leo, ullamcorper egestas, venenatis quis, viverra ac, mauris. In hac habitasse platea dictumst. Curabitur at velit vel sem auctor hendrerit. Integer mauris orci, vehicula eu, feugiat ac, hendrerit ut, dolor. Fusce elit nulla, gravida quis, vulputate eu, rutrum vel, lectus. Integer cursus luctus nisl. Quisque quam. Aliquam lectus urna, porta in, viverra eu, pellentesque a, massa. Etiam eros sapien, porta et, aliquam et, bibendum sit amet, erat. Sed condimentum interdum lacus. In ut ante non felis tincidunt porta. Aenean aliquet ornare sem. Nunc dignissim, erat sit amet vulputate cursus, elit magna facilisis massa, quis hendrerit nunc odio id dui. Proin interdum dictum arcu. Pellentesque erat ante, ultricies ac, porttitor ac, dictum et, purus. Donec enim odio, gravida ut, imperdiet quis, rutrum ut, lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Etiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.&lt;/p&gt;\r\n', '', '', ''),
(7, 1, 'Maecenas eu metus sit amet nunc', '&lt;span style=&quot;font-size: 13px;&quot;&gt;Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Aliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Vivamus commodo, augue et laoreet euismod, sem sapien tempor dolor, ac egestas sem ligula quis lacus. Donec vestibulum tortor ac lacus. Sed posuere vestibulum nisl. Curabitur eleifend fermentum justo. Nullam imperdiet. Integer sit amet mauris imperdiet risus sollicitudin rutrum. Ut vitae turpis. Nulla facilisi. Quisque tortor velit, scelerisque et, facilisis vel, tempor sed, urna. Vivamus nulla elit, vestibulum eget, semper et, scelerisque eget, lacus. Pellentesque viverra purus. Quisque elit. Donec ut dolor.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Duis volutpat elit et erat. In at nulla at nisl condimentum aliquet. Quisque elementum pharetra lacus. Nunc gravida arcu eget nunc. Nulla iaculis egestas magna. Aliquam erat volutpat. Sed pellentesque orci. Etiam lacus lorem, iaculis sit amet, pharetra quis, imperdiet sit amet, lectus. Integer quis elit ac mi aliquam pretium. Nullam mauris orci, porttitor eget, sollicitudin non, vulputate id, risus. Donec varius enim nec sem. Nam aliquam lacinia enim. Quisque eget lorem eu purus dignissim ultricies. Fusce porttitor hendrerit ante. Mauris urna diam, cursus id, mattis eget, tempus sit amet, risus. Curabitur eu felis. Sed eu mi. Nullam lectus mauris, luctus a, mattis ac, tempus non, leo. Cras mi nulla, rhoncus id, laoreet ut, ultricies id, odio.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Donec imperdiet. Vestibulum auctor tortor at orci. Integer semper, nisi eget suscipit eleifend, erat nisl hendrerit justo, eget vestibulum lorem justo ac leo. Integer sem velit, pharetra in, fringilla eu, fermentum id, felis. Vestibulum sed felis. In elit. Praesent et pede vel ante dapibus condimentum. Donec magna. Quisque id risus. Mauris vulputate pellentesque leo. Duis vulputate, ligula at venenatis tincidunt, orci nunc interdum leo, ac egestas elit sem ut lacus. Etiam non diam quis arcu egestas commodo. Curabitur nec massa ac massa gravida condimentum. Aenean id libero. Pellentesque vitae tellus. Fusce lectus est, accumsan ac, bibendum sed, porta eget, augue. Etiam faucibus. Quisque tempus purus eu ante.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Vestibulum sapien nisl, ornare auctor, consectetuer quis, posuere tristique, odio. Fusce ultrices ullamcorper odio. Ut augue nulla, interdum at, adipiscing non, tristique eget, neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut pede est, condimentum id, scelerisque ac, malesuada non, quam. Proin eu ligula ac sapien suscipit blandit. Suspendisse euismod. Ut accumsan, neque id gravida luctus, arcu pede sodales felis, vel blandit massa arcu eget ligula. Aenean sed turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem eros, ornare ut, commodo eu, tempor nec, risus. Donec laoreet dapibus ligula. Praesent orci leo, bibendum nec, ornare et, nonummy in, elit. Donec interdum feugiat leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque feugiat ullamcorper ipsum. Donec convallis tincidunt urna.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Suspendisse et orci et arcu porttitor pellentesque. Sed lacus nunc, fermentum vel, vehicula in, imperdiet eget, urna. Nam consectetuer euismod nunc. Nulla dignissim posuere nulla. Integer iaculis lacinia massa. Nullam sapien augue, condimentum vel, venenatis id, rhoncus pellentesque, sapien. Donec sed ipsum ultrices turpis consectetuer imperdiet. Duis et ipsum ac nisl laoreet commodo. Mauris eu est. Suspendisse id turpis quis orci euismod consequat. Donec tellus mi, luctus sit amet, ultrices a, convallis eu, lorem. Proin faucibus convallis elit. Maecenas rhoncus arcu at arcu. Proin libero. Proin adipiscing. In quis lorem vitae elit consectetuer pretium. Nullam ligula urna, adipiscing nec, iaculis ut, elementum non, turpis. Fusce pulvinar.&lt;/span&gt;', '', '', ''),
(8, 1, 'Consectetur adipisicing elit', '&lt;span style=&quot;font-size: 13px;&quot;&gt;Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Aliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Vivamus commodo, augue et laoreet euismod, sem sapien tempor dolor, ac egestas sem ligula quis lacus. Donec vestibulum tortor ac lacus. Sed posuere vestibulum nisl. Curabitur eleifend fermentum justo. Nullam imperdiet. Integer sit amet mauris imperdiet risus sollicitudin rutrum. Ut vitae turpis. Nulla facilisi. Quisque tortor velit, scelerisque et, facilisis vel, tempor sed, urna. Vivamus nulla elit, vestibulum eget, semper et, scelerisque eget, lacus. Pellentesque viverra purus. Quisque elit. Donec ut dolor.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Duis volutpat elit et erat. In at nulla at nisl condimentum aliquet. Quisque elementum pharetra lacus. Nunc gravida arcu eget nunc. Nulla iaculis egestas magna. Aliquam erat volutpat. Sed pellentesque orci. Etiam lacus lorem, iaculis sit amet, pharetra quis, imperdiet sit amet, lectus. Integer quis elit ac mi aliquam pretium. Nullam mauris orci, porttitor eget, sollicitudin non, vulputate id, risus. Donec varius enim nec sem. Nam aliquam lacinia enim. Quisque eget lorem eu purus dignissim ultricies. Fusce porttitor hendrerit ante. Mauris urna diam, cursus id, mattis eget, tempus sit amet, risus. Curabitur eu felis. Sed eu mi. Nullam lectus mauris, luctus a, mattis ac, tempus non, leo. Cras mi nulla, rhoncus id, laoreet ut, ultricies id, odio.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Donec imperdiet. Vestibulum auctor tortor at orci. Integer semper, nisi eget suscipit eleifend, erat nisl hendrerit justo, eget vestibulum lorem justo ac leo. Integer sem velit, pharetra in, fringilla eu, fermentum id, felis. Vestibulum sed felis. In elit. Praesent et pede vel ante dapibus condimentum. Donec magna. Quisque id risus. Mauris vulputate pellentesque leo. Duis vulputate, ligula at venenatis tincidunt, orci nunc interdum leo, ac egestas elit sem ut lacus. Etiam non diam quis arcu egestas commodo. Curabitur nec massa ac massa gravida condimentum. Aenean id libero. Pellentesque vitae tellus. Fusce lectus est, accumsan ac, bibendum sed, porta eget, augue. Etiam faucibus. Quisque tempus purus eu ante.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Vestibulum sapien nisl, ornare auctor, consectetuer quis, posuere tristique, odio. Fusce ultrices ullamcorper odio. Ut augue nulla, interdum at, adipiscing non, tristique eget, neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut pede est, condimentum id, scelerisque ac, malesuada non, quam. Proin eu ligula ac sapien suscipit blandit. Suspendisse euismod. Ut accumsan, neque id gravida luctus, arcu pede sodales felis, vel blandit massa arcu eget ligula. Aenean sed turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem eros, ornare ut, commodo eu, tempor nec, risus. Donec laoreet dapibus ligula. Praesent orci leo, bibendum nec, ornare et, nonummy in, elit. Donec interdum feugiat leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque feugiat ullamcorper ipsum. Donec convallis tincidunt urna.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Suspendisse et orci et arcu porttitor pellentesque. Sed lacus nunc, fermentum vel, vehicula in, imperdiet eget, urna. Nam consectetuer euismod nunc. Nulla dignissim posuere nulla. Integer iaculis lacinia massa. Nullam sapien augue, condimentum vel, venenatis id, rhoncus pellentesque, sapien. Donec sed ipsum ultrices turpis consectetuer imperdiet. Duis et ipsum ac nisl laoreet commodo. Mauris eu est. Suspendisse id turpis quis orci euismod consequat. Donec tellus mi, luctus sit amet, ultrices a, convallis eu, lorem. Proin faucibus convallis elit. Maecenas rhoncus arcu at arcu. Proin libero. Proin adipiscing. In quis lorem vitae elit consectetuer pretium. Nullam ligula urna, adipiscing nec, iaculis ut, elementum non, turpis. Fusce pulvinar.&lt;/span&gt;', '', '', ''),
(9, 1, 'Urna eget erat non purus', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Suspendisse aliquet sem ut nulla. Cras mollis ornare nisl. Morbi ac mi. Nunc eget nisi. Donec at enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed diam. Ut sagittis ultrices urna. Suspendisse eget erat non purus varius sodales. Aliquam imperdiet lobortis libero. Suspendisse scelerisque sagittis odio. Phasellus imperdiet interdum dolor. Mauris ante ante, gravida at, consectetuer quis, ullamcorper ornare, magna. Duis sed mauris sed libero tincidunt rutrum. In vulputate pretium dolor.Nullam ac erat. Donec a ipsum. Nullam tristique leo id lacus. Sed sed pede non arcu ornare interdum. Maecenas justo elit, rutrum in, adipiscing id, laoreet in, libero. Fusce quam. Donec a urna a enim gravida dictum. Nunc elementum, mauris sit amet imperdiet iaculis, dolor metus consectetuer mi, et tempor elit enim at massa. Duis ac nisl. Nullam pulvinar. Curabitur quam sapien, lobortis eu, luctus vitae, volutpat ac, metus. Nam elementum. Fusce fringilla. Praesent pulvinar turpis vitae justo cursus pulvinar. In hac habitasse platea dictumst. Nunc fermentum tellus interdum libero. Phasellus eros. Vestibulum euismod nunc at eros. Pellentesque nec ligula non tellus accumsan molestie. Pellentesque felis massa, tincidunt at, pulvinar id, placerat nec, velit.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Cras rhoncus ipsum ac dolor. In hac habitasse platea dictumst. Nulla dapibus ultricies pede. Quisque augue risus, porttitor nec, suscipit ut, pellentesque quis, lacus. Duis adipiscing purus eu metus pharetra porttitor. Aenean sapien nisi, sodales non, facilisis nec, ultricies et, erat. Cras aliquam. Maecenas mi. Sed lacus arcu, malesuada id, ultricies et, ornare non, dolor. Maecenas turpis lacus, vehicula nec, blandit in, laoreet a, nibh. Donec aliquet. In et leo tincidunt tortor rhoncus convallis. Nulla facilisi. Praesent bibendum semper eros. Morbi risus. Nam tellus leo, ullamcorper egestas, venenatis quis, viverra ac, mauris. In hac habitasse platea dictumst. Curabitur at velit vel sem auctor hendrerit. Integer mauris orci, vehicula eu, feugiat ac, hendrerit ut, dolor. Fusce elit nulla, gravida quis, vulputate eu, rutrum vel, lectus. Integer cursus luctus nisl. Quisque quam. Aliquam lectus urna, porta in, viverra eu, pellentesque a, massa. Etiam eros sapien, porta et, aliquam et, bibendum sit amet, erat. Sed condimentum interdum lacus. In ut ante non felis tincidunt porta. Aenean aliquet ornare sem. Nunc dignissim, erat sit amet vulputate cursus, elit magna facilisis massa, quis hendrerit nunc odio id dui. Proin interdum dictum arcu. Pellentesque erat ante, ultricies ac, porttitor ac, dictum et, purus. Donec enim odio, gravida ut, imperdiet quis, rutrum ut, lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Etiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.&lt;/p&gt;\r\n', '', '', ''),
(10, 1, 'Nam pellentesque ipsum ac tincidunt elementum', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Sed pellentesque commodo magna, eget tincidunt magna condimentum lobortis. Integer facilisis ipsum sem, sit amet aliquet sem iaculis in. Vivamus at accumsan ante. Donec vitae diam eu magna tincidunt rutrum. Nullam interdum lacinia lobortis. Duis eget lobortis augue, id sollicitudin justo. Aenean sollicitudin elit ut egestas viverra. Mauris tempus mollis velit, cursus pulvinar lectus auctor eget. Quisque eget arcu iaculis, tempus tellus id, semper augue. Vivamus facilisis imperdiet consectetur. Proin ac magna ante. Phasellus nec sagittis tellus. Mauris cursus, mi eget mollis dignissim, lectus nibh placerat lorem, at lobortis tellus nulla vitae arcu. Ut sit amet orci ac sapien porta porta. Mauris facilisis sollicitudin pharetra. Phasellus rutrum nisi quam, quis congue nisi vehicula ac.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Aenean aliquet mi ligula, et vehicula eros tempor at. Integer neque mi, scelerisque vel felis ac, convallis varius nibh. Quisque eget blandit ante. Vivamus vestibulum dolor dapibus arcu mattis placerat. Morbi blandit at magna nec vestibulum. Integer malesuada facilisis orci et adipiscing. Nunc sollicitudin mollis nunc scelerisque auctor. Donec vehicula pretium dolor sed hendrerit. In egestas tortor dui, id porta ipsum bibendum nec. Donec posuere nibh odio. Morbi eget tempor lectus, at laoreet erat. Mauris facilisis luctus nibh, vitae tincidunt nisi suscipit ut. In hac habitasse platea dictumst. Cras non dolor elit. Nulla ultrices massa nec eros mattis bibendum.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nam pellentesque ipsum ac tincidunt elementum. Maecenas eu metus sit amet nunc rhoncus dictum vitae non felis. Praesent consequat placerat velit nec vehicula. Aliquam nec varius nisi. In sollicitudin ac velit ac sodales. Nulla interdum lacus quis placerat semper. Suspendisse at sollicitudin lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Donec commodo commodo gravida. Nullam vel bibendum elit, eget eleifend massa. Cras tincidunt elementum augue, et volutpat dolor tincidunt in. Mauris non nunc odio. Suspendisse augue libero, sagittis non posuere a, molestie nec orci. Duis turpis quam, faucibus sed augue nec, imperdiet pretium tortor. Aliquam feugiat accumsan urna, sed sollicitudin nisl gravida nec. Aliquam vitae tincidunt erat, id bibendum magna. Proin sed sapien est. Quisque non felis arcu.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue. Nunc feugiat arcu ac nisl accumsan fringilla. Sed laoreet, libero vel molestie bibendum, nulla tellus fermentum libero, gravida eleifend libero sem eget urna. Nunc eget gravida felis. Nullam semper risus ultrices neque blandit, id venenatis diam blandit. Donec dui lacus, lacinia ac condimentum ut, congue eu ipsum. Suspendisse euismod nunc eu tellus molestie iaculis. Aliquam suscipit feugiat fermentum. Donec tempor urna nisl, eu feugiat tortor lobortis nec. Etiam ut tortor justo.&lt;/p&gt;\r\n', '', '', ''),
(1, 1, 'Vestibulum auctor tortor', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.&lt;br /&gt;\r\nAliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Etiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Aenean aliquet mi ligula, et vehicula eros tempor at. Integer neque mi, scelerisque vel felis ac, convallis varius nibh. Quisque eget blandit ante. Vivamus vestibulum dolor dapibus arcu mattis placerat. Morbi blandit at magna nec vestibulum. Integer malesuada facilisis orci et adipiscing. Nunc sollicitudin mollis nunc scelerisque auctor. Donec vehicula pretium dolor sed hendrerit. In egestas tortor dui, id porta ipsum bibendum nec. Donec posuere nibh odio. Morbi eget tempor lectus, at laoreet erat. Mauris facilisis luctus nibh, vitae tincidunt nisi suscipit ut. In hac habitasse platea dictumst. Cras non dolor elit. Nulla ultrices massa nec eros mattis bibendum.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nam pellentesque ipsum ac tincidunt elementum. Maecenas eu metus sit amet nunc rhoncus dictum vitae non felis. Praesent consequat placerat velit nec vehicula. Aliquam nec varius nisi. In sollicitudin ac velit ac sodales. Nulla interdum lacus quis placerat semper. Suspendisse at sollicitudin lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Donec commodo commodo gravida. Nullam vel bibendum elit, eget eleifend massa. Cras tincidunt elementum augue, et volutpat dolor tincidunt in. Mauris non nunc odio. Suspendisse augue libero, sagittis non posuere a, molestie nec orci. Duis turpis quam, faucibus sed augue nec, imperdiet pretium tortor. Aliquam feugiat accumsan urna, sed sollicitudin nisl gravida nec. Aliquam vitae tincidunt erat, id bibendum magna. Proin sed sapien est. Quisque non felis arcu.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue. Nunc feugiat arcu ac nisl accumsan fringilla. Sed laoreet, libero vel molestie bibendum, nulla tellus fermentum libero, gravida eleifend libero sem eget urna. Nunc eget gravida felis. Nullam semper risus ultrices neque blandit, id venenatis diam blandit. Donec dui lacus, lacinia ac condimentum ut, congue eu ipsum. Suspendisse euismod nunc eu tellus molestie iaculis. Aliquam suscipit feugiat fermentum. Donec tempor urna nisl, eu feugiat tortor lobortis nec. Etiam ut tortor justo.&lt;/p&gt;\r\n', '', '', '');
INSERT INTO `oc_kbm_article_description` (`article_id`, `language_id`, `name`, `description`, `meta_keyword`, `meta_description`, `tags`) VALUES
(2, 1, 'Tincidunt elementum', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Maecenas eu metus sit amet nunc rhoncus dictum vitae non felis. Praesent consequat placerat velit nec vehicula. Aliquam nec varius nisi. In sollicitudin ac velit ac sodales. Nulla interdum lacus quis placerat semper. Suspendisse at sollicitudin lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Donec commodo commodo gravida. Nullam vel bibendum elit, eget eleifend massa. Cras tincidunt elementum augue, et volutpat dolor tincidunt in. Mauris non nunc odio. Suspendisse augue libero, sagittis non posuere a, molestie nec orci. Duis turpis quam, faucibus sed augue nec, imperdiet pretium tortor. Aliquam feugiat accumsan urna, sed sollicitudin nisl gravida nec. Aliquam vitae tincidunt erat, id bibendum magna. Proin sed sapien est. Quisque non felis arcu.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue. Nunc feugiat arcu ac nisl accumsan fringilla. Sed laoreet, libero vel molestie bibendum, nulla tellus fermentum libero, gravida eleifend libero sem eget urna. Nunc eget gravida felis. Nullam semper risus ultrices neque blandit, id venenatis diam blandit. Donec dui lacus, lacinia ac condimentum ut, congue eu ipsum. Suspendisse euismod nunc eu tellus molestie iaculis. Aliquam suscipit feugiat fermentum. Donec tempor urna nisl, eu feugiat tortor lobortis nec. Etiam ut tortor justo.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Sed pellentesque commodo magna, eget tincidunt magna condimentum lobortis. Integer facilisis ipsum sem, sit amet aliquet sem iaculis in. Vivamus at accumsan ante. Donec vitae diam eu magna tincidunt rutrum. Nullam interdum lacinia lobortis. Duis eget lobortis augue, id sollicitudin justo. Aenean sollicitudin elit ut egestas viverra. Mauris tempus mollis velit, cursus pulvinar lectus auctor eget. Quisque eget arcu iaculis, tempus tellus id, semper augue. Vivamus facilisis imperdiet consectetur. Proin ac magna ante. Phasellus nec sagittis tellus. Mauris cursus, mi eget mollis dignissim, lectus nibh placerat lorem, at lobortis tellus nulla vitae arcu. Ut sit amet orci ac sapien porta porta. Mauris facilisis sollicitudin pharetra. Phasellus rutrum nisi quam, quis congue nisi vehicula ac.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Aenean aliquet mi ligula, et vehicula eros tempor at. Integer neque mi, scelerisque vel felis ac, convallis varius nibh. Quisque eget blandit ante. Vivamus vestibulum dolor dapibus arcu mattis placerat. Morbi blandit at magna nec vestibulum. Integer malesuada facilisis orci et adipiscing. Nunc sollicitudin mollis nunc scelerisque auctor. Donec vehicula pretium dolor sed hendrerit. In egestas tortor dui, id porta ipsum bibendum nec. Donec posuere nibh odio. Morbi eget tempor lectus, at laoreet erat. Mauris facilisis luctus nibh, vitae tincidunt nisi suscipit ut. In hac habitasse platea dictumst. Cras non dolor elit. Nulla ultrices massa nec eros mattis bibendum.Nam pellentesque ipsum ac tincidunt elementum.&lt;/p&gt;\r\n', '', '', ''),
(3, 1, 'Aenean aliquet mi ligula', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Shoes of Prey is a global online retail brand that allows women (including Carly Rae Jepsen!) to design their own shoes which we hand-make and deliver to them. We’re changing the way women shop for shoes and we’re on track to become a significant international retailer within the next 5 years. As our business continues to grow we''re looking for a passionate Marketing and Product Management Intern to assist Todd, our Senior Product Manager improving our website conversion rate whilst also managing and propelling forward the Shoes of Prey presence in the French market.&lt;br /&gt;\r\nShoes of Prey has created one of the best shoe design experiences on the internet. With such a bright group of engineers, creatives and marketing specialists behind this website, there is much you can learn from an internship with us!&lt;br /&gt;\r\nShoes of Prey internships are full-time and based in Sydney, Australia. Internships typically last between 4 and 6 months. The internship is unpaid however, we do provide lunch daily and partial reimbursement for housing and/or travel expenses, depending on your relevant experience:&lt;br /&gt;\r\nYour Key Responsibilities:&lt;br /&gt;\r\nManage French market presence, including website content updates, email marketing, social media management, blogger outreach, and public relations efforts. Seeking out prospects for effective business partners within the French market.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Assisting the product management team in the coordination of website development and technology initiatives. Including managing design life cycle by conduct brainstorms, prototyping, design reviews, user testing, etc. Writing functional specifications and mock website enhancements. Also, administering our JIRA project management platform.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Review marketing and website analytics, manage internal company dashboard reporting.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Attend weekly production meetings with Engineering, Creative, and Marketing teams.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Applicants for this position should be fluent in both English and French. Working knowledge of Spanish or German are also appreciated. Candidates should have achieved or be pursuing a degree in business and/or engineering.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Strong organisational and analytical skills with a persistent attention to detail.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;A great attitude and team player mentality.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Time-management skills: multi-tasking, prioritising, organising and planning&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Technical aptitude:- you don''t need to know how to code (although that would be an asset) but you must be able to convey complex, technical product requirements to engineers, and then translate these complicated details to non-technical colleagues&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Creativity and an enthusiasm for technology or e-commerce in the fashion sector&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;An interest in marketing and social media&lt;br /&gt;\r\nTo apply for this role please email a cover letter and resume to joinourteam@shoesofprey.com with the subject line &quot;YOUR NAME - MARKETING AND PRODUCT MANAGEMENT INTERN&quot;. This is essential to ensure applications are reviewed by the correct department.&lt;/p&gt;\r\n', '', '', ''),
(4, 1, 'Curabitur pretium tincidunt', '&lt;p style=&quot;font-size: 13px;&quot;&gt;In hac habitasse platea dictumst. Nulla dapibus ultricies pede. Quisque augue risus, porttitor nec, suscipit ut, pellentesque quis, lacus. Duis adipiscing purus eu metus pharetra porttitor. Aenean sapien nisi, sodales non, facilisis nec, ultricies et, erat. Cras aliquam. Maecenas mi. Sed lacus arcu, malesuada id, ultricies et, ornare non, dolor. Maecenas turpis lacus, vehicula nec, blandit in, laoreet a, nibh. Donec aliquet. In et leo tincidunt tortor rhoncus convallis. Nulla facilisi. Praesent bibendum semper eros. Morbi risus. Nam tellus leo, ullamcorper egestas, venenatis quis, viverra ac, mauris. In hac habitasse platea dictumst. Curabitur at velit vel sem auctor hendrerit. Integer mauris orci, vehicula eu, feugiat ac, hendrerit ut, dolor. Fusce elit nulla, gravida quis, vulputate eu, rutrum vel, lectus. Integer cursus luctus nisl. Quisque quam. Aliquam lectus urna, porta in, viverra eu, pellentesque a, massa. Etiam eros sapien, porta et, aliquam et, bibendum sit amet, erat. Sed condimentum interdum lacus. In ut ante non felis tincidunt porta. Aenean aliquet ornare sem. Nunc dignissim, erat sit amet vulputate cursus, elit magna facilisis massa, quis hendrerit nunc odio id dui. Proin interdum dictum arcu. Pellentesque erat ante, ultricies ac, porttitor ac, dictum et, purus. Donec enim odio, gravida ut, imperdiet quis, rutrum ut, lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Etiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;&lt;br /&gt;\r\nSuspendisse aliquet sem ut nulla. Cras mollis ornare nisl. Morbi ac mi. Nunc eget nisi. Donec at enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed diam. Ut sagittis ultrices urna. Suspendisse eget erat non purus varius sodales. Aliquam imperdiet lobortis libero. Suspendisse scelerisque sagittis odio. Phasellus imperdiet interdum dolor. Mauris ante ante, gravida at, consectetuer quis, ullamcorper ornare, magna. Duis sed mauris sed libero tincidunt rutrum. In vulputate pretium dolor.Nullam ac erat. Donec a ipsum. Nullam tristique leo id lacus. Sed sed pede non arcu ornare interdum. Maecenas justo elit, rutrum in, adipiscing id, laoreet in, libero. Fusce quam. Donec a urna a enim gravida dictum. Nunc elementum, mauris sit amet imperdiet iaculis, dolor metus consectetuer mi, et tempor elit enim at massa. Duis ac nisl. Nullam pulvinar. Curabitur quam sapien, lobortis eu, luctus vitae, volutpat ac, metus. Nam elementum. Fusce fringilla. Praesent pulvinar turpis vitae justo cursus pulvinar. In hac habitasse platea dictumst. Nunc fermentum tellus interdum libero. Phasellus eros. Vestibulum euismod nunc at eros. Pellentesque nec ligula non tellus accumsan molestie. Pellentesque felis massa, tincidunt at, pulvinar id, placerat nec, velit.&lt;/p&gt;\r\n', '', '', ''),
(5, 1, 'Vitae justo cursus pulvinar', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Aenean aliquet mi ligula, et vehicula eros tempor at. Integer neque mi, scelerisque vel felis ac, convallis varius nibh. Quisque eget blandit ante. Vivamus vestibulum dolor dapibus arcu mattis placerat. Morbi blandit at magna nec vestibulum. Integer malesuada facilisis orci et adipiscing. Nunc sollicitudin mollis nunc scelerisque auctor. Donec vehicula pretium dolor sed hendrerit. In egestas tortor dui, id porta ipsum bibendum nec. Donec posuere nibh odio. Morbi eget tempor lectus, at laoreet erat. Mauris facilisis luctus nibh, vitae tincidunt nisi suscipit ut. In hac habitasse platea dictumst. Cras non dolor elit. Nulla ultrices massa nec eros mattis bibendum.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nam pellentesque ipsum ac tincidunt elementum. Maecenas eu metus sit amet nunc rhoncus dictum vitae non felis. Praesent consequat placerat velit nec vehicula. Aliquam nec varius nisi. In sollicitudin ac velit ac sodales. Nulla interdum lacus quis placerat semper. Suspendisse at sollicitudin lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Donec commodo commodo gravida. Nullam vel bibendum elit, eget eleifend massa. Cras tincidunt elementum augue, et volutpat dolor tincidunt in. Mauris non nunc odio. Suspendisse augue libero, sagittis non posuere a, molestie nec orci. Duis turpis quam, faucibus sed augue nec, imperdiet pretium tortor. Aliquam feugiat accumsan urna, sed sollicitudin nisl gravida nec. Aliquam vitae tincidunt erat, id bibendum magna. Proin sed sapien est. Quisque non felis arcu.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue. Nunc feugiat arcu ac nisl accumsan fringilla. Sed laoreet, libero vel molestie bibendum, nulla tellus fermentum libero, gravida eleifend libero sem eget urna. Nunc eget gravida felis. Nullam semper risus ultrices neque blandit, id venenatis diam blandit. Donec dui lacus, lacinia ac condimentum ut, congue eu ipsum. Suspendisse euismod nunc eu tellus molestie iaculis. Aliquam suscipit feugiat fermentum. Donec tempor urna nisl, eu feugiat tortor lobortis nec. Etiam ut tortor justo.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Sed pellentesque commodo magna, eget tincidunt magna condimentum lobortis. Integer facilisis ipsum sem, sit amet aliquet sem iaculis in. Vivamus at accumsan ante. Donec vitae diam eu magna tincidunt rutrum. Nullam interdum lacinia lobortis. Duis eget lobortis augue, id sollicitudin justo. Aenean sollicitudin elit ut egestas viverra. Mauris tempus mollis velit, cursus pulvinar lectus auctor eget. Quisque eget arcu iaculis, tempus tellus id, semper augue. Vivamus facilisis imperdiet consectetur. Proin ac magna ante. Phasellus nec sagittis tellus. Mauris cursus, mi eget mollis dignissim, lectus nibh placerat lorem, at lobortis tellus nulla vitae arcu. Ut sit amet orci ac sapien porta porta. Mauris facilisis sollicitudin pharetra. Phasellus rutrum nisi quam, quis congue nisi vehicula ac.&lt;/p&gt;\r\n', '', '', ''),
(6, 2, 'Sed posuere vestibulum nisl', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Morbi ac mi. Nunc eget nisi. Donec at enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed diam. Ut sagittis ultrices urna. Suspendisse eget erat non purus varius sodales. Aliquam imperdiet lobortis libero. Suspendisse scelerisque sagittis odio. Phasellus imperdiet interdum dolor. Mauris ante ante, gravida at, consectetuer quis, ullamcorper ornare, magna. Duis sed mauris sed libero tincidunt rutrum. In vulputate pretium dolor.Nullam ac erat. Donec a ipsum. Nullam tristique leo id lacus. Sed sed pede non arcu ornare interdum. Maecenas justo elit, rutrum in, adipiscing id, laoreet in, libero. Fusce quam. Donec a urna a enim gravida dictum. Nunc elementum, mauris sit amet imperdiet iaculis, dolor metus consectetuer mi, et tempor elit enim at massa. Duis ac nisl. Nullam pulvinar. Curabitur quam sapien, lobortis eu, luctus vitae, volutpat ac, metus. Nam elementum. Fusce fringilla. Praesent pulvinar turpis vitae justo cursus pulvinar. In hac habitasse platea dictumst. Nunc fermentum tellus interdum libero. Phasellus eros. Vestibulum euismod nunc at eros. Pellentesque nec ligula non tellus accumsan molestie. Pellentesque felis massa, tincidunt at, pulvinar id, placerat nec, velit.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Cras rhoncus ipsum ac dolor. In hac habitasse platea dictumst. Nulla dapibus ultricies pede. Quisque augue risus, porttitor nec, suscipit ut, pellentesque quis, lacus. Duis adipiscing purus eu metus pharetra porttitor. Aenean sapien nisi, sodales non, facilisis nec, ultricies et, erat. Cras aliquam. Maecenas mi. Sed lacus arcu, malesuada id, ultricies et, ornare non, dolor. Maecenas turpis lacus, vehicula nec, blandit in, laoreet a, nibh. Donec aliquet. In et leo tincidunt tortor rhoncus convallis. Nulla facilisi. Praesent bibendum semper eros. Morbi risus. Nam tellus leo, ullamcorper egestas, venenatis quis, viverra ac, mauris. In hac habitasse platea dictumst. Curabitur at velit vel sem auctor hendrerit. Integer mauris orci, vehicula eu, feugiat ac, hendrerit ut, dolor. Fusce elit nulla, gravida quis, vulputate eu, rutrum vel, lectus. Integer cursus luctus nisl. Quisque quam. Aliquam lectus urna, porta in, viverra eu, pellentesque a, massa. Etiam eros sapien, porta et, aliquam et, bibendum sit amet, erat. Sed condimentum interdum lacus. In ut ante non felis tincidunt porta. Aenean aliquet ornare sem. Nunc dignissim, erat sit amet vulputate cursus, elit magna facilisis massa, quis hendrerit nunc odio id dui. Proin interdum dictum arcu. Pellentesque erat ante, ultricies ac, porttitor ac, dictum et, purus. Donec enim odio, gravida ut, imperdiet quis, rutrum ut, lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Etiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.&lt;/p&gt;\r\n', '', '', ''),
(7, 2, 'Maecenas eu metus sit amet nunc', '&lt;span style=&quot;font-size: 13px;&quot;&gt;Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Aliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Vivamus commodo, augue et laoreet euismod, sem sapien tempor dolor, ac egestas sem ligula quis lacus. Donec vestibulum tortor ac lacus. Sed posuere vestibulum nisl. Curabitur eleifend fermentum justo. Nullam imperdiet. Integer sit amet mauris imperdiet risus sollicitudin rutrum. Ut vitae turpis. Nulla facilisi. Quisque tortor velit, scelerisque et, facilisis vel, tempor sed, urna. Vivamus nulla elit, vestibulum eget, semper et, scelerisque eget, lacus. Pellentesque viverra purus. Quisque elit. Donec ut dolor.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Duis volutpat elit et erat. In at nulla at nisl condimentum aliquet. Quisque elementum pharetra lacus. Nunc gravida arcu eget nunc. Nulla iaculis egestas magna. Aliquam erat volutpat. Sed pellentesque orci. Etiam lacus lorem, iaculis sit amet, pharetra quis, imperdiet sit amet, lectus. Integer quis elit ac mi aliquam pretium. Nullam mauris orci, porttitor eget, sollicitudin non, vulputate id, risus. Donec varius enim nec sem. Nam aliquam lacinia enim. Quisque eget lorem eu purus dignissim ultricies. Fusce porttitor hendrerit ante. Mauris urna diam, cursus id, mattis eget, tempus sit amet, risus. Curabitur eu felis. Sed eu mi. Nullam lectus mauris, luctus a, mattis ac, tempus non, leo. Cras mi nulla, rhoncus id, laoreet ut, ultricies id, odio.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Donec imperdiet. Vestibulum auctor tortor at orci. Integer semper, nisi eget suscipit eleifend, erat nisl hendrerit justo, eget vestibulum lorem justo ac leo. Integer sem velit, pharetra in, fringilla eu, fermentum id, felis. Vestibulum sed felis. In elit. Praesent et pede vel ante dapibus condimentum. Donec magna. Quisque id risus. Mauris vulputate pellentesque leo. Duis vulputate, ligula at venenatis tincidunt, orci nunc interdum leo, ac egestas elit sem ut lacus. Etiam non diam quis arcu egestas commodo. Curabitur nec massa ac massa gravida condimentum. Aenean id libero. Pellentesque vitae tellus. Fusce lectus est, accumsan ac, bibendum sed, porta eget, augue. Etiam faucibus. Quisque tempus purus eu ante.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Vestibulum sapien nisl, ornare auctor, consectetuer quis, posuere tristique, odio. Fusce ultrices ullamcorper odio. Ut augue nulla, interdum at, adipiscing non, tristique eget, neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut pede est, condimentum id, scelerisque ac, malesuada non, quam. Proin eu ligula ac sapien suscipit blandit. Suspendisse euismod. Ut accumsan, neque id gravida luctus, arcu pede sodales felis, vel blandit massa arcu eget ligula. Aenean sed turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem eros, ornare ut, commodo eu, tempor nec, risus. Donec laoreet dapibus ligula. Praesent orci leo, bibendum nec, ornare et, nonummy in, elit. Donec interdum feugiat leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque feugiat ullamcorper ipsum. Donec convallis tincidunt urna.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Suspendisse et orci et arcu porttitor pellentesque. Sed lacus nunc, fermentum vel, vehicula in, imperdiet eget, urna. Nam consectetuer euismod nunc. Nulla dignissim posuere nulla. Integer iaculis lacinia massa. Nullam sapien augue, condimentum vel, venenatis id, rhoncus pellentesque, sapien. Donec sed ipsum ultrices turpis consectetuer imperdiet. Duis et ipsum ac nisl laoreet commodo. Mauris eu est. Suspendisse id turpis quis orci euismod consequat. Donec tellus mi, luctus sit amet, ultrices a, convallis eu, lorem. Proin faucibus convallis elit. Maecenas rhoncus arcu at arcu. Proin libero. Proin adipiscing. In quis lorem vitae elit consectetuer pretium. Nullam ligula urna, adipiscing nec, iaculis ut, elementum non, turpis. Fusce pulvinar.&lt;/span&gt;', '', '', ''),
(8, 2, 'Consectetur adipisicing elit', '&lt;span style=&quot;font-size: 13px;&quot;&gt;Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Aliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Vivamus commodo, augue et laoreet euismod, sem sapien tempor dolor, ac egestas sem ligula quis lacus. Donec vestibulum tortor ac lacus. Sed posuere vestibulum nisl. Curabitur eleifend fermentum justo. Nullam imperdiet. Integer sit amet mauris imperdiet risus sollicitudin rutrum. Ut vitae turpis. Nulla facilisi. Quisque tortor velit, scelerisque et, facilisis vel, tempor sed, urna. Vivamus nulla elit, vestibulum eget, semper et, scelerisque eget, lacus. Pellentesque viverra purus. Quisque elit. Donec ut dolor.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Duis volutpat elit et erat. In at nulla at nisl condimentum aliquet. Quisque elementum pharetra lacus. Nunc gravida arcu eget nunc. Nulla iaculis egestas magna. Aliquam erat volutpat. Sed pellentesque orci. Etiam lacus lorem, iaculis sit amet, pharetra quis, imperdiet sit amet, lectus. Integer quis elit ac mi aliquam pretium. Nullam mauris orci, porttitor eget, sollicitudin non, vulputate id, risus. Donec varius enim nec sem. Nam aliquam lacinia enim. Quisque eget lorem eu purus dignissim ultricies. Fusce porttitor hendrerit ante. Mauris urna diam, cursus id, mattis eget, tempus sit amet, risus. Curabitur eu felis. Sed eu mi. Nullam lectus mauris, luctus a, mattis ac, tempus non, leo. Cras mi nulla, rhoncus id, laoreet ut, ultricies id, odio.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Donec imperdiet. Vestibulum auctor tortor at orci. Integer semper, nisi eget suscipit eleifend, erat nisl hendrerit justo, eget vestibulum lorem justo ac leo. Integer sem velit, pharetra in, fringilla eu, fermentum id, felis. Vestibulum sed felis. In elit. Praesent et pede vel ante dapibus condimentum. Donec magna. Quisque id risus. Mauris vulputate pellentesque leo. Duis vulputate, ligula at venenatis tincidunt, orci nunc interdum leo, ac egestas elit sem ut lacus. Etiam non diam quis arcu egestas commodo. Curabitur nec massa ac massa gravida condimentum. Aenean id libero. Pellentesque vitae tellus. Fusce lectus est, accumsan ac, bibendum sed, porta eget, augue. Etiam faucibus. Quisque tempus purus eu ante.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Vestibulum sapien nisl, ornare auctor, consectetuer quis, posuere tristique, odio. Fusce ultrices ullamcorper odio. Ut augue nulla, interdum at, adipiscing non, tristique eget, neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut pede est, condimentum id, scelerisque ac, malesuada non, quam. Proin eu ligula ac sapien suscipit blandit. Suspendisse euismod. Ut accumsan, neque id gravida luctus, arcu pede sodales felis, vel blandit massa arcu eget ligula. Aenean sed turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem eros, ornare ut, commodo eu, tempor nec, risus. Donec laoreet dapibus ligula. Praesent orci leo, bibendum nec, ornare et, nonummy in, elit. Donec interdum feugiat leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque feugiat ullamcorper ipsum. Donec convallis tincidunt urna.&lt;/span&gt;&lt;br style=&quot;font-size: 13px;&quot; /&gt;\r\n&lt;span style=&quot;font-size: 13px;&quot;&gt;Suspendisse et orci et arcu porttitor pellentesque. Sed lacus nunc, fermentum vel, vehicula in, imperdiet eget, urna. Nam consectetuer euismod nunc. Nulla dignissim posuere nulla. Integer iaculis lacinia massa. Nullam sapien augue, condimentum vel, venenatis id, rhoncus pellentesque, sapien. Donec sed ipsum ultrices turpis consectetuer imperdiet. Duis et ipsum ac nisl laoreet commodo. Mauris eu est. Suspendisse id turpis quis orci euismod consequat. Donec tellus mi, luctus sit amet, ultrices a, convallis eu, lorem. Proin faucibus convallis elit. Maecenas rhoncus arcu at arcu. Proin libero. Proin adipiscing. In quis lorem vitae elit consectetuer pretium. Nullam ligula urna, adipiscing nec, iaculis ut, elementum non, turpis. Fusce pulvinar.&lt;/span&gt;', '', '', ''),
(9, 2, 'Urna eget erat non purus', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Suspendisse aliquet sem ut nulla. Cras mollis ornare nisl. Morbi ac mi. Nunc eget nisi. Donec at enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed diam. Ut sagittis ultrices urna. Suspendisse eget erat non purus varius sodales. Aliquam imperdiet lobortis libero. Suspendisse scelerisque sagittis odio. Phasellus imperdiet interdum dolor. Mauris ante ante, gravida at, consectetuer quis, ullamcorper ornare, magna. Duis sed mauris sed libero tincidunt rutrum. In vulputate pretium dolor.Nullam ac erat. Donec a ipsum. Nullam tristique leo id lacus. Sed sed pede non arcu ornare interdum. Maecenas justo elit, rutrum in, adipiscing id, laoreet in, libero. Fusce quam. Donec a urna a enim gravida dictum. Nunc elementum, mauris sit amet imperdiet iaculis, dolor metus consectetuer mi, et tempor elit enim at massa. Duis ac nisl. Nullam pulvinar. Curabitur quam sapien, lobortis eu, luctus vitae, volutpat ac, metus. Nam elementum. Fusce fringilla. Praesent pulvinar turpis vitae justo cursus pulvinar. In hac habitasse platea dictumst. Nunc fermentum tellus interdum libero. Phasellus eros. Vestibulum euismod nunc at eros. Pellentesque nec ligula non tellus accumsan molestie. Pellentesque felis massa, tincidunt at, pulvinar id, placerat nec, velit.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Cras rhoncus ipsum ac dolor. In hac habitasse platea dictumst. Nulla dapibus ultricies pede. Quisque augue risus, porttitor nec, suscipit ut, pellentesque quis, lacus. Duis adipiscing purus eu metus pharetra porttitor. Aenean sapien nisi, sodales non, facilisis nec, ultricies et, erat. Cras aliquam. Maecenas mi. Sed lacus arcu, malesuada id, ultricies et, ornare non, dolor. Maecenas turpis lacus, vehicula nec, blandit in, laoreet a, nibh. Donec aliquet. In et leo tincidunt tortor rhoncus convallis. Nulla facilisi. Praesent bibendum semper eros. Morbi risus. Nam tellus leo, ullamcorper egestas, venenatis quis, viverra ac, mauris. In hac habitasse platea dictumst. Curabitur at velit vel sem auctor hendrerit. Integer mauris orci, vehicula eu, feugiat ac, hendrerit ut, dolor. Fusce elit nulla, gravida quis, vulputate eu, rutrum vel, lectus. Integer cursus luctus nisl. Quisque quam. Aliquam lectus urna, porta in, viverra eu, pellentesque a, massa. Etiam eros sapien, porta et, aliquam et, bibendum sit amet, erat. Sed condimentum interdum lacus. In ut ante non felis tincidunt porta. Aenean aliquet ornare sem. Nunc dignissim, erat sit amet vulputate cursus, elit magna facilisis massa, quis hendrerit nunc odio id dui. Proin interdum dictum arcu. Pellentesque erat ante, ultricies ac, porttitor ac, dictum et, purus. Donec enim odio, gravida ut, imperdiet quis, rutrum ut, lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Etiam pharetra scelerisque diam. Maecenas varius augue vel urna. Vestibulum erat nisl, fringilla vel, mollis et, aliquam non, elit. Nulla malesuada turpis nec velit. Donec vitae sem a metus dictum molestie. Ut dignissim, odio non porttitor convallis, sapien leo viverra lorem, a consequat mauris erat sit amet dui. Nullam rutrum feugiat massa. Nullam lacinia purus vitae massa. Pellentesque vel tortor eget nulla ullamcorper vehicula. Cras egestas euismod magna. Praesent laoreet aliquet nulla. Aliquam arcu. Proin vel neque non ligula sodales sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed magna. Pellentesque aliquet mollis arcu. Morbi at felis. Suspendisse ligula. Aliquam nisl arcu, vehicula vitae, hendrerit ut, sodales eu, augue. Sed tristique pretium risus. Ut luctus, dui quis commodo luctus, quam nulla ultricies lorem, eu ornare nulla metus at leo. Praesent rhoncus sapien sit amet mauris. Aenean commodo erat eu eros. Morbi tristique, risus sed consequat bibendum, enim augue tincidunt quam, ac semper libero velit vitae eros.&lt;/p&gt;\r\n', '', '', ''),
(10, 2, 'Nam pellentesque ipsum ac tincidunt elementum', '&lt;p style=&quot;font-size: 13px;&quot;&gt;Sed pellentesque commodo magna, eget tincidunt magna condimentum lobortis. Integer facilisis ipsum sem, sit amet aliquet sem iaculis in. Vivamus at accumsan ante. Donec vitae diam eu magna tincidunt rutrum. Nullam interdum lacinia lobortis. Duis eget lobortis augue, id sollicitudin justo. Aenean sollicitudin elit ut egestas viverra. Mauris tempus mollis velit, cursus pulvinar lectus auctor eget. Quisque eget arcu iaculis, tempus tellus id, semper augue. Vivamus facilisis imperdiet consectetur. Proin ac magna ante. Phasellus nec sagittis tellus. Mauris cursus, mi eget mollis dignissim, lectus nibh placerat lorem, at lobortis tellus nulla vitae arcu. Ut sit amet orci ac sapien porta porta. Mauris facilisis sollicitudin pharetra. Phasellus rutrum nisi quam, quis congue nisi vehicula ac.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Aenean aliquet mi ligula, et vehicula eros tempor at. Integer neque mi, scelerisque vel felis ac, convallis varius nibh. Quisque eget blandit ante. Vivamus vestibulum dolor dapibus arcu mattis placerat. Morbi blandit at magna nec vestibulum. Integer malesuada facilisis orci et adipiscing. Nunc sollicitudin mollis nunc scelerisque auctor. Donec vehicula pretium dolor sed hendrerit. In egestas tortor dui, id porta ipsum bibendum nec. Donec posuere nibh odio. Morbi eget tempor lectus, at laoreet erat. Mauris facilisis luctus nibh, vitae tincidunt nisi suscipit ut. In hac habitasse platea dictumst. Cras non dolor elit. Nulla ultrices massa nec eros mattis bibendum.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nam pellentesque ipsum ac tincidunt elementum. Maecenas eu metus sit amet nunc rhoncus dictum vitae non felis. Praesent consequat placerat velit nec vehicula. Aliquam nec varius nisi. In sollicitudin ac velit ac sodales. Nulla interdum lacus quis placerat semper. Suspendisse at sollicitudin lacus.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Donec commodo commodo gravida. Nullam vel bibendum elit, eget eleifend massa. Cras tincidunt elementum augue, et volutpat dolor tincidunt in. Mauris non nunc odio. Suspendisse augue libero, sagittis non posuere a, molestie nec orci. Duis turpis quam, faucibus sed augue nec, imperdiet pretium tortor. Aliquam feugiat accumsan urna, sed sollicitudin nisl gravida nec. Aliquam vitae tincidunt erat, id bibendum magna. Proin sed sapien est. Quisque non felis arcu.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;Nullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue. Nunc feugiat arcu ac nisl accumsan fringilla. Sed laoreet, libero vel molestie bibendum, nulla tellus fermentum libero, gravida eleifend libero sem eget urna. Nunc eget gravida felis. Nullam semper risus ultrices neque blandit, id venenatis diam blandit. Donec dui lacus, lacinia ac condimentum ut, congue eu ipsum. Suspendisse euismod nunc eu tellus molestie iaculis. Aliquam suscipit feugiat fermentum. Donec tempor urna nisl, eu feugiat tortor lobortis nec. Etiam ut tortor justo.&lt;/p&gt;\r\n', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_article_related`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_article_related` (
  `article_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_article_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_article_to_category` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_kbm_article_to_category`
--

INSERT INTO `oc_kbm_article_to_category` (`article_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 1),
(6, 1),
(7, 2),
(8, 1),
(9, 2),
(10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_article_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_article_to_layout` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_kbm_article_to_layout`
--

INSERT INTO `oc_kbm_article_to_layout` (`article_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(2, 0, 0),
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_article_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_article_to_store` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_kbm_article_to_store`
--

INSERT INTO `oc_kbm_article_to_store` (`article_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_author`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` tinyint(3) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_kbm_author`
--

INSERT INTO `oc_kbm_author` (`author_id`, `name`, `user_id`, `role_id`) VALUES
(1, 'demoadmin', 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_category`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `column` int(3) NOT NULL,
  `article_order` int(3) NOT NULL DEFAULT '0',
  `article_image_width` int(3) DEFAULT NULL,
  `article_image_height` int(3) DEFAULT NULL,
  `character_limit` int(5) DEFAULT NULL,
  `date_added` int(10) unsigned NOT NULL,
  `date_modified` int(10) unsigned NOT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_kbm_category`
--

INSERT INTO `oc_kbm_category` (`category_id`, `parent_id`, `image`, `column`, `article_order`, `article_image_width`, `article_image_height`, `character_limit`, `date_added`, `date_modified`, `sort_order`, `status`) VALUES
(1, 0, '', 1, 1, 0, 0, 0, 1401931428, 1401931484, 0, 1),
(2, 0, '', 1, 1, 0, 0, 0, 1401931446, 1401931503, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_kbm_category_description`
--

INSERT INTO `oc_kbm_category_description` (`category_id`, `language_id`, `name`, `meta_keyword`, `meta_description`, `description`) VALUES
(1, 1, 'Men''s Fashion', '', '', '&lt;span style=&quot;font-size: 13px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla odio urna, vehicula at nisi nec, viverra suscipit nunc. In sagittis varius laoreet. Donec scelerisque feugiat facilisis. Sed id accumsan tellus. Proin ornare placerat est et cursus. Donec ac mauris vitae nibh luctus lacinia non ut nisl. Vestibulum auctor, urna vel sollicitudin pretium, lorem neque viverra est, eu condimentum ipsum velit vel massa. In&lt;/span&gt;'),
(2, 1, 'Women''s Fashion', '', '', '&lt;span style=&quot;font-size: 13px;&quot;&gt;Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.&lt;/span&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_category_path`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_kbm_category_path`
--

INSERT INTO `oc_kbm_category_path` (`category_id`, `path_id`, `level`) VALUES
(1, 1, 0),
(2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_kbm_category_to_layout`
--

INSERT INTO `oc_kbm_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_kbm_category_to_store`
--

INSERT INTO `oc_kbm_category_to_store` (`category_id`, `store_id`) VALUES
(1, 0),
(2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_comment`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `parent_comment_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL,
  `author_type` enum('admin','customer','guest') NOT NULL,
  `content` text NOT NULL,
  `data` text,
  `date_added` int(10) unsigned NOT NULL,
  `date_modified` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_kbm_comment`
--

INSERT INTO `oc_kbm_comment` (`comment_id`, `article_id`, `parent_comment_id`, `author_id`, `author_type`, `content`, `data`, `date_added`, `date_modified`, `status`) VALUES
(1, 1, 0, 0, 'guest', 'Nullam vulputate orci turpis, ut vestibulum erat placerat sit amet. Nunc commodo pellentesque augue.', 'a:3:{s:7:"website";s:0:"";s:4:"name";s:4:"Luan";s:5:"email";s:25:"luanvu@digitalcreative.vn";}', 1402301141, 1402301141, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_kbm_permission`
--

CREATE TABLE IF NOT EXISTS `oc_kbm_permission` (
  `role_id` int(3) NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_kbm_permission`
--

INSERT INTO `oc_kbm_permission` (`role_id`, `permissions`) VALUES
(5, 'a:2:{i:0;s:14:"create_article";i:1;s:16:"edit_own_article";}'),
(10, 'a:14:{i:0;s:14:"create_article";i:1;s:12:"copy_article";i:2;s:16:"edit_own_article";i:3;s:18:"edit_other_article";i:4;s:13:"change_author";i:5;s:14:"remove_article";i:6;s:15:"create_category";i:7;s:13:"copy_category";i:8;s:13:"edit_category";i:9;s:15:"remove_category";i:10;s:12:"edit_comment";i:11;s:13:"reply_comment";i:12;s:14:"remove_comment";i:13;s:10:"add_author";}'),
(15, 'a:18:{i:0;s:14:"create_article";i:1;s:12:"copy_article";i:2;s:16:"edit_own_article";i:3;s:18:"edit_other_article";i:4;s:13:"change_author";i:5;s:14:"remove_article";i:6;s:15:"create_category";i:7;s:13:"copy_category";i:8;s:13:"edit_category";i:9;s:15:"remove_category";i:10;s:12:"edit_comment";i:11;s:13:"reply_comment";i:12;s:14:"remove_comment";i:13;s:10:"add_author";i:14;s:11:"edit_author";i:15;s:13:"remove_author";i:16;s:21:"edit_group_permission";i:17;s:12:"edit_setting";}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_kcp_skin`
--

CREATE TABLE IF NOT EXISTS `oc_kcp_skin` (
  `theme_id` varchar(64) NOT NULL,
  `skin_id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `root_skin_id` varchar(64) NOT NULL,
  PRIMARY KEY (`theme_id`,`skin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_kcp_skin`
--

INSERT INTO `oc_kcp_skin` (`theme_id`, `skin_id`, `name`, `root_skin_id`) VALUES
('start', 'style_1', 'Style 1', 'style_1'),
('start', 'style_2', 'Style 2', 'style_2'),
('start', 'style_3', 'Style 3', 'style_3'),
('start', 'style_4', 'Style 4', 'style_4');

-- --------------------------------------------------------

--
-- Table structure for table `oc_kcp_skin_option`
--

CREATE TABLE IF NOT EXISTS `oc_kcp_skin_option` (
  `option` varchar(64) NOT NULL,
  `theme_id` varchar(64) NOT NULL,
  `skin_id` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`option`,`theme_id`,`skin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_kcp_skin_option`
--

INSERT INTO `oc_kcp_skin_option` (`option`, `theme_id`, `skin_id`, `value`) VALUES
('body_bg_color', 'start', 'style_1', '"#ababab"'),
('body_font', 'start', 'style_1', '{"font_family":"Varela Round"}'),
('body_main_color', 'start', 'style_1', '"#EC6467"'),
('body_pattern', 'start', 'style_1', '"catalog\\/view\\/theme\\/start\\/data\\/patterns\\/binding_dark_retina.png"'),
('body_text_color', 'start', 'style_1', '"#333"'),
('brand_logo_height', 'start', 'style_1', '"50"'),
('brand_logo_width', 'start', 'style_1', '"50"'),
('button_select_list', 'start', 'style_1', '"false"'),
('category_menu_type', 'start', 'style_1', '"accordion"'),
('contact_list', 'start', 'style_1', '"5d5b9f858d"'),
('contact_title', 'start', 'style_1', '{"en":"Contact"}'),
('custom_block_content', 'start', 'style_1', '"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\\n"'),
('custom_copyright', 'start', 'style_1', '{"ar":"","en":""}'),
('custom_css_file_status', 'start', 'style_1', '"false"'),
('custom_css_status', 'start', 'style_1', '"false"'),
('custom_information', 'start', 'style_1', '{"ar":"","en":"Say Hello! Don''t be shy!"}'),
('custom_js_status', 'start', 'style_1', '"false"'),
('custom_tab_1_content', 'start', 'style_1', '{"ar":"fsfsdfsdfsdf","en":"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\\n"}'),
('custom_tab_1_title', 'start', 'style_1', '{"en":"Custom tab 1"}'),
('custom_tab_2_content', 'start', 'style_1', '{"ar":"fsdfsdfsdfsdf","en":"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\\n"}'),
('custom_tab_2_title', 'start', 'style_1', '{"ar":"Custom Tab 2","en":"Custom Tab 2"}'),
('default_sharing', 'start', 'style_1', '"true"'),
('display_product_mode', 'start', 'style_1', '"list"'),
('email_1', 'start', 'style_1', '"contact@kulerthemes.com"'),
('enable_one_page_checkout', 'start', 'style_1', '"true"'),
('enable_scroll_up', 'start', 'style_1', '"true"'),
('enable_swap_image', 'start', 'style_1', '"true"'),
('fax_1', 'start', 'style_1', '"03.989898989"'),
('fixed_header', 'start', 'style_1', '"true"'),
('footer_background_color', 'start', 'style_1', '"#222"'),
('footer_heading_color', 'start', 'style_1', '"#ffffff"'),
('footer_link_color', 'start', 'style_1', '"#666"'),
('footer_link_hover_color', 'start', 'style_1', '"#fff"'),
('header_background_color', 'start', 'style_1', '"rgba(255, 255, 255, 1)"'),
('heading_font', 'start', 'style_1', '{"font_family":"Varela Round"}'),
('hide_category_image', 'start', 'style_1', '"false"'),
('home_icon_type', 'start', 'style_1', '"icon"'),
('image_lightbox', 'start', 'style_1', '"true"'),
('image_zoom_type', 'start', 'style_1', '"outer_cloud"'),
('information_content', 'start', 'style_1', '{"ar":"test","en":"<img alt=\\"\\" src=\\"http:\\/\\/demo.kulerthemes.com\\/start\\/1\\/image\\/data\\/demo\\/start\\/cp\\/170x170\\/about.jpg\\" \\/>\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, dolorem ea id illo illum ipsum labore pariatur temporibus. Enim eveniet molestias, possimus quod rerum tempore. Asperiores laboriosam quis vero voluptatem.<\\/p>\\n<a href=\\"#\\">read more<\\/a>"}'),
('information_title', 'start', 'style_1', '{"ar":"About us","en":"About us"}'),
('latitude', 'start', 'style_1', '"-33.878715"'),
('layout_style', 'start', 'style_1', '"full_width"'),
('lens_zoom_shape', 'start', 'style_1', '"rounded"'),
('link_text_color', 'start', 'style_1', '"#949494"'),
('live_search_status', 'start', 'style_1', '"true"'),
('login_popup', 'start', 'style_1', '"true"'),
('longitude', 'start', 'style_1', '"151.209744"'),
('mail_service', 'start', 'style_1', '"mailchimp"'),
('mailchimp_api_key', 'start', 'style_1', '"950e5f5a7b9c2bbe328717079c168fad-us8"'),
('map_type', 'start', 'style_1', '"ROADMAP"'),
('maximum_width', 'start', 'style_1', '"1170px"'),
('menu_font', 'start', 'style_1', '{"font_family":"Varela Round"}'),
('menu_item_color', 'start', 'style_1', '"#666"'),
('mobile_1', 'start', 'style_1', '"01.666.777.8989"'),
('mobile_menu_title', 'start', 'style_1', '{"ar":"Menu","en":"Menu"}'),
('more_details_button_text', 'start', 'style_1', '{"ar":"Product Detail","en":"Product Detail"}'),
('multi_level_default_menu', 'start', 'style_1', '"true"'),
('newsletter_button_text', 'start', 'style_1', '{"en":"SUBSCRIBE"}'),
('newsletter_description_text', 'start', 'style_1', '{"en":"Newsletter"}'),
('newsletter_input_text', 'start', 'style_1', '{"en":"Enter Your Email Address"}'),
('newsletter_success_message', 'start', 'style_1', '{"ar":"","en":"Thank you for contact us"}'),
('newsletter_title', 'start', 'style_1', '{"en":"Newsletter"}'),
('notification_show_time', 'start', 'style_1', '"3000"'),
('payment_icons', 'start', 'style_1', '[{"$$hashKey":"04T","image":"data\\/demo\\/start\\/payment_icons\\/visa.png","link":"#","name":{"ar":"visa","en":"visa"},"new_tab":"true","sort":""},{"$$hashKey":"04Z","image":"data\\/demo\\/start\\/payment_icons\\/master.png","link":"#","name":{"ar":"master","en":"master"},"new_tab":"true","sort":""},{"$$hashKey":"040","image":"data\\/demo\\/start\\/payment_icons\\/amex.png","link":"#","name":{"ar":"american express","en":"american express"},"new_tab":"true","sort":""},{"$$hashKey":"047","image":"data\\/demo\\/start\\/payment_icons\\/cirrus.png","link":"#","name":{"ar":"cirrus","en":"cirrus"},"new_tab":"true","sort":""},{"$$hashKey":"04E","image":"data\\/demo\\/start\\/payment_icons\\/paypal.png","link":"#","name":{"ar":"paypal","en":"cirrus"},"new_tab":"true","sort":""},{"$$hashKey":"04L","image":"data\\/demo\\/start\\/payment_icons\\/discovery.png","link":"#","name":{"ar":"discover","en":"discover"},"new_tab":"true","sort":""}]'),
('phone_1', 'start', 'style_1', '"+1.3333.9999"'),
('product_description_limit', 'start', 'style_1', '"120"'),
('product_image_height', 'start', 'style_1', '"150"'),
('product_image_width', 'start', 'style_1', '"130"'),
('related_products_position', 'start', 'style_1', '"bottom"'),
('related_products_style', 'start', 'style_1', '"grid"'),
('scroll_up_text', 'start', 'style_1', '{"ar":"Up","en":"Up"}'),
('search_field_text', 'start', 'style_1', '{"ar":"","en":"Live search products ..."}'),
('search_in_product_description', 'start', 'style_1', '"false"'),
('search_in_specific_category', 'start', 'style_1', '"false"'),
('search_in_specific_manufacturer', 'start', 'style_1', '"false"'),
('search_result_limit', 'start', 'style_1', '"4"'),
('select_category_text', 'start', 'style_1', '{"ar":"","en":"Category"}'),
('select_manufacturer_text', 'start', 'style_1', '{"en":"Manufacturer"}'),
('show_add_to_cart_button', 'start', 'style_1', '"true"'),
('show_brand_logo', 'start', 'style_1', '"true"'),
('show_compare_button', 'start', 'style_1', '"true"'),
('show_contact', 'start', 'style_1', '"true"'),
('show_contact_title', 'start', 'style_1', '"true"'),
('show_custom_block', 'start', 'style_1', '"true"'),
('show_custom_copyright', 'start', 'style_1', '"false"'),
('show_custom_information', 'start', 'style_1', '"true"'),
('show_custom_notification', 'start', 'style_1', '"true"'),
('show_custom_tab_1', 'start', 'style_1', '"true"'),
('show_custom_tab_2', 'start', 'style_1', '"true"'),
('show_facebook', 'start', 'style_1', '"false"'),
('show_facebook_friend_faces', 'start', 'style_1', '"false"'),
('show_facebook_posts', 'start', 'style_1', '"false"'),
('show_facebook_title', 'start', 'style_1', '"false"'),
('show_google_map', 'start', 'style_1', '"true"'),
('show_information', 'start', 'style_1', '"true"'),
('show_information_title', 'start', 'style_1', '"true"'),
('show_newsletter', 'start', 'style_1', '"true"'),
('show_newsletter_title', 'start', 'style_1', '"false"'),
('show_number_quantity', 'start', 'style_1', '"true"'),
('show_payment_icons', 'start', 'style_1', '"true"'),
('show_product_description', 'start', 'style_1', '"true"'),
('show_product_image', 'start', 'style_1', '"true"'),
('show_product_name', 'start', 'style_1', '"true"'),
('show_product_price', 'start', 'style_1', '"true"'),
('show_product_rating', 'start', 'style_1', '"true"'),
('show_quick_view', 'start', 'style_1', '"true"'),
('show_related_products', 'start', 'style_1', '"true"'),
('show_sale_badge', 'start', 'style_1', '"true"'),
('show_save_percent', 'start', 'style_1', '"false"'),
('show_social_icons', 'start', 'style_1', '"true"'),
('show_social_icons_title', 'start', 'style_1', '"false"'),
('show_tax', 'start', 'style_1', '"false"'),
('show_twitter', 'start', 'style_1', '"false"'),
('show_twitter_footer', 'start', 'style_1', '"false"'),
('show_twitter_header', 'start', 'style_1', '"false"'),
('show_twitter_title', 'start', 'style_1', '"false"'),
('show_wish_list_button', 'start', 'style_1', '"true"'),
('social_icon_facebook', 'start', 'style_1', '"true"'),
('social_icon_facebook_link', 'start', 'style_1', '"http:\\/\\/facebook.com\\/kulerthemes"'),
('social_icon_google_plus', 'start', 'style_1', '"true"'),
('social_icon_google_plus_link', 'start', 'style_1', '"#"'),
('social_icon_instagram', 'start', 'style_1', '"true"'),
('social_icon_instagram_link', 'start', 'style_1', '"http:\\/\\/instagram.com\\/mashable"'),
('social_icon_pinterest', 'start', 'style_1', '"true"'),
('social_icon_pinterest_link', 'start', 'style_1', '"#"'),
('social_icon_rss', 'start', 'style_1', '"true"'),
('social_icon_rss_link', 'start', 'style_1', '"#"'),
('social_icon_twitter', 'start', 'style_1', '"true"'),
('social_icon_twitter_link', 'start', 'style_1', '"#"'),
('social_icon_youtube', 'start', 'style_1', '"true"'),
('social_icon_youtube_link', 'start', 'style_1', '"#"'),
('sub_categories_image_carousel', 'start', 'style_1', '"true"'),
('sub_category_image', 'start', 'style_1', '"true"'),
('sub_category_image_size', 'start', 'style_1', '"80"'),
('topbar_background_color', 'start', 'style_1', '"#F2F2F2"'),
('topbar_border_color', 'start', 'style_1', '"#f2f2f2"'),
('topbar_link_color', 'start', 'style_1', '"#999"'),
('topbar_link_hover_color', 'start', 'style_1', '"#db2c2c"'),
('topbar_text_color', 'start', 'style_1', '"#999"'),
('twitter_transparent_background', 'start', 'style_1', '"false"'),
('view_button_text', 'start', 'style_1', '{"ar":"abc","en":"Quick View"}'),
('zoom_window_height', 'start', 'style_1', '"300"'),
('zoom_window_width', 'start', 'style_1', '"300"'),
('information_content', 'start', 'style_2', '{"ar":"","en":"<img alt=\\"\\" src=\\"http:\\/\\/bling.local\\/image\\/data\\/home_05.png\\" style=\\"width: 171px; height: 172px;\\" \\/>\\n<p>Fusce convallis, marius imperdiet gravida bibendum, nisl turpis sucipit maris, sed placeta ipsum. Fusce convallis, marius imperdiet gravida bibendum, nisl turpis scuipit maris, sed placeta ipsum.<\\/p>\\n<a href=\\"#\\">read more<\\/a>"}'),
('image_zoom_type', 'start', 'style_2', '"inner_cloud"'),
('heading_font', 'start', 'style_2', '{"font_family":"Varela Round","font_style":"normal","font_weight":"normal","text_style_transform":"none"}'),
('header_background_color', 'start', 'style_2', '"rgba(216, 74, 74, 0)"'),
('menu_bg_color', 'start', 'style_2', '"#f8f8f8"'),
('maximum_width', 'start', 'style_2', '"1170px"'),
('map_type', 'start', 'style_2', '"ROADMAP"'),
('longitude', 'start', 'style_2', '"151.209744"'),
('layout_style', 'start', 'style_2', '"boxed"'),
('latitude', 'start', 'style_2', '"-33.878715"'),
('notification_show_time', 'start', 'style_2', '"3000"'),
('mobile_1', 'start', 'style_2', '"64646456"'),
('menu_font', 'start', 'style_2', '{"font_family":"Varela Round"}'),
('footer_background_color', 'start', 'style_2', '"#ffffff"'),
('fax_1', 'start', 'style_2', '""'),
('email_1', 'start', 'style_2', '"contact@kulerthemes.com"'),
('display_product_mode', 'start', 'style_2', '"grid"'),
('menu_item_color', 'start', 'style_2', '"#73767a"'),
('product_image_width', 'start', 'style_2', '"120"'),
('search_result_limit', 'start', 'style_2', '"8"'),
('footer_heading_color', 'start', 'style_2', '"#afe66c"'),
('product_description_limit', 'start', 'style_2', '"200"'),
('product_image_height', 'start', 'style_2', '"100"'),
('custom_tab_2_title', 'start', 'style_2', '{"en":"Custom Tab 2"}'),
('phone_1', 'start', 'style_2', '"655645646"'),
('custom_copyright', 'start', 'style_2', '{"ar":"","en":""}'),
('custom_tab_1_title', 'start', 'style_2', '{"en":"Custom Tab 1"}'),
('information_title', 'start', 'style_2', '{"en":"About us"}'),
('payment_icons', 'start', 'style_2', '[{"$$hashKey":"03L","image":"data\\/demo\\/start\\/payment_icons\\/visa.png","link":"","name":{"ar":"visa","en":"visa"},"new_tab":"true","sort":""},{"$$hashKey":"03S","image":"data\\/demo\\/start\\/payment_icons\\/master.png","link":"","name":{"ar":"master card","en":"master card"},"new_tab":"true","sort":""},{"$$hashKey":"03Z","image":"data\\/demo\\/start\\/payment_icons\\/paypal.png","link":"","name":{"ar":"paypal","en":"paypal"},"new_tab":"true","sort":""},{"$$hashKey":"046","image":"data\\/demo\\/start\\/payment_icons\\/amex.png","link":"","name":{"ar":"american express","en":"american express"},"new_tab":"true","sort":""},{"$$hashKey":"04D","image":"data\\/demo\\/start\\/payment_icons\\/discovery.png","link":"","name":{"ar":"discover","en":"discover"},"new_tab":"true","sort":""},{"$$hashKey":"04K","image":"data\\/demo\\/start\\/payment_icons\\/cirrus.png","link":"","name":{"ar":"cirrus","en":"cirrus"},"new_tab":"true","sort":""}]'),
('custom_information', 'start', 'style_2', '{"ar":"","en":"<span style=\\"font-size: 13px;\\">Say Hello! Don&#39;t be shy!<\\/span>"}'),
('custom_tab_2_content', 'start', 'style_2', '{"ar":"","en":"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information&nbsp;or contact details here.<\\/p>\\n"}'),
('custom_tab_1_content', 'start', 'style_2', '{"ar":"","en":"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information&nbsp;or contact details here.<\\/p>\\n"}'),
('custom_block_content', 'start', 'style_2', '"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information&nbsp;or contact details here.<\\/p>\\n"'),
('body_text_color', 'start', 'style_2', '"#6a5f5f"'),
('body_pattern', 'start', 'style_2', '""'),
('body_main_color', 'start', 'style_2', '"#b4d88b"'),
('body_font', 'start', 'style_2', '{"font_family":"Varela Round"}'),
('category_menu_type', 'start', 'style_2', '"accordion"'),
('skype_1', 'start', 'style_2', '"kulerthemes"'),
('sub_category_image_size', 'start', 'style_2', '"80"'),
('social_icon_youtube_link', 'start', 'style_2', '"#"'),
('social_icon_google_plus_link', 'start', 'style_2', '"#"'),
('social_icon_rss_link', 'start', 'style_2', '"#"'),
('social_icon_twitter_link', 'start', 'style_2', '"#"'),
('social_icon_facebook_link', 'start', 'style_2', '"#"'),
('body_bg_color', 'start', 'style_2', '"#f8f8f8"'),
('newsletter_button_text', 'start', 'style_2', '{"en":"Subscribe"}'),
('footer_link_color', 'start', 'style_2', '"#827676"'),
('topbar_link_hover_color', 'start', 'style_2', '"#eee7e7"'),
('topbar_text_color', 'start', 'style_2', '"#dddbdb"'),
('topbar_link_color', 'start', 'style_2', '"#dadada"'),
('topbar_border_color', 'start', 'style_2', '"#f0f0f0"'),
('topbar_background_color', 'start', 'style_2', '"rgba(246, 246, 246, 0)"'),
('newsletter_title', 'start', 'style_2', '{"en":"Newsletter"}'),
('contact_title', 'start', 'style_2', '{"en":"Contact"}'),
('scroll_up_text', 'start', 'style_2', '{"ar":"","en":"Scroll up"}'),
('body_font', 'start', 'style_3', '{"font_family":"Varela Round"}'),
('body_main_color', 'start', 'style_3', '"#40AF63"'),
('body_pattern', 'start', 'style_3', '"catalog\\/view\\/theme\\/start\\/data\\/patterns\\/wood.png"'),
('body_text_color', 'start', 'style_3', '"#fff"'),
('brand_logo_height', 'start', 'style_3', '"50"'),
('brand_logo_width', 'start', 'style_3', '"50"'),
('button_select_list', 'start', 'style_3', '"true"'),
('category_menu_type', 'start', 'style_3', '"accordion"'),
('contact_title', 'start', 'style_3', '{"en":"Contact"}'),
('custom_block_content', 'start', 'style_3', '"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\\n"'),
('custom_copyright', 'start', 'style_3', '{"ar":"","en":""}'),
('custom_css_file_status', 'start', 'style_3', '"false"'),
('custom_css_status', 'start', 'style_3', '"false"'),
('custom_information', 'start', 'style_3', '{"ar":"","en":"Say hello! Don''t be shy!"}'),
('custom_js_status', 'start', 'style_3', '"false"'),
('custom_tab_1_content', 'start', 'style_3', '{"ar":"","en":"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\\n"}'),
('custom_tab_1_title', 'start', 'style_3', '{"en":"Custom tab 1"}'),
('custom_tab_2_content', 'start', 'style_3', '{"ar":"","en":"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\\n"}'),
('custom_tab_2_title', 'start', 'style_3', '{"en":"Custom Tab 2"}'),
('default_sharing', 'start', 'style_3', '"true"'),
('email_1', 'start', 'style_3', '"contact@kulerthemes.com"'),
('enable_one_page_checkout', 'start', 'style_3', '"true"'),
('enable_scroll_up', 'start', 'style_3', '"true"'),
('enable_swap_image', 'start', 'style_3', '"true"'),
('fax_1', 'start', 'style_3', '"03.989898989"'),
('fixed_header', 'start', 'style_3', '"false"'),
('footer_background_color', 'start', 'style_3', '"#000"'),
('footer_heading_color', 'start', 'style_3', '"#ffffff"'),
('footer_link_color', 'start', 'style_3', '"#666"'),
('footer_link_hover_color', 'start', 'style_3', '"#fff"'),
('header_background_color', 'start', 'style_3', '"#141414"'),
('heading_font', 'start', 'style_3', '{"font_family":"Varela Round"}'),
('hide_category_image', 'start', 'style_3', '"false"'),
('image_lightbox', 'start', 'style_3', '"true"'),
('image_zoom_type', 'start', 'style_3', '"inner_cloud"'),
('information_content', 'start', 'style_3', '{"ar":"","en":"<img alt=\\"\\" src=\\"http:\\/\\/demo.kulerthemes.com\\/start\\/1\\/image\\/data\\/demo\\/start\\/cp\\/170x170\\/about.jpg\\" \\/>\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, dolorem ea id illo illum ipsum labore pariatur temporibus. Enim eveniet molestias, possimus quod rerum tempore. Asperiores laboriosam quis vero voluptatem.<\\/p>\\n<a href=\\"#\\">read more<\\/a>"}'),
('information_title', 'start', 'style_3', '{"en":"About us"}'),
('latitude', 'start', 'style_3', '"-33.878715"'),
('layout_style', 'start', 'style_3', '"full_width"'),
('link_text_color', 'start', 'style_3', '"#949494"'),
('live_search_status', 'start', 'style_3', '"true"'),
('login_popup', 'start', 'style_3', '"true"'),
('longitude', 'start', 'style_3', '"151.209744"'),
('map_type', 'start', 'style_3', '"ROADMAP"'),
('maximum_width', 'start', 'style_3', '"1170px"'),
('menu_bg_color', 'start', 'style_3', '""'),
('menu_font', 'start', 'style_3', '{"font_family":"Varela Round"}'),
('menu_item_color', 'start', 'style_3', '"#fff"'),
('mobile_1', 'start', 'style_3', '"01.666.777.8989"'),
('mobile_menu_title', 'start', 'style_3', '{"ar":"MENU","en":"MENU"}'),
('more_details_button_text', 'start', 'style_3', '{"ar":"Product Detail","en":"Product Detail"}'),
('multi_level_default_menu', 'start', 'style_3', '"true"'),
('newsletter_button_text', 'start', 'style_3', '{"en":"SUBSCRIBE"}'),
('newsletter_description_text', 'start', 'style_3', '{"en":"Newsletter"}'),
('newsletter_input_text', 'start', 'style_3', '{"en":"Enter Your Email Address"}'),
('newsletter_title', 'start', 'style_3', '{"en":"Newsletter"}'),
('notification_show_time', 'start', 'style_3', '"3000"'),
('payment_icons', 'start', 'style_3', '[{"$$hashKey":"04T","image":"data\\/demo\\/start\\/payment_icons\\/visa.png","link":"#","name":{"ar":"visa","en":"visa"},"new_tab":"true","sort":""},{"$$hashKey":"04Z","image":"data\\/demo\\/start\\/payment_icons\\/master.png","link":"#","name":{"ar":"master","en":"master"},"new_tab":"true","sort":""},{"$$hashKey":"05G","image":"data\\/demo\\/start\\/payment_icons\\/paypal.png","link":"#","name":{"ar":"paypal","en":"paypal"},"new_tab":"true","sort":""},{"$$hashKey":"05N","image":"data\\/demo\\/start\\/payment_icons\\/amex.png","link":"","name":{"ar":"american express","en":"american express"},"new_tab":"true","sort":""},{"$$hashKey":"05U","image":"data\\/demo\\/start\\/payment_icons\\/cirrus.png","link":"","name":{"ar":"cirrus","en":"cirrus"},"new_tab":"true","sort":""}]'),
('phone_1', 'start', 'style_3', '"+1.3333.9999"'),
('product_description_limit', 'start', 'style_3', '"120"'),
('product_image_height', 'start', 'style_3', '"150"'),
('product_image_width', 'start', 'style_3', '"100"'),
('product_price_color', 'start', 'style_3', '"#fff"'),
('related_products_position', 'start', 'style_3', '"right"'),
('related_products_style', 'start', 'style_3', '"grid"'),
('scroll_up_text', 'start', 'style_3', '{"ar":"Up","en":"Up"}'),
('search_field_text', 'start', 'style_3', '{"ar":"search start"}'),
('search_in_product_description', 'start', 'style_3', '"false"'),
('search_in_specific_category', 'start', 'style_3', '"false"'),
('search_in_specific_manufacturer', 'start', 'style_3', '"false"'),
('search_result_limit', 'start', 'style_3', '"4"'),
('show_add_to_cart_button', 'start', 'style_3', '"true"'),
('show_brand_logo', 'start', 'style_3', '"true"'),
('show_compare_button', 'start', 'style_3', '"true"'),
('show_contact', 'start', 'style_3', '"true"'),
('show_contact_title', 'start', 'style_3', '"true"'),
('show_custom_block', 'start', 'style_3', '"true"'),
('show_custom_copyright', 'start', 'style_3', '"false"'),
('show_custom_information', 'start', 'style_3', '"true"'),
('show_custom_notification', 'start', 'style_3', '"true"'),
('show_custom_tab_1', 'start', 'style_3', '"true"'),
('show_custom_tab_2', 'start', 'style_3', '"true"'),
('show_facebook', 'start', 'style_3', '"false"'),
('show_facebook_friend_faces', 'start', 'style_3', '"false"'),
('show_facebook_posts', 'start', 'style_3', '"false"'),
('show_facebook_title', 'start', 'style_3', '"false"'),
('show_google_map', 'start', 'style_3', '"true"'),
('show_information', 'start', 'style_3', '"true"'),
('show_information_title', 'start', 'style_3', '"true"'),
('show_newsletter', 'start', 'style_3', '"true"'),
('show_newsletter_title', 'start', 'style_3', '"false"'),
('show_number_quantity', 'start', 'style_3', '"true"'),
('show_payment_icons', 'start', 'style_3', '"true"'),
('show_product_description', 'start', 'style_3', '"true"'),
('show_product_image', 'start', 'style_3', '"true"'),
('show_product_name', 'start', 'style_3', '"true"'),
('show_product_price', 'start', 'style_3', '"true"'),
('show_product_rating', 'start', 'style_3', '"true"'),
('show_quick_view', 'start', 'style_3', '"true"'),
('show_related_products', 'start', 'style_3', '"true"'),
('show_sale_badge', 'start', 'style_3', '"true"'),
('show_save_percent', 'start', 'style_3', '"false"'),
('show_social_icons', 'start', 'style_3', '"true"'),
('show_social_icons_title', 'start', 'style_3', '"false"'),
('show_tax', 'start', 'style_3', '"true"'),
('show_twitter', 'start', 'style_3', '"false"'),
('show_twitter_footer', 'start', 'style_3', '"false"'),
('show_twitter_header', 'start', 'style_3', '"false"'),
('show_twitter_title', 'start', 'style_3', '"false"'),
('show_wish_list_button', 'start', 'style_3', '"true"'),
('social_icon_facebook', 'start', 'style_3', '"true"'),
('social_icon_facebook_link', 'start', 'style_3', '"#"'),
('social_icon_google_plus', 'start', 'style_3', '"true"'),
('social_icon_google_plus_link', 'start', 'style_3', '"#"'),
('social_icon_instagram', 'start', 'style_3', '"false"'),
('social_icon_pinterest', 'start', 'style_3', '"false"'),
('social_icon_rss', 'start', 'style_3', '"true"'),
('social_icon_rss_link', 'start', 'style_3', '"#"'),
('social_icon_twitter', 'start', 'style_3', '"true"'),
('social_icon_twitter_link', 'start', 'style_3', '"#"'),
('social_icon_youtube', 'start', 'style_3', '"false"'),
('social_icon_youtube_link', 'start', 'style_3', '"#"'),
('sub_categories_image_carousel', 'start', 'style_3', '"false"'),
('sub_category_image', 'start', 'style_3', '"true"'),
('sub_category_image_size', 'start', 'style_3', '"80"'),
('topbar_background_color', 'start', 'style_3', '"#fff"'),
('topbar_border_color', 'start', 'style_3', '"#fff"'),
('topbar_link_color', 'start', 'style_3', '"#949494"'),
('topbar_link_hover_color', 'start', 'style_3', '"#40AF63"'),
('topbar_text_color', 'start', 'style_3', '"#949494"'),
('twitter_transparent_background', 'start', 'style_3', '"false"'),
('view_button_text', 'start', 'style_3', '{"ar":"abc","en":"Quick View"}'),
('body_bg_color', 'start', 'style_4', '"#ababab"'),
('body_font', 'start', 'style_4', '{"font_family":"Varela Round"}'),
('body_main_color', 'start', 'style_4', '"#EC6467"'),
('body_pattern', 'start', 'style_4', '"catalog\\/view\\/theme\\/start\\/data\\/patterns\\/binding_dark_retina.png"'),
('body_text_color', 'start', 'style_4', '"#333"'),
('brand_logo_height', 'start', 'style_4', '"50"'),
('brand_logo_width', 'start', 'style_4', '"50"'),
('button_select_list', 'start', 'style_4', '"false"'),
('category_menu_type', 'start', 'style_4', '"accordion"'),
('contact_list', 'start', 'style_4', '"5d5b9f858d"'),
('contact_title', 'start', 'style_4', '{"en":"Contact"}'),
('custom_block_content', 'start', 'style_4', '"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\\n"'),
('custom_copyright', 'start', 'style_4', '{"ar":"","en":""}'),
('custom_css_file_status', 'start', 'style_4', '"false"'),
('custom_css_status', 'start', 'style_4', '"false"'),
('custom_information', 'start', 'style_4', '{"ar":"","en":"Say Hello! Don''t be shy!"}'),
('custom_js_status', 'start', 'style_4', '"false"'),
('custom_tab_1_content', 'start', 'style_4', '{"ar":"fsfsdfsdfsdf","en":"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\\n"}'),
('custom_tab_1_title', 'start', 'style_4', '{"en":"Custom tab 1"}'),
('custom_tab_2_content', 'start', 'style_4', '{"ar":"fsdfsdfsdfsdf","en":"<p>This is a custom block edited from Kuler CP.<\\/p>\\n\\n<p>You can insert your payment method information\\u00a0or contact details here.<\\/p>\\n"}'),
('custom_tab_2_title', 'start', 'style_4', '{"ar":"Custom Tab 2","en":"Custom Tab 2"}'),
('default_sharing', 'start', 'style_4', '"true"'),
('display_product_mode', 'start', 'style_4', '"list"'),
('email_1', 'start', 'style_4', '"contact@kulerthemes.com"'),
('enable_one_page_checkout', 'start', 'style_4', '"true"'),
('enable_scroll_up', 'start', 'style_4', '"true"'),
('enable_swap_image', 'start', 'style_4', '"true"'),
('facebook_page_id', 'start', 'style_4', '"kulerthemes"'),
('facebook_theme', 'start', 'style_4', '"dark"'),
('facebook_title', 'start', 'style_4', '{"en":"Like us"}'),
('fax_1', 'start', 'style_4', '"03.989898989"'),
('fixed_header', 'start', 'style_4', '"true"'),
('footer_background_color', 'start', 'style_4', '"#222"'),
('footer_heading_color', 'start', 'style_4', '"#ffffff"'),
('footer_link_color', 'start', 'style_4', '"#666"'),
('footer_link_hover_color', 'start', 'style_4', '"#fff"'),
('header_background_color', 'start', 'style_4', '"rgba(255, 255, 255, 1)"'),
('heading_font', 'start', 'style_4', '{"font_family":"Varela Round"}'),
('hide_category_image', 'start', 'style_4', '"false"'),
('home_icon_type', 'start', 'style_4', '"icon"'),
('image_lightbox', 'start', 'style_4', '"true"'),
('image_zoom_type', 'start', 'style_4', '"outer_cloud"'),
('information_content', 'start', 'style_4', '{"ar":"test","en":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, dolorem ea id illo illum ipsum labore pariatur temporibus. Enim eveniet molestias, possimus quod rerum tempore. Asperiores laboriosam quis vero voluptatem.<\\/p>\\n<a href=\\"#\\">read more<\\/a>"}'),
('information_title', 'start', 'style_4', '{"ar":"About us","en":"About us"}'),
('latitude', 'start', 'style_4', '"-33.878715"'),
('layout_style', 'start', 'style_4', '"full_width"'),
('lens_zoom_shape', 'start', 'style_4', '"rounded"'),
('link_text_color', 'start', 'style_4', '"#949494"'),
('live_search_status', 'start', 'style_4', '"true"'),
('login_popup', 'start', 'style_4', '"true"'),
('longitude', 'start', 'style_4', '"151.209744"'),
('mail_service', 'start', 'style_4', '"mailchimp"'),
('mailchimp_api_key', 'start', 'style_4', '"950e5f5a7b9c2bbe328717079c168fad-us8"'),
('map_type', 'start', 'style_4', '"ROADMAP"'),
('maximum_width', 'start', 'style_4', '"1170px"'),
('menu_font', 'start', 'style_4', '{"font_family":"Varela Round"}'),
('menu_item_color', 'start', 'style_4', '"#666"'),
('mobile_1', 'start', 'style_4', '"01.666.777.8989"'),
('mobile_menu_title', 'start', 'style_4', '{"ar":"Menu","en":"Menu"}'),
('more_details_button_text', 'start', 'style_4', '{"ar":"Product Detail","en":"Product Detail"}'),
('multi_level_default_menu', 'start', 'style_4', '"true"'),
('newsletter_button_text', 'start', 'style_4', '{"en":"SUBSCRIBE"}'),
('newsletter_description_text', 'start', 'style_4', '{"en":"Newsletter"}'),
('newsletter_input_text', 'start', 'style_4', '{"en":"Enter Your Email Address"}'),
('newsletter_success_message', 'start', 'style_4', '{"ar":"","en":"Thank you for contact us"}'),
('newsletter_title', 'start', 'style_4', '{"en":"Newsletter"}'),
('notification_show_time', 'start', 'style_4', '"3000"'),
('number_of_tweets', 'start', 'style_4', '"2"'),
('payment_icons', 'start', 'style_4', '[{"$$hashKey":"04T","image":"data\\/start\\/payment_icons\\/visa.png","link":"#","name":{"en":"visa"},"new_tab":"true","sort":""},{"$$hashKey":"04Z","image":"data\\/start\\/payment_icons\\/master.png","link":"#","name":{"en":"master"},"new_tab":"true","sort":""}]'),
('phone_1', 'start', 'style_4', '"+1.3333.9999"'),
('product_description_limit', 'start', 'style_4', '"120"'),
('product_image_height', 'start', 'style_4', '"150"'),
('product_image_width', 'start', 'style_4', '"130"'),
('related_products_position', 'start', 'style_4', '"bottom"'),
('related_products_style', 'start', 'style_4', '"grid"'),
('scroll_up_text', 'start', 'style_4', '{"ar":"Up","en":"Up"}'),
('search_field_text', 'start', 'style_4', '{"ar":"","en":"Live search products ..."}'),
('search_in_product_description', 'start', 'style_4', '"false"'),
('search_in_specific_category', 'start', 'style_4', '"false"'),
('search_in_specific_manufacturer', 'start', 'style_4', '"false"'),
('search_result_limit', 'start', 'style_4', '"4"'),
('select_category_text', 'start', 'style_4', '{"ar":"","en":"Category"}'),
('select_manufacturer_text', 'start', 'style_4', '{"en":"Manufacturer"}'),
('show_add_to_cart_button', 'start', 'style_4', '"true"'),
('show_brand_logo', 'start', 'style_4', '"true"'),
('show_compare_button', 'start', 'style_4', '"true"'),
('show_contact', 'start', 'style_4', '"true"'),
('show_contact_title', 'start', 'style_4', '"true"'),
('show_custom_block', 'start', 'style_4', '"true"'),
('show_custom_copyright', 'start', 'style_4', '"false"'),
('show_custom_information', 'start', 'style_4', '"true"'),
('show_custom_notification', 'start', 'style_4', '"true"'),
('show_custom_tab_1', 'start', 'style_4', '"true"'),
('show_custom_tab_2', 'start', 'style_4', '"true"'),
('show_facebook', 'start', 'style_4', '"true"'),
('show_facebook_friend_faces', 'start', 'style_4', '"true"'),
('show_facebook_posts', 'start', 'style_4', '"false"'),
('show_facebook_title', 'start', 'style_4', '"true"'),
('show_google_map', 'start', 'style_4', '"true"'),
('show_information', 'start', 'style_4', '"true"'),
('show_information_title', 'start', 'style_4', '"true"'),
('show_newsletter', 'start', 'style_4', '"true"'),
('show_newsletter_title', 'start', 'style_4', '"false"'),
('show_number_quantity', 'start', 'style_4', '"true"'),
('show_payment_icons', 'start', 'style_4', '"true"'),
('show_product_description', 'start', 'style_4', '"true"'),
('show_product_image', 'start', 'style_4', '"true"'),
('show_product_name', 'start', 'style_4', '"true"'),
('show_product_price', 'start', 'style_4', '"true"'),
('show_product_rating', 'start', 'style_4', '"true"'),
('show_quick_view', 'start', 'style_4', '"true"'),
('show_related_products', 'start', 'style_4', '"true"'),
('show_sale_badge', 'start', 'style_4', '"true"'),
('show_save_percent', 'start', 'style_4', '"false"'),
('show_social_icons', 'start', 'style_4', '"true"'),
('show_social_icons_title', 'start', 'style_4', '"false"'),
('show_tax', 'start', 'style_4', '"false"'),
('show_twitter', 'start', 'style_4', '"true"'),
('show_twitter_footer', 'start', 'style_4', '"false"'),
('show_twitter_header', 'start', 'style_4', '"false"'),
('show_twitter_title', 'start', 'style_4', '"true"'),
('show_wish_list_button', 'start', 'style_4', '"true"'),
('social_icon_facebook', 'start', 'style_4', '"true"'),
('social_icon_facebook_link', 'start', 'style_4', '"#"'),
('social_icon_google_plus', 'start', 'style_4', '"true"'),
('social_icon_google_plus_link', 'start', 'style_4', '"#"'),
('social_icon_instagram', 'start', 'style_4', '"true"'),
('social_icon_instagram_link', 'start', 'style_4', '"#"'),
('social_icon_pinterest', 'start', 'style_4', '"true"'),
('social_icon_pinterest_link', 'start', 'style_4', '"#"'),
('social_icon_rss', 'start', 'style_4', '"true"'),
('social_icon_rss_link', 'start', 'style_4', '"#"'),
('social_icon_twitter', 'start', 'style_4', '"true"'),
('social_icon_twitter_link', 'start', 'style_4', '"#"'),
('social_icon_youtube', 'start', 'style_4', '"true"'),
('social_icon_youtube_link', 'start', 'style_4', '"#"'),
('sub_categories_image_carousel', 'start', 'style_4', '"false"'),
('sub_category_image', 'start', 'style_4', '"true"'),
('sub_category_image_size', 'start', 'style_4', '"80"'),
('topbar_background_color', 'start', 'style_4', '"#F2F2F2"'),
('topbar_border_color', 'start', 'style_4', '"#f2f2f2"'),
('topbar_link_color', 'start', 'style_4', '"#999"'),
('topbar_link_hover_color', 'start', 'style_4', '"#db2c2c"'),
('topbar_text_color', 'start', 'style_4', '"#999"'),
('twitter_theme', 'start', 'style_4', '"dark"'),
('twitter_title', 'start', 'style_4', '{"en":"Twitter"}'),
('twitter_transparent_background', 'start', 'style_4', '"true"'),
('twitter_username', 'start', 'style_4', '"kulerthemes"'),
('twitter_widget_id', 'start', 'style_4', '"348037804170809345"'),
('view_button_text', 'start', 'style_4', '{"ar":"abc","en":"Quick View"}'),
('zoom_window_height', 'start', 'style_4', '"300"'),
('zoom_window_width', 'start', 'style_4', '"300"'),
('search_field_text', 'start', 'style_2', '{"ar":"Search","en":"Search"}'),
('view_button_text', 'start', 'style_2', '{"en":"Quick View"}'),
('more_details_button_text', 'start', 'style_2', '{"ar":"","en":"More Details"}'),
('mobile_menu_title', 'start', 'style_2', '{"ar":"MENU","en":"MENU"}'),
('custom_js_status', 'start', 'style_2', '"false"'),
('custom_css_status', 'start', 'style_2', '"false"'),
('custom_css_file_status', 'start', 'style_2', '"false"'),
('show_payment_icons', 'start', 'style_2', '"true"'),
('show_custom_copyright', 'start', 'style_2', '"false"'),
('show_newsletter', 'start', 'style_2', '"true"'),
('show_newsletter_title', 'start', 'style_2', '"false"'),
('social_icon_pinterest', 'start', 'style_2', '"false"'),
('social_icon_rss', 'start', 'style_2', '"true"'),
('social_icon_instagram', 'start', 'style_2', '"false"'),
('social_icon_youtube', 'start', 'style_2', '"true"'),
('social_icon_google_plus', 'start', 'style_2', '"true"'),
('social_icon_twitter', 'start', 'style_2', '"true"'),
('social_icon_facebook', 'start', 'style_2', '"true"'),
('show_social_icons_title', 'start', 'style_2', '"false"'),
('show_social_icons', 'start', 'style_2', '"true"'),
('twitter_transparent_background', 'start', 'style_2', '"false"'),
('show_twitter_footer', 'start', 'style_2', '"false"'),
('show_twitter_header', 'start', 'style_2', '"false"'),
('show_twitter_title', 'start', 'style_2', '"false"'),
('show_twitter', 'start', 'style_2', '"false"'),
('show_facebook_posts', 'start', 'style_2', '"false"'),
('show_facebook_friend_faces', 'start', 'style_2', '"false"'),
('show_facebook_title', 'start', 'style_2', '"false"'),
('show_facebook', 'start', 'style_2', '"false"'),
('show_contact_title', 'start', 'style_2', '"true"'),
('show_contact', 'start', 'style_2', '"true"'),
('show_information_title', 'start', 'style_2', '"true"'),
('show_information', 'start', 'style_2', '"true"'),
('enable_scroll_up', 'start', 'style_2', '"true"'),
('enable_swap_image', 'start', 'style_2', '"true"'),
('show_sale_badge', 'start', 'style_2', '"true"'),
('show_quick_view', 'start', 'style_2', '"true"'),
('show_custom_notification', 'start', 'style_2', '"true"'),
('login_popup', 'start', 'style_2', '"true"'),
('enable_one_page_checkout', 'start', 'style_2', '"true"'),
('show_google_map', 'start', 'style_2', '"true"'),
('show_custom_information', 'start', 'style_2', '"true"'),
('show_custom_tab_2', 'start', 'style_2', '"true"'),
('show_custom_tab_1', 'start', 'style_2', '"true"'),
('show_related_products', 'start', 'style_2', '"false"'),
('show_custom_block', 'start', 'style_2', '"true"'),
('image_lightbox', 'start', 'style_2', '"true"'),
('default_sharing', 'start', 'style_2', '"true"'),
('show_tax', 'start', 'style_2', '"false"'),
('show_number_quantity', 'start', 'style_2', '"true"'),
('show_save_percent', 'start', 'style_2', '"false"'),
('show_brand_logo', 'start', 'style_2', '"false"'),
('sub_categories_image_carousel', 'start', 'style_2', '"false"'),
('sub_category_image', 'start', 'style_2', '"false"'),
('hide_category_image', 'start', 'style_2', '"false"'),
('show_compare_button', 'start', 'style_2', '"false"'),
('show_wish_list_button', 'start', 'style_2', '"false"'),
('show_add_to_cart_button', 'start', 'style_2', '"false"'),
('show_product_rating', 'start', 'style_2', '"false"'),
('show_product_price', 'start', 'style_2', '"false"'),
('show_product_description', 'start', 'style_2', '"false"'),
('show_product_name', 'start', 'style_2', '"true"'),
('show_product_image', 'start', 'style_2', '"true"'),
('search_in_product_description', 'start', 'style_2', '"false"'),
('search_in_specific_manufacturer', 'start', 'style_2', '"false"'),
('search_in_specific_category', 'start', 'style_2', '"false"'),
('live_search_status', 'start', 'style_2', '"true"'),
('multi_level_default_menu', 'start', 'style_2', '"false"'),
('fixed_header', 'start', 'style_2', '"false"'),
('button_select_list', 'start', 'style_2', '"false"'),
('footer_link_hover_color', 'start', 'style_2', '"#36376e"');

-- --------------------------------------------------------

--
-- Table structure for table `oc_kcp_theme`
--

CREATE TABLE IF NOT EXISTS `oc_kcp_theme` (
  `theme_id` varchar(64) NOT NULL,
  `version` varchar(10) NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_kcp_theme`
--

INSERT INTO `oc_kcp_theme` (`theme_id`, `version`) VALUES
('start', '1.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 'english', 1, 1),
(2, 'Arabic', 'ar', 'ar_LB', 'lb.png', 'arabic', 'arabic', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Kuler Blog Manager');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(30, 6, 0, 'account'),
(17, 10, 0, 'affiliate/'),
(34, 3, 0, 'product/category'),
(26, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(22, 5, 0, 'product/manufacturer'),
(23, 7, 0, 'checkout/'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(33, 12, 0, 'module/kbm'),
(35, 3, 0, 'module/kuler_filter_result');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE IF NOT EXISTS `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in'),
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'data/demo/htc_logo.jpg', 0),
(6, 'Palm', 'data/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'data/demo/hp_logo.jpg', 0),
(8, 'Apple', 'data/demo/apple_logo.jpg', 0),
(9, 'Canon', 'data/demo/canon_logo.jpg', 0),
(10, 'Sony', 'data/demo/sony_logo.jpg', 0),
(11, 'Dr Martens', 'data/demo/start/manufacturers/200x80/lg5-200x80.jpg', 0),
(12, 'Nike', 'data/demo/start/manufacturers/200x80/lg4-200x80.jpg', 0),
(13, 'Converse', 'data/demo/start/manufacturers/200x80/lg4-200x80.jpg', 0),
(14, 'Cheap Monday', 'data/demo/start/manufacturers/200x80/lg3-200x80.jpg', 0),
(15, 'Superdry', 'data/demo/start/manufacturers/200x80/lg7-200x80.jpg', 0),
(16, 'Armani Exchange', 'data/demo/start/manufacturers/200x80/lg1-200x80.jpg', 0),
(17, 'Fedora', 'data/demo/start/manufacturers/200x80/lg7-200x80.jpg', 0),
(18, 'Warehouse', 'data/demo/start/manufacturers/200x80/lg3-200x80.jpg', 0),
(19, 'ASOS', 'data/demo/start/manufacturers/200x80/lg2-200x80.jpg', 0),
(20, 'Ralph Lauren', '', 0),
(21, 'Criminal Damage', 'data/logo.png', 0),
(22, 'New Look', 'data/demo/start/manufacturers/200x80/lg3-200x80.jpg', 0),
(23, 'Selected', 'data/demo/start/manufacturers/200x80/lg6-200x80.jpg', 0),
(24, 'Penfield', '', 0),
(25, 'Pull&amp;Bear', 'data/demo/start/manufacturers/200x80/lg5-200x80.jpg', 0),
(26, 'Vila', 'data/demo/start/manufacturers/200x80/lg2-200x80.jpg', 0),
(27, 'Esprit', 'data/demo/start/manufacturers/200x80/lg6-200x80.jpg', 0),
(28, 'JDY', 'data/demo/start/manufacturers/200x80/lg1-200x80.jpg', 0),
(29, 'Minkpink', 'data/demo/start/manufacturers/200x80/lg2-200x80.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE IF NOT EXISTS `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 2),
(2, 'checkbox', 3),
(4, 'text', 4),
(5, 'select', 1),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 1),
(12, 'date', 1),
(13, 'select', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(1, 1, 'Select Size'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 1, 'Select Color'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size'),
(13, 1, 'Color'),
(13, 2, 'Color'),
(5, 2, 'Select Color'),
(1, 2, 'Select Size');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(45, 2, '', 4),
(44, 2, '', 3),
(41, 5, 'no_image.jpg', 3),
(42, 5, 'no_image.jpg', 4),
(43, 1, 'no_image.jpg', 3),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3),
(49, 13, '', 0),
(50, 13, '', 0),
(51, 13, '', 0),
(39, 5, 'no_image.jpg', 1),
(40, 5, 'no_image.jpg', 2),
(55, 5, '', 0),
(56, 5, '', 0),
(57, 5, '', 0),
(32, 1, 'no_image.jpg', 1),
(31, 1, 'no_image.jpg', 2),
(58, 1, '', 0),
(59, 1, '', 0),
(60, 1, '', 0),
(61, 1, '', 0),
(62, 1, '', 0),
(63, 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(31, 2, 1, 'Medium'),
(31, 1, 1, 'Medium'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(32, 2, 1, 'Small'),
(40, 1, 5, 'Blue'),
(39, 2, 5, 'Red'),
(39, 1, 5, 'Red'),
(41, 2, 5, 'Green'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(32, 1, 1, 'Small'),
(43, 2, 1, 'Large'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(43, 1, 1, 'Large'),
(41, 1, 5, 'Green'),
(42, 2, 5, 'Yellow'),
(42, 1, 5, 'Yellow'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small'),
(49, 1, 13, 'Red'),
(49, 2, 13, 'Red'),
(50, 1, 13, 'Green'),
(50, 2, 13, 'Green'),
(51, 1, 13, 'Blue'),
(51, 2, 13, 'Blue'),
(55, 2, 5, 'Black'),
(55, 1, 5, 'Black'),
(40, 2, 5, 'Blue'),
(56, 1, 5, 'Pink'),
(56, 2, 5, 'Pink'),
(57, 1, 5, 'Violet'),
(57, 2, 5, 'Violet'),
(58, 1, 1, '30'),
(58, 2, 1, '30'),
(59, 1, 1, '31'),
(59, 2, 1, '31'),
(60, 1, 1, '32'),
(60, 2, 1, '32'),
(61, 1, 1, '33'),
(61, 2, 1, '33'),
(62, 1, 1, '34'),
(62, 2, 1, '34'),
(63, 1, 1, '35'),
(63, 2, 1, '35');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE IF NOT EXISTS `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `oc_order`
--

INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_company_id`, `payment_tax_id`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 0, 'INV-2013-00', 0, 'Your Store', 'http://demo.kulerthemes.com/start/1/', 0, 0, '', '', '', '', '', 'Luan', 'Vu', '', '', '', 'cdc', '', 'czczxc', '', 'Viet Nam', 230, 'Cao Bang', 3764, '', 'Cash On Delivery', 'cod', 'Luan', 'Vu', '', 'cdc', '', 'czczxc', '', 'Viet Nam', 230, 'Cao Bang', 3764, '', 'Flat Shipping Rate', 'flat.flat', 'Hello', '26.8650', 0, 0, '0.0000', 1, 1, 'GBP', '0.59509999', '58.187.9.47', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'en-US,en;q=0.8,es;q=0.6,et;q=0.4,lt;q=0.2,vi;q=0.2,fi;q=0.2,nl;q=0.2,fr;q=0.2,de;q=0.2,ru;q=0.2,pt;q=0.2,sk;q=0.2', '2014-06-09 00:54:38', '2014-06-09 00:54:38'),
(2, 0, 'INV-2013-00', 0, 'Your Store', 'http://demo.kulerthemes.com/start/1/', 0, 0, '', '', '', '', '', 'Luan', 'Vu', '', '', '', 'cdc', '', 'czczxc', '', 'Viet Nam', 230, 'Cao Bang', 3764, '', 'Cash On Delivery', 'cod', 'Luan', 'Vu', '', 'cdc', '', 'czczxc', '', 'Viet Nam', 230, 'Cao Bang', 3764, '', 'Flat Shipping Rate', 'flat.flat', 'Hello', '26.8650', 0, 0, '0.0000', 1, 1, 'GBP', '0.59509999', '58.187.9.47', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'en-US,en;q=0.8,es;q=0.6,et;q=0.4,lt;q=0.2,vi;q=0.2,fi;q=0.2,nl;q=0.2,fr;q=0.2,de;q=0.2,ru;q=0.2,pt;q=0.2,sk;q=0.2', '2014-06-09 00:54:52', '2014-06-09 00:54:52'),
(3, 0, 'INV-2013-00', 0, 'Start OpenCart Theme', 'http://demo.kulerthemes.com/start/1/', 0, 1, 'Duong', 'Phan', 'duongphananh@gmail.com', '123456789', '', 'Duong', 'Phan', '', '', '', 'Ha Noi', '', 'Ha Noi', 'LL69', 'Viet Nam', 230, 'Ha Noi', 3776, '', 'Cash On Delivery', 'cod', 'Duong', 'Phan', '', 'Ha Noi', '', 'Ha Noi', 'LL69', 'Viet Nam', 230, 'Ha Noi', 3776, '', 'Flat Shipping Rate', 'flat.flat', '', '627.7950', 1, 0, '0.0000', 1, 2, 'USD', '1.00000000', '58.187.9.139', '', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2', '2014-06-15 19:37:33', '2014-06-15 19:39:00'),
(4, 0, 'INV-2013-00', 0, 'Start OpenCart Theme', 'http://demo.kulerthemes.com/start/2/', 1, 1, 'dfghfg', 'fghfdg', 'fhgfd@dfssdf.com', '3435645', '', 'dfghfg', 'fghfdg', '', '', '', 'gdfgdfgdf', '', 'dfgdfg', '', 'Bahamas', 16, 'Mayaguana', 302, '', 'Cash On Delivery', 'cod', 'dfghfg', 'fghfdg', '', 'gdfgdfgdf', '', 'dfgdfg', '', 'Bahamas', 16, 'Mayaguana', 302, '', 'Flat Shipping Rate', 'flat.flat', '', '17.8750', 1, 0, '0.0000', 1, 2, 'USD', '1.00000000', '36.85.77.70', '', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0', 'id,en-us;q=0.7,en;q=0.3', '2014-08-21 01:45:47', '2014-08-21 01:45:47'),
(5, 0, 'INV-2013-00', 0, 'Start OpenCart Theme', 'http://demo.kulerthemes.com/start/2/', 0, 1, 'sdfasfg', 'sdfsdf', 'acegames@btinternet.com', '077951133', '', 'sdfasfg', 'sdfsdf', '', '', '', 'sdgsdG', '', 'sdgsdG', 'demo', 'Aaland Islands', 244, '', 0, '', 'Cash On Delivery', 'cod', 'sdfasfg', 'sdfsdf', '', 'sdgsdG', '', 'sdgsdG', 'demo', 'Aaland Islands', 244, '', 0, '', 'Flat Shipping Rate', 'flat.flat', '', '17.8750', 0, 0, '0.0000', 1, 1, 'GBP', '0.60320002', '31.48.162.235', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:31.0) Gecko/20100101 Firefox/31.0', 'en-gb,en;q=0.5', '2014-08-22 17:48:27', '2014-08-22 17:48:27'),
(6, 0, 'INV-2013-00', 0, 'Start OpenCart Theme', 'http://demo.kulerthemes.com/start/2/', 1, 1, 'dfghfg', 'fghfdg', 'fhgfd@dfssdf.com', '3435645', '', 'dfghfg', 'fghfdg', '', '', '', 'gdfgdfgdf', '', 'dfgdfg', '19557', 'Bahamas', 16, 'Mayaguana', 302, '', 'Cash On Delivery', 'cod', 'dfghfg', 'fghfdg', '', 'gdfgdfgdf', '', 'dfgdfg', '19557', 'Bahamas', 16, 'Mayaguana', 302, '', 'Flat Shipping Rate', 'flat.flat', '', '27.0000', 1, 0, '0.0000', 1, 3, 'EUR', '0.75840002', '78.75.111.172', '', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; managedpc)', 'sv', '2014-08-28 01:55:04', '2014-08-28 01:55:04'),
(7, 0, 'INV-2013-00', 0, 'Start OpenCart Theme', 'http://demo.kulerthemes.com/start/2/', 1, 1, 'dfghfg', 'fghfdg', 'fhgfd@dfssdf.com', '3435645', '', 'dfghfg', 'fghfdg', '', '', '', 'gdfgdfgdf', '', 'dfgdfg', '19557', 'Bahamas', 16, 'Mayaguana', 302, '', 'Cash On Delivery', 'cod', 'dfghfg', 'fghfdg', '', 'gdfgdfgdf', '', 'dfgdfg', '19557', 'Bahamas', 16, 'Mayaguana', 302, '', 'Flat Shipping Rate', 'flat.flat', '', '27.0000', 0, 0, '0.0000', 1, 3, 'EUR', '0.75840002', '78.75.111.172', '', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; managedpc)', 'sv', '2014-08-28 01:55:05', '2014-08-28 01:55:05'),
(8, 0, 'INV-2013-00', 0, 'Start OpenCart Theme', 'http://demo.kulerthemes.com/start/2/', 1, 1, 'dfghfg', 'fghfdg', 'fhgfd@dfssdf.com', '3435645', '', 'dfghfg', 'fghfdg', '', '', '', 'gdfgdfgdf', '', 'dfgdfg', '19557', 'Bahamas', 16, 'Mayaguana', 302, '', 'Cash On Delivery', 'cod', 'dfghfg', 'fghfdg', '', 'gdfgdfgdf', '', 'dfgdfg', '19557', 'Bahamas', 16, 'Mayaguana', 302, '', 'Flat Shipping Rate', 'flat.flat', '', '208.9900', 1, 0, '0.0000', 1, 3, 'EUR', '0.75840002', '78.75.111.172', '', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; managedpc)', 'sv', '2014-08-28 01:56:41', '2014-08-28 01:56:41'),
(9, 0, 'INV-2013-00', 0, 'Start OpenCart Theme', 'http://demo.kulerthemes.com/start/2/', 1, 1, 'dfghfg', 'fghfdg', 'fhgfd@dfssdf.com', '3435645', '', 'dfghfg', 'fghfdg', '', '', '', 'gdfgdfgdf', '', 'dfgdfg', '19557', 'Bahamas', 16, 'Mayaguana', 302, '', 'Cash On Delivery', 'cod', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '32.9641', 1, 0, '0.0000', 1, 3, 'EUR', '0.75840002', '78.75.111.172', '', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; managedpc)', 'sv', '2014-08-28 02:00:50', '2014-08-28 02:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_download`
--

CREATE TABLE IF NOT EXISTS `oc_order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_field`
--

CREATE TABLE IF NOT EXISTS `oc_order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_fraud`
--

CREATE TABLE IF NOT EXISTS `oc_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE IF NOT EXISTS `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `oc_order_history`
--

INSERT INTO `oc_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(1, 3, 1, 1, '', '2014-06-15 19:37:33'),
(2, 4, 1, 1, '', '2014-08-21 01:45:47'),
(3, 6, 1, 1, '', '2014-08-28 01:55:04'),
(4, 8, 1, 1, '', '2014-08-28 01:56:41'),
(5, 9, 1, 1, '', '2014-08-28 02:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE IF NOT EXISTS `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_order_option`
--

INSERT INTO `oc_order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`) VALUES
(1, 8, 26, 242, 67, 'Select Color', 'Black', 'select'),
(2, 8, 26, 243, 71, 'Select Size', 'Medium', 'radio');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE IF NOT EXISTS `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `oc_order_product`
--

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 70, 'Long Sleeve T-Shirt With V Neck ', '444089', 1, '18.9900', '18.9900', '0.0000', 0),
(2, 2, 70, 'Long Sleeve T-Shirt With V Neck ', '444089', 1, '18.9900', '18.9900', '0.0000', 0),
(16, 3, 87, 'Textured Top With Chiffon Inserts', '482169', 1, '39.9900', '39.9900', '0.0000', 0),
(15, 3, 97, 'Stripe Oversize Shirt', '488644', 1, '45.9900', '45.9900', '0.0000', 0),
(14, 3, 86, 'New Look Double Strap Cami', '462888', 1, '10.9900', '10.9900', '0.0000', 0),
(13, 3, 96, 'Denim Smock Dress with Cap Sleeve in Light Wash', '455249', 1, '30.0000', '30.0000', '0.0000', 0),
(12, 3, 95, 'Denim Shirt in Retro Mid Wash', '469914', 1, '40.5000', '40.5000', '0.0000', 0),
(11, 3, 73, 'Twill Shirt In Short Sleeve With', '443250', 1, '30.9900', '30.9900', '0.0000', 0),
(10, 3, 68, 'T-Shirt With Yoke Print And Roll Sleeve', '495511', 1, '18.5000', '18.5000', '0.0000', 0),
(9, 3, 72, 'New Look Oxford Shirt with Long Sleeves', '441334', 1, '10.0000', '10.0000', '0.0000', 0),
(8, 3, 70, 'Long Sleeve T-Shirt With V Neck ', '444089', 1, '18.9900', '18.9900', '0.0000', 0),
(7, 3, 65, 'Irish Linen Shirt In Long Sleeve', '463233', 1, '60.5000', '60.5000', '0.0000', 0),
(6, 3, 93, 'Esprit Short Sleeve Henley In Pique', '471941', 1, '22.0000', '22.0000', '0.0000', 0),
(5, 3, 71, 'Denim Jacket With Distressed Effect', '381186', 1, '60.9900', '60.9900', '0.0000', 0),
(4, 3, 67, 'Criminal Damage Longline T-Shirt', '494888', 1, '50.9900', '50.9900', '0.0000', 0),
(3, 3, 81, 'Chino Shorts In Mid Length', '157564', 1, '30.0000', '30.0000', '0.0000', 0),
(17, 3, 109, 'Top with Origami Pleat Detail and Jersey Back', '154265', 1, '37.5000', '37.5000', '0.0000', 0),
(18, 3, 88, 'V Neck Contrast Panel Cami', '494561', 1, '33.0000', '33.0000', '0.0000', 0),
(19, 3, 91, 'Vila Sleeveless Braid Detail Button Blouse', '485941', 1, '45.9900', '45.9900', '0.0000', 0),
(20, 3, 105, 'Warehouse Shoulder Pad Shell Top', '413589', 1, '33.0000', '33.0000', '0.0000', 0),
(21, 4, 97, 'Stripe Oversize Shirt', '488644', 1, '10.0000', '10.0000', '0.0000', 0),
(22, 5, 72, 'New Look Oxford Shirt with Long Sleeves', '441334', 1, '10.0000', '10.0000', '0.0000', 0),
(23, 6, 93, 'Esprit Short Sleeve Henley In Pique', '471941', 1, '22.0000', '22.0000', '0.0000', 0),
(24, 7, 93, 'Esprit Short Sleeve Henley In Pique', '471941', 1, '22.0000', '22.0000', '0.0000', 0),
(25, 8, 69, 'Leather Biker Jacket', '309707', 1, '150.0000', '150.0000', '0.0000', 0),
(26, 8, 67, 'Criminal Damage Longline T-Shirt', '494888', 1, '53.9900', '53.9900', '0.0000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(255) NOT NULL,
  `profile_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `profile_reference` varchar(255) NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE IF NOT EXISTS `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired'),
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(7, 2, 'Canceled'),
(5, 2, 'Complete'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Failed'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(1, 2, 'Pending'),
(16, 2, 'Voided'),
(15, 2, 'Processed'),
(14, 2, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE IF NOT EXISTS `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `oc_order_total`
--

INSERT INTO `oc_order_total` (`order_total_id`, `order_id`, `code`, `title`, `text`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Sub-Total', '£11.30', '18.9900', 1),
(2, 1, 'shipping', 'Flat Shipping Rate', '£2.98', '5.0000', 3),
(3, 1, 'tax', 'Eco Tax (-2.00)', '£1.19', '2.0000', 5),
(4, 1, 'tax', 'VAT (17.5%)', '£0.52', '0.8750', 5),
(5, 1, 'total', 'Total', '£15.99', '26.8650', 9),
(6, 2, 'sub_total', 'Sub-Total', '£11.30', '18.9900', 1),
(7, 2, 'shipping', 'Flat Shipping Rate', '£2.98', '5.0000', 3),
(8, 2, 'tax', 'Eco Tax (-2.00)', '£1.19', '2.0000', 5),
(9, 2, 'tax', 'VAT (17.5%)', '£0.52', '0.8750', 5),
(10, 2, 'total', 'Total', '£15.99', '26.8650', 9),
(13, 3, 'tax', 'Eco Tax (-2.00)', '$2.00', '2.0000', 5),
(12, 3, 'shipping', 'Flat Shipping Rate', '$5.00', '5.0000', 3),
(11, 3, 'sub_total', 'Sub-Total', '$619.92', '619.9200', 1),
(14, 3, 'tax', 'VAT (17.5%)', '$0.88', '0.8750', 5),
(15, 3, 'total', 'Total', '$627.80', '627.7950', 9),
(16, 4, 'sub_total', 'Sub-Total', '$10.00', '10.0000', 1),
(17, 4, 'shipping', 'Flat Shipping Rate', '$5.00', '5.0000', 3),
(18, 4, 'tax', 'Eco Tax (-2.00)', '$2.00', '2.0000', 5),
(19, 4, 'tax', 'VAT (17.5%)', '$0.88', '0.8750', 5),
(20, 4, 'total', 'Total', '$17.88', '17.8750', 9),
(21, 5, 'sub_total', 'Sub-Total', '£6.03', '10.0000', 1),
(22, 5, 'shipping', 'Flat Shipping Rate', '£3.02', '5.0000', 3),
(23, 5, 'tax', 'Eco Tax (-2.00)', '£1.21', '2.0000', 5),
(24, 5, 'tax', 'VAT (17.5%)', '£0.53', '0.8750', 5),
(25, 5, 'total', 'Total', '£10.78', '17.8750', 9),
(26, 6, 'sub_total', 'Sub-Total', '16.68€', '22.0000', 1),
(27, 6, 'shipping', 'Flat Shipping Rate', '3.79€', '5.0000', 3),
(28, 6, 'total', 'Total', '20.48€', '27.0000', 9),
(29, 7, 'sub_total', 'Sub-Total', '16.68€', '22.0000', 1),
(30, 7, 'shipping', 'Flat Shipping Rate', '3.79€', '5.0000', 3),
(31, 7, 'total', 'Total', '20.48€', '27.0000', 9),
(32, 8, 'sub_total', 'Sub-Total', '154.71€', '203.9900', 1),
(33, 8, 'shipping', 'Flat Shipping Rate', '3.79€', '5.0000', 3),
(34, 8, 'total', 'Total', '158.50€', '208.9900', 9),
(35, 9, 'sub_total', 'Sub-Total', '25.00€', '32.9641', 1),
(36, 9, 'total', 'Total', '25.00€', '32.9641', 9);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_order_voucher`
--

INSERT INTO `oc_order_voucher` (`order_voucher_id`, `order_id`, `voucher_id`, `description`, `code`, `from_name`, `from_email`, `to_name`, `to_email`, `voucher_theme_id`, `message`, `amount`) VALUES
(1, 9, 1, '25.00€ Gift Certificate for ddd', '13a8993750', 'dfghfg fghfdg', 'fhgfd@dfssdf.com', 'ddd', 'kalle@kalle.se', 6, 'ddddd', '32.9641');

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavoslidergroups`
--

CREATE TABLE IF NOT EXISTS `oc_pavoslidergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_pavoslidergroups`
--

INSERT INTO `oc_pavoslidergroups` (`id`, `title`, `params`) VALUES
(3, 'Layer Slider', 'a:28:{s:5:"title";s:12:"Layer Slider";s:5:"delay";s:4:"6000";s:9:"fullwidth";s:0:"";s:5:"width";s:4:"1170";s:6:"height";s:3:"500";s:12:"touch_mobile";s:1:"1";s:13:"stop_on_hover";s:1:"1";s:12:"shuffle_mode";s:1:"0";s:14:"image_cropping";s:1:"0";s:11:"shadow_type";s:1:"0";s:14:"show_time_line";s:1:"1";s:18:"time_line_position";s:3:"top";s:16:"background_color";s:0:"";s:6:"margin";s:0:"";s:7:"padding";s:0:"";s:16:"background_image";s:1:"0";s:14:"background_url";s:0:"";s:14:"navigator_type";s:4:"none";s:16:"navigator_arrows";s:16:"verticalcentered";s:16:"navigation_style";s:5:"round";s:17:"offset_horizontal";s:1:"0";s:15:"offset_vertical";s:2:"20";s:14:"show_navigator";s:1:"0";s:20:"hide_navigator_after";s:3:"200";s:15:"thumbnail_width";s:3:"100";s:16:"thumbnail_height";s:2:"50";s:16:"thumbnail_amount";s:1:"5";s:17:"hide_screen_width";s:0:"";}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_pavosliderlayers`
--

CREATE TABLE IF NOT EXISTS `oc_pavosliderlayers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `params` text NOT NULL,
  `layersparams` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `oc_pavosliderlayers`
--

INSERT INTO `oc_pavosliderlayers` (`id`, `title`, `parent_id`, `group_id`, `params`, `layersparams`, `image`, `status`, `position`) VALUES
(11, 'red flower', 0, 3, 'a:17:{s:2:"id";s:1:"0";s:15:"slider_group_id";s:1:"3";s:12:"slider_title";s:10:"red flower";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:18:"slider_enable_link";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"0";s:12:"slider_image";s:19:"data/red-flower.png";}', 'O:8:"stdClass":1:{s:6:"layers";a:0:{}}', 'data/red-flower.png', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE IF NOT EXISTS `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`) VALUES
(109, '154265', '', '', '', '', '', '', '', 9, 7, 'data/demo/start/products/870x1110/image2-03-a.jpg', 19, 1, '37.5000', 0, 0, '2014-06-15', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-06-15 19:05:48', '0000-00-00 00:00:00', 0),
(50, '400136', '', '', '', '', '', '', '', 30, 7, 'data/demo/start/products/870x1110/shoes-02-a.jpg', 11, 1, '89.5000', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 01:29:50', '2014-05-29 01:32:28', 0),
(51, '414996', '', '', '', '', '', '', '', 50, 7, 'data/demo/start/products/870x1110/shoes-01-a.jpg', 11, 1, '150.5000', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 01:35:36', '0000-00-00 00:00:00', 0),
(52, '2014433077', '', '', '', '', '', '', '', 50, 7, 'data/demo/start/products/870x1110/shoes-03-a.jpg', 12, 1, '130.9900', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 01:49:20', '0000-00-00 00:00:00', 0),
(53, '1352561559', '', '', '', '', '', '', '', 40, 7, 'data/demo/start/products/870x1110/shoes-04-a.jpg', 12, 1, '98.5000', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 01:54:23', '0000-00-00 00:00:00', 0),
(54, '2411066262', '', '', '', '', '', '', '', 50, 7, 'data/demo/start/products/870x1110/shoes-05-a.jpg', 13, 1, '89.9900', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 02:06:24', '2014-06-17 01:24:40', 0),
(55, '456194', '', '', '', '', '', '', '', 20, 7, 'data/demo/start/products/870x1110/back-pack-01-a.jpg', 14, 1, '85.5000', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 02:14:29', '2014-06-17 03:56:43', 0),
(56, '401978', '', '', '', '', '', '', '', 40, 7, 'data/demo/start/products/870x1110/back-pack-02-a.jpg', 15, 1, '87.6000', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 02:23:17', '0000-00-00 00:00:00', 0),
(58, '422048', '', '', '', '', '', '', '', 20, 7, 'data/demo/start/products/870x1110/hat-01-a.jpg', 17, 1, '22.5000', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 02:45:18', '0000-00-00 00:00:00', 0),
(59, '468509', '', '', '', '', '', '', '', 15, 7, 'data/demo/start/products/870x1110/hat-02-a.jpg', 18, 1, '42.5000', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 02:48:42', '0000-00-00 00:00:00', 0),
(60, '403291', '', '', '', '', '', '', '', 25, 7, 'data/demo/start/products/870x1110/jean-01-a.jpg', 19, 1, '35.5000', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 03:09:44', '0000-00-00 00:00:00', 0),
(61, '428335', '', '', '', '', '', '', '', 15, 7, 'data/demo/start/products/870x1110/jean-02-a.jpg', 20, 1, '120.5000', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 03:14:13', '0000-00-00 00:00:00', 0),
(62, '474858', '', '', '', '', '', '', '', 15, 7, 'data/demo/start/products/870x1110/jean-03-a.jpg', 18, 1, '62.5000', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 03:20:19', '0000-00-00 00:00:00', 0),
(63, '392936', '', '', '', '', '', '', '', 15, 7, 'data/demo/start/products/870x1110/jean-04-a.jpg', 19, 1, '45.6000', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 03:33:15', '0000-00-00 00:00:00', 0),
(64, '340271', '', '', '', '', '', '', '', 20, 7, 'data/demo/start/products/870x1110/jean-05-a.jpg', 19, 1, '63.5000', 0, 0, '2014-05-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 03:36:43', '0000-00-00 00:00:00', 0),
(65, '463233', '', '', '', '', '', '', '', 49, 7, 'data/demo/start/products/870x1110/image1-04-a.jpg', 19, 1, '60.5000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 18:37:29', '0000-00-00 00:00:00', 0),
(66, '451331', '', '', '', '', '', '', '', 15, 7, 'data/demo/start/products/870x1110/image1-06-a.jpg', 12, 1, '35.5000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 18:43:27', '0000-00-00 00:00:00', 0),
(67, '494888', '', '', '', '', '', '', '', 28, 7, 'data/demo/start/products/870x1110/image1-08-a.jpg', 21, 1, '50.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 18:48:02', '2014-06-17 01:27:18', 0),
(68, '495511', '', '', '', '', '', '', '', 49, 7, 'data/demo/start/products/870x1110/image1-09-a.jpg', 19, 1, '18.5000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 18:59:19', '0000-00-00 00:00:00', 0),
(69, '309707', '', '', '', '', '', '', '', 9, 7, 'data/demo/start/products/870x1110/image1-03-a.jpg', 19, 1, '150.0000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 19:05:17', '2014-05-29 19:52:16', 0),
(70, '444089', '', '', '', '', '', '', '', 0, 7, 'data/demo/start/products/870x1110/image1-07-a.jpg', 19, 1, '18.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 19:42:42', '0000-00-00 00:00:00', 0),
(71, '381186', '', '', '', '', '', '', '', 9, 7, 'data/demo/start/products/870x1110/image1-02-a.jpg', 19, 1, '60.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 19:51:57', '0000-00-00 00:00:00', 0),
(72, '441334', '', '', '', '', '', '', '', 9, 7, 'data/demo/start/products/870x1110/image1-01-a.jpg', 22, 1, '19.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 20:00:29', '2014-06-15 19:41:32', 0),
(73, '443250', '', '', '', '', '', '', '', 14, 7, 'data/demo/start/products/870x1110/image1-05-a.jpg', 22, 1, '30.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 20:11:29', '0000-00-00 00:00:00', 0),
(74, '446202', '', '', '', '', '', '', '', 30, 7, 'data/demo/start/products/870x1110/image1-10-a.jpg', 22, 1, '20.0000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 20:22:40', '0000-00-00 00:00:00', 0),
(75, '457968', '', '', '', '', '', '', '', 15, 7, 'data/demo/start/products/870x1110/image1-11-a.jpg', 19, 1, '21.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 20:25:58', '0000-00-00 00:00:00', 0),
(76, '462181', '', '', '', '', '', '', '', 20, 7, 'data/demo/start/products/870x1110/image1-12-a.jpg', 19, 1, '33.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 20:29:38', '0000-00-00 00:00:00', 0),
(77, '455636', '', '', '', '', '', '', '', 10, 7, 'data/demo/start/products/870x1110/image1-13-a.jpg', 19, 1, '24.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 20:34:53', '0000-00-00 00:00:00', 0),
(79, '444839', '', '', '', '', '', '', '', 10, 7, 'data/demo/start/products/870x1110/image1-14-a.jpg', 15, 1, '59.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 20:38:00', '0000-00-00 00:00:00', 0),
(80, '331650', '', '', '', '', '', '', '', 30, 7, 'data/demo/start/products/870x1110/pants-01-a.jpg', 19, 1, '28.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 0, '2014-05-29 21:02:51', '2014-06-10 01:49:38', 0),
(81, '157564', '', '', '', '', '', '', '', 14, 7, 'data/demo/start/products/870x1110/pants-02-a.jpg', 22, 1, '30.0000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 21:07:15', '0000-00-00 00:00:00', 0),
(82, '401413', '', '', '', '', '', '', '', 20, 7, 'data/demo/start/products/870x1110/pants-03-a.jpg', 19, 1, '29.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 21:13:45', '0000-00-00 00:00:00', 0),
(83, '269921', '', '', '', '', '', '', '', 10, 7, 'data/demo/start/products/870x1110/pants-04-a.jpg', 23, 1, '60.5000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 21:19:36', '0000-00-00 00:00:00', 0),
(84, '418141', '', '', '', '', '', '', '', 20, 7, 'data/demo/start/products/870x1110/pants-05-a.jpg', 24, 1, '90.5000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 21:22:43', '0000-00-00 00:00:00', 0),
(85, '451232', '', '', '', '', '', '', '', 30, 7, 'data/demo/start/products/870x1110/pants-06-a.jpg', 12, 1, '60.0000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-29 21:26:03', '2014-06-10 01:50:36', 0),
(86, '462888', '', '', '', '', '', '', '', 29, 7, 'data/demo/start/products/870x1110/image2-02-a.jpg', 22, 1, '10.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 00:25:21', '0000-00-00 00:00:00', 0),
(87, '482169', '', '', '', '', '', '', '', 29, 7, 'data/demo/start/products/870x1110/image2-06-a.jpg', 19, 1, '39.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 00:29:25', '0000-00-00 00:00:00', 0),
(88, '494561', '', '', '', '', '', '', '', 19, 7, 'data/demo/start/products/870x1110/image2-04-a.jpg', 19, 1, '33.0000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 00:32:29', '0000-00-00 00:00:00', 0),
(89, '486343', '', '', '', '', '', '', '', 0, 5, 'data/demo/start/products/870x1110/image2-05-a.jpg', 19, 1, '24.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 00:40:54', '2014-06-15 19:27:15', 0),
(90, '514872', '', '', '', '', '', '', '', 20, 7, 'data/demo/start/products/870x1110/image1-15-a.jpg', 25, 1, '18.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 00:45:13', '2014-06-13 04:37:01', 0),
(91, '485941', '', '', '', '', '', '', '', 14, 7, 'data/demo/start/products/870x1110/image2-07-a.jpg', 26, 1, '45.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 00:54:18', '0000-00-00 00:00:00', 0),
(92, '451919', '', '', '', '', '', '', '', 10, 7, 'data/demo/start/products/870x1110/image2-08-a.jpg', 19, 1, '40.0000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 01:01:26', '0000-00-00 00:00:00', 0),
(93, '471941', '', '', '', '', '', '', '', 13, 7, 'data/demo/start/products/870x1110/image1-16-a.jpg', 27, 1, '27.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 01:09:54', '2014-06-13 04:35:28', 0),
(94, '475054', '', '', '', '', '', '', '', 15, 7, 'data/demo/start/products/870x1110/image1-17-a.jpg', 19, 1, '33.5000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 01:14:41', '0000-00-00 00:00:00', 0),
(95, '469914', '', '', '', '', '', '', '', 19, 7, 'data/demo/start/products/870x1110/image2-09-a.jpg', 19, 1, '40.5000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 01:19:02', '0000-00-00 00:00:00', 0),
(96, '455249', '', '', '', '', '', '', '', 9, 7, 'data/demo/start/products/870x1110/image2-10-a.jpg', 19, 1, '38.5000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 01:22:57', '2014-06-13 04:31:52', 0),
(97, '488644', '', '', '', '', '', '', '', 18, 7, 'data/demo/start/products/870x1110/image2-01-a.jpg', 19, 1, '45.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 01:27:23', '2014-06-15 19:42:02', 0),
(98, '431802', '', '', '', '', '', '', '', 30, 7, 'data/demo/start/products/870x1110/image2-11-a.jpg', 28, 1, '9.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 01:50:21', '0000-00-00 00:00:00', 0),
(99, '503609', '', '', '', '', '', '', '', 30, 7, 'data/demo/start/products/870x1110/image2-12-a.jpg', 19, 1, '15.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 02:01:25', '0000-00-00 00:00:00', 0),
(100, '469184', '', '', '', '', '', '', '', 20, 7, 'data/demo/start/products/870x1110/image2-13-a.jpg', 22, 1, '15.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 02:05:58', '0000-00-00 00:00:00', 0),
(101, '457247', '', '', '', '', '', '', '', 20, 7, 'data/demo/start/products/870x1110/image2-14-a.jpg', 19, 1, '12.0000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 02:10:11', '2014-06-13 04:30:23', 0),
(102, '430622', '', '', '', '', '', '', '', 10, 7, 'data/demo/start/products/870x1110/image2-15-a.jpg', 29, 1, '65.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 02:22:10', '0000-00-00 00:00:00', 0),
(103, '474111', '', '', '', '', '', '', '', 10, 7, 'data/demo/start/products/870x1110/image2-16-a.jpg', 19, 1, '27.5000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 02:33:39', '0000-00-00 00:00:00', 0),
(104, '484139', '', '', '', '', '', '', '', 30, 7, 'data/demo/start/products/870x1110/image2-17-a.jpg', 19, 1, '45.6000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 02:45:58', '0000-00-00 00:00:00', 0),
(105, '413589', '', '', '', '', '', '', '', 49, 7, 'data/demo/start/products/870x1110/image2-18-a.jpg', 18, 1, '33.0000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 02:49:44', '0000-00-00 00:00:00', 0),
(106, '414446', '', '', '', '', '', '', '', 30, 7, 'data/demo/start/products/870x1110/image2-19-b.jpg', 19, 1, '60.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 02:53:46', '0000-00-00 00:00:00', 0),
(107, '491554', '', '', '', '', '', '', '', 30, 7, 'data/demo/start/products/870x1110/image1-18-a.jpg', 19, 1, '22.5000', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 02:59:49', '0000-00-00 00:00:00', 0),
(108, '436776', '', '', '', '', '', '', '', 30, 7, 'data/demo/start/products/870x1110/image1-19-a.jpg', 19, 1, '37.9900', 0, 0, '2014-05-29', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-05-30 03:06:25', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE IF NOT EXISTS `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(83, 2, 'Selected Shorts In Mesh', '&lt;p&gt;&lt;strong&gt;Shorts by Selected&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a mesh fabric&lt;/li&gt;\r\n	&lt;li&gt;Shirred waistband&lt;/li&gt;\r\n	&lt;li&gt;Side slant pockets&lt;/li&gt;\r\n	&lt;li&gt;Regular rise&lt;/li&gt;\r\n	&lt;li&gt;Loose fit&lt;/li&gt;\r\n	&lt;li&gt;Rounded hem&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT SELECTED&lt;/strong&gt;&lt;br /&gt;\r\nFirst launched in 1997, &lt;strong&gt;Selected &lt;/strong&gt;now has a strong and respected foothold in men''s fashion worldwide with a presence in 25 countries across the globe. Still continuing to stand at the forefront of men''s fashion; &lt;strong&gt;Selected &lt;/strong&gt;specialises in raw and simple designs that are never obviously trend-driven, but always edgy, elegant and masculine with focus on attention to detail.&lt;/p&gt;\r\n', '', '', ''),
(72, 1, 'New Look Oxford Shirt with Long Sleeves', '&lt;p&gt;&lt;strong&gt;Shirt by New Look&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton chambray&lt;/li&gt;\r\n	&lt;li&gt;Shirt collar and button fastening&lt;/li&gt;\r\n	&lt;li&gt;Shaped hem&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT NEW LOOK&lt;br /&gt;\r\nNew Look&lt;/strong&gt; joins the &lt;strong&gt;ASOS &lt;/strong&gt;round up of great British high street brands, showcasing the best in upcoming style and staying ahead of the game. From graphic print t-shirts, through to footwear and accessories, &lt;strong&gt;New Look''s&lt;/strong&gt; menswear collection takes influences from classic rebel movies and the best of effortless style.&lt;/p&gt;\r\n', '', '', ''),
(73, 2, 'Twill Shirt In Short Sleeve With', '&lt;p&gt;&lt;strong&gt;Shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure cotton&lt;/li&gt;\r\n	&lt;li&gt;Button down collar&lt;/li&gt;\r\n	&lt;li&gt;Chest patch pocket&lt;/li&gt;\r\n	&lt;li&gt;Hanging hook&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Designed in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(74, 2, 'New Look Polo Shirt in Stripe', '&lt;p&gt;&lt;strong&gt;T-shirt by New Look&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a cotton blend&lt;/li&gt;\r\n	&lt;li&gt;Four button placket&lt;/li&gt;\r\n	&lt;li&gt;Chest patch pocket&lt;/li&gt;\r\n	&lt;li&gt;Striped pattern throughout&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT NEW LOOK&lt;br /&gt;\r\nNew Look&lt;/strong&gt; joins the &lt;strong&gt;ASOS &lt;/strong&gt;round up of great British high street brands, showcasing the best in upcoming style and staying ahead of the game. From graphic print t-shirts, through to footwear and accessories, &lt;strong&gt;New Look''s&lt;/strong&gt; menswear collection takes influences from classic rebel movies and the best of effortless style.&lt;/p&gt;\r\n', '', '', ''),
(75, 2, 'Polo In England Football Colours', '&lt;p&gt;&lt;strong&gt;Polo shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from pure 100% cotton&lt;/li&gt;\r\n	&lt;li&gt;Polo neck&lt;/li&gt;\r\n	&lt;li&gt;Three button placket&lt;/li&gt;\r\n	&lt;li&gt;Short sleeves&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&amp;nbsp;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', '', ''),
(76, 2, 'Long Sleeve Polo With Cut And Sew Panels', '&lt;p&gt;&lt;strong&gt;Polo shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a cotton blend&lt;/li&gt;\r\n	&lt;li&gt;Cut and sew panel detail&lt;/li&gt;\r\n	&lt;li&gt;Polo collar and button placket&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Designed in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(77, 2, 'Polo With Palm Tree Printed Collar &amp; Cuffs', '&lt;p&gt;&lt;strong&gt;Polo shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from pure 100% cotton&lt;/li&gt;\r\n	&lt;li&gt;Printed design on collar and cuffs&lt;/li&gt;\r\n	&lt;li&gt;Side slits for ease of movement&lt;/li&gt;\r\n	&lt;li&gt;Ribbed cuffs to stop stretching&lt;/li&gt;\r\n	&lt;li&gt;Extended tail to prevent shirt coming loose&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Designed in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(79, 2, 'Superdry Polo Shirt With Applique', '&lt;p&gt;&lt;strong&gt;Polo shirt by Superdry&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a breathable cotton pique&lt;/li&gt;\r\n	&lt;li&gt;Two button placket&lt;/li&gt;\r\n	&lt;li&gt;Ribbed armbands&lt;/li&gt;\r\n	&lt;li&gt;Uneven split hem&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT SUPERDRY&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Famed for their print t-shirts and innovative washed jeans,&lt;strong&gt; Superdry&lt;/strong&gt; combine Japanese design influences with timeless American style, producing a complete clothing range that captures &lt;strong&gt;Superdry&lt;/strong&gt;''s laid back yet stylish take on casual menswear.&lt;/p&gt;\r\n', '', '', ''),
(80, 1, 'Jersey Shorts', '&lt;p&gt;&lt;strong&gt;Shorts by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton jersey&lt;/li&gt;\r\n	&lt;li&gt;Adjustable drawcords to waist&lt;/li&gt;\r\n	&lt;li&gt;Side seam pockets&lt;/li&gt;\r\n	&lt;li&gt;Patch pocket to reverse&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(81, 2, 'Chino Shorts In Mid Length', '&lt;p&gt;&lt;strong&gt;Chino shorts&lt;/strong&gt; by &lt;strong&gt;ASOS&lt;/strong&gt;. Constructed in cotton. Featuring a regular waist with a concealed front fly and button closure, side pockets, buttoned welt pockets to the reverse, a cuffed hem and a mid length relaxed fit.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(82, 2, 'Denim Shorts In Super Skinny', '&lt;p&gt;&lt;strong&gt;Denim shorts by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from stretch cotton denim&lt;/li&gt;\r\n	&lt;li&gt;Concealed fly and button closure&lt;/li&gt;\r\n	&lt;li&gt;Five pocket set&lt;/li&gt;\r\n	&lt;li&gt;Super skinny fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(70, 2, 'Long Sleeve T-Shirt With V Neck ', '&lt;p&gt;&lt;strong&gt;T-shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure cotton&lt;/li&gt;\r\n	&lt;li&gt;Soft touch jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Stepped hem&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(71, 2, 'Denim Jacket With Distressed Effect', '&lt;p&gt;Denim jacket by ASOS&lt;br /&gt;\r\nMade from 100% cotton denim&lt;br /&gt;\r\nFour front pockets&lt;br /&gt;\r\nDistressed effect&amp;nbsp;&lt;br /&gt;\r\nRegular fit&lt;br /&gt;\r\nABOUT ASOS BRAND&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.&lt;/p&gt;\r\n', '', '', ''),
(85, 2, 'Nike Long Basketball Shorts', '&lt;p&gt;&lt;strong&gt;Shorts by Nike&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from &amp;nbsp;jersey&lt;/li&gt;\r\n	&lt;li&gt;Shirred waist with custom drawcords&lt;/li&gt;\r\n	&lt;li&gt;Side seam pockets&lt;/li&gt;\r\n	&lt;li&gt;Branded logo print&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT NIKE&lt;/strong&gt;&lt;br /&gt;\r\nBack in 1971 Blue Ribbons Sports introduced the concept of the Greek Goddess of Victory - &lt;strong&gt;Nike&lt;/strong&gt;. Founded a year later in 1972, &lt;strong&gt;Nike &lt;/strong&gt;have a long and esteemed history of creating functional yet stylish sportswear, covering everything from retro styles, to forward thinking pieces that use the latest innovations in sports technology.&lt;/p&gt;\r\n', '', '', ''),
(84, 2, 'Penfield Shorts with Palm Flower Print', '&lt;p&gt;&lt;strong&gt;Shorts by Penfield&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton&lt;/li&gt;\r\n	&lt;li&gt;Side slant pockets&lt;/li&gt;\r\n	&lt;li&gt;Flower print pattern&lt;/li&gt;\r\n	&lt;li&gt;Straight fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT PENFIELD&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Designed to withstand the demands of the New England climate, &lt;strong&gt;Penfield &lt;/strong&gt;jackets and accessories place a strong emphasis on quality and style. Established in Massachusetts in 1975 the label have a rich history within the area of outdoor clothing, with fashion, function and durability all playing key roles in &lt;strong&gt;Penfield''s &lt;/strong&gt;aesthetic.&lt;/p&gt;\r\n', '', '', ''),
(64, 2, 'Rivington High Waist Denim Jeggings', '&lt;p&gt;&lt;strong&gt;Jeggings by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from stretch cotton denim&lt;/li&gt;\r\n	&lt;li&gt;Stretch added for comfort and fit&lt;/li&gt;\r\n	&lt;li&gt;Flattering high rise, concealed fly&lt;/li&gt;\r\n	&lt;li&gt;Patch pockets&lt;/li&gt;\r\n	&lt;li&gt;Skinny fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Directional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(65, 2, 'Irish Linen Shirt In Long Sleeve', '&lt;p&gt;&lt;strong&gt;Shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from pure 100% linen&lt;/li&gt;\r\n	&lt;li&gt;Point collar&lt;/li&gt;\r\n	&lt;li&gt;Button fastening&lt;/li&gt;\r\n	&lt;li&gt;Chest pocket&lt;/li&gt;\r\n	&lt;li&gt;Full length sleeves&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.&lt;/p&gt;\r\n', '', '', ''),
(66, 2, 'Nike SB Icon Lizard T-Shirt', '&lt;p&gt;&lt;strong&gt;T-shirt by Nike Skateboarding&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a cotton rich fabric&lt;/li&gt;\r\n	&lt;li&gt;Breathable jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Large print on chest&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT NIKE SKATEBOARDING&lt;/strong&gt;&lt;br /&gt;\r\nBalancing premium style and unmatched innovation, &lt;strong&gt;Nike&lt;/strong&gt; Skateboarding is committed to inspiring and supporting the world of skateboarding. With their own pro skate team lead by their signature athlete Paul Rodriguez, &lt;strong&gt;Nike &lt;/strong&gt;Skateboarding produce a line of trainers and apparel, releasing classic Dunk low skate trainers in refreshed colourways alongside their newest signature styles.&lt;/p&gt;\r\n', '', '', ''),
(67, 2, 'Criminal Damage Longline T-Shirt', '&lt;p&gt;&lt;strong&gt;T-shirt by Criminal Damage&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton blend&lt;/li&gt;\r\n	&lt;li&gt;Contrast hem panel&lt;/li&gt;\r\n	&lt;li&gt;Side zip fastening&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CRIMINAL DAMAGE&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Established in 1991, East London label &lt;strong&gt;Criminal Damage&lt;/strong&gt; put their unique take on streetwear with their own trend-led influences. From the dark and macabre, to the bright and bold &lt;strong&gt;Criminal Damage''s&lt;/strong&gt; designers have fun with all-over prints and loud graphics as well as understated classic designs across a line of t-shirts, hoodies and sweatshirts.&lt;/p&gt;\r\n', '', '', ''),
(68, 2, 'T-Shirt With Yoke Print And Roll Sleeve', '&lt;p&gt;&lt;strong&gt;T-shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure cotton&lt;/li&gt;\r\n	&lt;li&gt;Soft touch jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Print on yoke&lt;/li&gt;\r\n	&lt;li&gt;Rolled sleeve design&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(69, 2, 'Leather Biker Jacket', '&lt;p&gt;&lt;strong&gt;Leather jacket by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a soft leather&lt;/li&gt;\r\n	&lt;li&gt;Classic point collar&lt;/li&gt;\r\n	&lt;li&gt;Zipped front and cuffs&lt;/li&gt;\r\n	&lt;li&gt;Jetted side pockets&lt;/li&gt;\r\n	&lt;li&gt;Waist cinchers to sides&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp;Designed in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(51, 2, 'Dr Martens Ali 6-Eye Boots', '&lt;p&gt;&lt;em&gt;Boots &lt;/em&gt;by &lt;strong&gt;Dr Martens&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;100% leather upper&lt;/li&gt;\r\n	&lt;li&gt;Lace up fastening&lt;/li&gt;\r\n	&lt;li&gt;Heel pull tab&lt;/li&gt;\r\n	&lt;li&gt;Chunky grip tread&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT DR MARTENS&lt;/strong&gt;&lt;br /&gt;\r\nSince its creation in the 1960s, the classic &lt;strong&gt;Dr Martens&lt;/strong&gt; eight eyelet boot was once an iconic footwear choice for punks, skinheads and working class rebels the world over. With technical construction that ensures each shoe or boot is durable, resistant and comfortable; &lt;strong&gt;Dr Martens&lt;/strong&gt; have built a reputation on the exceptional quality of their footwear. Today, &lt;strong&gt;Dr Martens&lt;/strong&gt; has retained its trademark designs but added a fresh, contemporary twist with the addition of coloured soles, soft suedes, bright colours and bold prints.&lt;/p&gt;\r\n', '', '', ''),
(50, 2, 'Dr Martens Silver Packard Heeled Sandal', '&lt;p&gt;&lt;em&gt;Yasmin&lt;/em&gt; &lt;strong&gt;sandals &lt;/strong&gt;by &lt;strong&gt;Dr Martens&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;100% leather upper&lt;/li&gt;\r\n	&lt;li&gt;Metallic-look finish&lt;/li&gt;\r\n	&lt;li&gt;Silver-tone spiked studs&lt;/li&gt;\r\n	&lt;li&gt;Lace front fastening&lt;/li&gt;\r\n	&lt;li&gt;Cut-out detailing&lt;/li&gt;\r\n	&lt;li&gt;Open toe design&lt;/li&gt;\r\n	&lt;li&gt;Tapered heel&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT DR MARTENS&lt;/strong&gt;&lt;br /&gt;\r\nFrom working class essential to counter-culture icon,&lt;strong&gt; Dr Martens''&lt;/strong&gt; boots and shoes define generations of rebel style. With classic yellow welt stitching and an air cushioned sole, anti-fashion was indentified in eight holes of &lt;strong&gt;Dr Martens''&lt;/strong&gt; leather boot. Look to seasonal updates from Liberty''s prettifying florals, original colour ways and fresh print finishes&lt;/p&gt;\r\n', '', '', ''),
(52, 2, 'Nike Air Max 1', '&lt;p&gt;&lt;strong&gt;Air Max 1 by Nike&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Running silhouette&lt;br /&gt;\r\n- Pure platinum, navy and silver colourway&lt;br /&gt;\r\n- Leather and mesh upper&lt;br /&gt;\r\n- Visible Air Sole unit&lt;br /&gt;\r\n- Rubber outsole with Waffle pattern for traction&lt;br /&gt;\r\n&lt;strong&gt;- Half sizes available in this style&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;About Air Max 1&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;First released in 1987, the &lt;strong&gt;Air Max 1&lt;/strong&gt; was the first shoe to display Nike’s revolutionary Air-Sole unit in the heel, proving seeing was believing with this lightweight and cushioned model. Made from premium materials in a variety of colourways for style and durability the &lt;strong&gt;Air Max 1&lt;/strong&gt; trainer is a classic that continues to evolve.&lt;/p&gt;\r\n', '', '', ''),
(53, 2, 'Nike Air Max Thea', '&lt;p&gt;&lt;strong&gt;The Nike Air Max Thea&lt;/strong&gt; is a new addition to the &lt;strong&gt;Air Max&lt;/strong&gt; family, a hybrid mix of &lt;strong&gt;Air Max&lt;/strong&gt; and the minimalist Roshe Run. This style is featured here in a orange and bright magenta colourway, the upper is a mix of engineered mesh for ultimate breathability and simplistic Hyperfuse panels. This is all sat atop a white EVA midsole with the visible AirSole unit, a perfect twist of comfort and style.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Half sizes available in this style&lt;/strong&gt;&lt;/p&gt;\r\n', '', '', ''),
(54, 1, 'Converse All Star Hi Foam Mint Better', '&lt;p&gt;&lt;strong&gt;All Star Hi By Converse&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;The iconic basketball style that transcends age and time, this style features a foam mint better wash colourway with lace up front and classic striped white sole.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Better wash canvas upper&lt;br /&gt;\r\n- Classic rubber toecap and outsole&lt;br /&gt;\r\n- All Star branding on midsole and side&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;About Converse&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Converse, renowned for their hi-top canvas trainers have become true wardrobe staples. Transcending age, gender and time Converse continue to develop the iconic hi-top trainer with exclusive prints and designer collaborations keeping the original Converse DNA at its heart.&lt;/p&gt;\r\n', '', '', ''),
(55, 2, 'Cheap Monday Zip Backpack', '&lt;p&gt;&lt;strong&gt;Backpack by Cheap Monday&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton&lt;/li&gt;\r\n	&lt;li&gt;Zip closure&lt;/li&gt;\r\n	&lt;li&gt;Large main compartment&lt;/li&gt;\r\n	&lt;li&gt;Adjustable shoulder straps&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT CHEAP MONDAY&lt;/strong&gt;&lt;br /&gt;\r\nKnown for their skinny jeans and their characteristic skull logo, Stockholm based label Cheap Monday channel their slick Scandinavian style to a range of clothing, with everything from check shirts to selvedge denim.&lt;/p&gt;\r\n', '', '', ''),
(56, 2, 'Superdry Montana Marled Backpack', '&lt;p&gt;&lt;strong&gt;Backpack by Superdry&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Spacious main with zip around closure&lt;/li&gt;\r\n	&lt;li&gt;Front storage pocket&lt;/li&gt;\r\n	&lt;li&gt;Contrast lined interior and padded back&lt;/li&gt;\r\n	&lt;li&gt;Two interior pockets&lt;/li&gt;\r\n	&lt;li&gt;Adjustable shoulder straps&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT SUPERDRY&lt;/strong&gt;&lt;br /&gt;\r\nFamed for their print t-shirts and innovative washed jeans, Superdry combine Japanese design influences with timeless American style, producing a complete clothing range that captures Superdry''s laid back yet stylish take on casual menswear.&lt;/p&gt;\r\n', '', '', ''),
(58, 2, 'Straw Fedora Hat With Skinny Band', '&lt;p&gt;&lt;strong&gt;Fedora hat by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from straw&lt;/li&gt;\r\n	&lt;li&gt;Pinched grown&lt;/li&gt;\r\n	&lt;li&gt;Grosgrain ribbon trim&lt;/li&gt;\r\n	&lt;li&gt;Wide brim&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(59, 2, 'Warehouse Digital Floral Scarf', '&lt;p&gt;&lt;strong&gt;Scarf by Warehouse&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a lightweight poly fabric&lt;/li&gt;\r\n	&lt;li&gt;Digital floral print&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Square-cut, wraparound style&amp;nbsp;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT WAREHOUSE&lt;/strong&gt;&lt;br /&gt;\r\nDelivering seasonal trends for the high street, &lt;strong&gt;Warehouse&lt;/strong&gt; offer a collection of directional pieces, with vibrant prints and clean cut tailoring channelling the brand''s signature style. Statement party dresses sit alongside classic wardrobe staples, all complemented by a key range of jewellery and accessories, including an exclusive edit of three satchel bags.&lt;/p&gt;\r\n', '', '', ''),
(60, 2, 'High Waist Denim Jeggings in Mid Wash Blue', '&lt;p&gt;&lt;strong&gt;Jeggings by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from from a stretch cotton denim&lt;/li&gt;\r\n	&lt;li&gt;Stretch added for comfort and fit&lt;/li&gt;\r\n	&lt;li&gt;High waisted design&lt;/li&gt;\r\n	&lt;li&gt;Buttoned top with a concealed zip fly&lt;/li&gt;\r\n	&lt;li&gt;Patch pockets to the reverse&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Flattering tube shape&lt;/li&gt;\r\n	&lt;li&gt;Super skinny fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Directional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(61, 2, 'Denim &amp; Supply Super Skinny Jeans', '&lt;p&gt;&lt;strong&gt;Skinny jeans by Denim &amp;amp; Supply by Ralph Lauren&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a cotton rich denim&lt;/li&gt;\r\n	&lt;li&gt;Stretch added for comfort and fit&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Classic five pocket styling&lt;/li&gt;\r\n	&lt;li&gt;Low rise&lt;/li&gt;\r\n	&lt;li&gt;Concealed zip fly&lt;/li&gt;\r\n	&lt;li&gt;Skinny fit&amp;nbsp;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT DENIM &amp;amp; SUPPLY BY RALPH LAUREN&lt;/strong&gt;&lt;br /&gt;\r\nWorking a laidback chic aesthetic, &lt;strong&gt;Denim &amp;amp; Supply by Ralph Lauren&lt;/strong&gt; is the latest denim line from the &lt;strong&gt;Ralph Lauren &lt;/strong&gt;family. Taking inspiration from the artist communities of Brooklyn, New York, Denim &amp;amp; Supply by &lt;strong&gt;Ralph Lauren&lt;/strong&gt; teams soft marl t-shirts, bandana print vests and cable knit jumpers with fade-out denim and distressed skinny jeans, to channel a carefree vintage vibe.&lt;/p&gt;\r\n', '', '', ''),
(62, 2, 'Warehouse Denim Jogger', '&lt;p&gt;&lt;strong&gt;Trousers by Warehouse&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure natural lyocell fabric&lt;/li&gt;\r\n	&lt;li&gt;Easy-care, lightweight, denim-look fabric&lt;/li&gt;\r\n	&lt;li&gt;Regular rise&lt;/li&gt;\r\n	&lt;li&gt;Concealed zip fly fastening&lt;/li&gt;\r\n	&lt;li&gt;Side pockets&lt;/li&gt;\r\n	&lt;li&gt;Fitted cuffs&lt;/li&gt;\r\n	&lt;li&gt;Relaxed fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT WAREHOUSE&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Delivering seasonal trends for the high street, &lt;strong&gt;Warehouse&lt;/strong&gt; offer a collection of directional pieces, with vibrant prints and clean cut tailoring channelling the brand''s signature style. Statement party dresses sit alongside classic wardrobe staples, all complemented by a key range of jewellery and accessories, including an exclusive edit of three satchel bags.&lt;/p&gt;\r\n', '', '', ''),
(63, 2, 'Jameson Low Rise Denim Jeggings ', '&lt;p&gt;&lt;strong&gt;Jeggings by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100%cotton denim&lt;/li&gt;\r\n	&lt;li&gt;Low rise, stretch waist&lt;/li&gt;\r\n	&lt;li&gt;Faux front pockets&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Back patch pockets&lt;/li&gt;\r\n	&lt;li&gt;Skinny fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(51, 1, 'Dr Martens Ali 6-Eye Boots', '&lt;p&gt;&lt;em&gt;Boots &lt;/em&gt;by &lt;strong&gt;Dr Martens&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;100% leather upper&lt;/li&gt;\r\n	&lt;li&gt;Lace up fastening&lt;/li&gt;\r\n	&lt;li&gt;Heel pull tab&lt;/li&gt;\r\n	&lt;li&gt;Chunky grip tread&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT DR MARTENS&lt;/strong&gt;&lt;br /&gt;\r\nSince its creation in the 1960s, the classic &lt;strong&gt;Dr Martens&lt;/strong&gt; eight eyelet boot was once an iconic footwear choice for punks, skinheads and working class rebels the world over. With technical construction that ensures each shoe or boot is durable, resistant and comfortable; &lt;strong&gt;Dr Martens&lt;/strong&gt; have built a reputation on the exceptional quality of their footwear. Today, &lt;strong&gt;Dr Martens&lt;/strong&gt; has retained its trademark designs but added a fresh, contemporary twist with the addition of coloured soles, soft suedes, bright colours and bold prints.&lt;/p&gt;\r\n', '', '', ''),
(86, 2, 'New Look Double Strap Cami', '&lt;p&gt;Top by New Look&lt;br /&gt;\r\n&lt;strong&gt;Made from a premium modal jersey blend&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Super soft smooth touch&lt;/li&gt;\r\n	&lt;li&gt;Scoop neckline&lt;/li&gt;\r\n	&lt;li&gt;Racer cut to the back&lt;/li&gt;\r\n	&lt;li&gt;Curved, split hem&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;ABOUT NEW LOOK&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Offering irresistible fashion and fast off the catwalk styles, &lt;strong&gt;New Look&lt;/strong&gt; joins the &lt;strong&gt;ASOS &lt;/strong&gt;round up of great British high street brands. Bringing forth their award-winning clothing collection of dresses, jeans and jersey basics alongside a punchy edit of accessories. Go glam with skater and bodycon dresses or keep casual with high waisted jeans and biker boots.&lt;/p&gt;\r\n', '', '', ''),
(50, 1, 'Dr Martens Silver Packard Heeled Sandal', '&lt;p&gt;&lt;em&gt;Yasmin&lt;/em&gt; &lt;strong&gt;sandals &lt;/strong&gt;by &lt;strong&gt;Dr Martens&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;100% leather upper&lt;/li&gt;\r\n	&lt;li&gt;Metallic-look finish&lt;/li&gt;\r\n	&lt;li&gt;Silver-tone spiked studs&lt;/li&gt;\r\n	&lt;li&gt;Lace front fastening&lt;/li&gt;\r\n	&lt;li&gt;Cut-out detailing&lt;/li&gt;\r\n	&lt;li&gt;Open toe design&lt;/li&gt;\r\n	&lt;li&gt;Tapered heel&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT DR MARTENS&lt;/strong&gt;&lt;br /&gt;\r\nFrom working class essential to counter-culture icon,&lt;strong&gt; Dr Martens''&lt;/strong&gt; boots and shoes define generations of rebel style. With classic yellow welt stitching and an air cushioned sole, anti-fashion was indentified in eight holes of &lt;strong&gt;Dr Martens''&lt;/strong&gt; leather boot. Look to seasonal updates from Liberty''s prettifying florals, original colour ways and fresh print finishes&lt;/p&gt;\r\n', '', '', ''),
(52, 1, 'Nike Air Max 1', '&lt;p&gt;&lt;strong&gt;Air Max 1 by Nike&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Running silhouette&lt;br /&gt;\r\n- Pure platinum, navy and silver colourway&lt;br /&gt;\r\n- Leather and mesh upper&lt;br /&gt;\r\n- Visible Air Sole unit&lt;br /&gt;\r\n- Rubber outsole with Waffle pattern for traction&lt;br /&gt;\r\n&lt;strong&gt;- Half sizes available in this style&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;About Air Max 1&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;First released in 1987, the &lt;strong&gt;Air Max 1&lt;/strong&gt; was the first shoe to display Nike’s revolutionary Air-Sole unit in the heel, proving seeing was believing with this lightweight and cushioned model. Made from premium materials in a variety of colourways for style and durability the &lt;strong&gt;Air Max 1&lt;/strong&gt; trainer is a classic that continues to evolve.&lt;/p&gt;\r\n', '', '', ''),
(53, 1, 'Nike Air Max Thea', '&lt;p&gt;&lt;strong&gt;The Nike Air Max Thea&lt;/strong&gt; is a new addition to the &lt;strong&gt;Air Max&lt;/strong&gt; family, a hybrid mix of &lt;strong&gt;Air Max&lt;/strong&gt; and the minimalist Roshe Run. This style is featured here in a orange and bright magenta colourway, the upper is a mix of engineered mesh for ultimate breathability and simplistic Hyperfuse panels. This is all sat atop a white EVA midsole with the visible AirSole unit, a perfect twist of comfort and style.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;- Half sizes available in this style&lt;/strong&gt;&lt;/p&gt;\r\n', '', '', ''),
(54, 2, 'Converse All Star Hi Foam Mint Better', '&lt;p&gt;&lt;strong&gt;All Star Hi By Converse&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;The iconic basketball style that transcends age and time, this style features a foam mint better wash colourway with lace up front and classic striped white sole.&lt;/p&gt;\r\n\r\n&lt;p&gt;- Better wash canvas upper&lt;br /&gt;\r\n- Classic rubber toecap and outsole&lt;br /&gt;\r\n- All Star branding on midsole and side&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;About Converse&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Converse, renowned for their hi-top canvas trainers have become true wardrobe staples. Transcending age, gender and time Converse continue to develop the iconic hi-top trainer with exclusive prints and designer collaborations keeping the original Converse DNA at its heart.&lt;/p&gt;\r\n', '', '', ''),
(55, 1, 'Cheap Monday Zip Backpack', '&lt;p&gt;&lt;strong&gt;Backpack by Cheap Monday&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton&lt;/li&gt;\r\n	&lt;li&gt;Zip closure&lt;/li&gt;\r\n	&lt;li&gt;Large main compartment&lt;/li&gt;\r\n	&lt;li&gt;Adjustable shoulder straps&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT CHEAP MONDAY&lt;/strong&gt;&lt;br /&gt;\r\nKnown for their skinny jeans and their characteristic skull logo, Stockholm based label Cheap Monday channel their slick Scandinavian style to a range of clothing, with everything from check shirts to selvedge denim.&lt;/p&gt;\r\n', '', '', ''),
(56, 1, 'Superdry Montana Marled Backpack', '&lt;p&gt;&lt;strong&gt;Backpack by Superdry&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Spacious main with zip around closure&lt;/li&gt;\r\n	&lt;li&gt;Front storage pocket&lt;/li&gt;\r\n	&lt;li&gt;Contrast lined interior and padded back&lt;/li&gt;\r\n	&lt;li&gt;Two interior pockets&lt;/li&gt;\r\n	&lt;li&gt;Adjustable shoulder straps&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT SUPERDRY&lt;/strong&gt;&lt;br /&gt;\r\nFamed for their print t-shirts and innovative washed jeans, Superdry combine Japanese design influences with timeless American style, producing a complete clothing range that captures Superdry''s laid back yet stylish take on casual menswear.&lt;/p&gt;\r\n', '', '', ''),
(87, 2, 'Textured Top With Chiffon Inserts', '&lt;p&gt;&lt;strong&gt;T-shirt by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a waffle texture jersey&lt;/li&gt;\r\n	&lt;li&gt;Boat neckline&lt;/li&gt;\r\n	&lt;li&gt;Chiffon shoulder strips&lt;/li&gt;\r\n	&lt;li&gt;Curved, split hem&lt;/li&gt;\r\n	&lt;li&gt;Zip back fastening&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(58, 1, 'Straw Fedora Hat With Skinny Band', '&lt;p&gt;&lt;strong&gt;Fedora hat by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from straw&lt;/li&gt;\r\n	&lt;li&gt;Pinched grown&lt;/li&gt;\r\n	&lt;li&gt;Grosgrain ribbon trim&lt;/li&gt;\r\n	&lt;li&gt;Wide brim&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(59, 1, 'Warehouse Digital Floral Scarf', '&lt;p&gt;&lt;strong&gt;Scarf by Warehouse&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a lightweight poly fabric&lt;/li&gt;\r\n	&lt;li&gt;Digital floral print&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Square-cut, wraparound style&amp;nbsp;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT WAREHOUSE&lt;/strong&gt;&lt;br /&gt;\r\nDelivering seasonal trends for the high street, &lt;strong&gt;Warehouse&lt;/strong&gt; offer a collection of directional pieces, with vibrant prints and clean cut tailoring channelling the brand''s signature style. Statement party dresses sit alongside classic wardrobe staples, all complemented by a key range of jewellery and accessories, including an exclusive edit of three satchel bags.&lt;/p&gt;\r\n', '', '', ''),
(60, 1, 'High Waist Denim Jeggings in Mid Wash Blue', '&lt;p&gt;&lt;strong&gt;Jeggings by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from from a stretch cotton denim&lt;/li&gt;\r\n	&lt;li&gt;Stretch added for comfort and fit&lt;/li&gt;\r\n	&lt;li&gt;High waisted design&lt;/li&gt;\r\n	&lt;li&gt;Buttoned top with a concealed zip fly&lt;/li&gt;\r\n	&lt;li&gt;Patch pockets to the reverse&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Flattering tube shape&lt;/li&gt;\r\n	&lt;li&gt;Super skinny fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Directional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(61, 1, 'Denim &amp; Supply Super Skinny Jeans', '&lt;p&gt;&lt;strong&gt;Skinny jeans by Denim &amp;amp; Supply by Ralph Lauren&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a cotton rich denim&lt;/li&gt;\r\n	&lt;li&gt;Stretch added for comfort and fit&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Classic five pocket styling&lt;/li&gt;\r\n	&lt;li&gt;Low rise&lt;/li&gt;\r\n	&lt;li&gt;Concealed zip fly&lt;/li&gt;\r\n	&lt;li&gt;Skinny fit&amp;nbsp;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT DENIM &amp;amp; SUPPLY BY RALPH LAUREN&lt;/strong&gt;&lt;br /&gt;\r\nWorking a laidback chic aesthetic, &lt;strong&gt;Denim &amp;amp; Supply by Ralph Lauren&lt;/strong&gt; is the latest denim line from the &lt;strong&gt;Ralph Lauren &lt;/strong&gt;family. Taking inspiration from the artist communities of Brooklyn, New York, Denim &amp;amp; Supply by &lt;strong&gt;Ralph Lauren&lt;/strong&gt; teams soft marl t-shirts, bandana print vests and cable knit jumpers with fade-out denim and distressed skinny jeans, to channel a carefree vintage vibe.&lt;/p&gt;\r\n', '', '', ''),
(62, 1, 'Warehouse Denim Jogger', '&lt;p&gt;&lt;strong&gt;Trousers by Warehouse&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure natural lyocell fabric&lt;/li&gt;\r\n	&lt;li&gt;Easy-care, lightweight, denim-look fabric&lt;/li&gt;\r\n	&lt;li&gt;Regular rise&lt;/li&gt;\r\n	&lt;li&gt;Concealed zip fly fastening&lt;/li&gt;\r\n	&lt;li&gt;Side pockets&lt;/li&gt;\r\n	&lt;li&gt;Fitted cuffs&lt;/li&gt;\r\n	&lt;li&gt;Relaxed fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT WAREHOUSE&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Delivering seasonal trends for the high street, &lt;strong&gt;Warehouse&lt;/strong&gt; offer a collection of directional pieces, with vibrant prints and clean cut tailoring channelling the brand''s signature style. Statement party dresses sit alongside classic wardrobe staples, all complemented by a key range of jewellery and accessories, including an exclusive edit of three satchel bags.&lt;/p&gt;\r\n', '', '', ''),
(63, 1, 'Jameson Low Rise Denim Jeggings ', '&lt;p&gt;&lt;strong&gt;Jeggings by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100%cotton denim&lt;/li&gt;\r\n	&lt;li&gt;Low rise, stretch waist&lt;/li&gt;\r\n	&lt;li&gt;Faux front pockets&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Back patch pockets&lt;/li&gt;\r\n	&lt;li&gt;Skinny fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(64, 1, 'Rivington High Waist Denim Jeggings', '&lt;p&gt;&lt;strong&gt;Jeggings by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from stretch cotton denim&lt;/li&gt;\r\n	&lt;li&gt;Stretch added for comfort and fit&lt;/li&gt;\r\n	&lt;li&gt;Flattering high rise, concealed fly&lt;/li&gt;\r\n	&lt;li&gt;Patch pockets&lt;/li&gt;\r\n	&lt;li&gt;Skinny fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Directional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(65, 1, 'Irish Linen Shirt In Long Sleeve', '&lt;p&gt;&lt;strong&gt;Shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from pure 100% linen&lt;/li&gt;\r\n	&lt;li&gt;Point collar&lt;/li&gt;\r\n	&lt;li&gt;Button fastening&lt;/li&gt;\r\n	&lt;li&gt;Chest pocket&lt;/li&gt;\r\n	&lt;li&gt;Full length sleeves&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.&lt;/p&gt;\r\n', '', '', ''),
(66, 1, 'Nike SB Icon Lizard T-Shirt', '&lt;p&gt;&lt;strong&gt;T-shirt by Nike Skateboarding&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a cotton rich fabric&lt;/li&gt;\r\n	&lt;li&gt;Breathable jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Large print on chest&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT NIKE SKATEBOARDING&lt;/strong&gt;&lt;br /&gt;\r\nBalancing premium style and unmatched innovation, &lt;strong&gt;Nike&lt;/strong&gt; Skateboarding is committed to inspiring and supporting the world of skateboarding. With their own pro skate team lead by their signature athlete Paul Rodriguez, &lt;strong&gt;Nike &lt;/strong&gt;Skateboarding produce a line of trainers and apparel, releasing classic Dunk low skate trainers in refreshed colourways alongside their newest signature styles.&lt;/p&gt;\r\n', '', '', ''),
(67, 1, 'Criminal Damage Longline T-Shirt', '&lt;p&gt;&lt;strong&gt;T-shirt by Criminal Damage&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton blend&lt;/li&gt;\r\n	&lt;li&gt;Contrast hem panel&lt;/li&gt;\r\n	&lt;li&gt;Side zip fastening&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CRIMINAL DAMAGE&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Established in 1991, East London label &lt;strong&gt;Criminal Damage&lt;/strong&gt; put their unique take on streetwear with their own trend-led influences. From the dark and macabre, to the bright and bold &lt;strong&gt;Criminal Damage''s&lt;/strong&gt; designers have fun with all-over prints and loud graphics as well as understated classic designs across a line of t-shirts, hoodies and sweatshirts.&lt;/p&gt;\r\n', '', '', ''),
(68, 1, 'T-Shirt With Yoke Print And Roll Sleeve', '&lt;p&gt;&lt;strong&gt;T-shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure cotton&lt;/li&gt;\r\n	&lt;li&gt;Soft touch jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Print on yoke&lt;/li&gt;\r\n	&lt;li&gt;Rolled sleeve design&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(69, 1, 'Leather Biker Jacket', '&lt;p&gt;&lt;strong&gt;Leather jacket by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a soft leather&lt;/li&gt;\r\n	&lt;li&gt;Classic point collar&lt;/li&gt;\r\n	&lt;li&gt;Zipped front and cuffs&lt;/li&gt;\r\n	&lt;li&gt;Jetted side pockets&lt;/li&gt;\r\n	&lt;li&gt;Waist cinchers to sides&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp;Designed in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(70, 1, 'Long Sleeve T-Shirt With V Neck ', '&lt;p&gt;&lt;strong&gt;T-shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure cotton&lt;/li&gt;\r\n	&lt;li&gt;Soft touch jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Stepped hem&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(71, 1, 'Denim Jacket With Distressed Effect', '&lt;p&gt;Denim jacket by ASOS&lt;br /&gt;\r\nMade from 100% cotton denim&lt;br /&gt;\r\nFour front pockets&lt;br /&gt;\r\nDistressed effect&amp;nbsp;&lt;br /&gt;\r\nRegular fit&lt;br /&gt;\r\nABOUT ASOS BRAND&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, ASOS offer a range of men’s clothing designed and created exclusively for ASOS.&lt;/p&gt;\r\n', '', '', ''),
(72, 2, 'New Look Oxford Shirt with Long Sleeves', '&lt;p&gt;&lt;strong&gt;Shirt by New Look&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton chambray&lt;/li&gt;\r\n	&lt;li&gt;Shirt collar and button fastening&lt;/li&gt;\r\n	&lt;li&gt;Shaped hem&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT NEW LOOK&lt;br /&gt;\r\nNew Look&lt;/strong&gt; joins the &lt;strong&gt;ASOS &lt;/strong&gt;round up of great British high street brands, showcasing the best in upcoming style and staying ahead of the game. From graphic print t-shirts, through to footwear and accessories, &lt;strong&gt;New Look''s&lt;/strong&gt; menswear collection takes influences from classic rebel movies and the best of effortless style.&lt;/p&gt;\r\n', '', '', ''),
(73, 1, 'Twill Shirt In Short Sleeve With', '&lt;p&gt;&lt;strong&gt;Shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure cotton&lt;/li&gt;\r\n	&lt;li&gt;Button down collar&lt;/li&gt;\r\n	&lt;li&gt;Chest patch pocket&lt;/li&gt;\r\n	&lt;li&gt;Hanging hook&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Designed in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(74, 1, 'New Look Polo Shirt in Stripe', '&lt;p&gt;&lt;strong&gt;T-shirt by New Look&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a cotton blend&lt;/li&gt;\r\n	&lt;li&gt;Four button placket&lt;/li&gt;\r\n	&lt;li&gt;Chest patch pocket&lt;/li&gt;\r\n	&lt;li&gt;Striped pattern throughout&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT NEW LOOK&lt;br /&gt;\r\nNew Look&lt;/strong&gt; joins the &lt;strong&gt;ASOS &lt;/strong&gt;round up of great British high street brands, showcasing the best in upcoming style and staying ahead of the game. From graphic print t-shirts, through to footwear and accessories, &lt;strong&gt;New Look''s&lt;/strong&gt; menswear collection takes influences from classic rebel movies and the best of effortless style.&lt;/p&gt;\r\n', '', '', ''),
(75, 1, 'Polo In England Football Colours', '&lt;p&gt;&lt;strong&gt;Polo shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from pure 100% cotton&lt;/li&gt;\r\n	&lt;li&gt;Polo neck&lt;/li&gt;\r\n	&lt;li&gt;Three button placket&lt;/li&gt;\r\n	&lt;li&gt;Short sleeves&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&amp;nbsp;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', '', ''),
(76, 1, 'Long Sleeve Polo With Cut And Sew Panels', '&lt;p&gt;&lt;strong&gt;Polo shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a cotton blend&lt;/li&gt;\r\n	&lt;li&gt;Cut and sew panel detail&lt;/li&gt;\r\n	&lt;li&gt;Polo collar and button placket&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Designed in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(77, 1, 'Polo With Palm Tree Printed Collar &amp; Cuffs', '&lt;p&gt;&lt;strong&gt;Polo shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from pure 100% cotton&lt;/li&gt;\r\n	&lt;li&gt;Printed design on collar and cuffs&lt;/li&gt;\r\n	&lt;li&gt;Side slits for ease of movement&lt;/li&gt;\r\n	&lt;li&gt;Ribbed cuffs to stop stretching&lt;/li&gt;\r\n	&lt;li&gt;Extended tail to prevent shirt coming loose&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Designed in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(79, 1, 'Superdry Polo Shirt With Applique', '&lt;p&gt;&lt;strong&gt;Polo shirt by Superdry&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a breathable cotton pique&lt;/li&gt;\r\n	&lt;li&gt;Two button placket&lt;/li&gt;\r\n	&lt;li&gt;Ribbed armbands&lt;/li&gt;\r\n	&lt;li&gt;Uneven split hem&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT SUPERDRY&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Famed for their print t-shirts and innovative washed jeans,&lt;strong&gt; Superdry&lt;/strong&gt; combine Japanese design influences with timeless American style, producing a complete clothing range that captures &lt;strong&gt;Superdry&lt;/strong&gt;''s laid back yet stylish take on casual menswear.&lt;/p&gt;\r\n', '', '', ''),
(80, 2, 'Jersey Shorts', '&lt;p&gt;&lt;strong&gt;Shorts by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton jersey&lt;/li&gt;\r\n	&lt;li&gt;Adjustable drawcords to waist&lt;/li&gt;\r\n	&lt;li&gt;Side seam pockets&lt;/li&gt;\r\n	&lt;li&gt;Patch pocket to reverse&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(81, 1, 'Chino Shorts In Mid Length', '&lt;p&gt;&lt;strong&gt;Chino shorts&lt;/strong&gt; by &lt;strong&gt;ASOS&lt;/strong&gt;. Constructed in cotton. Featuring a regular waist with a concealed front fly and button closure, side pockets, buttoned welt pockets to the reverse, a cuffed hem and a mid length relaxed fit.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(82, 1, 'Denim Shorts In Super Skinny', '&lt;p&gt;&lt;strong&gt;Denim shorts by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from stretch cotton denim&lt;/li&gt;\r\n	&lt;li&gt;Concealed fly and button closure&lt;/li&gt;\r\n	&lt;li&gt;Five pocket set&lt;/li&gt;\r\n	&lt;li&gt;Super skinny fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(83, 1, 'Selected Shorts In Mesh', '&lt;p&gt;&lt;strong&gt;Shorts by Selected&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a mesh fabric&lt;/li&gt;\r\n	&lt;li&gt;Shirred waistband&lt;/li&gt;\r\n	&lt;li&gt;Side slant pockets&lt;/li&gt;\r\n	&lt;li&gt;Regular rise&lt;/li&gt;\r\n	&lt;li&gt;Loose fit&lt;/li&gt;\r\n	&lt;li&gt;Rounded hem&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT SELECTED&lt;/strong&gt;&lt;br /&gt;\r\nFirst launched in 1997, &lt;strong&gt;Selected &lt;/strong&gt;now has a strong and respected foothold in men''s fashion worldwide with a presence in 25 countries across the globe. Still continuing to stand at the forefront of men''s fashion; &lt;strong&gt;Selected &lt;/strong&gt;specialises in raw and simple designs that are never obviously trend-driven, but always edgy, elegant and masculine with focus on attention to detail.&lt;/p&gt;\r\n', '', '', ''),
(84, 1, 'Penfield Shorts with Palm Flower Print', '&lt;p&gt;&lt;strong&gt;Shorts by Penfield&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton&lt;/li&gt;\r\n	&lt;li&gt;Side slant pockets&lt;/li&gt;\r\n	&lt;li&gt;Flower print pattern&lt;/li&gt;\r\n	&lt;li&gt;Straight fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT PENFIELD&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Designed to withstand the demands of the New England climate, &lt;strong&gt;Penfield &lt;/strong&gt;jackets and accessories place a strong emphasis on quality and style. Established in Massachusetts in 1975 the label have a rich history within the area of outdoor clothing, with fashion, function and durability all playing key roles in &lt;strong&gt;Penfield''s &lt;/strong&gt;aesthetic.&lt;/p&gt;\r\n', '', '', ''),
(85, 1, 'Nike Long Basketball Shorts', '&lt;p&gt;&lt;strong&gt;Shorts by Nike&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from &amp;nbsp;jersey&lt;/li&gt;\r\n	&lt;li&gt;Shirred waist with custom drawcords&lt;/li&gt;\r\n	&lt;li&gt;Side seam pockets&lt;/li&gt;\r\n	&lt;li&gt;Branded logo print&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT NIKE&lt;/strong&gt;&lt;br /&gt;\r\nBack in 1971 Blue Ribbons Sports introduced the concept of the Greek Goddess of Victory - &lt;strong&gt;Nike&lt;/strong&gt;. Founded a year later in 1972, &lt;strong&gt;Nike &lt;/strong&gt;have a long and esteemed history of creating functional yet stylish sportswear, covering everything from retro styles, to forward thinking pieces that use the latest innovations in sports technology.&lt;/p&gt;\r\n', '', '', ''),
(86, 1, 'New Look Double Strap Cami', '&lt;p&gt;Top by New Look&lt;br /&gt;\r\n&lt;strong&gt;Made from a premium modal jersey blend&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Super soft smooth touch&lt;/li&gt;\r\n	&lt;li&gt;Scoop neckline&lt;/li&gt;\r\n	&lt;li&gt;Racer cut to the back&lt;/li&gt;\r\n	&lt;li&gt;Curved, split hem&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;ABOUT NEW LOOK&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Offering irresistible fashion and fast off the catwalk styles, &lt;strong&gt;New Look&lt;/strong&gt; joins the &lt;strong&gt;ASOS &lt;/strong&gt;round up of great British high street brands. Bringing forth their award-winning clothing collection of dresses, jeans and jersey basics alongside a punchy edit of accessories. Go glam with skater and bodycon dresses or keep casual with high waisted jeans and biker boots.&lt;/p&gt;\r\n', '', '', ''),
(87, 1, 'Textured Top With Chiffon Inserts', '&lt;p&gt;&lt;strong&gt;T-shirt by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a waffle texture jersey&lt;/li&gt;\r\n	&lt;li&gt;Boat neckline&lt;/li&gt;\r\n	&lt;li&gt;Chiffon shoulder strips&lt;/li&gt;\r\n	&lt;li&gt;Curved, split hem&lt;/li&gt;\r\n	&lt;li&gt;Zip back fastening&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(88, 1, 'V Neck Contrast Panel Cami', '&lt;p&gt;&lt;strong&gt;Top by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a woven poly fabric&lt;/li&gt;\r\n	&lt;li&gt;V-neckline&lt;/li&gt;\r\n	&lt;li&gt;Contrast trim&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(89, 1, 'Vest with Drop Armhole and keyhole Back', '&lt;p&gt;&lt;strong&gt;Vest by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a woven poly fabric&lt;/li&gt;\r\n	&lt;li&gt;Crew neckline&lt;/li&gt;\r\n	&lt;li&gt;Keyhole cut with button fastening to reverse&lt;/li&gt;\r\n	&lt;li&gt;Cropped cut&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n\r\n&lt;p&gt;This garment is also available in our &lt;strong&gt;ASOS PETITE&lt;/strong&gt; collection.&lt;/p&gt;\r\n', '', '', ''),
(90, 2, 'Pull&amp;Bear T-Shirt with Brooklyn Print', '&lt;p&gt;&lt;strong&gt;T-shirt by Pull&amp;amp;Bear&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton&lt;/li&gt;\r\n	&lt;li&gt;Breathable jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Large print on chest&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT PULL&amp;amp;BEAR&lt;/strong&gt;&lt;br /&gt;\r\nBorn in the ‘90s, &lt;strong&gt;Pull&amp;amp;Bear&lt;/strong&gt; aren’t ones to suffer stereotypes. With a big nod to street style, &lt;strong&gt;Pull&amp;amp;Bear&lt;/strong&gt; opt into a laidback, easy-wearing aesthetic, where age isn’t an obstacle. Sweatshirts, t-shirts and jeans make up their core collection alongside a sharper line of accessories, indigo denim and biker jackets.&lt;/p&gt;\r\n', '', '', ''),
(91, 1, 'Vila Sleeveless Braid Detail Button Blouse', '&lt;p&gt;&lt;strong&gt;Blouse by Vila&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a breathable woven fabric&lt;/li&gt;\r\n	&lt;li&gt;Collarless design&lt;/li&gt;\r\n	&lt;li&gt;Button placket through front&lt;/li&gt;\r\n	&lt;li&gt;Curved, split hem&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT VILA&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp;Seeking inspiration from street and city style, Danish label Vila combine quality fabrics, textures and delicate cuts to create fashion-forward garments. Intricate feminine detailing and fine prints channel the brand''s signature elegant style; with party dresses and cool casuals featuring prominently.&lt;/p&gt;\r\n', '', '', ''),
(92, 1, 'Fitted Shirt', '&lt;p&gt;&lt;strong&gt;Shirt by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure cotton&lt;/li&gt;\r\n	&lt;li&gt;Breathable woven fabric&lt;/li&gt;\r\n	&lt;li&gt;Classic point collar&lt;/li&gt;\r\n	&lt;li&gt;Button down front&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(93, 2, 'Esprit Short Sleeve Henley In Pique', '&lt;p&gt;&lt;strong&gt;T-shirt by Esprit&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from pure 100% cotton&lt;/li&gt;\r\n	&lt;li&gt;Grandad collar with two button placket&lt;/li&gt;\r\n	&lt;li&gt;Short sleeves&lt;/li&gt;\r\n	&lt;li&gt;Chest pocket with button&lt;/li&gt;\r\n	&lt;li&gt;Short sleeves&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ESPRIT&lt;br /&gt;\r\nEsprit &lt;/strong&gt;was founded by Susie and Doug Tompkins from the back of their station wagon in countercultural ''60s San Francisco. From these bohemian beginnings, the label has risen to become an iconic international brand, synonymous with fresh, youthful style. Look to &lt;strong&gt;Esprit''s &lt;/strong&gt;menswear line for a casual and crisply sporty collection of slim-fit cotton chinos alongside collegiate-style blazers, polo shirts and preppy knitwear.&lt;/p&gt;\r\n', '', '', ''),
(94, 1, 'Shirt In Short Sleeve With Dip Dye', '&lt;p&gt;&lt;strong&gt;Short sleeve shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton&lt;/li&gt;\r\n	&lt;li&gt;Chest patch pocket&lt;/li&gt;\r\n	&lt;li&gt;Dip dye pattern&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(95, 1, 'Denim Shirt in Retro Mid Wash', '&lt;p&gt;&lt;strong&gt;Denim shirt by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure cotton&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Retro mid-wash denim&lt;/li&gt;\r\n	&lt;li&gt;Button through fastening&lt;/li&gt;\r\n	&lt;li&gt;Patch chest pocket&lt;/li&gt;\r\n	&lt;li&gt;Curved hemline&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(96, 2, 'Denim Smock Dress with Cap Sleeve in Light Wash', '&lt;p&gt;&lt;strong&gt;Dress by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from pure cotton denim&lt;/li&gt;\r\n	&lt;li&gt;Boat neckline&lt;/li&gt;\r\n	&lt;li&gt;Cap shoulders&lt;/li&gt;\r\n	&lt;li&gt;Loose seam under the bust&lt;/li&gt;\r\n	&lt;li&gt;Relaxed swing shape&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(97, 1, 'Stripe Oversize Shirt', '&lt;p&gt;&lt;strong&gt;Shirt by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% cotton&lt;/li&gt;\r\n	&lt;li&gt;Breathable woven fabric&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Classic point collar&lt;/li&gt;\r\n	&lt;li&gt;Button placket to front&lt;/li&gt;\r\n	&lt;li&gt;Cuffing detail to sleeves&lt;/li&gt;\r\n	&lt;li&gt;Pinstripe pattern&lt;/li&gt;\r\n	&lt;li&gt;Oversize style&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS&lt;/strong&gt; Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(98, 1, 'Rib Collar Tank Top', '&lt;p&gt;&lt;strong&gt;Top by JDY&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a cotton-rich fabric mix&lt;/li&gt;\r\n	&lt;li&gt;Soft touch jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Round neckline with rib collar&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT JDY&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Part of the Only family, &lt;strong&gt;JDY&lt;/strong&gt; put a whole new spin on wardrobe basics. Always hot on the heels of the latest trends, &lt;strong&gt;JDY&lt;/strong&gt; mix and match cool prints and strong colours across a collection of super-soft jersey, low-key sweatshirts and denim jeans.&lt;/p&gt;\r\n', '', '', ''),
(99, 1, 'PETITE Exclusive Rib Crop Top', '&lt;p&gt;&lt;strong&gt;Top exclusive to the ASOS PETITE collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a stretch cotton jersey&lt;/li&gt;\r\n	&lt;li&gt;Ribbed knit throughout&lt;/li&gt;\r\n	&lt;li&gt;Scoop neckline&lt;/li&gt;\r\n	&lt;li&gt;Cropped fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS PETITE&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; ASOS PETITE&lt;/strong&gt; brings forth a trend-led collection specifically designed to fit women of 5’3/1.60m and under. Adapting directional designs, key pieces and best-sellers from our mainline range, the collection also features an exclusive range of styles especially created for our petite customers with carefully considered cuts and shapes. Expect a wide selection of dresses, playsuits, trousers, tops and more, perfectly proportioned for the most flattering fit.&lt;/p&gt;\r\n', '', '', ''),
(100, 1, 'New Look Gathered Waist Skater Dress', '&lt;p&gt;&lt;strong&gt;Skater dress by New Look&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from stretch cotton jersey&lt;/li&gt;\r\n	&lt;li&gt;Breathable soft touch fabric&lt;/li&gt;\r\n	&lt;li&gt;Scoop neckline&lt;/li&gt;\r\n	&lt;li&gt;Fit and flare shape&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT NEW LOOK&lt;/strong&gt;&lt;br /&gt;\r\nOffering irresistible fashion and fast off the catwalk styles,&lt;strong&gt; New Look&lt;/strong&gt; joins the ASOS round up of great British high street brands. Bringing forth their award-winning clothing collection of dresses, jeans and jersey basics alongside a punchy edit of accessories. Go glam with skater and bodycon dresses or keep casual with high waisted jeans and biker boots.&lt;/p&gt;\r\n', '', '', ''),
(101, 2, 'Cropped Boyfriend T-Shirt with Roll Sleeve', '&lt;p&gt;&lt;strong&gt;T-shirt by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure cotton&lt;/li&gt;\r\n	&lt;li&gt;Soft touch jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Crew neckline&lt;/li&gt;\r\n	&lt;li&gt;Rolled sleeves&lt;/li&gt;\r\n	&lt;li&gt;Cropped cut&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(102, 1, 'Minkpink Cottonfields Crochet Top', '&lt;p&gt;&lt;strong&gt;Top by Minkpink&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% cotton&lt;/li&gt;\r\n	&lt;li&gt;Snooped neckline&lt;/li&gt;\r\n	&lt;li&gt;Spaghetti straps&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Cross detail with self-tie on reverse&lt;/li&gt;\r\n	&lt;li&gt;Drawstring at front&lt;/li&gt;\r\n	&lt;li&gt;Cropped cut&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT MINKPINK&lt;/strong&gt;&lt;br /&gt;\r\nRenowned for a laidback, vintage inspired aesthetic; Australian label &lt;strong&gt;Minkpink &lt;/strong&gt;channel a trend-led, directional approach, with an eclectic, rock and roll vibe. Expect a collection of distinctive dresses, unique jersey separates and statement jackets, all with &lt;strong&gt;Minkpink''s &lt;/strong&gt;signature prints and undone cool.&lt;/p&gt;\r\n', '', '', ''),
(103, 1, 'Exclusive Cross Back Body', '&lt;p&gt;&lt;strong&gt;Body exclusive to the ASOS PETITE collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a stretch jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Scoop neckline&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;V-shaped back with wrap styling&lt;/li&gt;\r\n	&lt;li&gt;Cut-out detailing&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS PETITE&lt;br /&gt;\r\nASOS PETITE&lt;/strong&gt; brings forth a trend-led collection specifically designed to fit women of 5’3/1.60m and under. Adapting directional designs, key pieces and best-sellers from our mainline range, the collection also features an exclusive range of styles especially created for our petite customers with carefully considered cuts and shapes. Expect a wide selection of dresses, playsuits, trousers, tops and more, perfectly proportioned for the most flattering fit.&lt;/p&gt;\r\n', '', '', ''),
(104, 1, 'Short Sleeve Hi Lo Peplum Top', '&lt;p&gt;&lt;strong&gt;Top by ASOS PETITE&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a breathable woven fabric&lt;/li&gt;\r\n	&lt;li&gt;Crew neckline&lt;/li&gt;\r\n	&lt;li&gt;Peplum hem&lt;/li&gt;\r\n	&lt;li&gt;Button keyhole back&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS PETITE&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp;ASOS PETITE&lt;/strong&gt; brings forth a trend-led collection specifically designed to fit women of 5’3/1.60m and under. Adapting directional designs, key pieces and best-sellers from our mainline range, the collection also features an exclusive range of styles especially created for our petite customers with carefully considered cuts and shapes. Expect a wide selection of dresses, playsuits, trousers, tops and more, perfectly proportioned for the most flattering fit.&lt;/p&gt;\r\n', '', '', ''),
(105, 1, 'Warehouse Shoulder Pad Shell Top', '&lt;p&gt;&lt;strong&gt;Top by Warehouse&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a breathable lightweight fabric&lt;/li&gt;\r\n	&lt;li&gt;Boat neckline&lt;/li&gt;\r\n	&lt;li&gt;Padded shoulders&lt;/li&gt;\r\n	&lt;li&gt;Zip back detail&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT WAREHOUSE&lt;/strong&gt;&lt;br /&gt;\r\nDelivering seasonal trends for the high street, &lt;strong&gt;Warehouse &lt;/strong&gt;offer a collection of directional pieces, with vibrant prints and clean cut tailoring channelling the brand''s signature style. Statement party dresses sit alongside classic wardrobe staples, all complemented by a key range of jewellery and accessories, including an exclusive edit of three satchel bags.&lt;/p&gt;\r\n', '', '', ''),
(106, 1, 'Top with Dramatic Pleated Ruffle', '&lt;p&gt;&lt;strong&gt;Top by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a sheer mesh fabric&lt;/li&gt;\r\n	&lt;li&gt;Crew neckline&lt;/li&gt;\r\n	&lt;li&gt;Layered ruffle detail&lt;/li&gt;\r\n	&lt;li&gt;Cropped fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(107, 1, 'Smart Shirt In Short Sleeve', '&lt;p&gt;&lt;strong&gt;Smart shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a cotton blend&lt;/li&gt;\r\n	&lt;li&gt;Classic placket&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n	&lt;li&gt;Click here to shop our range of cufflinks.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Designed in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(108, 1, 'Denim Shirt In Short Sleeve', '&lt;p&gt;&lt;strong&gt;Shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton denim&lt;/li&gt;\r\n	&lt;li&gt;Button down collar&lt;/li&gt;\r\n	&lt;li&gt;Pocket detail to chest&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Designed in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(88, 2, 'V Neck Contrast Panel Cami', '&lt;p&gt;&lt;strong&gt;Top by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a woven poly fabric&lt;/li&gt;\r\n	&lt;li&gt;V-neckline&lt;/li&gt;\r\n	&lt;li&gt;Contrast trim&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(89, 2, 'Vest with Drop Armhole and keyhole Back', '&lt;p&gt;&lt;strong&gt;Vest by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a woven poly fabric&lt;/li&gt;\r\n	&lt;li&gt;Crew neckline&lt;/li&gt;\r\n	&lt;li&gt;Keyhole cut with button fastening to reverse&lt;/li&gt;\r\n	&lt;li&gt;Cropped cut&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n\r\n&lt;p&gt;This garment is also available in our &lt;strong&gt;ASOS PETITE&lt;/strong&gt; collection.&lt;/p&gt;\r\n', '', '', ''),
(90, 1, 'Pull&amp;Bear T-Shirt with Brooklyn Print', '&lt;p&gt;&lt;strong&gt;T-shirt by Pull&amp;amp;Bear&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton&lt;/li&gt;\r\n	&lt;li&gt;Breathable jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Large print on chest&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT PULL&amp;amp;BEAR&lt;/strong&gt;&lt;br /&gt;\r\nBorn in the ‘90s, &lt;strong&gt;Pull&amp;amp;Bear&lt;/strong&gt; aren’t ones to suffer stereotypes. With a big nod to street style, &lt;strong&gt;Pull&amp;amp;Bear&lt;/strong&gt; opt into a laidback, easy-wearing aesthetic, where age isn’t an obstacle. Sweatshirts, t-shirts and jeans make up their core collection alongside a sharper line of accessories, indigo denim and biker jackets.&lt;/p&gt;\r\n', '', '', ''),
(91, 2, 'Vila Sleeveless Braid Detail Button Blouse', '&lt;p&gt;&lt;strong&gt;Blouse by Vila&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a breathable woven fabric&lt;/li&gt;\r\n	&lt;li&gt;Collarless design&lt;/li&gt;\r\n	&lt;li&gt;Button placket through front&lt;/li&gt;\r\n	&lt;li&gt;Curved, split hem&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT VILA&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp;Seeking inspiration from street and city style, Danish label Vila combine quality fabrics, textures and delicate cuts to create fashion-forward garments. Intricate feminine detailing and fine prints channel the brand''s signature elegant style; with party dresses and cool casuals featuring prominently.&lt;/p&gt;\r\n', '', '', ''),
(92, 2, 'Fitted Shirt', '&lt;p&gt;&lt;strong&gt;Shirt by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure cotton&lt;/li&gt;\r\n	&lt;li&gt;Breathable woven fabric&lt;/li&gt;\r\n	&lt;li&gt;Classic point collar&lt;/li&gt;\r\n	&lt;li&gt;Button down front&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(93, 1, 'Esprit Short Sleeve Henley In Pique', '&lt;p&gt;&lt;strong&gt;T-shirt by Esprit&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from pure 100% cotton&lt;/li&gt;\r\n	&lt;li&gt;Grandad collar with two button placket&lt;/li&gt;\r\n	&lt;li&gt;Short sleeves&lt;/li&gt;\r\n	&lt;li&gt;Chest pocket with button&lt;/li&gt;\r\n	&lt;li&gt;Short sleeves&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ESPRIT&lt;br /&gt;\r\nEsprit &lt;/strong&gt;was founded by Susie and Doug Tompkins from the back of their station wagon in countercultural ''60s San Francisco. From these bohemian beginnings, the label has risen to become an iconic international brand, synonymous with fresh, youthful style. Look to &lt;strong&gt;Esprit''s &lt;/strong&gt;menswear line for a casual and crisply sporty collection of slim-fit cotton chinos alongside collegiate-style blazers, polo shirts and preppy knitwear.&lt;/p&gt;\r\n', '', '', ''),
(94, 2, 'Shirt In Short Sleeve With Dip Dye', '&lt;p&gt;&lt;strong&gt;Short sleeve shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton&lt;/li&gt;\r\n	&lt;li&gt;Chest patch pocket&lt;/li&gt;\r\n	&lt;li&gt;Dip dye pattern&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\nDesigned in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(95, 2, 'Denim Shirt in Retro Mid Wash', '&lt;p&gt;&lt;strong&gt;Denim shirt by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure cotton&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Retro mid-wash denim&lt;/li&gt;\r\n	&lt;li&gt;Button through fastening&lt;/li&gt;\r\n	&lt;li&gt;Patch chest pocket&lt;/li&gt;\r\n	&lt;li&gt;Curved hemline&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(96, 1, 'Denim Smock Dress with Cap Sleeve in Light Wash', '&lt;p&gt;&lt;strong&gt;Dress by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from pure cotton denim&lt;/li&gt;\r\n	&lt;li&gt;Boat neckline&lt;/li&gt;\r\n	&lt;li&gt;Cap shoulders&lt;/li&gt;\r\n	&lt;li&gt;Loose seam under the bust&lt;/li&gt;\r\n	&lt;li&gt;Relaxed swing shape&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(97, 2, 'Stripe Oversize Shirt', '&lt;p&gt;&lt;strong&gt;Shirt by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% cotton&lt;/li&gt;\r\n	&lt;li&gt;Breathable woven fabric&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Classic point collar&lt;/li&gt;\r\n	&lt;li&gt;Button placket to front&lt;/li&gt;\r\n	&lt;li&gt;Cuffing detail to sleeves&lt;/li&gt;\r\n	&lt;li&gt;Pinstripe pattern&lt;/li&gt;\r\n	&lt;li&gt;Oversize style&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS&lt;/strong&gt; Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(98, 2, 'Rib Collar Tank Top', '&lt;p&gt;&lt;strong&gt;Top by JDY&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a cotton-rich fabric mix&lt;/li&gt;\r\n	&lt;li&gt;Soft touch jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Round neckline with rib collar&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT JDY&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Part of the Only family, &lt;strong&gt;JDY&lt;/strong&gt; put a whole new spin on wardrobe basics. Always hot on the heels of the latest trends, &lt;strong&gt;JDY&lt;/strong&gt; mix and match cool prints and strong colours across a collection of super-soft jersey, low-key sweatshirts and denim jeans.&lt;/p&gt;\r\n', '', '', ''),
(99, 2, 'PETITE Exclusive Rib Crop Top', '&lt;p&gt;&lt;strong&gt;Top exclusive to the ASOS PETITE collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a stretch cotton jersey&lt;/li&gt;\r\n	&lt;li&gt;Ribbed knit throughout&lt;/li&gt;\r\n	&lt;li&gt;Scoop neckline&lt;/li&gt;\r\n	&lt;li&gt;Cropped fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS PETITE&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; ASOS PETITE&lt;/strong&gt; brings forth a trend-led collection specifically designed to fit women of 5’3/1.60m and under. Adapting directional designs, key pieces and best-sellers from our mainline range, the collection also features an exclusive range of styles especially created for our petite customers with carefully considered cuts and shapes. Expect a wide selection of dresses, playsuits, trousers, tops and more, perfectly proportioned for the most flattering fit.&lt;/p&gt;\r\n', '', '', ''),
(100, 2, 'New Look Gathered Waist Skater Dress', '&lt;p&gt;&lt;strong&gt;Skater dress by New Look&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from stretch cotton jersey&lt;/li&gt;\r\n	&lt;li&gt;Breathable soft touch fabric&lt;/li&gt;\r\n	&lt;li&gt;Scoop neckline&lt;/li&gt;\r\n	&lt;li&gt;Fit and flare shape&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT NEW LOOK&lt;/strong&gt;&lt;br /&gt;\r\nOffering irresistible fashion and fast off the catwalk styles,&lt;strong&gt; New Look&lt;/strong&gt; joins the ASOS round up of great British high street brands. Bringing forth their award-winning clothing collection of dresses, jeans and jersey basics alongside a punchy edit of accessories. Go glam with skater and bodycon dresses or keep casual with high waisted jeans and biker boots.&lt;/p&gt;\r\n', '', '', ''),
(101, 1, 'Cropped Boyfriend T-Shirt with Roll Sleeve', '&lt;p&gt;&lt;strong&gt;T-shirt by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% pure cotton&lt;/li&gt;\r\n	&lt;li&gt;Soft touch jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Crew neckline&lt;/li&gt;\r\n	&lt;li&gt;Rolled sleeves&lt;/li&gt;\r\n	&lt;li&gt;Cropped cut&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(102, 2, 'Minkpink Cottonfields Crochet Top', '&lt;p&gt;&lt;strong&gt;Top by Minkpink&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from 100% cotton&lt;/li&gt;\r\n	&lt;li&gt;Snooped neckline&lt;/li&gt;\r\n	&lt;li&gt;Spaghetti straps&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;Cross detail with self-tie on reverse&lt;/li&gt;\r\n	&lt;li&gt;Drawstring at front&lt;/li&gt;\r\n	&lt;li&gt;Cropped cut&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT MINKPINK&lt;/strong&gt;&lt;br /&gt;\r\nRenowned for a laidback, vintage inspired aesthetic; Australian label &lt;strong&gt;Minkpink &lt;/strong&gt;channel a trend-led, directional approach, with an eclectic, rock and roll vibe. Expect a collection of distinctive dresses, unique jersey separates and statement jackets, all with &lt;strong&gt;Minkpink''s &lt;/strong&gt;signature prints and undone cool.&lt;/p&gt;\r\n', '', '', ''),
(103, 2, 'Exclusive Cross Back Body', '&lt;p&gt;&lt;strong&gt;Body exclusive to the ASOS PETITE collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a stretch jersey fabric&lt;/li&gt;\r\n	&lt;li&gt;Scoop neckline&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;V-shaped back with wrap styling&lt;/li&gt;\r\n	&lt;li&gt;Cut-out detailing&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS PETITE&lt;br /&gt;\r\nASOS PETITE&lt;/strong&gt; brings forth a trend-led collection specifically designed to fit women of 5’3/1.60m and under. Adapting directional designs, key pieces and best-sellers from our mainline range, the collection also features an exclusive range of styles especially created for our petite customers with carefully considered cuts and shapes. Expect a wide selection of dresses, playsuits, trousers, tops and more, perfectly proportioned for the most flattering fit.&lt;/p&gt;\r\n', '', '', ''),
(104, 2, 'Short Sleeve Hi Lo Peplum Top', '&lt;p&gt;&lt;strong&gt;Top by ASOS PETITE&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a breathable woven fabric&lt;/li&gt;\r\n	&lt;li&gt;Crew neckline&lt;/li&gt;\r\n	&lt;li&gt;Peplum hem&lt;/li&gt;\r\n	&lt;li&gt;Button keyhole back&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS PETITE&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp;ASOS PETITE&lt;/strong&gt; brings forth a trend-led collection specifically designed to fit women of 5’3/1.60m and under. Adapting directional designs, key pieces and best-sellers from our mainline range, the collection also features an exclusive range of styles especially created for our petite customers with carefully considered cuts and shapes. Expect a wide selection of dresses, playsuits, trousers, tops and more, perfectly proportioned for the most flattering fit.&lt;/p&gt;\r\n', '', '', ''),
(105, 2, 'Warehouse Shoulder Pad Shell Top', '&lt;p&gt;&lt;strong&gt;Top by Warehouse&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a breathable lightweight fabric&lt;/li&gt;\r\n	&lt;li&gt;Boat neckline&lt;/li&gt;\r\n	&lt;li&gt;Padded shoulders&lt;/li&gt;\r\n	&lt;li&gt;Zip back detail&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT WAREHOUSE&lt;/strong&gt;&lt;br /&gt;\r\nDelivering seasonal trends for the high street, &lt;strong&gt;Warehouse &lt;/strong&gt;offer a collection of directional pieces, with vibrant prints and clean cut tailoring channelling the brand''s signature style. Statement party dresses sit alongside classic wardrobe staples, all complemented by a key range of jewellery and accessories, including an exclusive edit of three satchel bags.&lt;/p&gt;\r\n', '', '', ''),
(106, 2, 'Top with Dramatic Pleated Ruffle', '&lt;p&gt;&lt;strong&gt;Top by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a sheer mesh fabric&lt;/li&gt;\r\n	&lt;li&gt;Crew neckline&lt;/li&gt;\r\n	&lt;li&gt;Layered ruffle detail&lt;/li&gt;\r\n	&lt;li&gt;Cropped fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the &lt;strong&gt;ASOS &lt;/strong&gt;Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(107, 2, 'Smart Shirt In Short Sleeve', '&lt;p&gt;&lt;strong&gt;Smart shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a cotton blend&lt;/li&gt;\r\n	&lt;li&gt;Classic placket&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n	&lt;li&gt;Click here to shop our range of cufflinks.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Designed in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(108, 2, 'Denim Shirt In Short Sleeve', '&lt;p&gt;&lt;strong&gt;Shirt by ASOS&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from cotton denim&lt;/li&gt;\r\n	&lt;li&gt;Button down collar&lt;/li&gt;\r\n	&lt;li&gt;Pocket detail to chest&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS BRAND&lt;/strong&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Designed in-house in our London studio by our dedicated menswear team, &lt;strong&gt;ASOS &lt;/strong&gt;offer a range of men’s clothing designed and created exclusively for &lt;strong&gt;ASOS&lt;/strong&gt;.&lt;/p&gt;\r\n', '', '', ''),
(109, 2, 'Top with Origami Pleat Detail and Jersey Back', '&lt;p style=&quot;font-size: 13px;&quot;&gt;&lt;strong&gt;Top by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul style=&quot;font-size: 13px;&quot;&gt;\r\n	&lt;li&gt;Made from a breathable woven fabric&lt;/li&gt;\r\n	&lt;li&gt;Crew neckline&lt;/li&gt;\r\n	&lt;li&gt;Origami pleat detail to front&lt;/li&gt;\r\n	&lt;li&gt;Keyhole button fastening to reverse&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px;&quot;&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', ''),
(109, 1, 'Top with Origami Pleat Detail and Jersey Back', '&lt;p&gt;&lt;strong&gt;Top by ASOS Collection&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Made from a breathable woven fabric&lt;/li&gt;\r\n	&lt;li&gt;Crew neckline&lt;/li&gt;\r\n	&lt;li&gt;Origami pleat detail to front&lt;/li&gt;\r\n	&lt;li&gt;Keyhole button fastening to reverse&lt;/li&gt;\r\n	&lt;li&gt;Regular fit&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;ABOUT ASOS COLLECTION&lt;/strong&gt;&lt;br /&gt;\r\nDirectional, exciting and diverse, the ASOS Collection makes and breaks the fashion rules. Scouring the globe for inspiration, our London based Design Team is inspired by fashion’s most covetable trends; providing you with a cutting edge wardrobe season upon season.&lt;/p&gt;\r\n', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE IF NOT EXISTS `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=447 ;

--
-- Dumping data for table `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(446, 50, 1, 30, 30, '60.0000', '2014-05-29', '2015-04-23');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE IF NOT EXISTS `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE IF NOT EXISTS `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2519 ;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2518, 55, 'data/demo/start/products/870x1110/back-pack-01-a.jpg', 0),
(2502, 109, 'data/demo/start/products/870x1110/image2-03-c.jpg', 0),
(2501, 109, 'data/demo/start/products/870x1110/image2-03-b.jpg', 0),
(2362, 50, 'data/demo/start/products/870x1110/shoes-02-b.jpg', 0),
(2361, 50, 'data/demo/start/products/870x1110/shoes-02-c.jpg', 0),
(2363, 51, 'data/demo/start/products/870x1110/shoes-01-b.jpg', 0),
(2364, 51, 'data/demo/start/products/870x1110/shoes-01-c.jpg', 0),
(2365, 52, 'data/demo/start/products/870x1110/shoes-03-c.jpg', 0),
(2366, 52, 'data/demo/start/products/870x1110/shoes-03-b.jpg', 0),
(2367, 53, 'data/demo/start/products/870x1110/shoes-04-b.jpg', 0),
(2368, 53, 'data/demo/start/products/870x1110/shoes-04-c.jpg', 0),
(2513, 54, 'data/demo/start/products/870x1110/shoes-05-c.jpg', 0),
(2512, 54, 'data/demo/start/products/870x1110/shoes-05-b.jpg', 0),
(2517, 55, 'data/demo/start/products/870x1110/back-pack-01-c.jpg', 0),
(2516, 55, 'data/demo/start/products/870x1110/back-pack-01-b.jpg', 0),
(2373, 56, 'data/demo/start/products/870x1110/back-pack-02-b.jpg', 0),
(2374, 56, 'data/demo/start/products/870x1110/back-pack-02-c.jpg', 0),
(2377, 58, 'data/demo/start/products/870x1110/hat-01-b.jpg', 0),
(2378, 58, 'data/demo/start/products/870x1110/hat-01-c.jpg', 0),
(2379, 59, 'data/demo/start/products/870x1110/hat-02-b.jpg', 0),
(2382, 60, 'data/demo/start/products/870x1110/jean-01-b.jpg', 0),
(2383, 61, 'data/demo/start/products/870x1110/jean-02-b.jpg', 0),
(2384, 61, 'data/demo/start/products/870x1110/jean-02-c.jpg', 0),
(2385, 62, 'data/demo/start/products/870x1110/jean-03-b.jpg', 0),
(2386, 62, 'data/demo/start/products/870x1110/jean-03-c.jpg', 0),
(2387, 63, 'data/demo/start/products/870x1110/jean-04-b.jpg', 0),
(2388, 63, 'data/demo/start/products/870x1110/jean-04-c.jpg', 0),
(2389, 64, 'data/demo/start/products/870x1110/jean-05-b.jpg', 0),
(2390, 64, 'data/demo/start/products/870x1110/jean-05-c.jpg', 0),
(2391, 65, 'data/demo/start/products/870x1110/image1-04-b.jpg', 0),
(2392, 65, 'data/demo/start/products/870x1110/image1-04-c.jpg', 0),
(2393, 66, 'data/demo/start/products/870x1110/image1-06-b.jpg', 0),
(2394, 66, 'data/demo/start/products/870x1110/image1-06-c.jpg', 0),
(2515, 67, 'data/demo/start/products/870x1110/image1-08-b.jpg', 0),
(2514, 67, 'data/demo/start/products/870x1110/image1-08-c.jpg', 0),
(2397, 68, 'data/demo/start/products/870x1110/image1-09-b.jpg', 0),
(2398, 68, 'data/demo/start/products/870x1110/image1-09-c.jpg', 0),
(2406, 69, 'data/demo/start/products/870x1110/image1-03-c.jpg', 0),
(2405, 69, 'data/demo/start/products/870x1110/image1-03-b.jpg', 0),
(2401, 70, 'data/demo/start/products/870x1110/image1-07-b.jpg', 0),
(2402, 70, 'data/demo/start/products/870x1110/image1-07-c.jpg', 0),
(2403, 71, 'data/demo/start/products/870x1110/image1-02-b.jpg', 0),
(2404, 71, 'data/demo/start/products/870x1110/image1-02-c.jpg', 0),
(2509, 72, 'data/demo/start/products/870x1110/image1-01-b.jpg', 0),
(2408, 73, 'data/demo/start/products/870x1110/image1-05-b.jpg', 0),
(2409, 73, 'data/demo/start/products/870x1110/image1-05-c.jpg', 0),
(2410, 74, 'data/demo/start/products/870x1110/image1-10-b.jpg', 0),
(2411, 74, 'data/demo/start/products/870x1110/image1-10-c.jpg', 0),
(2412, 75, 'data/demo/start/products/870x1110/image1-11-b.jpg', 0),
(2413, 75, 'data/demo/start/products/870x1110/image1-11-c.jpg', 0),
(2414, 76, 'data/demo/start/products/870x1110/image1-12-b.jpg', 0),
(2415, 76, 'data/demo/start/products/870x1110/image1-12-c.jpg', 0),
(2416, 77, 'data/demo/start/products/870x1110/image1-13-b.jpg', 0),
(2417, 77, 'data/demo/start/products/870x1110/image1-13-c.jpg', 0),
(2420, 79, 'data/demo/start/products/870x1110/image1-14-b.jpg', 0),
(2421, 79, 'data/demo/start/products/870x1110/image1-14-c.jpg', 0),
(2482, 80, 'data/demo/start/products/870x1110/pants-01-c.jpg', 0),
(2481, 80, 'data/demo/start/products/870x1110/pants-01-b.jpg', 0),
(2424, 81, 'data/demo/start/products/870x1110/pants-02-b.jpg', 0),
(2425, 81, 'data/demo/start/products/870x1110/pants-02-c.jpg', 0),
(2426, 82, 'data/demo/start/products/870x1110/pants-03-b.jpg', 0),
(2427, 82, 'data/demo/start/products/870x1110/pants-03-c.jpg', 0),
(2428, 83, 'data/demo/start/products/870x1110/pants-04-b.jpg', 0),
(2429, 83, 'data/demo/start/products/870x1110/pants-04-c.jpg', 0),
(2430, 84, 'data/demo/start/products/870x1110/pants-05-b.jpg', 0),
(2486, 85, 'data/demo/start/products/870x1110/pants-06-b.jpg', 0),
(2485, 85, 'data/demo/start/products/870x1110/pants-06-c.jpg', 0),
(2433, 86, 'data/demo/start/products/870x1110/image2-02-b.jpg', 0),
(2434, 86, 'data/demo/start/products/870x1110/image2-02-c.jpg', 0),
(2435, 87, 'data/demo/start/products/870x1110/image2-06-b.jpg', 0),
(2436, 87, 'data/demo/start/products/870x1110/image2-06-c.jpg', 0),
(2437, 88, 'data/demo/start/products/870x1110/image2-04-b.jpg', 0),
(2438, 88, 'data/demo/start/products/870x1110/image2-04-c.jpg', 0),
(2506, 89, 'data/demo/start/products/870x1110/image2-05-b.jpg', 0),
(2505, 89, 'data/demo/start/products/870x1110/image2-05-c.jpg', 0),
(2500, 90, 'data/demo/start/products/870x1110/image1-15-c.jpg', 0),
(2499, 90, 'data/demo/start/products/870x1110/image1-15-b.jpg', 0),
(2443, 91, 'data/demo/start/products/870x1110/image2-07-b.jpg', 0),
(2444, 91, 'data/demo/start/products/870x1110/image2-07-c.jpg', 0),
(2445, 92, 'data/demo/start/products/870x1110/image2-08-b.jpg', 0),
(2446, 92, 'data/demo/start/products/870x1110/image2-08-c.jpg', 0),
(2498, 93, 'data/demo/start/products/870x1110/image1-16-c.jpg', 0),
(2497, 93, 'data/demo/start/products/870x1110/image1-16-b.jpg', 0),
(2449, 94, 'data/demo/start/products/870x1110/image1-17-b.jpg', 0),
(2450, 94, 'data/demo/start/products/870x1110/image1-17-c.jpg', 0),
(2451, 95, 'data/demo/start/products/870x1110/image2-09-b.jpg', 0),
(2452, 95, 'data/demo/start/products/870x1110/image2-09-c.jpg', 0),
(2496, 96, 'data/demo/start/products/870x1110/image2-10-c.jpg', 0),
(2495, 96, 'data/demo/start/products/870x1110/image2-10-b.jpg', 0),
(2511, 97, 'data/demo/start/products/870x1110/image2-01-b.jpg', 0),
(2510, 97, 'data/demo/start/products/870x1110/image2-01-c.jpg', 0),
(2457, 98, 'data/demo/start/products/870x1110/image2-11-b.jpg', 0),
(2458, 98, 'data/demo/start/products/870x1110/image2-11-c.jpg', 0),
(2459, 99, 'data/demo/start/products/870x1110/image2-12-b.jpg', 0),
(2460, 99, 'data/demo/start/products/870x1110/image2-12-c.jpg', 0),
(2461, 100, 'data/demo/start/products/870x1110/image2-13-b.jpg', 0),
(2462, 100, 'data/demo/start/products/870x1110/image2-13-c.jpg', 0),
(2494, 101, 'data/demo/start/products/870x1110/image2-14-c.jpg', 0),
(2493, 101, 'data/demo/start/products/870x1110/image2-14-b.jpg', 0),
(2465, 102, 'data/demo/start/products/870x1110/image2-15-b.jpg', 0),
(2466, 102, 'data/demo/start/products/870x1110/image2-15-c.jpg', 0),
(2467, 103, 'data/demo/start/products/870x1110/image2-16-b.jpg', 0),
(2468, 103, 'data/demo/start/products/870x1110/image2-16-c.jpg', 0),
(2469, 104, 'data/demo/start/products/870x1110/image2-17-b.jpg', 0),
(2470, 104, 'data/demo/start/products/870x1110/image2-17-c.jpg', 0),
(2471, 105, 'data/demo/start/products/870x1110/image2-18-b.jpg', 0),
(2472, 105, 'data/demo/start/products/870x1110/image2-18-c.jpg', 0),
(2473, 106, 'data/demo/start/products/870x1110/image2-19-c.jpg', 0),
(2474, 106, 'data/demo/start/products/870x1110/image2-19-a.jpg', 0),
(2475, 107, 'data/demo/start/products/870x1110/image1-18-b.jpg', 0),
(2476, 107, 'data/demo/start/products/870x1110/image1-18-c.jpg', 0),
(2477, 108, 'data/demo/start/products/870x1110/image1-19-b.jpg', 0),
(2478, 108, 'data/demo/start/products/870x1110/image1-19-c.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE IF NOT EXISTS `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=244 ;

--
-- Dumping data for table `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `option_value`, `required`) VALUES
(227, 54, 13, '', 1),
(242, 67, 5, '', 1),
(236, 68, 5, '', 1),
(229, 97, 5, '', 1),
(230, 97, 1, '', 1),
(235, 88, 1, '', 1),
(232, 86, 1, '', 1),
(233, 86, 5, '', 1),
(234, 88, 5, '', 1),
(237, 68, 1, '', 1),
(238, 109, 5, '', 1),
(239, 109, 1, '', 1),
(240, 70, 5, '', 1),
(241, 70, 1, '', 1),
(243, 67, 1, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(32, 233, 86, 5, 56, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(31, 232, 86, 1, 61, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(30, 232, 86, 1, 60, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(25, 230, 97, 1, 32, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(26, 230, 97, 1, 31, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(27, 230, 97, 1, 43, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(23, 229, 97, 5, 39, 10, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(24, 229, 97, 5, 57, 10, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(68, 242, 67, 5, 39, 10, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(67, 242, 67, 5, 55, 9, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(18, 227, 54, 13, 50, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(17, 227, 54, 13, 51, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(19, 227, 54, 13, 49, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(29, 232, 86, 1, 59, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(28, 232, 86, 1, 58, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(33, 233, 86, 5, 39, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(34, 233, 86, 5, 42, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(35, 234, 88, 5, 40, 5, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(36, 234, 88, 5, 55, 5, 1, '4.0000', '+', 0, '+', '0.00000000', '+'),
(37, 234, 88, 5, 39, 5, 1, '3.0000', '+', 0, '+', '0.00000000', '+'),
(38, 235, 88, 1, 32, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(39, 235, 88, 1, 31, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(40, 235, 88, 1, 43, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(41, 235, 88, 1, 58, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(42, 236, 68, 5, 55, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(43, 236, 68, 5, 40, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(44, 236, 68, 5, 41, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(45, 236, 68, 5, 56, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(46, 237, 68, 1, 58, 5, 1, '1.0000', '+', 0, '+', '0.00000000', '+'),
(47, 237, 68, 1, 59, 5, 1, '2.0000', '+', 0, '+', '0.00000000', '+'),
(48, 237, 68, 1, 60, 5, 1, '3.0000', '+', 0, '+', '0.00000000', '+'),
(49, 237, 68, 1, 61, 10, 1, '4.0000', '+', 0, '+', '0.00000000', '+'),
(50, 238, 109, 5, 55, 5, 1, '1.0000', '+', 0, '+', '0.00000000', '+'),
(51, 238, 109, 5, 40, 5, 1, '2.0000', '+', 0, '+', '0.00000000', '+'),
(52, 238, 109, 5, 39, 5, 1, '3.0000', '+', 0, '+', '0.00000000', '+'),
(53, 239, 109, 1, 58, 5, 1, '3.0000', '+', 0, '+', '0.00000000', '+'),
(54, 239, 109, 1, 59, 5, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(55, 239, 109, 1, 60, 5, 1, '1.0000', '+', 0, '+', '0.00000000', '+'),
(56, 239, 109, 1, 61, 5, 1, '2.0000', '+', 0, '+', '0.00000000', '+'),
(57, 239, 109, 1, 62, 5, 1, '7.0000', '+', 0, '+', '0.00000000', '+'),
(58, 239, 109, 1, 63, 5, 1, '2.0000', '+', 0, '+', '0.00000000', '+'),
(59, 240, 70, 5, 55, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(60, 240, 70, 5, 40, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(61, 240, 70, 5, 41, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(62, 240, 70, 5, 56, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(63, 241, 70, 1, 58, 5, 1, '1.0000', '+', 0, '+', '0.00000000', '+'),
(64, 241, 70, 1, 43, 5, 1, '2.0000', '+', 0, '+', '0.00000000', '+'),
(65, 241, 70, 1, 31, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(66, 241, 70, 1, 32, 5, 1, '3.0000', '+', 0, '+', '0.00000000', '+'),
(69, 242, 67, 5, 40, 10, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(70, 243, 67, 1, 32, 10, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(71, 243, 67, 1, 31, 9, 1, '3.0000', '+', 0, '+', '0.00000000', '+'),
(72, 243, 67, 1, 43, 10, 1, '6.0000', '+', 0, '+', '0.00000000', '+');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_profile`
--

CREATE TABLE IF NOT EXISTS `oc_product_profile` (
  `product_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`profile_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE IF NOT EXISTS `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE IF NOT EXISTS `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=634 ;

--
-- Dumping data for table `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(633, 109, 1, 0),
(549, 50, 1, 0),
(550, 51, 1, 0),
(551, 52, 1, 0),
(552, 53, 1, 0),
(628, 54, 1, 0),
(631, 55, 1, 0),
(555, 56, 1, 0),
(557, 58, 1, 0),
(558, 59, 1, 0),
(560, 60, 1, 0),
(561, 61, 1, 0),
(562, 62, 1, 0),
(563, 63, 1, 0),
(564, 64, 1, 0),
(565, 65, 1, 0),
(566, 66, 1, 0),
(629, 67, 1, 0),
(568, 68, 1, 0),
(572, 69, 1, 0),
(570, 70, 1, 0),
(571, 71, 1, 0),
(626, 72, 1, 0),
(574, 73, 1, 0),
(575, 74, 1, 0),
(576, 75, 1, 0),
(577, 76, 1, 0),
(578, 77, 1, 0),
(580, 79, 1, 0),
(612, 80, 1, 0),
(582, 81, 1, 0),
(583, 82, 1, 0),
(584, 83, 1, 0),
(585, 84, 1, 0),
(614, 85, 1, 0),
(587, 86, 1, 0),
(588, 87, 1, 0),
(589, 88, 1, 0),
(624, 89, 1, 0),
(621, 90, 1, 0),
(592, 91, 1, 0),
(593, 92, 1, 0),
(620, 93, 1, 0),
(595, 94, 1, 0),
(596, 95, 1, 0),
(619, 96, 1, 0),
(627, 97, 1, 0),
(599, 98, 1, 0),
(600, 99, 1, 0),
(601, 100, 1, 0),
(618, 101, 1, 0),
(603, 102, 1, 0),
(604, 103, 1, 0),
(605, 104, 1, 0),
(606, 105, 1, 0),
(607, 106, 1, 0),
(608, 107, 1, 0),
(609, 108, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE IF NOT EXISTS `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=454 ;

--
-- Dumping data for table `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(449, 93, 1, 0, '22.0000', '2014-06-01', '2015-01-01'),
(448, 96, 1, 0, '30.0000', '2014-06-01', '2014-11-01'),
(447, 101, 1, 0, '10.0000', '2014-06-01', '2015-01-01'),
(441, 50, 1, 30, '70.5000', '2014-05-29', '2015-08-22'),
(442, 51, 1, 50, '120.5000', '2014-05-29', '2015-09-19'),
(452, 72, 1, 5, '10.0000', '2014-05-22', '2015-06-30'),
(450, 90, 1, 0, '10.0000', '2014-06-01', '2015-02-01'),
(453, 97, 1, 10, '10.0000', '2014-06-16', '2015-04-29');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(50, 89),
(50, 91),
(51, 89),
(51, 91),
(52, 89),
(52, 90),
(53, 89),
(53, 90),
(54, 72),
(54, 75),
(54, 89),
(54, 92),
(55, 67),
(55, 68),
(56, 67),
(56, 68),
(58, 84),
(58, 85),
(59, 84),
(59, 86),
(60, 80),
(60, 81),
(61, 80),
(61, 81),
(62, 80),
(62, 81),
(63, 80),
(63, 81),
(64, 80),
(64, 81),
(65, 59),
(65, 61),
(66, 59),
(66, 60),
(67, 59),
(67, 61),
(68, 59),
(68, 61),
(69, 59),
(69, 62),
(70, 59),
(70, 61),
(71, 59),
(71, 62),
(72, 59),
(72, 60),
(73, 59),
(73, 61),
(74, 59),
(74, 60),
(75, 59),
(75, 60),
(76, 59),
(76, 61),
(77, 59),
(77, 60),
(79, 59),
(79, 60),
(80, 63),
(80, 65),
(81, 63),
(81, 65),
(82, 63),
(82, 65),
(83, 63),
(83, 65),
(84, 63),
(84, 65),
(85, 63),
(85, 65),
(86, 76),
(86, 77),
(87, 76),
(87, 78),
(88, 76),
(88, 77),
(89, 76),
(89, 78),
(90, 59),
(90, 61),
(91, 76),
(91, 77),
(92, 76),
(92, 78),
(93, 59),
(93, 61),
(94, 59),
(94, 61),
(95, 76),
(95, 78),
(96, 76),
(96, 82),
(97, 76),
(97, 77),
(98, 76),
(98, 79),
(99, 76),
(99, 79),
(100, 76),
(100, 82),
(101, 76),
(101, 79),
(102, 76),
(102, 79),
(103, 76),
(103, 78),
(104, 76),
(104, 78),
(105, 76),
(105, 78),
(106, 76),
(106, 82),
(107, 59),
(107, 77),
(108, 61),
(108, 76),
(109, 76),
(109, 77);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_profile`
--

CREATE TABLE IF NOT EXISTS `oc_profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_profile_description`
--

CREATE TABLE IF NOT EXISTS `oc_profile_description` (
  `profile_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`profile_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE IF NOT EXISTS `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE IF NOT EXISTS `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent'),
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE IF NOT EXISTS `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE IF NOT EXISTS `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details'),
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE IF NOT EXISTS `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products'),
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE IF NOT EXISTS `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3221 ;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(2789, 0, 'carousel', 'carousel_module', 'a:2:{i:0;a:9:{s:9:"banner_id";s:1:"8";s:5:"limit";s:1:"5";s:6:"scroll";s:1:"3";s:5:"width";s:3:"200";s:6:"height";s:2:"80";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"3";}i:1;a:9:{s:9:"banner_id";s:1:"9";s:5:"limit";s:1:"5";s:6:"scroll";s:1:"1";s:5:"width";s:3:"105";s:6:"height";s:2:"25";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(2023, 0, 'kuler_filter', 'op', '', 0),
(2024, 0, 'kuler_filter', 'kuler_filter_module', 'a:1:{i:1;a:15:{s:6:"status";s:1:"1";s:10:"show_title";s:1:"1";s:5:"title";a:2:{i:1;s:6:"Filter";i:2;s:6:"Filter";}s:9:"shortcode";s:21:"[kuler_filter filter]";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:8:"category";s:1:"1";s:11:"manufacture";s:1:"1";s:9:"attribute";s:1:"1";s:6:"option";s:1:"1";s:12:"price_filter";s:1:"1";s:9:"price_min";s:1:"0";s:9:"price_max";s:4:"1000";s:8:"currency";s:3:"EUR";s:10:"sort_order";s:1:"2";}}', 1),
(2025, 0, 'latest', 'latest_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"5";s:11:"image_width";s:2:"80";s:12:"image_height";s:2:"80";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(56, 0, 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(57, 0, 'category', 'category_module', 'a:2:{i:0;a:5:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:5:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:5:"count";s:1:"0";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(60, 0, 'account', 'account_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(844, 0, 'banner', 'banner_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:1:"6";s:5:"width";s:3:"182";s:6:"height";s:3:"182";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"3";}}', 1),
(3122, 0, 'config', 'config_google_analytics', '&lt;script&gt;\r\n  (function(i,s,o,g,r,a,m){i[''GoogleAnalyticsObject'']=r;i[r]=i[r]||function(){\r\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\r\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\r\n  })(window,document,''script'',''//www.google-analytics.com/analytics.js'',''ga'');\r\n\r\n  ga(''create'', ''UA-50925759-13'', ''auto'');\r\n  ga(''send'', ''pageview'');\r\n\r\n&lt;/script&gt;\r\n\r\n&lt;!-- Qualaroo for kulerthemes.com --&gt;\r\n&lt;!-- Paste this code right after the &lt;body&gt; tag on every page of your site. --&gt;\r\n&lt;script type=&quot;text/javascript&quot;&gt;\r\n  var _kiq = _kiq || [];\r\n  (function(){\r\n    setTimeout(function(){\r\n    var d = document, f = d.getElementsByTagName(''script'')[0], s = d.createElement(''script''); s.type = ''text/javascript'';\r\n    s.async = true; s.src = ''//s3.amazonaws.com/ki.js/54847/c0_.js''; f.parentNode.insertBefore(s, f);\r\n    }, 1);\r\n  })();\r\n&lt;/script&gt;\r\n', 0),
(3112, 0, 'config', 'config_seo_url', '0', 0),
(3113, 0, 'config', 'config_file_extension_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0),
(3114, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0),
(3115, 0, 'config', 'config_maintenance', '0', 0),
(3116, 0, 'config', 'config_password', '1', 0),
(3117, 0, 'config', 'config_encryption', '7fc29820f6ad27397a96e52f6cd4e156', 0),
(3118, 0, 'config', 'config_compression', '0', 0),
(3119, 0, 'config', 'config_error_display', '1', 0),
(3120, 0, 'config', 'config_error_log', '1', 0),
(3121, 0, 'config', 'config_error_filename', 'error.txt', 0),
(3188, 0, 'kuler_cp', 'skin_id', 'style_2', 0),
(3187, 0, 'kuler_cp', 'theme_id', 'start', 0),
(2896, 0, 'kuler_layer_slider', 'kuler_layer_slider_module', 'a:1:{i:0;a:7:{s:8:"group_id";s:1:"3";s:8:"store_id";s:1:"0";s:11:"language_id";s:1:"0";s:9:"layout_id";s:1:"1";s:8:"position";s:9:"promotion";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(3110, 0, 'config', 'config_shared', '0', 0),
(3111, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(3108, 0, 'config', 'config_fraud_status_id', '7', 0),
(3109, 0, 'config', 'config_secure', '0', 0),
(3107, 0, 'config', 'config_fraud_score', '', 0),
(3106, 0, 'config', 'config_fraud_key', '', 0),
(3104, 0, 'config', 'config_alert_emails', '', 0),
(3195, 0, 'kuler_slides', 'kuler_slides_module', 'a:1:{i:1;a:8:{s:6:"status";s:1:"0";s:10:"show_title";s:1:"0";s:12:"module_title";a:2:{i:1;s:11:"BEST SELLER";i:2;s:11:"BEST SELLER";}s:9:"shortcode";s:26:"[kuler_slides best_seller]";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:10:"sort_order";s:1:"3";s:4:"tabs";a:1:{i:1;a:15:{s:8:"tab_type";s:7:"product";s:11:"category_id";s:2:"61";s:8:"products";s:39:"68,109,67,70,97,88,72,73,108,103,76,102";s:4:"item";s:1:"5";s:5:"limit";s:2:"15";s:11:"image_width";s:3:"270";s:12:"image_height";s:3:"344";s:4:"name";s:1:"0";s:5:"price";s:1:"0";s:6:"rating";s:1:"0";s:11:"description";s:1:"0";s:3:"add";s:1:"0";s:8:"wishlist";s:1:"0";s:7:"compare";s:1:"0";s:17:"description_limit";s:0:"";}}}}', 1),
(1861, 0, 'kuler_accordion', 'kuler_accordion_module', 'a:1:{i:1;a:22:{s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:12:"module_title";a:2:{i:1;s:9:"Accordion";i:2;s:9:"Accordion";}s:9:"shortcode";s:27:"[kuler_accordion accordion]";s:4:"type";s:7:"product";s:11:"category_id";s:2:"63";s:8:"products";s:12:"67,70,108,81";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"content_top";s:10:"sort_order";s:1:"1";s:5:"limit";s:1:"4";s:11:"image_width";s:3:"270";s:12:"image_height";s:3:"350";s:11:"title_limit";s:2:"20";s:4:"name";s:1:"1";s:5:"price";s:1:"1";s:6:"rating";s:1:"1";s:11:"description";s:1:"1";s:16:"description_text";s:0:"";s:3:"add";s:1:"1";s:8:"wishlist";s:1:"1";s:7:"compare";s:1:"1";}}', 1),
(3219, 0, 'kuler_contact_form', 'kuler_contact_form_module', 'a:1:{i:0;a:12:{s:9:"layout_id";s:2:"-1";s:8:"position";s:14:"footer_address";s:10:"sort_order";s:1:"1";s:6:"status";s:1:"1";s:9:"mainTitle";s:12:"CONTACT FORM";s:5:"title";a:1:{s:2:"en";s:12:"CONTACT FORM";}s:6:"active";s:4:"true";s:10:"short_code";s:33:"[kuler_contact_form contact_form]";s:9:"$$hashKey";s:3:"006";s:10:"show_title";s:1:"0";s:23:"show_custom_information";s:1:"1";s:18:"custom_information";a:1:{s:2:"en";s:398:"&lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1656.212338688264!2d151.20974400000003!3d-33.87871499999992!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12ae3d511200d9%3A0x16a18777b88ade3f!2s170+Elizabeth+St!5e0!3m2!1sen!2s!4v1402653619325&quot; width=&quot;350&quot; height=&quot;260&quot; frameborder=&quot;0&quot; style=&quot;border:0&quot;&gt;&lt;/iframe&gt;";}}}', 1),
(3105, 0, 'config', 'config_fraud_detection', '0', 0),
(3103, 0, 'config', 'config_account_mail', '0', 0),
(3102, 0, 'config', 'config_alert_mail', '0', 0),
(3100, 0, 'config', 'config_smtp_port', '25', 0),
(3101, 0, 'config', 'config_smtp_timeout', '5', 0),
(3099, 0, 'config', 'config_smtp_password', '', 0),
(910, 0, 'kbm', 'kbm_settings', 'a:8:{s:4:"home";a:4:{s:11:"description";a:2:{i:1;a:4:{s:9:"blog_name";s:18:"Kuler Blog Manager";s:12:"blog_keyword";s:0:"";s:21:"blog_meta_description";s:0:"";s:21:"blog_home_description";s:0:"";}i:2;a:4:{s:9:"blog_name";s:18:"Kuler Blog Manager";s:12:"blog_keyword";s:0:"";s:21:"blog_meta_description";s:0:"";s:21:"blog_home_description";s:0:"";}}s:10:"show_title";s:1:"1";s:13:"article_order";s:1:"4";s:6:"column";s:1:"1";}s:8:"category";a:6:{s:17:"articles_per_page";s:1:"5";s:18:"article_characters";s:3:"100";s:20:"featured_image_width";s:3:"270";s:21:"featured_image_height";s:3:"270";s:17:"virtual_directory";s:1:"0";s:22:"virtual_directory_name";s:4:"blog";}s:7:"article";a:12:{s:10:"url_suffix";s:5:".html";s:11:"author_name";s:1:"1";s:4:"date";s:1:"1";s:11:"last_update";s:1:"1";s:8:"category";s:2:"on";s:7:"comment";s:2:"on";s:15:"related_article";s:1:"1";s:20:"featured_image_width";s:3:"270";s:21:"featured_image_height";s:3:"270";s:12:"social_media";s:1:"1";s:17:"add_analytic_code";s:0:"";s:20:"add_this_custom_code";s:0:"";}s:7:"comment";a:10:{s:6:"status";s:1:"1";s:16:"comment_per_page";s:1:"6";s:11:"avatar_size";s:2:"60";s:13:"min_character";s:2:"25";s:13:"max_character";s:4:"1500";s:13:"comment_order";s:17:"date_created_desc";s:18:"email_notification";s:0:"";s:7:"captcha";s:1:"3";s:13:"guest_comment";s:1:"1";s:12:"auto_approve";s:1:"0";}s:6:"search";a:6:{s:6:"status";s:1:"1";s:11:"author_name";s:2:"on";s:4:"date";s:2:"on";s:14:"search_display";s:12:"compact_list";s:13:"search_result";s:1:"6";s:14:"result_per_row";s:1:"6";}s:4:"feed";a:2:{s:6:"status";s:1:"0";s:5:"limit";s:3:"500";}s:7:"sitemap";a:2:{s:6:"status";s:1:"0";s:5:"limit";s:4:"1000";}s:5:"admin";a:1:{s:17:"articles_per_page";s:2:"40";}}', 1),
(3098, 0, 'config', 'config_smtp_username', '', 0),
(3097, 0, 'config', 'config_smtp_host', '', 0),
(2022, 0, 'kuler_filter', 'tab', '#tab-module-1', 0),
(3220, 0, 'kuler_tabs', 'kuler_tabs_module', 'a:2:{i:1;a:8:{s:6:"status";s:1:"1";s:10:"show_title";s:1:"0";s:12:"module_title";a:2:{i:1;s:9:"Home Tabs";i:2;s:9:"Home Tabs";}s:9:"shortcode";s:22:"[kuler_tabs home_tabs]";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:10:"sort_order";s:1:"1";s:4:"tabs";a:4:{i:1;a:17:{s:9:"tab_title";a:2:{i:1;s:17:"FEATURED PRODUCTS";i:2;s:17:"FEATURED PRODUCTS";}s:8:"tab_type";s:7:"product";s:11:"category_id";s:2:"76";s:8:"products";s:14:"97,86,89,88,61";s:10:"show_title";s:1:"1";s:6:"status";s:1:"1";s:5:"limit";s:1:"5";s:11:"image_width";s:3:"270";s:12:"image_height";s:3:"344";s:4:"name";s:1:"1";s:5:"price";s:1:"1";s:6:"rating";s:1:"1";s:11:"description";s:1:"0";s:3:"add";s:1:"1";s:8:"wishlist";s:1:"1";s:7:"compare";s:1:"1";s:17:"description_limit";s:0:"";}i:2;a:17:{s:9:"tab_title";a:2:{i:1;s:11:"NEW PRODUCT";i:2;s:11:"NEW PRODUCT";}s:8:"tab_type";s:7:"product";s:11:"category_id";s:2:"67";s:8:"products";s:16:"68,109,67,70,108";s:10:"show_title";s:1:"1";s:6:"status";s:1:"1";s:5:"limit";s:1:"5";s:11:"image_width";s:3:"270";s:12:"image_height";s:3:"350";s:4:"name";s:1:"1";s:5:"price";s:1:"1";s:6:"rating";s:1:"1";s:11:"description";s:1:"0";s:3:"add";s:1:"1";s:8:"wishlist";s:1:"1";s:7:"compare";s:1:"1";s:17:"description_limit";s:0:"";}i:3;a:17:{s:9:"tab_title";a:2:{i:1;s:16:"ANOTHER CATEGORY";i:2;s:16:"ANOTHER CATEGORY";}s:8:"tab_type";s:7:"product";s:11:"category_id";s:2:"67";s:8:"products";s:14:"55,58,56,59,51";s:10:"show_title";s:1:"1";s:6:"status";s:1:"1";s:5:"limit";s:1:"5";s:11:"image_width";s:3:"270";s:12:"image_height";s:3:"350";s:4:"name";s:1:"1";s:5:"price";s:1:"1";s:6:"rating";s:1:"1";s:11:"description";s:1:"0";s:3:"add";s:1:"1";s:8:"wishlist";s:1:"1";s:7:"compare";s:1:"1";s:17:"description_limit";s:0:"";}i:4;a:17:{s:9:"tab_title";a:2:{i:1;s:16:"ANOTHER CATEGORY";i:2;s:16:"ANOTHER CATEGORY";}s:8:"tab_type";s:8:"category";s:11:"category_id";s:2:"67";s:8:"products";s:0:"";s:10:"show_title";s:1:"1";s:6:"status";s:1:"1";s:5:"limit";s:1:"5";s:11:"image_width";s:3:"155";s:12:"image_height";s:3:"155";s:4:"name";s:1:"1";s:5:"price";s:1:"1";s:6:"rating";s:1:"1";s:11:"description";s:1:"1";s:3:"add";s:1:"1";s:8:"wishlist";s:1:"1";s:7:"compare";s:1:"1";s:17:"description_limit";s:0:"";}}}i:2;a:8:{s:6:"status";s:1:"0";s:10:"show_title";s:1:"0";s:12:"module_title";a:2:{i:1;s:10:"SALE ITEMS";i:2;s:10:"SALE ITEMS";}s:9:"shortcode";s:23:"[kuler_tabs sale_items]";s:9:"layout_id";s:2:"-1";s:8:"position";s:11:"content_top";s:10:"sort_order";s:0:"";s:4:"tabs";a:1:{i:1;a:17:{s:9:"tab_title";a:2:{i:1;s:0:"";i:2;s:0:"";}s:8:"tab_type";s:8:"category";s:11:"category_id";s:2:"80";s:8:"products";s:0:"";s:10:"show_title";s:1:"1";s:6:"status";s:1:"1";s:5:"limit";s:1:"3";s:11:"image_width";s:3:"100";s:12:"image_height";s:3:"100";s:4:"name";s:1:"1";s:5:"price";s:1:"1";s:6:"rating";s:1:"0";s:11:"description";s:1:"0";s:3:"add";s:1:"0";s:8:"wishlist";s:1:"0";s:7:"compare";s:1:"0";s:17:"description_limit";s:0:"";}}}}', 1),
(3086, 0, 'config', 'config_image_wishlist_height', '115', 0),
(3096, 0, 'config', 'config_mail_parameter', '', 0),
(3095, 0, 'config', 'config_mail_protocol', 'mail', 0),
(3094, 0, 'config', 'config_ftp_status', '0', 0),
(3093, 0, 'config', 'config_ftp_root', '', 0),
(3092, 0, 'config', 'config_ftp_password', '', 0),
(3091, 0, 'config', 'config_ftp_username', '', 0),
(3090, 0, 'config', 'config_ftp_port', '21', 0),
(3089, 0, 'config', 'config_ftp_host', 'demo.kulerthemes.com', 0),
(3088, 0, 'config', 'config_image_cart_height', '115', 0),
(3087, 0, 'config', 'config_image_cart_width', '90', 0),
(3085, 0, 'config', 'config_image_wishlist_width', '90', 0),
(3084, 0, 'config', 'config_image_compare_height', '115', 0),
(3083, 0, 'config', 'config_image_compare_width', '90', 0),
(3082, 0, 'config', 'config_image_related_height', '344', 0),
(3081, 0, 'config', 'config_image_related_width', '270', 0),
(3080, 0, 'config', 'config_image_additional_height', '94', 0),
(3078, 0, 'config', 'config_image_product_height', '344', 0),
(3079, 0, 'config', 'config_image_additional_width', '74', 0),
(3077, 0, 'config', 'config_image_product_width', '270', 0),
(3186, 0, 'kbm_mod_recent_article', 'kbm_mod_recent_article_module', 'a:2:{i:0;a:12:{s:6:"status";s:1:"1";s:10:"show_title";s:1:"1";s:5:"title";a:2:{i:1;s:13:"FROM THE BLOG";i:2;s:13:"FROM THE BLOG";}s:9:"layout_id";s:2:"12";s:8:"position";s:11:"column_left";s:10:"sort_order";s:1:"2";s:22:"product_featured_image";s:1:"1";s:19:"product_description";s:1:"0";s:13:"article_limit";s:1:"5";s:17:"description_limit";s:3:"100";s:20:"featured_image_width";s:3:"100";s:21:"featured_image_height";s:3:"100";}i:2;a:12:{s:6:"status";s:1:"1";s:10:"show_title";s:1:"1";s:5:"title";a:2:{i:1;s:15:"Recent Articles";i:2;s:15:"Recent Articles";}s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:10:"sort_order";s:1:"2";s:22:"product_featured_image";s:1:"1";s:19:"product_description";s:1:"1";s:13:"article_limit";s:1:"4";s:17:"description_limit";s:3:"100";s:20:"featured_image_width";s:3:"170";s:21:"featured_image_height";s:3:"126";}}', 1),
(3076, 0, 'config', 'config_image_popup_height', '1110', 0),
(3074, 0, 'config', 'config_image_thumb_height', '638', 0),
(3217, 0, 'kuler_advanced_html', 'kuler_advanced_html_widgets', 'a:0:{}', 1),
(3216, 0, 'kuler_advanced_html', 'kuler_advanced_html_module', 'a:1:{i:0;a:24:{s:6:"status";s:1:"1";s:9:"showtitle";s:1:"0";s:5:"title";a:2:{i:1;s:12:"Top banner 2";i:2;s:12:"Top banner 2";}s:11:"module_type";s:8:"standard";s:15:"widget_position";s:4:"left";s:11:"widget_type";s:4:"html";s:11:"widget_icon";s:0:"";s:17:"widget_icon_color";s:0:"";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:10:"sort_order";s:1:"1";s:11:"description";a:2:{i:1;s:1027:"&lt;div class=&quot;container banners2&quot;&gt;\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col-md-8&quot;&gt;\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col-md-12&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://bling.local/image/data/baby1.png&quot; style=&quot;width: 738px; height: 236px; float: left;&quot; /&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col-md-6&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://bling.local/image/data/baby-2.png&quot; style=&quot;width: 363px; height: 237px;&quot; /&gt;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;col-md-6&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://bling.local/image/data/Baby-3.png&quot; style=&quot;width: 357px; height: 237px;&quot; /&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;col-md-4&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://bling.local/image/data/baby4.png&quot; style=&quot;width: 363px; height: 483px;&quot; /&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n";i:2;s:114:"&lt;ul&gt;\r\n	&lt;li&gt;+1.3333.9999&lt;/li&gt;\r\n	&lt;li&gt;Free Ship On Order Over $2000&lt;/li&gt;\r\n&lt;/ul&gt;\r\n";}s:7:"product";s:0:"";s:4:"name";s:1:"1";s:5:"price";s:1:"1";s:6:"rating";s:1:"1";s:19:"product_description";s:1:"1";s:3:"add";s:1:"1";s:8:"wishlist";s:1:"1";s:7:"compare";s:1:"1";s:11:"image_width";s:2:"80";s:12:"image_height";s:2:"80";s:16:"description_text";s:3:"100";s:12:"module_index";i:1;}}', 1),
(3166, 0, 'kuler_testimonial', 'kuler_testimonial_module', 'a:1:{i:0;a:15:{s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:10:"sort_order";s:1:"1";s:10:"show_title";s:1:"1";s:6:"status";s:1:"1";s:9:"auto_play";s:1:"1";s:4:"mode";s:10:"horizontal";s:21:"testimonials_per_view";s:1:"1";s:12:"testimonials";a:1:{i:0;a:6:{s:6:"active";s:4:"true";s:9:"$$hashKey";s:3:"013";s:11:"writer_name";a:1:{s:2:"en";s:8:"JANE DOE";}s:12:"writer_image";s:0:"";s:23:"testimonial_information";a:1:{s:2:"en";s:0:"";}s:11:"testimonial";a:1:{s:2:"en";s:274:"&lt;span style=&quot;color:#FFFFFF;&quot;&gt;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters&lt;/span&gt;";}}}s:9:"mainTitle";s:22:"WHAT OUR CUSTOMERS SAY";s:5:"title";a:2:{s:2:"en";s:22:"WHAT OUR CUSTOMERS SAY";s:2:"ar";s:22:"WHAT OUR CUSTOMERS SAY";}s:6:"active";s:4:"true";s:10:"short_code";s:42:"[kuler_testimonial what_our_customers_say]";s:9:"$$hashKey";s:3:"007";s:9:"css_class";s:20:"parallax_testimonial";}}', 1),
(3075, 0, 'config', 'config_image_popup_width', '870', 0),
(3072, 0, 'config', 'config_image_category_height', '300', 0),
(3073, 0, 'config', 'config_image_thumb_width', '500', 0),
(3071, 0, 'config', 'config_image_category_width', '870', 0),
(3070, 0, 'config', 'config_icon', 'data/cart.png', 0),
(3069, 0, 'config', 'config_logo', 'data/logo.png', 0),
(3068, 0, 'config', 'config_return_status_id', '2', 0),
(3067, 0, 'config', 'config_return_id', '0', 0),
(3066, 0, 'config', 'config_commission', '5', 0),
(3065, 0, 'config', 'config_affiliate_id', '4', 0),
(3064, 0, 'config', 'config_stock_status_id', '5', 0),
(3063, 0, 'config', 'config_stock_checkout', '0', 0),
(3062, 0, 'config', 'config_stock_warning', '0', 0),
(3061, 0, 'config', 'config_stock_display', '0', 0),
(3060, 0, 'config', 'config_complete_status_id', '5', 0),
(3059, 0, 'config', 'config_order_status_id', '1', 0),
(3058, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(3057, 0, 'config', 'config_order_edit', '100', 0),
(3056, 0, 'config', 'config_checkout_id', '5', 0),
(3055, 0, 'config', 'config_guest_checkout', '1', 0),
(3054, 0, 'config', 'config_cart_weight', '1', 0),
(3053, 0, 'config', 'config_account_id', '3', 0),
(3052, 0, 'config', 'config_customer_price', '0', 0),
(2913, 0, 'kuler_demo_builder', 'kuler_demo_builder', 'a:1:{s:10:"quickstart";a:3:{s:14:"excluded_items";s:263:"config.php\nadmin/config.php\nquickstart.zip\nadmin/controller/module/kuler_demo_builder.php\nadmin/language/english/module/kuler_demo_builder.php\nadmin/model/kuler/demo_builder.php\nadmin/view/kuler/js/demo_builder.js\nadmin/view/template/module/kuler_demo_builder.tpl";s:13:"mapping_items";s:65:"config-dist.php=config.php\nadmin/config-dist.php=admin/config.php";s:18:"image_placeholders";s:23:"yfsdfsdfsdf=yfsdfsdfsdf";}}', 1),
(3050, 0, 'config', 'config_customer_group_id', '1', 0),
(3051, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(3049, 0, 'config', 'config_customer_online', '0', 0),
(3041, 0, 'config', 'config_review_status', '1', 0),
(3130, 0, 'kuler_menu', 'kuler_menu_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"-1";s:8:"position";s:4:"menu";s:10:"sort_order";s:1:"1";s:6:"status";s:1:"1";}}', 1),
(3129, 0, 'kuler_menu', 'kuler_menu', 'a:5:{i:0;a:16:{s:6:"status";s:1:"1";s:5:"title";a:1:{i:1;s:4:"SHOP";}s:10:"sort_order";s:1:"2";s:4:"type";s:8:"category";s:16:"enable_hyperlink";s:1:"0";s:4:"link";s:0:"";s:7:"new_tab";s:1:"1";s:5:"image";s:1:"1";s:14:"image_position";s:10:"float-left";s:11:"description";s:1:"1";s:19:"show_sub_categories";s:1:"1";s:16:"description_text";s:3:"100";s:20:"category_image_width";s:2:"90";s:21:"category_image_height";s:2:"90";s:21:"max_subcategory_items";s:1:"3";s:10:"categories";a:8:{i:0;a:2:{s:11:"category_id";s:2:"59";s:4:"name";s:13:"MEN’S SHIRT";}i:1;a:2:{s:11:"category_id";s:2:"63";s:4:"name";s:13:"MEN’S PANTS";}i:2;a:2:{s:11:"category_id";s:2:"67";s:4:"name";s:19:"MEN’S ACCESSORIES";}i:3;a:2:{s:11:"category_id";s:2:"72";s:4:"name";s:13:"MEN’S SHOES";}i:4;a:2:{s:11:"category_id";s:2:"76";s:4:"name";s:13:"WOMEN’S TOP";}i:5;a:2:{s:11:"category_id";s:2:"80";s:4:"name";s:16:"WOMEN’S BOTTOM";}i:6;a:2:{s:11:"category_id";s:2:"84";s:4:"name";s:21:"WOMEN’S ACCESSORIES";}i:7;a:2:{s:11:"category_id";s:2:"89";s:4:"name";s:15:"WOMEN’S SHOES";}}}i:1;a:8:{s:6:"status";s:1:"1";s:5:"title";a:1:{i:1;s:11:"BOW BUILDER";}s:10:"sort_order";s:1:"3";s:4:"type";s:4:"html";s:16:"enable_hyperlink";s:1:"0";s:4:"link";s:0:"";s:7:"new_tab";s:1:"1";s:5:"htmls";a:1:{i:1;s:1011:"&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col-md-6&quot;&gt;\r\n&lt;style type=&quot;text/css&quot;&gt;.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; height: auto; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }\r\n&lt;/style&gt;\r\n&lt;div class=&quot;embed-container&quot;&gt;&lt;iframe allowfullscreen=&quot;&quot; frameborder=&quot;0&quot; mozallowfullscreen=&quot;&quot; src=&quot;http://player.vimeo.com/video/26017275&quot; webkitallowfullscreen=&quot;&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;col-md-6&quot;&gt;\r\n&lt;div class=&quot;embed-container&quot;&gt;&lt;iframe allowfullscreen=&quot;&quot; frameborder=&quot;0&quot; mozallowfullscreen=&quot;&quot; src=&quot;http://player.vimeo.com/video/51094481&quot; webkitallowfullscreen=&quot;&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n";}}i:2;a:8:{s:6:"status";s:1:"1";s:5:"title";a:1:{i:1;s:22:"SALES &amp; DISCOUNTED";}s:10:"sort_order";s:1:"4";s:4:"type";s:6:"custom";s:16:"enable_hyperlink";s:1:"1";s:4:"link";s:44:"http://www.kulerthemes.com/theme/start-theme";s:7:"new_tab";s:1:"0";s:11:"sub_new_tab";s:1:"0";}i:3;a:9:{s:6:"status";s:1:"1";s:5:"title";a:1:{i:1;s:8:"ABOUT US";}s:10:"sort_order";s:1:"5";s:4:"type";s:6:"custom";s:16:"enable_hyperlink";s:1:"0";s:4:"link";s:0:"";s:7:"new_tab";s:1:"1";s:11:"sub_new_tab";s:1:"0";s:5:"links";a:6:{i:0;a:2:{s:6:"titles";a:1:{i:1;s:19:"Easy to get started";}s:4:"link";s:92:"http://demo.kulerthemes.com/start/1/index.php?route=module/kbm/article&amp;kbm_article_id=17";}i:1;a:2:{s:6:"titles";a:1:{i:1;s:10:"11 Modules";}s:4:"link";s:107:"http://demo.kulerthemes.com/start/1/index.php?route=module/kbm/article&amp;kbm_path=4&amp;kbm_article_id=18";}i:2;a:2:{s:6:"titles";a:1:{i:1;s:17:"One-page checkout";}s:4:"link";s:107:"http://demo.kulerthemes.com/start/1/index.php?route=module/kbm/article&amp;kbm_path=4&amp;kbm_article_id=19";}i:3;a:2:{s:6:"titles";a:1:{i:1;s:25:"Light style customization";}s:4:"link";s:214:"http://demo.kulerthemes.com/start/1/index.php?route=module/kbm/article&amp;kbm_path=4&amp;kbm_article_id=20http://demo.kulerthemes.com/start/1/index.php?route=module/kbm/article&amp;kbm_path=4&amp;kbm_article_id=20";}i:4;a:2:{s:6:"titles";a:1:{i:1;s:22:"Powerful control panel";}s:4:"link";s:107:"http://demo.kulerthemes.com/start/1/index.php?route=module/kbm/article&amp;kbm_path=4&amp;kbm_article_id=21";}i:5;a:2:{s:6:"titles";a:1:{i:1;s:10:"Responsive";}s:4:"link";s:107:"http://demo.kulerthemes.com/start/1/index.php?route=module/kbm/article&amp;kbm_path=4&amp;kbm_article_id=22";}}}i:4;a:15:{s:6:"status";s:1:"1";s:5:"title";a:1:{i:1;s:7:"CONNECT";}s:10:"sort_order";s:1:"6";s:4:"type";s:8:"category";s:16:"enable_hyperlink";s:1:"0";s:4:"link";s:0:"";s:7:"new_tab";s:1:"1";s:5:"image";s:1:"1";s:14:"image_position";s:10:"float-left";s:11:"description";s:1:"1";s:19:"show_sub_categories";s:1:"1";s:16:"description_text";s:3:"100";s:20:"category_image_width";s:2:"80";s:21:"category_image_height";s:2:"80";s:21:"max_subcategory_items";s:0:"";}}', 1),
(3042, 0, 'config', 'config_download', '1', 0),
(3043, 0, 'config', 'config_voucher_min', '1', 0),
(3044, 0, 'config', 'config_voucher_max', '1000', 0),
(3045, 0, 'config', 'config_tax', '1', 0),
(3046, 0, 'config', 'config_vat', '0', 0),
(3047, 0, 'config', 'config_tax_default', 'shipping', 0),
(3048, 0, 'config', 'config_tax_customer', 'shipping', 0),
(3040, 0, 'config', 'config_product_count', '1', 0),
(3039, 0, 'config', 'config_admin_limit', '20', 0),
(3038, 0, 'config', 'config_catalog_limit', '15', 0),
(3037, 0, 'config', 'config_weight_class_id', '1', 0),
(3036, 0, 'config', 'config_length_class_id', '1', 0),
(3020, 0, 'config', 'config_name', 'Start OpenCart Theme', 0),
(3021, 0, 'config', 'config_owner', 'KulerThemes', 0),
(3022, 0, 'config', 'config_address', '198  West 21th Street, Suite 721\r\nNew York, NY 10010\r\nEmail: youremail@yourdomain.com\r\nFax: +88 (0) 202 0000 001', 0),
(3023, 0, 'config', 'config_email', 'celso@lamrock.com', 0),
(3024, 0, 'config', 'config_telephone', '+88 (0) 101 0000 000', 0),
(3025, 0, 'config', 'config_fax', '', 0),
(3026, 0, 'config', 'config_title', 'Start', 0),
(3027, 0, 'config', 'config_meta_description', 'KulerThemes', 0),
(3028, 0, 'config', 'config_template', 'start', 0),
(3029, 0, 'config', 'config_layout_id', '4', 0),
(3030, 0, 'config', 'config_country_id', '222', 0),
(3031, 0, 'config', 'config_zone_id', '3563', 0),
(3032, 0, 'config', 'config_language', 'en', 0),
(3033, 0, 'config', 'config_admin_language', 'en', 0),
(3034, 0, 'config', 'config_currency', 'USD', 0),
(3035, 0, 'config', 'config_currency_auto', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE IF NOT EXISTS `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2 - 3 Days'),
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2 - 3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE IF NOT EXISTS `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed Stuff', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (17.5%)', '17.5000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_url_alias`
--

CREATE TABLE IF NOT EXISTS `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=773 ;

--
-- Dumping data for table `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(730, 'manufacturer_id=8', 'apple'),
(772, 'information_id=4', 'about_us'),
(767, 'category_id=34', 'mp3-players'),
(536, 'category_id=36', 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE IF NOT EXISTS `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '565276aacd36b4941af25520db2f125badd56835', '227d8d67e', '', '', 'celso@lamrock.com', '', '127.0.0.1', 1, '2014-10-07 00:18:58'),
(2, 10, 'demo', '2e9f21b2a8851079de2455d42f5161e28aac25d8', '66445279e', 'Demo', 'Demo', 'support@kulerthemes.com', '', '1.64.44.146', 1, '2014-06-09 03:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Top Administrator', 'a:2:{s:6:"access";a:160:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:15:"catalog/profile";i:10;s:14:"catalog/review";i:11;s:18:"common/filemanager";i:12;s:13:"design/banner";i:13;s:19:"design/custom_field";i:14;s:13:"design/layout";i:15;s:14:"extension/feed";i:16;s:17:"extension/manager";i:17;s:16:"extension/module";i:18;s:17:"extension/openbay";i:19;s:17:"extension/payment";i:20;s:18:"extension/shipping";i:21;s:15:"extension/total";i:22;s:16:"feed/google_base";i:23;s:19:"feed/google_sitemap";i:24;s:20:"localisation/country";i:25;s:21:"localisation/currency";i:26;s:21:"localisation/geo_zone";i:27;s:21:"localisation/language";i:28;s:25:"localisation/length_class";i:29;s:25:"localisation/order_status";i:30;s:26:"localisation/return_action";i:31;s:26:"localisation/return_reason";i:32;s:26:"localisation/return_status";i:33;s:25:"localisation/stock_status";i:34;s:22:"localisation/tax_class";i:35;s:21:"localisation/tax_rate";i:36;s:25:"localisation/weight_class";i:37;s:17:"localisation/zone";i:38;s:14:"module/account";i:39;s:16:"module/affiliate";i:40;s:29:"module/amazon_checkout_layout";i:41;s:13:"module/banner";i:42;s:17:"module/bestseller";i:43;s:15:"module/carousel";i:44;s:15:"module/category";i:45;s:18:"module/ebaydisplay";i:46;s:15:"module/featured";i:47;s:13:"module/filter";i:48;s:18:"module/google_talk";i:49;s:18:"module/information";i:50;s:13:"module/latest";i:51;s:17:"module/openbaypro";i:52;s:16:"module/pp_layout";i:53;s:16:"module/slideshow";i:54;s:14:"module/special";i:55;s:12:"module/store";i:56;s:14:"module/welcome";i:57;s:14:"openbay/amazon";i:58;s:22:"openbay/amazon_listing";i:59;s:22:"openbay/amazon_product";i:60;s:16:"openbay/amazonus";i:61;s:24:"openbay/amazonus_listing";i:62;s:24:"openbay/amazonus_product";i:63;s:20:"openbay/ebay_profile";i:64;s:21:"openbay/ebay_template";i:65;s:15:"openbay/openbay";i:66;s:23:"payment/amazon_checkout";i:67;s:24:"payment/authorizenet_aim";i:68;s:21:"payment/bank_transfer";i:69;s:14:"payment/cheque";i:70;s:11:"payment/cod";i:71;s:21:"payment/free_checkout";i:72;s:22:"payment/klarna_account";i:73;s:22:"payment/klarna_invoice";i:74;s:14:"payment/liqpay";i:75;s:20:"payment/moneybookers";i:76;s:14:"payment/nochex";i:77;s:15:"payment/paymate";i:78;s:16:"payment/paypoint";i:79;s:13:"payment/payza";i:80;s:26:"payment/perpetual_payments";i:81;s:18:"payment/pp_express";i:82;s:25:"payment/pp_payflow_iframe";i:83;s:14:"payment/pp_pro";i:84;s:21:"payment/pp_pro_iframe";i:85;s:17:"payment/pp_pro_pf";i:86;s:17:"payment/pp_pro_uk";i:87;s:19:"payment/pp_standard";i:88;s:15:"payment/sagepay";i:89;s:22:"payment/sagepay_direct";i:90;s:18:"payment/sagepay_us";i:91;s:19:"payment/twocheckout";i:92;s:28:"payment/web_payment_software";i:93;s:16:"payment/worldpay";i:94;s:27:"report/affiliate_commission";i:95;s:22:"report/customer_credit";i:96;s:22:"report/customer_online";i:97;s:21:"report/customer_order";i:98;s:22:"report/customer_reward";i:99;s:24:"report/product_purchased";i:100;s:21:"report/product_viewed";i:101;s:18:"report/sale_coupon";i:102;s:17:"report/sale_order";i:103;s:18:"report/sale_return";i:104;s:20:"report/sale_shipping";i:105;s:15:"report/sale_tax";i:106;s:14:"sale/affiliate";i:107;s:12:"sale/contact";i:108;s:11:"sale/coupon";i:109;s:13:"sale/customer";i:110;s:20:"sale/customer_ban_ip";i:111;s:19:"sale/customer_group";i:112;s:10:"sale/order";i:113;s:14:"sale/recurring";i:114;s:11:"sale/return";i:115;s:12:"sale/voucher";i:116;s:18:"sale/voucher_theme";i:117;s:15:"setting/setting";i:118;s:13:"setting/store";i:119;s:16:"shipping/auspost";i:120;s:17:"shipping/citylink";i:121;s:14:"shipping/fedex";i:122;s:13:"shipping/flat";i:123;s:13:"shipping/free";i:124;s:13:"shipping/item";i:125;s:23:"shipping/parcelforce_48";i:126;s:15:"shipping/pickup";i:127;s:19:"shipping/royal_mail";i:128;s:12:"shipping/ups";i:129;s:13:"shipping/usps";i:130;s:15:"shipping/weight";i:131;s:11:"tool/backup";i:132;s:14:"tool/error_log";i:133;s:12:"total/coupon";i:134;s:12:"total/credit";i:135;s:14:"total/handling";i:136;s:16:"total/klarna_fee";i:137;s:19:"total/low_order_fee";i:138;s:12:"total/reward";i:139;s:14:"total/shipping";i:140;s:15:"total/sub_total";i:141;s:9:"total/tax";i:142;s:11:"total/total";i:143;s:13:"total/voucher";i:144;s:9:"user/user";i:145;s:20:"user/user_permission";i:146;s:15:"module/kuler_cp";i:147;s:25:"module/kuler_contact_form";i:148;s:26:"module/kuler_advanced_html";i:149;s:25:"module/kuler_layer_slider";i:150;s:17:"module/kuler_tabs";i:151;s:19:"module/kuler_slides";i:152;s:17:"module/kuler_menu";i:153;s:10:"module/kbm";i:154;s:29:"module/kbm_mod_recent_article";i:155;s:22:"module/kuler_accordion";i:156;s:13:"module/latest";i:157;s:19:"module/kuler_filter";i:158;s:24:"module/kuler_testimonial";i:159;s:25:"module/kuler_demo_builder";}s:6:"modify";a:160:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:15:"catalog/profile";i:10;s:14:"catalog/review";i:11;s:18:"common/filemanager";i:12;s:13:"design/banner";i:13;s:19:"design/custom_field";i:14;s:13:"design/layout";i:15;s:14:"extension/feed";i:16;s:17:"extension/manager";i:17;s:16:"extension/module";i:18;s:17:"extension/openbay";i:19;s:17:"extension/payment";i:20;s:18:"extension/shipping";i:21;s:15:"extension/total";i:22;s:16:"feed/google_base";i:23;s:19:"feed/google_sitemap";i:24;s:20:"localisation/country";i:25;s:21:"localisation/currency";i:26;s:21:"localisation/geo_zone";i:27;s:21:"localisation/language";i:28;s:25:"localisation/length_class";i:29;s:25:"localisation/order_status";i:30;s:26:"localisation/return_action";i:31;s:26:"localisation/return_reason";i:32;s:26:"localisation/return_status";i:33;s:25:"localisation/stock_status";i:34;s:22:"localisation/tax_class";i:35;s:21:"localisation/tax_rate";i:36;s:25:"localisation/weight_class";i:37;s:17:"localisation/zone";i:38;s:14:"module/account";i:39;s:16:"module/affiliate";i:40;s:29:"module/amazon_checkout_layout";i:41;s:13:"module/banner";i:42;s:17:"module/bestseller";i:43;s:15:"module/carousel";i:44;s:15:"module/category";i:45;s:18:"module/ebaydisplay";i:46;s:15:"module/featured";i:47;s:13:"module/filter";i:48;s:18:"module/google_talk";i:49;s:18:"module/information";i:50;s:13:"module/latest";i:51;s:17:"module/openbaypro";i:52;s:16:"module/pp_layout";i:53;s:16:"module/slideshow";i:54;s:14:"module/special";i:55;s:12:"module/store";i:56;s:14:"module/welcome";i:57;s:14:"openbay/amazon";i:58;s:22:"openbay/amazon_listing";i:59;s:22:"openbay/amazon_product";i:60;s:16:"openbay/amazonus";i:61;s:24:"openbay/amazonus_listing";i:62;s:24:"openbay/amazonus_product";i:63;s:20:"openbay/ebay_profile";i:64;s:21:"openbay/ebay_template";i:65;s:15:"openbay/openbay";i:66;s:23:"payment/amazon_checkout";i:67;s:24:"payment/authorizenet_aim";i:68;s:21:"payment/bank_transfer";i:69;s:14:"payment/cheque";i:70;s:11:"payment/cod";i:71;s:21:"payment/free_checkout";i:72;s:22:"payment/klarna_account";i:73;s:22:"payment/klarna_invoice";i:74;s:14:"payment/liqpay";i:75;s:20:"payment/moneybookers";i:76;s:14:"payment/nochex";i:77;s:15:"payment/paymate";i:78;s:16:"payment/paypoint";i:79;s:13:"payment/payza";i:80;s:26:"payment/perpetual_payments";i:81;s:18:"payment/pp_express";i:82;s:25:"payment/pp_payflow_iframe";i:83;s:14:"payment/pp_pro";i:84;s:21:"payment/pp_pro_iframe";i:85;s:17:"payment/pp_pro_pf";i:86;s:17:"payment/pp_pro_uk";i:87;s:19:"payment/pp_standard";i:88;s:15:"payment/sagepay";i:89;s:22:"payment/sagepay_direct";i:90;s:18:"payment/sagepay_us";i:91;s:19:"payment/twocheckout";i:92;s:28:"payment/web_payment_software";i:93;s:16:"payment/worldpay";i:94;s:27:"report/affiliate_commission";i:95;s:22:"report/customer_credit";i:96;s:22:"report/customer_online";i:97;s:21:"report/customer_order";i:98;s:22:"report/customer_reward";i:99;s:24:"report/product_purchased";i:100;s:21:"report/product_viewed";i:101;s:18:"report/sale_coupon";i:102;s:17:"report/sale_order";i:103;s:18:"report/sale_return";i:104;s:20:"report/sale_shipping";i:105;s:15:"report/sale_tax";i:106;s:14:"sale/affiliate";i:107;s:12:"sale/contact";i:108;s:11:"sale/coupon";i:109;s:13:"sale/customer";i:110;s:20:"sale/customer_ban_ip";i:111;s:19:"sale/customer_group";i:112;s:10:"sale/order";i:113;s:14:"sale/recurring";i:114;s:11:"sale/return";i:115;s:12:"sale/voucher";i:116;s:18:"sale/voucher_theme";i:117;s:15:"setting/setting";i:118;s:13:"setting/store";i:119;s:16:"shipping/auspost";i:120;s:17:"shipping/citylink";i:121;s:14:"shipping/fedex";i:122;s:13:"shipping/flat";i:123;s:13:"shipping/free";i:124;s:13:"shipping/item";i:125;s:23:"shipping/parcelforce_48";i:126;s:15:"shipping/pickup";i:127;s:19:"shipping/royal_mail";i:128;s:12:"shipping/ups";i:129;s:13:"shipping/usps";i:130;s:15:"shipping/weight";i:131;s:11:"tool/backup";i:132;s:14:"tool/error_log";i:133;s:12:"total/coupon";i:134;s:12:"total/credit";i:135;s:14:"total/handling";i:136;s:16:"total/klarna_fee";i:137;s:19:"total/low_order_fee";i:138;s:12:"total/reward";i:139;s:14:"total/shipping";i:140;s:15:"total/sub_total";i:141;s:9:"total/tax";i:142;s:11:"total/total";i:143;s:13:"total/voucher";i:144;s:9:"user/user";i:145;s:20:"user/user_permission";i:146;s:15:"module/kuler_cp";i:147;s:25:"module/kuler_contact_form";i:148;s:26:"module/kuler_advanced_html";i:149;s:25:"module/kuler_layer_slider";i:150;s:17:"module/kuler_tabs";i:151;s:19:"module/kuler_slides";i:152;s:17:"module/kuler_menu";i:153;s:10:"module/kbm";i:154;s:29:"module/kbm_mod_recent_article";i:155;s:22:"module/kuler_accordion";i:156;s:13:"module/latest";i:157;s:19:"module/kuler_filter";i:158;s:24:"module/kuler_testimonial";i:159;s:25:"module/kuler_demo_builder";}}'),
(10, 'Demonstration', 'a:1:{s:6:"access";a:163:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:15:"catalog/profile";i:10;s:14:"catalog/review";i:11;s:18:"common/filemanager";i:12;s:13:"design/banner";i:13;s:19:"design/custom_field";i:14;s:13:"design/layout";i:15;s:14:"extension/feed";i:16;s:17:"extension/manager";i:17;s:16:"extension/module";i:18;s:17:"extension/openbay";i:19;s:17:"extension/payment";i:20;s:18:"extension/shipping";i:21;s:15:"extension/total";i:22;s:16:"feed/google_base";i:23;s:19:"feed/google_sitemap";i:24;s:20:"localisation/country";i:25;s:21:"localisation/currency";i:26;s:21:"localisation/geo_zone";i:27;s:21:"localisation/language";i:28;s:25:"localisation/length_class";i:29;s:25:"localisation/order_status";i:30;s:26:"localisation/return_action";i:31;s:26:"localisation/return_reason";i:32;s:26:"localisation/return_status";i:33;s:25:"localisation/stock_status";i:34;s:22:"localisation/tax_class";i:35;s:21:"localisation/tax_rate";i:36;s:25:"localisation/weight_class";i:37;s:17:"localisation/zone";i:38;s:14:"module/account";i:39;s:16:"module/affiliate";i:40;s:29:"module/amazon_checkout_layout";i:41;s:13:"module/banner";i:42;s:17:"module/bestseller";i:43;s:15:"module/carousel";i:44;s:15:"module/category";i:45;s:18:"module/ebaydisplay";i:46;s:15:"module/featured";i:47;s:13:"module/filter";i:48;s:18:"module/google_talk";i:49;s:18:"module/information";i:50;s:10:"module/kbm";i:51;s:22:"module/kbm_mod_archive";i:52;s:26:"module/kbm_mod_article_tag";i:53;s:23:"module/kbm_mod_category";i:54;s:29:"module/kbm_mod_latest_comment";i:55;s:30:"module/kbm_mod_popular_article";i:56;s:29:"module/kbm_mod_recent_article";i:57;s:22:"module/kuler_accordion";i:58;s:26:"module/kuler_advanced_html";i:59;s:25:"module/kuler_contact_form";i:60;s:15:"module/kuler_cp";i:61;s:19:"module/kuler_filter";i:62;s:25:"module/kuler_layer_slider";i:63;s:17:"module/kuler_menu";i:64;s:19:"module/kuler_slides";i:65;s:17:"module/kuler_tabs";i:66;s:24:"module/kuler_testimonial";i:67;s:13:"module/latest";i:68;s:17:"module/openbaypro";i:69;s:16:"module/pp_layout";i:70;s:16:"module/slideshow";i:71;s:14:"module/special";i:72;s:12:"module/store";i:73;s:14:"module/welcome";i:74;s:14:"openbay/amazon";i:75;s:22:"openbay/amazon_listing";i:76;s:22:"openbay/amazon_product";i:77;s:16:"openbay/amazonus";i:78;s:24:"openbay/amazonus_listing";i:79;s:24:"openbay/amazonus_product";i:80;s:20:"openbay/ebay_profile";i:81;s:21:"openbay/ebay_template";i:82;s:15:"openbay/openbay";i:83;s:23:"payment/amazon_checkout";i:84;s:24:"payment/authorizenet_aim";i:85;s:21:"payment/bank_transfer";i:86;s:14:"payment/cheque";i:87;s:11:"payment/cod";i:88;s:21:"payment/free_checkout";i:89;s:22:"payment/klarna_account";i:90;s:22:"payment/klarna_invoice";i:91;s:14:"payment/liqpay";i:92;s:20:"payment/moneybookers";i:93;s:14:"payment/nochex";i:94;s:15:"payment/paymate";i:95;s:16:"payment/paypoint";i:96;s:13:"payment/payza";i:97;s:26:"payment/perpetual_payments";i:98;s:18:"payment/pp_express";i:99;s:25:"payment/pp_payflow_iframe";i:100;s:14:"payment/pp_pro";i:101;s:21:"payment/pp_pro_iframe";i:102;s:17:"payment/pp_pro_pf";i:103;s:17:"payment/pp_pro_uk";i:104;s:19:"payment/pp_standard";i:105;s:15:"payment/sagepay";i:106;s:22:"payment/sagepay_direct";i:107;s:18:"payment/sagepay_us";i:108;s:19:"payment/twocheckout";i:109;s:28:"payment/web_payment_software";i:110;s:16:"payment/worldpay";i:111;s:27:"report/affiliate_commission";i:112;s:22:"report/customer_credit";i:113;s:22:"report/customer_online";i:114;s:21:"report/customer_order";i:115;s:22:"report/customer_reward";i:116;s:24:"report/product_purchased";i:117;s:21:"report/product_viewed";i:118;s:18:"report/sale_coupon";i:119;s:17:"report/sale_order";i:120;s:18:"report/sale_return";i:121;s:20:"report/sale_shipping";i:122;s:15:"report/sale_tax";i:123;s:14:"sale/affiliate";i:124;s:12:"sale/contact";i:125;s:11:"sale/coupon";i:126;s:13:"sale/customer";i:127;s:20:"sale/customer_ban_ip";i:128;s:19:"sale/customer_group";i:129;s:10:"sale/order";i:130;s:14:"sale/recurring";i:131;s:11:"sale/return";i:132;s:12:"sale/voucher";i:133;s:18:"sale/voucher_theme";i:134;s:15:"setting/setting";i:135;s:13:"setting/store";i:136;s:16:"shipping/auspost";i:137;s:17:"shipping/citylink";i:138;s:14:"shipping/fedex";i:139;s:13:"shipping/flat";i:140;s:13:"shipping/free";i:141;s:13:"shipping/item";i:142;s:23:"shipping/parcelforce_48";i:143;s:15:"shipping/pickup";i:144;s:19:"shipping/royal_mail";i:145;s:12:"shipping/ups";i:146;s:13:"shipping/usps";i:147;s:15:"shipping/weight";i:148;s:11:"tool/backup";i:149;s:14:"tool/error_log";i:150;s:12:"total/coupon";i:151;s:12:"total/credit";i:152;s:14:"total/handling";i:153;s:16:"total/klarna_fee";i:154;s:19:"total/low_order_fee";i:155;s:12:"total/reward";i:156;s:14:"total/shipping";i:157;s:15:"total/sub_total";i:158;s:9:"total/tax";i:159;s:11:"total/total";i:160;s:13:"total/voucher";i:161;s:9:"user/user";i:162;s:20:"user/user_permission";}}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_voucher`
--

INSERT INTO `oc_voucher` (`voucher_id`, `order_id`, `code`, `from_name`, `from_email`, `to_name`, `to_email`, `voucher_theme_id`, `message`, `amount`, `status`, `date_added`) VALUES
(1, 9, '13a8993750', 'dfghfg fghfdg', 'fhgfd@dfssdf.com', 'ddd', 'kalle@kalle.se', 6, 'ddddd', '32.9641', 1, '2014-08-28 02:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'data/demo/canon_eos_5d_2.jpg'),
(7, 'data/demo/gift-voucher-birthday.jpg'),
(6, 'data/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General'),
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(1, 2, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g'),
(5, 2, 'Pound ', 'lb'),
(6, 2, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4033 ;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Hi', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chi', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovar-Bilogora', 'BB', 1),
(848, 53, 'City of Zagreb', 'CZ', 1),
(849, 53, 'Dubrovnik-Neretva', 'DN', 1),
(850, 53, 'Istra', 'IS', 1),
(851, 53, 'Karlovac', 'KA', 1),
(852, 53, 'Koprivnica-Krizevci', 'KK', 1),
(853, 53, 'Krapina-Zagorje', 'KZ', 1),
(854, 53, 'Lika-Senj', 'LS', 1),
(855, 53, 'Medimurje', 'ME', 1),
(856, 53, 'Osijek-Baranja', 'OB', 1),
(857, 53, 'Pozega-Slavonia', 'PS', 1),
(858, 53, 'Primorje-Gorski Kotar', 'PG', 1),
(859, 53, 'Sibenik', 'SI', 1),
(860, 53, 'Sisak-Moslavina', 'SM', 1),
(861, 53, 'Slavonski Brod-Posavina', 'SB', 1),
(862, 53, 'Split-Dalmatia', 'SD', 1),
(863, 53, 'Varazdin', 'VA', 1),
(864, 53, 'Virovitica-Podravina', 'VP', 1),
(865, 53, 'Vukovar-Srijem', 'VS', 1),
(866, 53, 'Zadar-Knin', 'ZK', 1),
(867, 53, 'Zagreb', 'ZA', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan Laani', 'AL', 1),
(1086, 72, 'Etela-Suomen Laani', 'ES', 1),
(1087, 72, 'Ita-Suomen Laani', 'IS', 1),
(1088, 72, 'Lansi-Suomen Laani', 'LS', 1),
(1089, 72, 'Lapin Lanani', 'LA', 1),
(1090, 72, 'Oulun Laani', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1428, 97, 'Bacs-Kiskun', 'BK', 1),
(1429, 97, 'Baranya', 'BA', 1),
(1430, 97, 'Bekes', 'BE', 1),
(1431, 97, 'Bekescsaba', 'BS', 1),
(1432, 97, 'Borsod-Abauj-Zemplen', 'BZ', 1),
(1433, 97, 'Budapest', 'BU', 1),
(1434, 97, 'Csongrad', 'CS', 1),
(1435, 97, 'Debrecen', 'DE', 1),
(1436, 97, 'Dunaujvaros', 'DU', 1),
(1437, 97, 'Eger', 'EG', 1),
(1438, 97, 'Fejer', 'FE', 1),
(1439, 97, 'Gyor', 'GY', 1),
(1440, 97, 'Gyor-Moson-Sopron', 'GM', 1),
(1441, 97, 'Hajdu-Bihar', 'HB', 1),
(1442, 97, 'Heves', 'HE', 1),
(1443, 97, 'Hodmezovasarhely', 'HO', 1),
(1444, 97, 'Jasz-Nagykun-Szolnok', 'JN', 1),
(1445, 97, 'Kaposvar', 'KA', 1),
(1446, 97, 'Kecskemet', 'KE', 1),
(1447, 97, 'Komarom-Esztergom', 'KO', 1),
(1448, 97, 'Miskolc', 'MI', 1),
(1449, 97, 'Nagykanizsa', 'NA', 1),
(1450, 97, 'Nograd', 'NO', 1),
(1451, 97, 'Nyiregyhaza', 'NY', 1),
(1452, 97, 'Pecs', 'PE', 1),
(1453, 97, 'Pest', 'PS', 1),
(1454, 97, 'Somogy', 'SO', 1),
(1455, 97, 'Sopron', 'SP', 1),
(1456, 97, 'Szabolcs-Szatmar-Bereg', 'SS', 1),
(1457, 97, 'Szeged', 'SZ', 1),
(1458, 97, 'Szekesfehervar', 'SE', 1),
(1459, 97, 'Szolnok', 'SL', 1),
(1460, 97, 'Szombathely', 'SM', 1),
(1461, 97, 'Tatabanya', 'TA', 1),
(1462, 97, 'Tolna', 'TO', 1),
(1463, 97, 'Vas', 'VA', 1),
(1464, 97, 'Veszprem', 'VE', 1),
(1465, 97, 'Zala', 'ZA', 1),
(1466, 97, 'Zalaegerszeg', 'ZZ', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Pondicherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1819, 117, 'Aizkraukles Rajons', 'AIZ', 1),
(1820, 117, 'Aluksnes Rajons', 'ALU', 1),
(1821, 117, 'Balvu Rajons', 'BAL', 1),
(1822, 117, 'Bauskas Rajons', 'BAU', 1),
(1823, 117, 'Cesu Rajons', 'CES', 1),
(1824, 117, 'Daugavpils Rajons', 'DGR', 1),
(1825, 117, 'Dobeles Rajons', 'DOB', 1),
(1826, 117, 'Gulbenes Rajons', 'GUL', 1),
(1827, 117, 'Jekabpils Rajons', 'JEK', 1),
(1828, 117, 'Jelgavas Rajons', 'JGR', 1),
(1829, 117, 'Kraslavas Rajons', 'KRA', 1),
(1830, 117, 'Kuldigas Rajons', 'KUL', 1),
(1831, 117, 'Liepajas Rajons', 'LPR', 1),
(1832, 117, 'Limbazu Rajons', 'LIM', 1),
(1833, 117, 'Ludzas Rajons', 'LUD', 1),
(1834, 117, 'Madonas Rajons', 'MAD', 1),
(1835, 117, 'Ogres Rajons', 'OGR', 1),
(1836, 117, 'Preilu Rajons', 'PRE', 1),
(1837, 117, 'Rezeknes Rajons', 'RZR', 1),
(1838, 117, 'Rigas Rajons', 'RGR', 1),
(1839, 117, 'Saldus Rajons', 'SAL', 1),
(1840, 117, 'Talsu Rajons', 'TAL', 1),
(1841, 117, 'Tukuma Rajons', 'TUK', 1),
(1842, 117, 'Valkas Rajons', 'VLK', 1),
(1843, 117, 'Valmieras Rajons', 'VLM', 1),
(1844, 117, 'Ventspils Rajons', 'VSR', 1),
(1845, 117, 'Daugavpils', 'DGV', 1),
(1846, 117, 'Jelgava', 'JGV', 1),
(1847, 117, 'Jurmala', 'JUR', 1),
(1848, 117, 'Liepaja', 'LPK', 1),
(1849, 117, 'Rezekne', 'RZK', 1),
(1850, 117, 'Riga', 'RGA', 1),
(1851, 117, 'Ventspils', 'VSL', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'JO', 1),
(1972, 129, 'Kedah', 'KE', 1),
(1973, 129, 'Kelantan', 'KL', 1),
(1974, 129, 'Labuan', 'LA', 1),
(1975, 129, 'Melaka', 'ME', 1),
(1976, 129, 'Negeri Sembilan', 'NS', 1),
(1977, 129, 'Pahang', 'PA', 1),
(1978, 129, 'Perak', 'PE', 1),
(1979, 129, 'Perlis', 'PR', 1),
(1980, 129, 'Pulau Pinang', 'PP', 1),
(1981, 129, 'Sabah', 'SA', 1),
(1982, 129, 'Sarawak', 'SR', 1),
(1983, 129, 'Selangor', 'SE', 1),
(1984, 129, 'Terengganu', 'TE', 1),
(1985, 129, 'Wilayah Persekutuan', 'WP', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3031, 197, 'Ascension', 'A', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3033, 197, 'Tristan da Cunha', 'T', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakir', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkasy', 'CK', 1),
(3481, 220, 'Chernihiv', 'CH', 1),
(3482, 220, 'Chernivtsi', 'CV', 1),
(3483, 220, 'Crimea', 'CR', 1),
(3484, 220, 'Dnipropetrovs''k', 'DN', 1),
(3485, 220, 'Donets''k', 'DO', 1),
(3486, 220, 'Ivano-Frankivs''k', 'IV', 1),
(3487, 220, 'Kharkiv Kherson', 'KL', 1),
(3488, 220, 'Khmel''nyts''kyy', 'KM', 1),
(3489, 220, 'Kirovohrad', 'KR', 1),
(3490, 220, 'Kiev', 'KV', 1),
(3491, 220, 'Kyyiv', 'KY', 1),
(3492, 220, 'Luhans''k', 'LU', 1),
(3493, 220, 'L''viv', 'LV', 1),
(3494, 220, 'Mykolayiv', 'MY', 1),
(3495, 220, 'Odesa', 'OD', 1),
(3496, 220, 'Poltava', 'PO', 1),
(3497, 220, 'Rivne', 'RI', 1),
(3498, 220, 'Sevastopol', 'SE', 1),
(3499, 220, 'Sumy', 'SU', 1),
(3500, 220, 'Ternopil''', 'TE', 1),
(3501, 220, 'Vinnytsya', 'VI', 1),
(3502, 220, 'Volyn''', 'VO', 1),
(3503, 220, 'Zakarpattya', 'ZK', 1),
(3504, 220, 'Zaporizhzhya', 'ZA', 1),
(3505, 220, 'Zhytomyr', 'ZH', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubayy', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3972, 222, 'Isle of Man', 'IOM', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4019, 243, 'Kosovo', 'KM', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(57, 222, 0, 3, '2010-02-26 22:33:24', '0000-00-00 00:00:00'),
(65, 222, 0, 4, '2010-12-15 15:18:13', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
