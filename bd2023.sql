-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 19 mai 2024 à 19:14
-- Version du serveur : 10.4.8-MariaDB
-- Version de PHP : 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bd2023`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

C-- --------------------------------------------------------
-- Table CATEGORIE
-- --------------------------------------------------------
CREATE TABLE `categorie` (
  `codecat` int(11) NOT NULL,
  `libelle` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`codecat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------
-- Table CLIENT
-- --------------------------------------------------------
CREATE TABLE `client` (
  `cin` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------
-- Table HABIT
-- --------------------------------------------------------
CREATE TABLE `habit` (
  `codehab` int(11) NOT NULL,
  `descripton` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `taille` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `disponible` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'D',
  `codecat` int(11) NOT NULL,
  PRIMARY KEY (`codehab`),
  KEY `c1` (`codecat`),
  CONSTRAINT `c1` FOREIGN KEY (`codecat`) REFERENCES `categorie` (`codecat`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------
-- Table LOCATION
-- --------------------------------------------------------
CREATE TABLE `location` (
  `dateloc` date NOT NULL,
  `codehab` int(11) NOT NULL,
  `cin` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `duree` int(11) NOT NULL,
  PRIMARY KEY (`dateloc`,`codehab`),
  KEY `c2` (`codehab`),
  KEY `c3` (`cin`),
  CONSTRAINT `c2` FOREIGN KEY (`codehab`) REFERENCES `habit` (`codehab`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c3` FOREIGN KEY (`cin`) REFERENCES `client` (`cin`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
