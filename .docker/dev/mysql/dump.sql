-- --------------------------------------------------------
-- Host:                         localhost
-- Server-Version:               8.4.0 - MySQL Community Server - GPL
-- Server-Betriebssystem:        Linux
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank-Struktur für database_one
DROP DATABASE IF EXISTS `database_one`;
CREATE DATABASE IF NOT EXISTS `database_one` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `database_one`;

-- Exportiere Struktur von Tabelle database_one.admin_group
DROP TABLE IF EXISTS `admin_group`;
CREATE TABLE IF NOT EXISTS `admin_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `roles` json NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.admin_group: ~3 rows (ungefähr)
DELETE FROM `admin_group`;
INSERT INTO `admin_group` (`id`, `name`, `description`, `roles`, `created_at`) VALUES
	(1, 'Super Admin', 'Super Admin', '["ROLE_SUPER_ADMIN"]', '2024-06-07 05:56:29'),
	(2, 'Admin', 'Admin', '["ROLE_ADMIN"]', '2024-06-07 05:56:29'),
	(3, 'User', 'No rights User', '["ROLE_USER"]', '2024-06-07 05:56:29');

-- Exportiere Struktur von Tabelle database_one.admin_user
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE IF NOT EXISTS `admin_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(240) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.admin_user: ~3 rows (ungefähr)
DELETE FROM `admin_user`;
INSERT INTO `admin_user` (`id`, `name`, `email`, `salt`, `roles`, `password`, `token`, `comment`, `is_locked`, `created_at`) VALUES
	(1, 'Super Admin', 'super-admin@joneddo.de', '82212744', '["ROLE_SUPER_ADMIN"]', '$2y$13$4Sevso4DS2GKuqLlNxuxoOnFyFuKs6CoW4Ol./N3oNekpRyA8xRm2', '938ad78e3f5c24ed24d8773745f06865', 'Super Admin', 0, '2024-06-07 05:56:31'),
	(2, 'Admin', 'admin@joneddo.de', '2869870', '["ROLE_ADMIN"]', '$2y$13$nUQJmz4a8fPQPcKAcScDAeY5.K5ViBT89pn26o5UDuxrDN7wzpoEO', 'e1d1c27faca04fbbcdf17b07ad5feb24', 'Admin', 0, '2024-06-07 05:56:31'),
	(3, 'User', 'user@joneddo.de', '8875072', '["ROLE_USER"]', '$2y$13$cO1MT5Jqsp665JWjfvGd9erU/3F1MtX5httCV5z20uHBP0Vsv1iuy', '37abe4dc879c7ca1cda2f7b37902b82b', 'No rights User', 0, '2024-06-07 05:56:31');

-- Exportiere Struktur von Tabelle database_one.admin_user_group
DROP TABLE IF EXISTS `admin_user_group`;
CREATE TABLE IF NOT EXISTS `admin_user_group` (
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_473C1918A76ED395` (`user_id`),
  KEY `IDX_473C1918FE54D947` (`group_id`),
  CONSTRAINT `FK_473C1918A76ED395` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`id`),
  CONSTRAINT `FK_473C1918FE54D947` FOREIGN KEY (`group_id`) REFERENCES `admin_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.admin_user_group: ~3 rows (ungefähr)
DELETE FROM `admin_user_group`;
INSERT INTO `admin_user_group` (`user_id`, `group_id`) VALUES
	(1, 1),
	(2, 2),
	(3, 3);

-- Exportiere Struktur von Tabelle database_one.easy_admin_rabbit_mq
DROP TABLE IF EXISTS `easy_admin_rabbit_mq`;
CREATE TABLE IF NOT EXISTS `easy_admin_rabbit_mq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `messages` int NOT NULL,
  `processes` int NOT NULL,
  `bulk` int NOT NULL,
  `log_index` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.easy_admin_rabbit_mq: ~1 rows (ungefähr)
DELETE FROM `easy_admin_rabbit_mq`;
INSERT INTO `easy_admin_rabbit_mq` (`id`, `messages`, `processes`, `bulk`, `log_index`) VALUES
	(1, 100, 10, 500, 'default');

-- Exportiere Struktur von Tabelle database_one.easy_admin_reference
DROP TABLE IF EXISTS `easy_admin_reference`;
CREATE TABLE IF NOT EXISTS `easy_admin_reference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text_field` text,
  `slug_field` varchar(255) DEFAULT NULL,
  `textarea_field` text NOT NULL,
  `text_editor_field` text NOT NULL,
  `code_editor_field` text NOT NULL,
  `boolean_field` tinyint(1) NOT NULL,
  `autocomplete_field` json NOT NULL,
  `checkbox_field` json NOT NULL,
  `radiobutton_field` int NOT NULL,
  `integer_field` int NOT NULL,
  `decimal_field` double NOT NULL,
  `percent_field` double NOT NULL,
  `money_field` double NOT NULL,
  `date_field` datetime NOT NULL,
  `time_field` datetime NOT NULL,
  `datetime_field` datetime NOT NULL,
  `timezone_field` varchar(255) NOT NULL,
  `country_field` varchar(255) NOT NULL,
  `currency_field` varchar(255) NOT NULL,
  `language_field` varchar(255) NOT NULL,
  `locale_field` varchar(255) NOT NULL,
  `array_field` json NOT NULL,
  `collection_simple_field` json DEFAULT NULL,
  `collection_complex_field` json DEFAULT NULL,
  `image_field` varchar(255) DEFAULT NULL,
  `pdf_field` varchar(255) DEFAULT NULL,
  `color_field` varchar(255) NOT NULL,
  `email_field` varchar(255) NOT NULL,
  `telephone_field` varchar(255) NOT NULL,
  `url_field` varchar(255) NOT NULL,
  `admin_user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_47ED42F76352511C` (`admin_user_id`),
  CONSTRAINT `FK_47ED42F76352511C` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.easy_admin_reference: ~1 rows (ungefähr)
DELETE FROM `easy_admin_reference`;
INSERT INTO `easy_admin_reference` (`id`, `text_field`, `slug_field`, `textarea_field`, `text_editor_field`, `code_editor_field`, `boolean_field`, `autocomplete_field`, `checkbox_field`, `radiobutton_field`, `integer_field`, `decimal_field`, `percent_field`, `money_field`, `date_field`, `time_field`, `datetime_field`, `timezone_field`, `country_field`, `currency_field`, `language_field`, `locale_field`, `array_field`, `collection_simple_field`, `collection_complex_field`, `image_field`, `pdf_field`, `color_field`, `email_field`, `telephone_field`, `url_field`, `admin_user_id`) VALUES
	(1, 'Lorem ipsum dolor sit amet', 'lorem-ipsum-dolor-sit-amet', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div>Lorem ipsum <strong>dolor sit amet</strong>, consectetur adipisicing elit, sed do eiusmod tempor incididunt <em>ut labore et dolore</em> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation <a href="#">ullamco laboris nisi</a> ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</div>', '<?php\r\n\r\nnamespace Symfony\\Component\\HttpFoundation;\r\n\r\nclass Request\r\n{\r\n    // ...\r\n    public function getScriptName()\r\n    {\r\n        return $this->server->get(\'SCRIPT_NAME\', $this->server->get(\'ORIG_SCRIPT_NAME\', \'\'));\r\n    }\r\n}', 0, '[0]', '[0, 1]', 2, 7, 81.26, 0.35, 19900, '2024-06-07 00:00:00', '1970-01-01 04:06:00', '2025-03-14 07:06:00', 'Europe/Madrid', 'CR', 'JPY', 'ar', 'zh_Hans_MO', '["Item 1", "Item 2"]', '[]', '[]', 'marvin.png', '/uploads/Scan_20231107_150358.pdf', '#6174d1', 'user@example.com', '+1 800 555 0199', 'https://github.com/EasyCorp/EasyAdminBundle', 2);

-- Exportiere Struktur von Tabelle database_one.migration_versions
DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportiere Daten aus Tabelle database_one.migration_versions: ~1 rows (ungefähr)
DELETE FROM `migration_versions`;
INSERT INTO `migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version00000000000001', '2024-06-07 05:56:28', 681);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
