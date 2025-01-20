CREATE DATABASE IF NOT EXISTS database_one;
CREATE DATABASE IF NOT EXISTS database_one_test;
CREATE DATABASE IF NOT EXISTS database_grafana;
CREATE DATABASE IF NOT EXISTS database_bitwarden;

CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED WITH caching_sha2_password BY 'test123';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;


-- MySQL dump 10.13  Distrib 9.1.0, for Linux (x86_64)
--
-- Host: mysql    Database: database_one
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `database_one`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `database_one` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `database_one`;

--
-- Table structure for table `admin_group`
--

DROP TABLE IF EXISTS `admin_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_group` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `name` varchar(255) NOT NULL,
                               `description` varchar(255) DEFAULT NULL,
                               `roles` json NOT NULL,
                               `created_at` datetime NOT NULL,
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_group`
--

LOCK TABLES `admin_group` WRITE;
/*!40000 ALTER TABLE `admin_group` DISABLE KEYS */;
INSERT INTO `admin_group` VALUES (1,'Super Admin','Super Admin','[\"ROLE_SUPER_ADMIN\"]','2024-10-18 10:50:35'),(2,'Admin','Admin','[\"ROLE_ADMIN\"]','2024-10-18 10:50:35'),(3,'User','No rights User','[\"ROLE_USER\"]','2024-10-18 10:50:35');
/*!40000 ALTER TABLE `admin_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'Super Admin','super-admin@joneddo.de','35104235','[\"ROLE_SUPER_ADMIN\"]','$2y$13$xrMFMAARvZe1bVPKp5oYIef7eKxBl0owneOUz41xdxVKmJh0eXN4G','938ad78e3f5c24ed24d8773745f06865','Super Admin',0,'2024-10-18 10:50:37'),(2,'Admin','admin@joneddo.de','23907644','[\"ROLE_ADMIN\"]','$2y$13$MSxC1RuA0JPOx72FaHvfRuQNmmhZEx1FhxhaYDUHHUEn4EktCTQha','b7af84ea530782e8fd97c072206a2c55','Admin',0,'2024-10-18 10:50:37'),(3,'User','user@joneddo.de','55268357','[\"ROLE_USER\"]','$2y$13$lbaAqqcNHmQtVfiErZVePOFurXS3Yo4TLRTTKROR8PaltzjPUEpye','acfc52134be013f36731f309d61c4a15','No rights User',0,'2024-10-18 10:50:37');
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_group`
--

DROP TABLE IF EXISTS `admin_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_group` (
                                    `user_id` int NOT NULL,
                                    `group_id` int NOT NULL,
                                    PRIMARY KEY (`user_id`,`group_id`),
                                    KEY `IDX_473C1918A76ED395` (`user_id`),
                                    KEY `IDX_473C1918FE54D947` (`group_id`),
                                    CONSTRAINT `FK_473C1918A76ED395` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`id`),
                                    CONSTRAINT `FK_473C1918FE54D947` FOREIGN KEY (`group_id`) REFERENCES `admin_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_group`
--

LOCK TABLES `admin_user_group` WRITE;
/*!40000 ALTER TABLE `admin_user_group` DISABLE KEYS */;
INSERT INTO `admin_user_group` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `admin_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_query_log`
--

DROP TABLE IF EXISTS `api_query_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_query_log` (
                                 `id` int NOT NULL AUTO_INCREMENT,
                                 `query_endpoint` varchar(255) NOT NULL,
                                 `query_datetime` datetime NOT NULL,
                                 `response_json` json DEFAULT NULL,
                                 `status` varchar(255) NOT NULL,
                                 `message` text,
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_query_log`
--

LOCK TABLES `api_query_log` WRITE;
/*!40000 ALTER TABLE `api_query_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_query_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_admin_rabbit_mq`
--

DROP TABLE IF EXISTS `easy_admin_rabbit_mq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `easy_admin_rabbit_mq` (
                                        `id` int NOT NULL AUTO_INCREMENT,
                                        `messages` int NOT NULL,
                                        `processes` int NOT NULL,
                                        `bulk` int NOT NULL,
                                        `log_index` longtext NOT NULL,
                                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_admin_rabbit_mq`
--

LOCK TABLES `easy_admin_rabbit_mq` WRITE;
/*!40000 ALTER TABLE `easy_admin_rabbit_mq` DISABLE KEYS */;
INSERT INTO `easy_admin_rabbit_mq` VALUES (1,100,10,500,'default');
/*!40000 ALTER TABLE `easy_admin_rabbit_mq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_admin_reference`
--

DROP TABLE IF EXISTS `easy_admin_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `easy_admin_reference` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_admin_reference`
--

LOCK TABLES `easy_admin_reference` WRITE;
/*!40000 ALTER TABLE `easy_admin_reference` DISABLE KEYS */;
INSERT INTO `easy_admin_reference` VALUES (1,'Lorem ipsum dolor sit amet','lorem-ipsum-dolor-sit-amet','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','<div>Lorem ipsum <strong>dolor sit amet</strong>, consectetur adipisicing elit, sed do eiusmod tempor incididunt <em>ut labore et dolore</em> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation <a href=\"#\">ullamco laboris nisi</a> ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</div>','<?php\r\n\r\nnamespace Symfony\\Component\\HttpFoundation;\r\n\r\nclass Request\r\n{\r\n    // ...\r\n    public function getScriptName()\r\n    {\r\n        return $this->server->get(\'SCRIPT_NAME\', $this->server->get(\'ORIG_SCRIPT_NAME\', \'\'));\r\n    }\r\n}',0,'[0]','[0, 1]',2,7,81.26,0.35,19900,'2024-06-07 00:00:00','1970-01-01 04:06:00','2025-03-14 07:06:00','Europe/Madrid','CR','JPY','ar','zh_Hans_MO','[\"Item 1\", \"Item 2\"]','[]','[]','marvin.png','/uploads/Scan_20231107_150358.pdf','#6174d1','user@example.com','+1 800 555 0199','https://github.com/EasyCorp/EasyAdminBundle',2);
/*!40000 ALTER TABLE `easy_admin_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_log_entries`
--

DROP TABLE IF EXISTS `ext_log_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ext_log_entries` (
                                   `id` int NOT NULL AUTO_INCREMENT,
                                   `action` varchar(8) COLLATE utf8mb3_unicode_ci NOT NULL,
                                   `logged_at` datetime NOT NULL,
                                   `object_id` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
                                   `object_class` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
                                   `version` int NOT NULL,
                                   `data` json NOT NULL,
                                   `username` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `log_class_lookup_idx` (`object_class`),
                                   KEY `log_user_lookup_idx` (`username`),
                                   KEY `log_date_lookup_idx` (`logged_at`),
                                   KEY `log_version_lookup_idx` (`object_id`,`object_class`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_log_entries`
--

LOCK TABLES `ext_log_entries` WRITE;
/*!40000 ALTER TABLE `ext_log_entries` DISABLE KEYS */;
INSERT INTO `ext_log_entries` VALUES (1,'create','2024-10-18 10:50:35','1','App\\DataHolder\\Entity\\Mysql\\AdminGroup',1,'{\"id\": 1, \"name\": \"Super Admin\", \"roles\": [\"ROLE_SUPER_ADMIN\"], \"description\": \"Super Admin\"}','- Migration -'),(2,'create','2024-10-18 10:50:35','2','App\\DataHolder\\Entity\\Mysql\\AdminGroup',1,'{\"id\": 2, \"name\": \"Admin\", \"roles\": [\"ROLE_ADMIN\"], \"description\": \"Admin\"}','- Migration -'),(3,'create','2024-10-18 10:50:35','3','App\\DataHolder\\Entity\\Mysql\\AdminGroup',1,'{\"id\": 3, \"name\": \"User\", \"roles\": [\"ROLE_USER\"], \"description\": \"No rights User\"}','- Migration -'),(4,'create','2024-10-18 10:50:37','1','App\\DataHolder\\Entity\\Mysql\\AdminUser',1,'{\"id\": 1, \"name\": \"Super Admin\", \"salt\": \"35104235\", \"email\": \"super-admin@joneddo.de\", \"roles\": [\"ROLE_SUPER_ADMIN\"], \"token\": \"938ad78e3f5c24ed24d8773745f06865\", \"comment\": \"Super Admin\", \"isLocked\": false, \"password\": \"$2y$13$xrMFMAARvZe1bVPKp5oYIef7eKxBl0owneOUz41xdxVKmJh0eXN4G\"}','- Migration -'),(5,'create','2024-10-18 10:50:37','2','App\\DataHolder\\Entity\\Mysql\\AdminUser',1,'{\"id\": 2, \"name\": \"Admin\", \"salt\": \"23907644\", \"email\": \"admin@joneddo.de\", \"roles\": [\"ROLE_ADMIN\"], \"token\": \"b7af84ea530782e8fd97c072206a2c55\", \"comment\": \"Admin\", \"isLocked\": false, \"password\": \"$2y$13$MSxC1RuA0JPOx72FaHvfRuQNmmhZEx1FhxhaYDUHHUEn4EktCTQha\"}','- Migration -'),(6,'create','2024-10-18 10:50:37','3','App\\DataHolder\\Entity\\Mysql\\AdminUser',1,'{\"id\": 3, \"name\": \"User\", \"salt\": \"55268357\", \"email\": \"user@joneddo.de\", \"roles\": [\"ROLE_USER\"], \"token\": \"acfc52134be013f36731f309d61c4a15\", \"comment\": \"No rights User\", \"isLocked\": false, \"password\": \"$2y$13$lbaAqqcNHmQtVfiErZVePOFurXS3Yo4TLRTTKROR8PaltzjPUEpye\"}','- Migration -');
/*!40000 ALTER TABLE `ext_log_entries` ENABLE KEYS */;
UNLOCK TABLES;

