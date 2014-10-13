-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 13, 2014 at 06:28 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rumbler`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`comment_id` int(30) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=131 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `content`, `created_at`) VALUES
(1, 1, 2, 'Bajingan Lu!', '2014-10-08 00:00:00'),
(2, 1, 1, 'jgn kasar donk', '2014-10-08 00:00:00'),
(3, 1, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(4, 1, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(5, 1, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(6, 2, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(7, 2, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(8, 2, 5, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(9, 2, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(10, 2, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(11, 3, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(12, 3, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(13, 3, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(14, 3, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(15, 3, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(16, 4, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(17, 4, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(18, 4, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(19, 4, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(20, 4, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(21, 5, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(22, 5, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(23, 5, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(24, 5, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(25, 5, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(26, 6, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(27, 6, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(28, 6, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(29, 6, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(30, 6, 5, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(31, 7, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(32, 7, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(33, 7, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(34, 7, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(35, 7, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(36, 8, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(37, 8, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(38, 8, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(39, 8, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(40, 8, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(41, 9, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(42, 9, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(43, 9, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(44, 9, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(45, 9, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(46, 10, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(47, 10, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(48, 10, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(49, 10, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(50, 10, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(51, 11, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(52, 11, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(53, 11, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(54, 11, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(55, 11, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(56, 12, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(57, 12, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(58, 12, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(59, 12, 5, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(60, 12, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(61, 13, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(62, 13, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(63, 13, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(64, 13, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(65, 13, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(71, 14, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(72, 14, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(73, 14, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(74, 14, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(75, 14, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(76, 15, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(77, 15, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(78, 15, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(79, 15, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(80, 15, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(81, 16, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(82, 16, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(83, 16, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(84, 16, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(85, 16, 5, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(86, 17, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(87, 17, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(88, 17, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(89, 17, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(90, 17, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(91, 18, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(92, 18, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(93, 18, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(94, 18, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(95, 18, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(96, 19, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(97, 19, 5, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(98, 19, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(99, 19, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(100, 19, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(101, 20, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(102, 20, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(103, 20, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(104, 20, 5, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(105, 20, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(106, 21, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(107, 21, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(108, 21, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(109, 21, 5, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(110, 21, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(111, 22, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(112, 22, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(113, 22, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(114, 22, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(115, 22, 5, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(116, 23, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(117, 23, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(118, 23, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(119, 23, 5, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(120, 23, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(121, 24, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(122, 24, 1, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(123, 24, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(124, 24, 5, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(125, 24, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(126, 25, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(127, 25, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(128, 25, 3, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(129, 25, 2, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00'),
(130, 25, 4, '"In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-13 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE IF NOT EXISTS `followers` (
`id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `follower_id` int(30) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `user_id`, `follower_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 5),
(4, 2, 1),
(5, 2, 3),
(6, 2, 5),
(7, 2, 4),
(8, 3, 1),
(9, 3, 2),
(10, 3, 4),
(11, 3, 5),
(12, 4, 1),
(13, 4, 3),
(14, 5, 1),
(15, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
`like_id` int(30) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `post_id`, `user_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 3),
(5, 3, 2),
(6, 3, 1),
(7, 4, 3),
(8, 4, 2),
(9, 5, 1),
(10, 5, 4),
(11, 6, 1),
(12, 6, 3),
(13, 7, 2),
(14, 7, 4),
(15, 8, 1),
(16, 8, 2),
(17, 9, 3),
(18, 9, 4),
(19, 10, 5),
(20, 10, 1),
(21, 11, 2),
(22, 11, 4),
(23, 12, 2),
(24, 12, 3),
(25, 13, 1),
(26, 13, 4),
(27, 14, 2),
(28, 14, 1),
(29, 15, 5),
(30, 15, 2),
(31, 16, 2),
(32, 16, 3),
(33, 17, 4),
(34, 17, 5),
(35, 18, 2),
(36, 18, 1),
(37, 19, 3),
(38, 19, 1),
(39, 20, 3),
(40, 20, 2),
(41, 21, 2),
(42, 21, 3),
(43, 22, 4),
(44, 22, 2),
(45, 23, 3),
(46, 23, 1),
(47, 24, 5),
(48, 24, 1),
(49, 25, 1),
(50, 25, 5);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
`notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `notification_type` int(11) NOT NULL,
  `seen_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
`post_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `title` varchar(32) NOT NULL,
  `image` varchar(128) DEFAULT 'no image',
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `tag` text NOT NULL,
  `isVideo` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `title`, `image`, `content`, `created_at`, `tag`, `isVideo`) VALUES
(1, 1, 'TesRumbler', 'assets/img/PostPic/images.jpe', 'cek cek cek', '2014-10-04 13:27:23', '#loser #bangsat', 0),
(2, 1, 'tes2', 'no image', 'asbcd', '2014-10-07 00:00:00', '', 0),
(3, 1, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(4, 1, 'pbol', 'no image', '\r\n"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(5, 1, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', 0),
(6, 2, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(7, 2, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '', 0),
(8, 2, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(9, 2, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(10, 2, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(11, 3, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(12, 3, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(13, 3, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(14, 3, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(15, 3, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(16, 4, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(17, 4, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '', 0),
(18, 4, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(19, 4, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(20, 4, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(21, 5, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(22, 5, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(23, 5, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(24, 5, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0),
(25, 5, 'pbol', 'no image', '"Im not dismissing the value of higher education; Im simply saying it comes at the expense of experience."\r\n--STEVE JOBS--', '2014-10-13 00:00:00', '#test #pbol', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `user_id` int(11) NOT NULL,
  `username` int(11) NOT NULL DEFAULT '1',
  `realname` int(11) NOT NULL DEFAULT '1',
  `birthday` int(11) NOT NULL DEFAULT '1',
  `email` int(11) NOT NULL DEFAULT '1',
  `newFollower` int(11) NOT NULL DEFAULT '1',
  `newLikes` int(11) NOT NULL DEFAULT '1',
  `newComment` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`user_id`, `username`, `realname`, `birthday`, `email`, `newFollower`, `newLikes`, `newComment`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  `username` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `birthday` datetime NOT NULL,
  `password` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `blog_title` varchar(32) NOT NULL,
  `registered_at` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `picture_path` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `email`, `birthday`, `password`, `description`, `blog_title`, `registered_at`, `last_login`, `picture_path`) VALUES
(1, 'raiven teguh', 'vayneblue', 'vayneblue@yahoo.com', '1994-09-20 00:00:00', 'vayneblue', '', '', '2014-10-04 02:04:03', '2014-10-04 10:08:09', 'assets/img/ProfPic/Ahri.jpg'),
(2, 'sukoreno mukti', 'smwflynn', 'smwflynn@yahoo.com', '2000-10-09 00:00:00', 'adsfasdf', 'tes', 'tes', '2014-10-07 00:00:00', '2014-10-07 00:00:00', 'assets/img/PostPic/images.jpe'),
(3, 'gilang pratama', 'gilang77', 'gilang.pratama.gilang@gmail.com', '2014-10-07 00:00:00', 'hujikopolki', 'dummy data', '', '2014-10-01 00:00:00', '2014-10-13 01:00:00', ''),
(4, 'Gian Sebastian', 'gian', 'gian@yahoo.com', '2014-10-01 00:00:00', 'otot', 'dummy data', '', '2014-10-02 00:00:00', '2014-10-07 00:00:00', ''),
(5, 'Jeremy', 'jeremy', 'jeremy@yahoo.com', '2014-10-10 00:00:00', 'jeremy', 'dummy data', '', '2014-10-11 00:00:00', '2014-10-12 00:00:00', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`comment_id`), ADD KEY `fk_comments_post` (`post_id`), ADD KEY `fk_comments_user` (`user_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
 ADD PRIMARY KEY (`id`,`user_id`,`follower_id`), ADD KEY `fk_followers_user` (`user_id`), ADD KEY `fk_following_user` (`follower_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
 ADD PRIMARY KEY (`like_id`), ADD KEY `fk_likes_post` (`post_id`), ADD KEY `fk_likes_user` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
 ADD PRIMARY KEY (`notification_id`), ADD KEY `fk_notif_user` (`user_id`), ADD KEY `fk_notif_post` (`post_id`), ADD KEY `fk_notif_from_user` (`from_user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`post_id`), ADD KEY `fk_posts_user` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
 ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `comment_id` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
MODIFY `like_id` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `post_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `fk_comments_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
ADD CONSTRAINT `fk_comments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
ADD CONSTRAINT `fk_followers_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
ADD CONSTRAINT `fk_following_user` FOREIGN KEY (`follower_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
ADD CONSTRAINT `fk_likes_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
ADD CONSTRAINT `fk_likes_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
ADD CONSTRAINT `fk_notif_from_user` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`user_id`),
ADD CONSTRAINT `fk_notif_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
ADD CONSTRAINT `fk_notif_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
ADD CONSTRAINT `fk_posts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
ADD CONSTRAINT `fk_setting_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
