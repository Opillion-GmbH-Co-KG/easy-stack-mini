CREATE DATABASE IF NOT EXISTS database_one;
CREATE DATABASE IF NOT EXISTS database_one_test;
CREATE DATABASE IF NOT EXISTS database_grafana;
CREATE DATABASE IF NOT EXISTS database_metabase;
CREATE DATABASE IF NOT EXISTS database_bitwarden;

CREATE USER IF NOT EXISTS 'admin'@'%';
ALTER USER 'admin'@'%' IDENTIFIED WITH caching_sha2_password BY 'test123';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

--
-- Current Database: `database_one`
--

-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for Linux (x86_64)
--
-- Host: mysql    Database: database_one
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `database_one`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `database_one` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `database_one`;

-- Exportiere Struktur von Tabelle database_one.address
DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
                                         `id` int NOT NULL AUTO_INCREMENT,
                                         `label` varchar(255) DEFAULT NULL,
    `street_address` varchar(255) NOT NULL,
    `postal_code` varchar(5) NOT NULL,
    `locality` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.address: ~2 rows (ungefähr)
DELETE FROM `address`;
INSERT INTO `address` (`id`, `label`, `street_address`, `postal_code`, `locality`) VALUES
                                                                                       (1, 'Example Address', '101 Example St.', '00000', 'Example City'),
                                                                                       (2, 'Another Example Address', 'Street 1', '00000', 'Example City');

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
                                                                                   (1, 'Super Admin', 'Super Admin', '["ROLE_SUPER_ADMIN"]', '2024-11-28 12:22:59'),
                                                                                   (2, 'Admin', 'Admin', '["ROLE_ADMIN"]', '2024-11-28 12:22:59'),
                                                                                   (3, 'User', 'No rights User', '["ROLE_USER"]', '2024-11-28 12:22:59');

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
                                                                                                                                 (1, 'Super Admin', 'super-admin@joneddo.de', '57988431', '["ROLE_SUPER_ADMIN"]', '$2y$13$buYss9Le0VVG0U87qo7xiOa5W6KEXUrYVtbGvVUZd64pp/t3AUKVi', '938ad78e3f5c24ed24d8773745f06865', 'Super Admin', 0, '2024-11-28 12:23:01'),
                                                                                                                                 (2, 'Admin', 'admin@joneddo.de', '50368507', '["ROLE_ADMIN"]', '$2y$13$2VQZ7yNzE9ck.FAEsuTpEO5q/NVBZy5m27.zQq1G3acPWuPe9fnJy', '592aadb8c7c28ed11f741a31fe62bdbc', 'Admin', 0, '2024-11-28 12:23:01'),
                                                                                                                                 (3, 'User', 'user@joneddo.de', '52206840', '["ROLE_USER"]', '$2y$13$yYnBelFbIOPRbGzcQ56XyOe/sw/p0JwGKwqkOTO6PCgelNaEDO8Gm', '3a093a9a9fd4bd00237172330dc861ec', 'No rights User', 0, '2024-11-28 12:23:01');

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

-- Exportiere Struktur von Tabelle database_one.api_query_log
DROP TABLE IF EXISTS `api_query_log`;
CREATE TABLE IF NOT EXISTS `api_query_log` (
                                               `id` int NOT NULL AUTO_INCREMENT,
                                               `query_endpoint` varchar(255) NOT NULL,
    `query_datetime` datetime NOT NULL,
    `response_json` json DEFAULT NULL,
    `status` varchar(255) NOT NULL,
    `message` text,
    `query_duration` double NOT NULL,
    `rows_processed` int DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.api_query_log: ~4 rows (ungefähr)
DELETE FROM `api_query_log`;
INSERT INTO `api_query_log` (`id`, `query_endpoint`, `query_datetime`, `response_json`, `status`, `message`, `query_duration`, `rows_processed`) VALUES
                                                                                                                                                     (1, 'oracle', '2024-11-28 12:26:45', '[{"NAME": "Africa", "REGION_ID": "AF"}, {"NAME": "Antarctica", "REGION_ID": "AN"}, {"NAME": "Asia", "REGION_ID": "AS"}, {"NAME": "Europe", "REGION_ID": "EU"}, {"NAME": "North America", "REGION_ID": "NA"}, {"NAME": "Oceania", "REGION_ID": "OC"}, {"NAME": "South America", "REGION_ID": "SA"}]', 'success', NULL, 0.048430919647217, 7),
                                                                                                                                                     (2, 'mssql', '2024-11-28 12:26:45', '[{"name": "master", "status": "ONLINE", "create_date": "2003-04-08 09:13:36.390", "compatibility_level": 160}, {"name": "tempdb", "status": "ONLINE", "create_date": "2024-11-28 12:22:52.973", "compatibility_level": 160}, {"name": "model", "status": "ONLINE", "create_date": "2003-04-08 09:13:36.390", "compatibility_level": 160}, {"name": "msdb", "status": "ONLINE", "create_date": "2024-11-06 19:51:26.760", "compatibility_level": 160}]', 'success', NULL, 0.01796293258667, 4),
                                                                                                                                                     (3, 'ldap', '2024-11-28 12:26:45', '[{"cn": ["Klaus Tester"], "sn": ["Muster-Tester"], "uid": ["ktest"], "gidNumber": ["2001"], "givenName": ["Klaus"], "uidNumber": ["2006"], "loginShell": ["/bin/bash"], "objectClass": ["inetOrgPerson", "posixAccount"], "userPassword": ["{SSHA}nIyhUc4yfQUJuIGoDkvj3+d7YM00NXKi"], "homeDirectory": ["/home/ktest"]}, "uid=ktest,ou=people,dc=example,dc=org"]', 'success', 'Fetched 2 records.', 0.0034999847412109, 2),
                                                                                                                                                     (4, 'http', '2024-11-28 12:26:45', '[{"id": 1, "name": "Super Admin", "roles": ["ROLE_SUPER_ADMIN"], "users": [], "createdAt": {"date": "2024-11-28 12:22:59.000000", "timezone": "UTC", "timezone_type": 3}, "description": "Super Admin"}, {"id": 2, "name": "Admin", "roles": ["ROLE_ADMIN"], "users": [], "createdAt": {"date": "2024-11-28 12:22:59.000000", "timezone": "UTC", "timezone_type": 3}, "description": "Admin"}, {"id": 3, "name": "User", "roles": ["ROLE_USER"], "users": [], "createdAt": {"date": "2024-11-28 12:22:59.000000", "timezone": "UTC", "timezone_type": 3}, "description": "No rights User"}]', 'success', NULL, 0.12109112739563, 3);

-- Exportiere Struktur von Tabelle database_one.branch_office
DROP TABLE IF EXISTS `branch_office`;
CREATE TABLE IF NOT EXISTS `branch_office` (
                                               `id` int NOT NULL AUTO_INCREMENT,
                                               `code` varchar(64) NOT NULL,
    `label` varchar(255) DEFAULT NULL,
    `server` varchar(255) DEFAULT NULL,
    `updated` datetime DEFAULT NULL,
    `tenant_id` int DEFAULT NULL,
    `address_id` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UNIQ_81301E5777153098` (`code`),
    KEY `IDX_81301E579033212A` (`tenant_id`),
    KEY `IDX_81301E57F5B7AF75` (`address_id`),
    CONSTRAINT `FK_81301E579033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`),
    CONSTRAINT `FK_81301E57F5B7AF75` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.branch_office: ~3 rows (ungefähr)
DELETE FROM `branch_office`;
INSERT INTO `branch_office` (`id`, `code`, `label`, `server`, `updated`, `tenant_id`, `address_id`) VALUES
                                                                                                        (1, 'EXBRNCH-1', 'Example Branch Office', '192.168.0.1', NULL, 1, 1),
                                                                                                        (2, 'EXBRNCH-2', 'Second Example Branch Office', '192.168.0.2', NULL, 2, 1),
                                                                                                        (3, 'EXBRNCH-3', 'Third Example Branch Office', 'localhost', NULL, 2, 2);

-- Exportiere Struktur von Tabelle database_one.branch_office_service
DROP TABLE IF EXISTS `branch_office_service`;
CREATE TABLE IF NOT EXISTS `branch_office_service` (
                                                       `id` int NOT NULL AUTO_INCREMENT,
                                                       `branch_office_id` int DEFAULT NULL,
                                                       `support_service_id` int DEFAULT NULL,
                                                       `type` varchar(16) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UNIQ_752BF86CFD2AF2F78CDE5729` (`branch_office_id`,`type`),
    KEY `IDX_752BF86CFD2AF2F7` (`branch_office_id`),
    KEY `IDX_752BF86CCFE86DC4` (`support_service_id`),
    CONSTRAINT `FK_752BF86CCFE86DC4` FOREIGN KEY (`support_service_id`) REFERENCES `support_service` (`id`),
    CONSTRAINT `FK_752BF86CFD2AF2F7` FOREIGN KEY (`branch_office_id`) REFERENCES `branch_office` (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.branch_office_service: ~5 rows (ungefähr)
DELETE FROM `branch_office_service`;
INSERT INTO `branch_office_service` (`id`, `branch_office_id`, `support_service_id`, `type`) VALUES
                                                                                                 (1, 1, 1, 'remote'),
                                                                                                 (2, 1, 1, 'local'),
                                                                                                 (3, 2, 1, 'remote'),
                                                                                                 (4, 2, 1, 'unknown'),
                                                                                                 (5, 3, 2, 'local');

-- Exportiere Struktur von Tabelle database_one.computer
DROP TABLE IF EXISTS `computer`;
CREATE TABLE IF NOT EXISTS `computer` (
                                          `id` int NOT NULL AUTO_INCREMENT,
                                          `label` varchar(255) DEFAULT NULL,
    `dn` varchar(255) DEFAULT NULL,
    `ou` varchar(255) DEFAULT NULL,
    `type` varchar(64) DEFAULT NULL,
    `last_logon` datetime DEFAULT NULL,
    `origin` int DEFAULT NULL,
    `destination` varchar(255) DEFAULT NULL,
    `imported` datetime DEFAULT NULL,
    `updated` datetime DEFAULT NULL,
    `branch_office_id` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `IDX_A298A7A6FD2AF2F7` (`branch_office_id`),
    CONSTRAINT `FK_A298A7A6FD2AF2F7` FOREIGN KEY (`branch_office_id`) REFERENCES `branch_office` (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.computer: ~1 rows (ungefähr)
DELETE FROM `computer`;
INSERT INTO `computer` (`id`, `label`, `dn`, `ou`, `type`, `last_logon`, `origin`, `destination`, `imported`, `updated`, `branch_office_id`) VALUES
    (1, 'Example Computer', 'cn=Computer 1,ou=Computers,dn=example,dn=org', 'ou=Computers,dn=example,dn=org', 'desktop', NULL, NULL, NULL, NULL, NULL, 1);

-- Exportiere Struktur von Tabelle database_one.cron_job
DROP TABLE IF EXISTS `cron_job`;
CREATE TABLE IF NOT EXISTS `cron_job` (
                                          `id` int NOT NULL AUTO_INCREMENT,
                                          `name` varchar(255) NOT NULL,
    `schedule_frequency` varchar(255) NOT NULL,
    `description` text,
    `last_run` datetime DEFAULT NULL,
    `next_run` datetime DEFAULT NULL,
    `scheduled` datetime DEFAULT NULL,
    `job_duration` double DEFAULT NULL,
    `counter` int DEFAULT NULL,
    `is_active` tinyint(1) NOT NULL,
    `command` varchar(255) NOT NULL,
    `message` text,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UNIQ_8E6EB8EE979C663` (`schedule_frequency`)
    ) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.cron_job: ~20 rows (ungefähr)
DELETE FROM `cron_job`;
INSERT INTO `cron_job` (`id`, `name`, `schedule_frequency`, `description`, `last_run`, `next_run`, `scheduled`, `job_duration`, `counter`, `is_active`, `command`, `message`) VALUES
                                                                                                                                                                                  (1, 'Second task (1)', 'PT1S', 'Runs every 10 seconds', '2024-11-28 12:26:49', '2024-11-28 12:26:50', '2024-11-28 12:23:42', 0.0037591457366943, 174, 1, 'apcu:status', 'APCu Cache Info:\nSlots: 4099\nEntries: 9\nHits: 0\nMisses: 0\nStart time: 2024-11-28 12:23:41\nMemory allocation: 1 segments\nAvailable memory: 67074176 bytes\n\nCache Entries:\n'),
                                                                                                                                                                                  (2, 'Second task (11)', 'PT11S', 'Runs every 10 seconds', '2024-11-28 12:26:43', '2024-11-28 12:26:53', '2024-11-28 12:23:42', 0.0035171508789062, 18, 1, 'apcu:status', 'APCu Cache Info:\nSlots: 4099\nEntries: 9\nHits: 0\nMisses: 0\nStart time: 2024-11-28 12:23:41\nMemory allocation: 1 segments\nAvailable memory: 67074176 bytes\n\nCache Entries:\n'),
                                                                                                                                                                                  (3, 'Second task (30)', 'PT30S', 'Runs every 30 seconds', '2024-11-28 12:26:44', '2024-11-28 12:27:14', '2024-11-28 12:23:15', 0.16699481010437, 6, 1, 'stack:check-services', 'nginx: up\nrabbitmq: up\nprometheus: up\nmetabase: up\nbitwarden: up\nldap: down\ncURL error 7: Failed to connect to ldap-gui port 18080 after 0 ms: Could not connect to server (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for http://ldap-gui:18080/setup/\n'),
                                                                                                                                                                                  (4, 'Minute task', 'PT1M', 'Imports foreign data sources', '2024-11-28 12:26:46', '2024-11-28 12:27:45', '2024-11-28 12:23:15', 0.2374119758606, 2, 1, 'import:dbs', 'Requesting: oracle db ...\noracle ok .... done!\nRequesting: mssql db ...\nmssql ok .... done!\nRequesting: ldap db ...\nldap ok .... done!\nRequesting: http db ...\nhttp ok .... done!\n'),
                                                                                                                                                                                  (5, 'Minute task (5)', 'PT5M', 'Runs every 5 minutes', NULL, '2024-11-28 12:28:46', '2024-11-28 12:23:15', NULL, 0, 1, 'apcu:status', NULL),
                                                                                                                                                                                  (6, 'Minute task (15)', 'PT15M', 'Runs every 15 minutes', NULL, '2024-11-28 12:38:47', '2024-11-28 12:23:15', NULL, 0, 1, 'apcu:status', NULL),
                                                                                                                                                                                  (7, 'Hourly task', 'PT1H', 'Sync data every hour', NULL, '2024-11-28 13:23:48', '2024-11-28 12:23:15', NULL, 0, 1, 'app:sync', NULL),
                                                                                                                                                                                  (8, 'Hourly task (6)', 'PT6H', 'Runs every 6 hours', NULL, '2024-11-28 18:23:49', '2024-11-28 12:23:15', NULL, 0, 1, 'apcu:status', NULL),
                                                                                                                                                                                  (9, 'Hourly task (12)', 'PT12H', 'Runs every 12 hours', NULL, '2024-11-29 00:23:50', '2024-11-28 12:23:15', NULL, 0, 1, 'apcu:status', NULL),
                                                                                                                                                                                  (10, 'Daily task', 'P1D', 'Daily log cleanup', NULL, '2024-11-29 12:23:52', '2024-11-28 12:23:15', NULL, 0, 1, 'app:cleanup', NULL),
                                                                                                                                                                                  (11, 'Daily task (noon)', 'P1DT12H', 'Runs every day at noon', NULL, '2024-11-30 00:23:53', '2024-11-28 12:23:15', NULL, 0, 1, 'apcu:status', NULL),
                                                                                                                                                                                  (12, 'Daily at midnight', 'P1DT00H', 'Runs every day at midnight', NULL, '2024-11-29 12:23:51', '2024-11-28 12:23:15', NULL, 0, 1, 'apcu:status', NULL),
                                                                                                                                                                                  (13, 'Weekly task', 'P1W', 'Generates weekly reports', NULL, '2024-12-05 12:23:55', '2024-11-28 12:23:15', NULL, 0, 1, 'app:generate-report', NULL),
                                                                                                                                                                                  (14, 'Monthly task', 'P1M', 'Runs once a month', NULL, '2024-12-28 12:23:57', '2024-11-28 12:23:15', NULL, 0, 1, 'app:monthly-backup', NULL),
                                                                                                                                                                                  (15, 'Monthly task (first day)', 'P1MT00H', 'Runs every month on the first day', NULL, '2024-12-28 12:23:56', '2024-11-28 12:23:15', NULL, 0, 1, 'apcu:status', NULL),
                                                                                                                                                                                  (16, 'Monthly task (last day)', 'P1MT23H', 'Runs every month on the last day', NULL, '2024-12-29 11:23:58', '2024-11-28 12:23:15', NULL, 0, 1, 'apcu:status', NULL),
                                                                                                                                                                                  (17, 'Yearly task', 'P1Y', 'Runs once a year', NULL, '2025-11-28 12:24:00', '2024-11-28 12:23:15', NULL, 0, 1, 'apcu:status', NULL),
                                                                                                                                                                                  (18, 'Yearly task (January)', 'P1YT00H', 'Runs every January', NULL, '2025-11-28 12:23:59', '2024-11-28 12:23:15', NULL, 0, 1, 'apcu:status', NULL),
                                                                                                                                                                                  (19, 'Yearly task (July)', 'P1YT12H', 'Runs every July', NULL, '2025-11-29 00:24:01', '2024-11-28 12:23:15', NULL, 0, 1, 'apcu:status', NULL),
                                                                                                                                                                                  (20, 'Weekly task at midnight', 'P1WT00H', 'Runs every week at 2 AM', NULL, '2024-12-05 12:23:54', '2024-11-28 12:23:15', NULL, 0, 1, 'apcu:status', NULL);

-- Exportiere Struktur von Tabelle database_one.database_dump
DROP TABLE IF EXISTS `database_dump`;
CREATE TABLE IF NOT EXISTS `database_dump` (
                                               `id` int NOT NULL AUTO_INCREMENT,
                                               `file_name` varchar(255) NOT NULL,
    `size` int NOT NULL,
    `created` datetime NOT NULL,
    `database_type` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.database_dump: ~0 rows (ungefähr)
DELETE FROM `database_dump`;

-- Exportiere Struktur von Tabelle database_one.easy_admin_rabbit_mq
DROP TABLE IF EXISTS `easy_admin_rabbit_mq`;
CREATE TABLE IF NOT EXISTS `easy_admin_rabbit_mq` (
                                                      `id` int NOT NULL AUTO_INCREMENT,
                                                      `messages` int NOT NULL,
                                                      `processes` int NOT NULL,
                                                      `bulk` int NOT NULL,
                                                      `log_index` longtext NOT NULL,
                                                      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportiere Daten aus Tabelle database_one.easy_admin_reference: ~1 rows (ungefähr)
DELETE FROM `easy_admin_reference`;
INSERT INTO `easy_admin_reference` (`id`, `text_field`, `slug_field`, `textarea_field`, `text_editor_field`, `code_editor_field`, `boolean_field`, `autocomplete_field`, `checkbox_field`, `radiobutton_field`, `integer_field`, `decimal_field`, `percent_field`, `money_field`, `date_field`, `time_field`, `datetime_field`, `timezone_field`, `country_field`, `currency_field`, `language_field`, `locale_field`, `array_field`, `collection_simple_field`, `collection_complex_field`, `image_field`, `pdf_field`, `color_field`, `email_field`, `telephone_field`, `url_field`, `admin_user_id`) VALUES
    (1, 'Lorem ipsum dolor sit amet', 'lorem-ipsum-dolor-sit-amet', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div>Lorem ipsum <strong>dolor sit amet</strong>, consectetur adipisicing elit, sed do eiusmod tempor incididunt <em>ut labore et dolore</em> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation <a href="#">ullamco laboris nisi</a> ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</div>', '<?php\r\n\r\nnamespace Symfony\\Component\\HttpFoundation;\r\n\r\nclass Request\r\n{\r\n    // ...\r\n    public function getScriptName()\r\n    {\r\n        return $this->server->get(\'SCRIPT_NAME\', $this->server->get(\'ORIG_SCRIPT_NAME\', \'\'));\r\n    }\r\n}', 0, '[0]', '[0, 1]', 2, 7, 81.26, 0.35, 19900, '2024-06-07 00:00:00', '1970-01-01 04:06:00', '2025-03-14 07:06:00', 'Europe/Madrid', 'CR', 'JPY', 'ar', 'zh_Hans_MO', '["Item 1", "Item 2"]', '[]', '[]', 'marvin.png', '/uploads/Scan_20231107_150358.pdf', '#6174d1', 'user@example.com', '+1 800 555 0199', 'https://github.com/EasyCorp/EasyAdminBundle', 2);

-- Exportiere Struktur von Tabelle database_one.ext_log_entries
DROP TABLE IF EXISTS `ext_log_entries`;
CREATE TABLE IF NOT EXISTS `ext_log_entries` (
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
    ) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Exportiere Daten aus Tabelle database_one.ext_log_entries: ~44 rows (ungefähr)
DELETE FROM `ext_log_entries`;
INSERT INTO `ext_log_entries` (`id`, `action`, `logged_at`, `object_id`, `object_class`, `version`, `data`, `username`) VALUES
    (1, 'create', '2024-11-28 12:22:59', '1', 'App\\DataHolder\\Entity\\Mysql\\AdminGroup', 1, '{"id": 1, "name": "Super Admin", "roles": ["ROLE_SUPER_ADMIN"], "description": "Super Admin"}', '- Migration -'),
    (2, 'create', '2024-11-28 12:22:59', '2', 'App\\DataHolder\\Entity\\Mysql\\AdminGroup', 1, '{"id": 2, "name": "Admin", "roles": ["ROLE_ADMIN"], "description": "Admin"}', '- Migration -'),
    (3, 'create', '2024-11-28 12:22:59', '3', 'App\\DataHolder\\Entity\\Mysql\\AdminGroup', 1, '{"id": 3, "name": "User", "roles": ["ROLE_USER"], "description": "No rights User"}', '- Migration -'),
    (4, 'create', '2024-11-28 12:23:01', '1', 'App\\DataHolder\\Entity\\Mysql\\AdminUser', 1, '{"id": 1, "name": "Super Admin", "salt": "57988431", "email": "super-admin@joneddo.de", "roles": ["ROLE_SUPER_ADMIN"], "token": "938ad78e3f5c24ed24d8773745f06865", "comment": "Super Admin", "isLocked": false, "password": "$2y$13$buYss9Le0VVG0U87qo7xiOa5W6KEXUrYVtbGvVUZd64pp/t3AUKVi"}', '- Migration -'),
    (5, 'create', '2024-11-28 12:23:01', '2', 'App\\DataHolder\\Entity\\Mysql\\AdminUser', 1, '{"id": 2, "name": "Admin", "salt": "50368507", "email": "admin@joneddo.de", "roles": ["ROLE_ADMIN"], "token": "592aadb8c7c28ed11f741a31fe62bdbc", "comment": "Admin", "isLocked": false, "password": "$2y$13$2VQZ7yNzE9ck.FAEsuTpEO5q/NVBZy5m27.zQq1G3acPWuPe9fnJy"}', '- Migration -'),
    (6, 'create', '2024-11-28 12:23:01', '3', 'App\\DataHolder\\Entity\\Mysql\\AdminUser', 1, '{"id": 3, "name": "User", "salt": "52206840", "email": "user@joneddo.de", "roles": ["ROLE_USER"], "token": "3a093a9a9fd4bd00237172330dc861ec", "comment": "No rights User", "isLocked": false, "password": "$2y$13$yYnBelFbIOPRbGzcQ56XyOe/sw/p0JwGKwqkOTO6PCgelNaEDO8Gm"}', '- Migration -'),
    (7, 'create', '2024-11-28 12:23:01', '1', 'App\\DataHolder\\Entity\\Mysql\\Address', 1, '{"label": "Example Address", "locality": "Example City", "postalCode": "00000", "streetAddress": "101 Example St."}', '- Migration -'),
    (8, 'create', '2024-11-28 12:23:01', '2', 'App\\DataHolder\\Entity\\Mysql\\Address', 1, '{"label": "Another Example Address", "locality": "Example City", "postalCode": "00000", "streetAddress": "Street 1"}', '- Migration -'),
    (9, 'create', '2024-11-28 12:23:01', '1', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 1, "name": "Second task (1)", "command": "apcu:status", "isActive": true, "description": "Runs every 10 seconds", "scheduleFrequency": "PT1S"}', '- Migration -'),
    (10, 'create', '2024-11-28 12:23:01', '2', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 2, "name": "Second task (11)", "command": "apcu:status", "isActive": true, "description": "Runs every 10 seconds", "scheduleFrequency": "PT11S"}', '- Migration -'),
    (11, 'create', '2024-11-28 12:23:01', '3', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 3, "name": "Second task (30)", "command": "stack:check-services", "isActive": true, "description": "Runs every 30 seconds", "scheduleFrequency": "PT30S"}', '- Migration -'),
    (12, 'create', '2024-11-28 12:23:01', '4', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 4, "name": "Minute task", "command": "import:dbs", "isActive": true, "description": "Imports foreign data sources", "scheduleFrequency": "PT1M"}', '- Migration -'),
    (13, 'create', '2024-11-28 12:23:01', '5', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 5, "name": "Minute task (5)", "command": "apcu:status", "isActive": true, "description": "Runs every 5 minutes", "scheduleFrequency": "PT5M"}', '- Migration -'),
    (14, 'create', '2024-11-28 12:23:01', '6', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 6, "name": "Minute task (15)", "command": "apcu:status", "isActive": true, "description": "Runs every 15 minutes", "scheduleFrequency": "PT15M"}', '- Migration -'),
    (15, 'create', '2024-11-28 12:23:01', '7', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 7, "name": "Hourly task", "command": "app:sync", "isActive": true, "description": "Sync data every hour", "scheduleFrequency": "PT1H"}', '- Migration -'),
    (16, 'create', '2024-11-28 12:23:01', '8', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 8, "name": "Hourly task (6)", "command": "apcu:status", "isActive": true, "description": "Runs every 6 hours", "scheduleFrequency": "PT6H"}', '- Migration -'),
    (17, 'create', '2024-11-28 12:23:01', '9', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 9, "name": "Hourly task (12)", "command": "apcu:status", "isActive": true, "description": "Runs every 12 hours", "scheduleFrequency": "PT12H"}', '- Migration -'),
    (18, 'create', '2024-11-28 12:23:01', '10', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 10, "name": "Daily task", "command": "app:cleanup", "isActive": true, "description": "Daily log cleanup", "scheduleFrequency": "P1D"}', '- Migration -'),
    (19, 'create', '2024-11-28 12:23:01', '11', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 11, "name": "Daily task (noon)", "command": "apcu:status", "isActive": true, "description": "Runs every day at noon", "scheduleFrequency": "P1DT12H"}', '- Migration -'),
    (20, 'create', '2024-11-28 12:23:01', '12', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 12, "name": "Daily at midnight", "command": "apcu:status", "isActive": true, "description": "Runs every day at midnight", "scheduleFrequency": "P1DT00H"}', '- Migration -'),
    (21, 'create', '2024-11-28 12:23:01', '13', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 13, "name": "Weekly task", "command": "app:generate-report", "isActive": true, "description": "Generates weekly reports", "scheduleFrequency": "P1W"}', '- Migration -'),
    (22, 'create', '2024-11-28 12:23:01', '14', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 14, "name": "Monthly task", "command": "app:monthly-backup", "isActive": true, "description": "Runs once a month", "scheduleFrequency": "P1M"}', '- Migration -'),
    (23, 'create', '2024-11-28 12:23:01', '15', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 15, "name": "Monthly task (first day)", "command": "apcu:status", "isActive": true, "description": "Runs every month on the first day", "scheduleFrequency": "P1MT00H"}', '- Migration -'),
    (24, 'create', '2024-11-28 12:23:01', '16', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 16, "name": "Monthly task (last day)", "command": "apcu:status", "isActive": true, "description": "Runs every month on the last day", "scheduleFrequency": "P1MT23H"}', '- Migration -'),
    (25, 'create', '2024-11-28 12:23:01', '17', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 17, "name": "Yearly task", "command": "apcu:status", "isActive": true, "description": "Runs once a year", "scheduleFrequency": "P1Y"}', '- Migration -'),
    (26, 'create', '2024-11-28 12:23:01', '18', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 18, "name": "Yearly task (January)", "command": "apcu:status", "isActive": true, "description": "Runs every January", "scheduleFrequency": "P1YT00H"}', '- Migration -'),
    (27, 'create', '2024-11-28 12:23:01', '19', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 19, "name": "Yearly task (July)", "command": "apcu:status", "isActive": true, "description": "Runs every July", "scheduleFrequency": "P1YT12H"}', '- Migration -'),
    (28, 'create', '2024-11-28 12:23:01', '20', 'App\\DataHolder\\Entity\\Mysql\\CronJob', 1, '{"id": 20, "name": "Weekly task at midnight", "command": "apcu:status", "isActive": true, "description": "Runs every week at 2 AM", "scheduleFrequency": "P1WT00H"}', '- Migration -'),
    (29, 'create', '2024-11-28 12:23:01', '1', 'App\\DataHolder\\Entity\\Mysql\\Process', 1, '{"code": "EXPRCS-1", "label": "Example Process", "status": true}', '- Migration -'),
    (30, 'create', '2024-11-28 12:23:01', '2', 'App\\DataHolder\\Entity\\Mysql\\Process', 1, '{"code": "EXPRCS-2", "label": "Second Example Process", "status": false}', '- Migration -'),
    (31, 'create', '2024-11-28 12:23:01', '3', 'App\\DataHolder\\Entity\\Mysql\\Process', 1, '{"code": "EXPRCS-3", "label": "Third Example Process", "status": true}', '- Migration -'),
    (32, 'create', '2024-11-28 12:23:01', '1', 'App\\DataHolder\\Entity\\Mysql\\Service', 1, '{"code": "EXSRVC-1", "attr1": "Attr 1", "attr2": 42, "label": "Example Process"}', '- Migration -'),
    (33, 'create', '2024-11-28 12:23:01', '2', 'App\\DataHolder\\Entity\\Mysql\\Service', 1, '{"code": "EXSRVC-2", "attr1": "Attr 1, but different", "attr2": 1337, "label": "Second Example Process"}', '- Migration -'),
    (34, 'create', '2024-11-28 12:23:01', '3', 'App\\DataHolder\\Entity\\Mysql\\Service', 1, '{"code": "EXSRVC-3", "attr1": "Another Attr 1", "attr2": 0, "label": "Third Example Process"}', '- Migration -'),
    (35, 'create', '2024-11-28 12:23:01', '1', 'App\\DataHolder\\Entity\\Mysql\\SupportService', 1, '{"attr1": "Attr 1", "attr2": "Attr 2", "attr3": "Attr 3", "label": "Example Support Service"}', '- Migration -'),
    (36, 'create', '2024-11-28 12:23:01', '2', 'App\\DataHolder\\Entity\\Mysql\\SupportService', 1, '{"attr1": null, "attr2": null, "attr3": "Some Attr 3", "label": "Another Example Support Service"}', '- Migration -'),
    (37, 'create', '2024-11-28 12:23:01', '1', 'App\\DataHolder\\Entity\\Mysql\\Tenant', 1, '{"url": "https://example.org", "code": "EXTNT-1", "attr1": "Attr 1", "attr2": "Attr 2", "label": "Example Tenant", "status": true, "process": {"id": 2}}', '- Migration -'),
    (38, 'create', '2024-11-28 12:23:01', '2', 'App\\DataHolder\\Entity\\Mysql\\Tenant', 1, '{"url": null, "code": "EXTNT-2", "attr1": null, "attr2": "Attr 2", "label": "Another Example Tenant", "status": false, "process": {"id": 3}}', '- Migration -'),
    (39, 'create', '2024-11-28 12:23:01', '1', 'App\\DataHolder\\Entity\\Mysql\\BranchOffice', 1, '{"code": "EXBRNCH-1", "label": "Example Branch Office", "server": "192.168.0.1", "tenant": {"id": 1}, "address": {"id": 1}}', '- Migration -'),
    (40, 'create', '2024-11-28 12:23:01', '2', 'App\\DataHolder\\Entity\\Mysql\\BranchOffice', 1, '{"code": "EXBRNCH-2", "label": "Second Example Branch Office", "server": "192.168.0.2", "tenant": {"id": 2}, "address": {"id": 1}}', '- Migration -'),
    (41, 'create', '2024-11-28 12:23:01', '3', 'App\\DataHolder\\Entity\\Mysql\\BranchOffice', 1, '{"code": "EXBRNCH-3", "label": "Third Example Branch Office", "server": "localhost", "tenant": {"id": 2}, "address": {"id": 2}}', '- Migration -'),
    (42, 'create', '2024-11-28 12:23:01', '1', 'App\\DataHolder\\Entity\\Mysql\\Computer', 1, '{"dn": "cn=Computer 1,ou=Computers,dn=example,dn=org", "ou": "ou=Computers,dn=example,dn=org", "type": "desktop", "label": "Example Computer", "origin": null, "imported": null, "lastLogon": null, "destination": null}', '- Migration -'),
    (43, 'create', '2024-11-28 12:23:02', '1', 'App\\DataHolder\\Entity\\Mysql\\Order', 1, '{"code": "EXORDR-1", "type": "local", "attr1": "Attr 1", "label": "Example Order", "service": {"id": 1}}', '- Migration -'),
    (44, 'create', '2024-11-28 12:23:02', '2', 'App\\DataHolder\\Entity\\Mysql\\Order', 1, '{"code": "EXORDR-2", "type": "remote", "attr1": "Attr 1 (different)", "label": "Another Example Order", "service": {"id": 2}}', '- Migration -');

-- Exportiere Struktur von Tabelle database_one.migration_versions
DROP TABLE IF EXISTS `migration_versions`;

-- Exportiere Struktur von Tabelle database_one.order
DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
                                       `id` int NOT NULL AUTO_INCREMENT,
                                       `code` varchar(64) DEFAULT NULL,
    `label` varchar(255) DEFAULT NULL,
    `type` varchar(16) NOT NULL,
    `attr1` varchar(255) DEFAULT NULL,
    `service_id` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UNIQ_F5299398ED5CA9E6` (`service_id`),
    CONSTRAINT `FK_F5299398ED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.order: ~2 rows (ungefähr)
DELETE FROM `order`;
INSERT INTO `order` (`id`, `code`, `label`, `type`, `attr1`, `service_id`) VALUES
                                                                               (1, 'EXORDR-1', 'Example Order', 'local', 'Attr 1', 1),
                                                                               (2, 'EXORDR-2', 'Another Example Order', 'remote', 'Attr 1 (different)', 2);

-- Exportiere Struktur von Tabelle database_one.order_tenant
DROP TABLE IF EXISTS `order_tenant`;
CREATE TABLE IF NOT EXISTS `order_tenant` (
                                              `order_id` int NOT NULL,
                                              `tenant_id` int NOT NULL,
                                              PRIMARY KEY (`order_id`,`tenant_id`),
    KEY `IDX_8DD6D4B78D9F6D38` (`order_id`),
    KEY `IDX_8DD6D4B79033212A` (`tenant_id`),
    CONSTRAINT `FK_8DD6D4B78D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
    CONSTRAINT `FK_8DD6D4B79033212A` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.order_tenant: ~3 rows (ungefähr)
DELETE FROM `order_tenant`;
INSERT INTO `order_tenant` (`order_id`, `tenant_id`) VALUES
                                                         (1, 1),
                                                         (1, 2),
                                                         (2, 2);

-- Exportiere Struktur von Tabelle database_one.process
DROP TABLE IF EXISTS `process`;
CREATE TABLE IF NOT EXISTS `process` (
                                         `id` int NOT NULL AUTO_INCREMENT,
                                         `code` varchar(64) NOT NULL,
    `label` varchar(255) DEFAULT NULL,
    `status` tinyint(1) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.process: ~3 rows (ungefähr)
DELETE FROM `process`;
INSERT INTO `process` (`id`, `code`, `label`, `status`) VALUES
                                                            (1, 'EXPRCS-1', 'Example Process', 1),
                                                            (2, 'EXPRCS-2', 'Second Example Process', 0),
                                                            (3, 'EXPRCS-3', 'Third Example Process', 1);

-- Exportiere Struktur von Tabelle database_one.service
DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
                                         `id` int NOT NULL AUTO_INCREMENT,
                                         `code` varchar(64) NOT NULL,
    `label` varchar(255) DEFAULT NULL,
    `attr1` varchar(255) DEFAULT NULL,
    `attr2` int DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.service: ~3 rows (ungefähr)
DELETE FROM `service`;
INSERT INTO `service` (`id`, `code`, `label`, `attr1`, `attr2`) VALUES
                                                                    (1, 'EXSRVC-1', 'Example Process', 'Attr 1', 42),
                                                                    (2, 'EXSRVC-2', 'Second Example Process', 'Attr 1, but different', 1337),
                                                                    (3, 'EXSRVC-3', 'Third Example Process', 'Another Attr 1', 0);

-- Exportiere Struktur von Tabelle database_one.support_service
DROP TABLE IF EXISTS `support_service`;
CREATE TABLE IF NOT EXISTS `support_service` (
     `id` int NOT NULL AUTO_INCREMENT,
     `label` varchar(255) DEFAULT NULL,
    `attr1` varchar(255) DEFAULT NULL,
    `attr2` varchar(255) DEFAULT NULL,
    `attr3` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.support_service: ~2 rows (ungefähr)
DELETE FROM `support_service`;
INSERT INTO `support_service` (`id`, `label`, `attr1`, `attr2`, `attr3`) VALUES
     (1, 'Example Support Service', 'Attr 1', 'Attr 2', 'Attr 3'),
     (2, 'Another Example Support Service', NULL, NULL, 'Some Attr 3');

-- Exportiere Struktur von Tabelle database_one.tenant
DROP TABLE IF EXISTS `tenant`;
CREATE TABLE IF NOT EXISTS `tenant` (
    `id` int NOT NULL AUTO_INCREMENT,
    `label` varchar(255) NOT NULL,
    `code` varchar(64) NOT NULL,
    `url` varchar(255) DEFAULT NULL,
    `status` tinyint(1) NOT NULL,
    `attr1` varchar(255) DEFAULT NULL,
    `attr2` varchar(64) DEFAULT NULL,
    `process_id` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UNIQ_4E59C4627EC2F574` (`process_id`),
    CONSTRAINT `FK_4E59C4627EC2F574` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle database_one.tenant: ~2 rows (ungefähr)
DELETE FROM `tenant`;
INSERT INTO `tenant` (`id`, `label`, `code`, `url`, `status`, `attr1`, `attr2`, `process_id`) VALUES
                                                                                                  (1, 'Example Tenant', 'EXTNT-1', 'https://example.org', 1, 'Attr 1', 'Attr 2', 2),
                                                                                                  (2, 'Another Example Tenant', 'EXTNT-2', NULL, 0, NULL, 'Attr 2', 3);
/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
