-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 25 Janvier 2017 à 16:20
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `db_jechante`
--

-- --------------------------------------------------------

--
-- Structure de la table `citation`
--

CREATE TABLE IF NOT EXISTS `citation` (
  `idCitation` int(11) NOT NULL AUTO_INCREMENT,
  `Citation` varchar(500) DEFAULT NULL,
  `Debut` int(11) DEFAULT NULL,
  `Fin` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `idLyrics` int(11) NOT NULL,
  PRIMARY KEY (`idCitation`),
  KEY `FK_Citation_idUser` (`idUser`),
  KEY `FK_Citation_idLyrics` (`idLyrics`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `lyrics`
--

CREATE TABLE IF NOT EXISTS `lyrics` (
  `idLyrics` int(11) NOT NULL AUTO_INCREMENT,
  `TextLyrics` varchar(600) DEFAULT NULL,
  `TitreMusique` varchar(50) DEFAULT NULL,
  `mbid` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idLyrics`),
  UNIQUE KEY `mbid` (`mbid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `Pseudo` varchar(50) DEFAULT NULL,
  `mdp` varchar(50) DEFAULT NULL,
  `email` text,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `citation`
--
ALTER TABLE `citation`
  ADD CONSTRAINT `FK_Citation_idLyrics` FOREIGN KEY (`idLyrics`) REFERENCES `lyrics` (`idLyrics`),
  ADD CONSTRAINT `FK_Citation_idUser` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
