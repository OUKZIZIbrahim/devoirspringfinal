-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2022 at 08:27 PM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `devoirfinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `developpeur`
--

CREATE TABLE IF NOT EXISTS `developpeur` (
  `code_dev` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `developpeur`
--

INSERT INTO `developpeur` (`code_dev`, `email`, `nom`, `prenom`) VALUES
(1, 'o@gmail.com', 'oussamadev', 'lanssari');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'CLIENT'),
(3, 'DEV');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `id_t` int(11) NOT NULL,
  `attribue` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `environnement` varchar(255) DEFAULT NULL,
  `priorite` varchar(255) DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  `type_urgence` varchar(255) DEFAULT NULL,
  `developpeur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id_t`, `attribue`, `description`, `environnement`, `priorite`, `statut`, `type_urgence`, `developpeur_id`) VALUES
(1, b'1', 'd1', 'en11', 'pr1', 'resolu', 'Pasurgent', 1),
(2, b'1', 'd2', 'en2', 'pr2', 'new', 'Urgent', 1),
(3, b'0', 'd3', 'en3', 'pr3', 'resolu', 'Urgent', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `enabled`, `password`, `username`) VALUES
(1, b'1', '$2y$10$d6NdOwXzZ36A3tlu42ZynuGnkpn4QTYDFW8PCo4HEaNG.nM8ePdhS', 'oussama'),
(2, b'1', '$2y$10$d6NdOwXzZ36A3tlu42ZynuGnkpn4QTYDFW8PCo4HEaNG.nM8ePdhS', 'ibrahim'),
(3, b'1', '$2y$10$d6NdOwXzZ36A3tlu42ZynuGnkpn4QTYDFW8PCo4HEaNG.nM8ePdhS', 'khalid');

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE IF NOT EXISTS `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `developpeur`
--
ALTER TABLE `developpeur`
  ADD PRIMARY KEY (`code_dev`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id_t`), ADD KEY `FK76btse3ilxfcv9sf9gipsia3w` (`developpeur_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`), ADD KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `developpeur`
--
ALTER TABLE `developpeur`
  MODIFY `code_dev` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id_t` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
ADD CONSTRAINT `FK76btse3ilxfcv9sf9gipsia3w` FOREIGN KEY (`developpeur_id`) REFERENCES `developpeur` (`code_dev`);

--
-- Constraints for table `users_roles`
--
ALTER TABLE `users_roles`
ADD CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
ADD CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
