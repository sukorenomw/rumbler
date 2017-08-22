-- phpMyAdmin SQL Dump
-- version 4.2.9.1deb0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 15, 2014 at 09:40 PM
-- Server version: 5.5.38-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rumbler`
--
CREATE DATABASE IF NOT EXISTS `rumbler` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `rumbler`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
`comment_id` int(30) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `content`, `created_at`) VALUES
(1, 1, 2, 'Bajingan Lu!', '2014-10-08 00:00:00'),
(2, 1, 1, 'jgn kasar donk', '2014-10-09 00:00:00'),
(3, 1, 2, 'panggil Alvaro', '2014-10-13 02:07:22'),
(4, 1, 3, 'panggil Alvaro jg', '2014-10-13 06:14:20'),
(5, 1, 1, 'panggil aku raiven', '2014-10-13 10:11:11'),
(6, 2, 3, 'jessica', '2014-10-13 12:13:11'),
(7, 2, 1, 'love you lah jessica', '2014-10-13 17:19:32'),
(8, 2, 5, 'aisiteru', '2014-10-13 20:13:13'),
(9, 2, 2, 'udah woi inget tugas', '2014-10-13 20:15:00'),
(10, 2, 4, 'baru 10', '2014-10-14 00:00:00'),
(11, 3, 1, 'panggil Alvaro1', '2014-10-14 06:49:00'),
(12, 3, 3, 'panggil Alvaro2', '2014-10-14 11:32:00'),
(13, 3, 3, 'panggil Alvaro3', '2014-10-14 13:00:25'),
(14, 3, 4, 'panggil Alvaro4', '2014-10-14 14:00:34'),
(15, 3, 1, 'otot', '2014-10-14 17:00:00'),
(16, 4, 1, 'otot lg', '2014-10-14 20:39:00'),
(17, 4, 3, 'KFC', '2014-10-14 21:00:00'),
(18, 4, 2, 'KFC2', '2014-10-14 21:11:00'),
(19, 4, 4, 'KFC4', '2014-10-15 00:09:16'),
(20, 4, 1, 'KFC mulu', '2014-10-15 03:11:17'),
(21, 5, 3, 'minta no jessica', '2014-10-15 06:08:00'),
(22, 5, 1, 'ada yg cantik ga', '2014-10-15 08:39:00'),
(23, 5, 3, 'ga tau lier ngulang muu', '2014-10-15 10:31:00'),
(24, 5, 2, 'ciyus', '2014-10-15 11:00:00'),
(25, 5, 3, 'miapah lah', '2014-10-15 13:09:00'),
(26, 6, 4, 'mi kamu', '2014-10-15 15:00:21'),
(27, 6, 1, 'najong woi', '2014-10-15 21:00:00'),
(28, 6, 2, 'inget chen', '2014-10-16 00:51:51'),
(29, 6, 3, 'love lah', '2014-10-16 03:00:00'),
(30, 6, 5, 'apa woi', '2014-10-16 04:00:00'),
(31, 7, 1, 'ganti room', '2014-10-16 06:00:00'),
(32, 7, 3, 'gelo ih', '2014-10-16 08:00:00'),
(33, 7, 4, 'udah stress', '2014-10-16 09:00:00'),
(34, 7, 3, 'dimengerti', '2014-10-16 12:16:00'),
(35, 7, 2, 'wkwkkwkwk', '2014-10-16 14:00:21'),
(36, 8, 4, 'hit your but', '2014-10-16 15:46:00'),
(37, 8, 2, 'fuck off', '2014-10-16 17:28:00'),
(38, 8, 3, 'okai', '2014-10-16 20:00:00'),
(39, 8, 1, 'sakit nampak nya', '2014-10-16 20:00:37'),
(40, 8, 2, 'who', '2014-10-17 00:00:00'),
(41, 9, 1, 'adelide', '2014-10-17 00:33:00'),
(42, 9, 2, 'kalem minum', '2014-10-17 01:00:00'),
(43, 9, 3, 'baru 43', '2014-10-17 03:00:36'),
(44, 9, 1, '44 - "In your life you only get to do so many things and right now weve chosen to do this, so lets make it great."', '2014-10-17 05:47:38'),
(45, 9, 2, 'keras lah', '2014-10-17 08:27:10'),
(46, 10, 1, 'ngulang itu hoby', '2014-10-17 10:00:00'),
(47, 10, 3, 'sakit sia', '2014-10-17 10:31:00'),
(48, 10, 2, 'aduh ini', '2014-10-17 11:00:00'),
(49, 10, 1, 'gmn jumat', '2014-10-17 12:00:00'),
(50, 10, 2, 'up to you', '2014-10-17 19:24:22'),
(51, 11, 2, 'bust room lagi', '2014-10-18 01:37:17'),
(52, 11, 1, 'woi buat room lain bust', '2014-10-18 06:17:30'),
(53, 11, 3, 'ini bajingan bner', '2014-10-18 06:17:40'),
(54, 11, 1, 'gobs', '2014-10-18 07:00:28'),
(55, 11, 3, 'damn', '2014-10-18 08:33:00'),
(56, 12, 1, 'assshole', '2014-10-18 08:43:00'),
(57, 12, 3, 'kunaon', '2014-10-18 09:00:00'),
(58, 12, 2, 'galau epen', '2014-10-18 12:00:00'),
(59, 12, 5, 'ok lah mengerti', '2014-10-18 12:13:00'),
(60, 12, 3, '60', '2014-10-18 12:19:00'),
(61, 13, 1, '61', '2014-10-18 13:12:20'),
(62, 13, 2, '62', '2014-10-18 13:30:00'),
(63, 13, 4, '63', '2014-10-18 13:37:00'),
(64, 13, 3, '64', '2014-10-18 14:26:00'),
(65, 13, 1, '65', '2014-10-18 15:00:00'),
(71, 14, 2, '71', '2014-10-18 15:36:00'),
(72, 14, 1, 'bngung ini', '2014-10-18 19:19:00'),
(73, 14, 2, 'udah ngulang DB 3x', '2014-10-18 21:00:00'),
(74, 14, 4, 'keras sia', '2014-10-18 21:45:26'),
(75, 14, 3, 'hiber lah', '2014-10-18 22:24:43'),
(76, 15, 4, 'kade ngapung', '2014-10-18 23:29:48'),
(77, 15, 2, 'apaan', '2014-10-19 00:23:00'),
(78, 15, 3, 'itu lu ', '2014-10-19 02:12:10'),
(79, 15, 4, 'gobs', '2014-10-19 02:16:36'),
(80, 15, 2, 'wkakwkawkak', '2014-10-19 05:19:29'),
(81, 16, 2, 'begini nasib', '2014-10-19 06:00:00'),
(82, 16, 3, 'jadi bujang naas?', '2014-10-19 06:12:00'),
(83, 16, 1, 'jis ga enak gt', '2014-10-19 06:16:00'),
(84, 16, 4, 'WOI SUTEI', '2014-10-19 06:31:00'),
(85, 16, 5, 'HBD GILANG', '2014-10-19 07:00:00'),
(86, 17, 3, 'HBD PEN', '2014-10-19 07:12:00'),
(87, 17, 3, 'Sweetseventeen again', '2014-10-19 10:00:19'),
(88, 17, 2, 'asik', '2014-10-19 11:17:00'),
(89, 17, 1, 'gobs udah lewat da', '2014-10-19 13:12:00'),
(90, 17, 3, 'kan tiap taun pen', '2014-10-19 13:23:00'),
(91, 18, 1, 'udah 91 jg', '2014-10-19 13:40:00'),
(92, 18, 3, 'ini ada yg ilang', '2014-10-19 13:46:00'),
(93, 18, 4, 'di 60an gtu', '2014-10-19 19:27:00'),
(94, 18, 3, 'bner" ilang', '2014-10-19 20:19:00'),
(95, 18, 2, 'udah 95', '2014-10-19 21:33:11'),
(96, 19, 1, 'aduh gila bner ini 96', '2014-10-20 00:00:00'),
(97, 19, 5, 'ok lah 97', '2014-10-20 00:23:00'),
(98, 19, 3, 'masih 30lg', '2014-10-20 01:29:00'),
(99, 19, 2, 'anjeng ini bner" ngulang ngetik 130x ', '2014-10-20 01:13:38'),
(100, 19, 1, 'kan ga 130 jg ada yg ilang', '2014-10-20 02:29:14'),
(101, 20, 2, 'coba cek baris tengah DB', '2014-10-20 02:33:24'),
(102, 20, 1, 'ada yg ilang bner', '2014-10-20 03:20:36'),
(103, 20, 3, 'terlalu euy', '2014-10-20 03:39:00'),
(104, 20, 5, 'oke lah percaya aja', '2014-10-20 06:43:26'),
(105, 20, 4, 'udah 105', '2014-10-20 11:23:37'),
(106, 21, 2, 'baru 106', '2014-10-20 12:30:41'),
(107, 21, 1, 'masih 107', '2014-10-20 14:00:52'),
(108, 21, 3, 'ganti 108', '2014-10-20 14:45:00'),
(109, 21, 5, 'lanjut', '2014-10-20 15:00:00'),
(110, 21, 3, 'kanjut?', '2014-10-20 18:00:00'),
(111, 22, 2, 'oke 111', '2014-10-20 18:33:00'),
(112, 22, 3, 'double 1 and 2', '2014-10-20 19:37:00'),
(113, 22, 1, 'udah woi ga sanggup kalo ini ga ke save', '2014-10-20 20:00:31'),
(114, 22, 4, 'udah woi ga sanggup kalo ini ga ke save2', '2014-10-20 22:43:27'),
(115, 22, 5, 'udah woi ga sanggup kalo ini ga ke save3', '2014-10-21 00:00:32'),
(116, 23, 3, 'udah woi ga sanggup kalo ini ga ke save4', '2014-10-21 03:00:00'),
(117, 23, 2, 'udah woi ga sanggup kalo ini ga ke save5', '2014-10-21 05:27:00'),
(118, 23, 4, 'again udah woi ga sanggup kalo ini ga ke save', '2014-10-21 09:29:00'),
(119, 23, 5, 'again 1', '2014-10-21 10:21:00'),
(120, 23, 1, 'again 2 udah woi ga sanggup kalo ini ga ke save', '2014-10-21 11:24:00'),
(121, 24, 3, 'again 3 udah woi ga sanggup kalo ini ga ke save', '2014-10-21 13:31:00'),
(122, 24, 1, 'akhir nya finish', '2014-10-21 13:44:00'),
(123, 24, 2, 'horee', '2014-10-21 16:22:26'),
(124, 24, 5, 'room 5 galau ah', '2014-10-21 17:33:00'),
(125, 24, 2, 'percaya udah woi ga sanggup kalo ini ga ke save', '2014-10-21 18:26:00'),
(126, 25, 2, 'woi ada yg pnya nomor jessica?', '2014-10-21 18:44:00'),
(127, 25, 4, 'yang 2014 lah', '2014-10-21 20:53:16'),
(128, 25, 3, 'jis lucu beul', '2014-10-21 21:26:00'),
(129, 25, 2, 'oooh jessica', '2014-10-21 22:26:00'),
(130, 25, 4, 'bner ga sih nama nya', '2014-10-21 23:26:32');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
CREATE TABLE IF NOT EXISTS `followers` (
`id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `follower_id` int(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

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

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
`like_id` int(30) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

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

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
`notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `notification_type` int(11) NOT NULL,
  `seen_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
`post_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '',
  `image` varchar(128) DEFAULT 'no image',
  `content` text,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tag` text,
  `isVideo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `title`, `image`, `content`, `created_at`, `tag`, `isVideo`) VALUES
(1, 1, 'TesRumbler', 'assets/img/PostPic/images.jpe', 'cek cek cek', '2014-10-04 13:27:23', '#loser #bangsat', 0),
(2, 1, 'tes2', 'no image', 'asbcd', '2014-10-07 00:00:00', '', 0),
(3, 1, '001 - pbol', 'no image', 'pliss jessica', '2014-10-08 00:00:00', '#test #pbol', 0),
(4, 1, '002 - pbol', 'no image', 'love you jessica', '2014-10-09 00:00:00', '#test #pbol', 0),
(5, 1, '003 - pbol', 'no image', 'would you marry me', '2014-10-09 08:00:00', '#test #pbol', 0),
(6, 2, '004 - pbol', 'no image', 'room baru', '2014-10-09 11:00:00', '#test #pbol', 0),
(7, 2, '005 - pbol', 'no image', 'panggil Alvaro', '2014-10-10 04:00:00', '', 0),
(8, 2, '006 - pbol', 'no image', 'panggil Alvaro lai', '2014-10-10 08:00:00', '#test #pbol', 0),
(9, 2, '007 - pbol', 'no image', 'panggil Alvaro 13', '2014-10-11 00:00:00', '#test #pbol', 0),
(10, 2, '008 - pbol', 'no image', 'panggil Raiven', '2014-10-11 03:00:00', '#test #pbol', 0),
(11, 3, '009 - pbol', 'no image', 'Summon hans', '2014-10-12 00:00:00', '#test #pbol', 0),
(12, 3, '11 - pbol', 'no image', 'JESSICA', '2014-10-12 06:00:00', '#test #pbol', 0),
(13, 3, '12 - pbol', 'no image', 'kapan lagi woi', '2014-10-13 00:00:00', '#test #pbol', 0),
(14, 3, '13 - pbol', 'no image', 'sicca wwowoii', '2014-10-14 00:00:00', '#test #pbol', 0),
(15, 3, '15 - pbol', 'no image', 'gelo', '2014-10-15 00:00:00', '#test #pbol', 0),
(16, 4, '16 - pbol', 'no image', 'galau mode on', '2014-10-16 00:00:00', '#test #pbol', 0),
(17, 4, '17 - pbol', 'no image', 'galau aja ah', '2014-10-16 07:00:00', '', 0),
(18, 4, '18 - pbol', 'no image', 'aduh galau pisan', '2014-10-16 11:00:00', '#test #pbol', 0),
(19, 4, '19 - pbol', 'no image', 'ngulang lagi deh', '2014-10-16 17:00:00', '#test #pbol', 0),
(20, 4, '20 - pbol', 'no image', 'hobby dong', '2014-10-16 22:00:00', '#test #pbol', 0),
(21, 5, '21 - pbol', 'no image', 'yeah hooby', '2014-10-17 00:00:00', '#test #pbol', 0),
(22, 5, '22 - pbol', 'no image', 'im not noob', '2014-10-17 04:00:00', '#test #pbol', 0),
(23, 5, '23 - pbol', 'no image', 'ciyus ah', '2014-10-17 08:00:00', '#test #pbol', 0),
(24, 5, '24 - pbol', 'no image', 'love you lah', '2014-10-17 12:00:00', '#test #pbol', 0),
(25, 5, '25 - pbol', 'no image', 'room baru lagi guys', '2014-10-18 00:00:00', '#test #pbol', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
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

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(10) NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `username` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(32) NOT NULL DEFAULT '',
  `birthday` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `password` varchar(32) NOT NULL DEFAULT '',
  `description` text,
  `blog_title` varchar(32) NOT NULL DEFAULT '',
  `registered_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `picture_path` varchar(225) DEFAULT 'assets/img/ProfPic/default.png'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `email`, `birthday`, `password`, `description`, `blog_title`, `registered_at`, `last_login`, `picture_path`) VALUES
(1, 'raiven teguh', 'vayneblue', 'vayneblue@yahoo.com', '1994-09-20 00:00:00', 'vayneblue', '', '', '2014-10-04 02:04:03', '2015-01-03 10:08:09', 'assets/img/ProfPic/Ahri.jpg'),
(2, 'sukoreno mukti', 'smwflynn', 'smwflynn@yahoo.com', '2000-10-09 00:00:00', 'adsfasdf', 'tes', 'tes', '2014-10-07 00:00:00', '2015-01-02 00:00:00', 'assets/img/PostPic/images.jpe'),
(3, 'gilang pratama', 'gilang77', 'gilang.pratama.gilang@gmail.com', '2014-10-07 00:00:00', 'hujikopolki', 'dummy data', '', '2014-10-08 00:00:00', '2015-01-03 01:00:00', ''),
(4, 'Gian Sebastian', 'gian', 'gian@yahoo.com', '2014-10-01 00:00:00', 'otot', 'dummy data', '', '2014-10-09 00:00:00', '2015-01-02 00:00:00', ''),
(5, 'Jeremy', 'jeremy', 'jeremy@yahoo.com', '2014-10-10 00:00:00', 'jeremy', 'dummy data', '', '2014-10-10 00:00:00', '2015-01-01 07:18:00', ''),
(6, '', 'flynn', 'sukorenomw@windowslive.com', '0000-00-00 00:00:00', 'a1b2c3d4', NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'assets/img/ProfPic/default.png');

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
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `email` (`email`);

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
MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
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
