-- phpMyAdmin SQL Dump
-- version 4.2.9.1deb0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 09, 2014 at 06:42 PM
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
  `content` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `content`, `created_at`) VALUES
(1, 1, 2, 'Bajingan Lu!', '2014-10-08 00:00:00'),
(2, 1, 1, 'jgn kasar donk', '2014-10-08 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
CREATE TABLE IF NOT EXISTS `followers` (
`id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `follower_id` int(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `user_id`, `follower_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
`like_id` int(30) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `seen_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
`post_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `title` varchar(32) NOT NULL,
  `image` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `tag` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `title`, `image`, `content`, `created_at`, `tag`) VALUES
(1, 1, 'TesRumbler', 'assets/img/PostPic/images.jpe', 'cek cek cek', '2014-10-04 13:27:23', '#loser #bangsat'),
(2, 1, 'tes2', '', 'asbcd', '2014-10-07 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `user_id` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `realname` int(11) NOT NULL,
  `birthday` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `newFollower` int(11) NOT NULL,
  `newLikes` int(11) NOT NULL,
  `newComment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `email`, `birthday`, `password`, `description`, `blog_title`, `registered_at`, `last_login`, `picture_path`) VALUES
(1, 'raiven teguh', 'vayneblue', 'vayneblue@yahoo.com', '1994-09-20 00:00:00', 'vayneblue', '', '', '2014-10-04 02:04:03', '2014-10-04 10:08:09', 'assets/img/ProfPic/Ahri.jpg'),
(2, 'sukoreno mukti', 'smwflynn', 'smwflynn@yahoo.com', '2000-10-09 00:00:00', 'adsfasdf', 'tes', 'tes', '2014-10-07 00:00:00', '2014-10-07 00:00:00', 'assets/img/PostPic/images.jpe');

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
MODIFY `comment_id` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
MODIFY `id` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
MODIFY `like_id` int(30) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `post_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
