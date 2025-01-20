CREATE DATABASE IF NOT EXISTS photoprism;

CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'test123';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;


-- --------------------------------------------------------
-- Host:                         localhost
-- Server-Version:               11.6.2-MariaDB-ubu2404 - mariadb.org binary distribution
-- Server-Betriebssystem:        debian-linux-gnu
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank-Struktur für photoprism
CREATE DATABASE IF NOT EXISTS `photoprism` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `photoprism`;

-- Exportiere Struktur von Tabelle photoprism.albums
DROP TABLE IF EXISTS `albums`;
CREATE TABLE IF NOT EXISTS `albums` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `album_uid` varbinary(42) DEFAULT NULL,
    `parent_uid` varbinary(42) DEFAULT '',
    `album_slug` varbinary(160) DEFAULT NULL,
    `album_path` varchar(1024) DEFAULT NULL,
    `album_type` varbinary(8) DEFAULT 'album',
    `album_title` varchar(160) DEFAULT NULL,
    `album_location` varchar(160) DEFAULT NULL,
    `album_category` varchar(100) DEFAULT NULL,
    `album_caption` varchar(1024) DEFAULT NULL,
    `album_description` varchar(2048) DEFAULT NULL,
    `album_notes` varchar(1024) DEFAULT NULL,
    `album_filter` varbinary(2048) DEFAULT '',
    `album_order` varbinary(32) DEFAULT NULL,
    `album_template` varbinary(255) DEFAULT NULL,
    `album_state` varchar(100) DEFAULT NULL,
    `album_country` varbinary(2) DEFAULT 'zz',
    `album_year` int(11) DEFAULT NULL,
    `album_month` int(11) DEFAULT NULL,
    `album_day` int(11) DEFAULT NULL,
    `album_favorite` tinyint(1) DEFAULT NULL,
    `album_private` tinyint(1) DEFAULT NULL,
    `thumb` varbinary(128) DEFAULT '',
    `thumb_src` varbinary(8) DEFAULT '',
    `created_by` varbinary(42) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `published_at` datetime DEFAULT NULL,
    `deleted_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uix_albums_album_uid` (`album_uid`),
    KEY `idx_albums_published_at` (`published_at`),
    KEY `idx_albums_album_slug` (`album_slug`),
    KEY `idx_albums_album_state` (`album_state`),
    KEY `idx_albums_country_year_month` (`album_country`,`album_year`,`album_month`),
    KEY `idx_albums_ymd` (`album_day`),
    KEY `idx_albums_created_by` (`created_by`),
    KEY `idx_albums_album_path` (`album_path`(768)),
    KEY `idx_albums_album_title` (`album_title`),
    KEY `idx_albums_album_category` (`album_category`),
    KEY `idx_albums_thumb` (`thumb`),
    KEY `idx_albums_deleted_at` (`deleted_at`),
    KEY `idx_albums_album_filter` (`album_filter`(512))
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.albums: ~3 rows (ungefähr)
DELETE FROM `albums`;
INSERT INTO `albums` (`id`, `album_uid`, `parent_uid`, `album_slug`, `album_path`, `album_type`, `album_title`, `album_location`, `album_category`, `album_caption`, `album_description`, `album_notes`, `album_filter`, `album_order`, `album_template`, `album_state`, `album_country`, `album_year`, `album_month`, `album_day`, `album_favorite`, `album_private`, `thumb`, `thumb_src`, `created_by`, `created_at`, `updated_at`, `published_at`, `deleted_at`) VALUES
                                                                                                                                                                                                                                                                                                                                                                                                                                                                         (1, _binary 0x61736d663578696e3534336861396d6f, _binary '', _binary 0x32303234, '2024', _binary 0x666f6c646572, '2024', '', '', '', '', '', _binary 0x706174683a32303234207075626c69633a74727565, _binary 0x6164646564, _binary '', '', _binary 0x7a7a, 2024, 11, 0, 0, 0, NULL, _binary '', _binary '', '2024-11-04 09:20:06', '2024-11-04 09:20:06', NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                         (2, _binary 0x61736d663578697a6178623879716b31, _binary '', _binary 0x323032342d3131, '2024/11', _binary 0x666f6c646572, 'November 2024', '', '', '', '', '', _binary 0x706174683a323032342f3131207075626c69633a74727565, _binary 0x6164646564, _binary '', '', _binary 0x7a7a, 2024, 11, 1, 0, 0, _binary 0x35313831623237376634363966653466396432613836666336383137643963303566316465316263, _binary '', _binary '', '2024-11-04 09:20:06', '2024-11-04 09:20:06', NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                         (3, _binary 0x61736d66366c38336836327771353965, _binary '', _binary 0x6e6f76656d6265722d32303234, '', _binary 0x6d6f6e7468, 'November 2024', '', '', '', '', '', _binary 0x7075626c69633a7472756520796561723a32303234206d6f6e74683a3131, _binary 0x6f6c64657374, _binary '', '', _binary 0x7a7a, 2024, 11, 0, 0, 0, _binary 0x35313831623237376634363966653466396432613836666336383137643963303566316465316263, _binary '', _binary '', '2024-11-04 09:34:20', '2024-11-04 09:34:20', NULL, NULL);

-- Exportiere Struktur von Tabelle photoprism.albums_users
DROP TABLE IF EXISTS `albums_users`;
CREATE TABLE IF NOT EXISTS `albums_users` (
    `uid` varbinary(42) NOT NULL,
    `user_uid` varbinary(42) NOT NULL,
    `team_uid` varbinary(42) DEFAULT NULL,
    `perm` int(10) unsigned DEFAULT NULL,
    PRIMARY KEY (`uid`,`user_uid`),
    KEY `idx_albums_users_user_uid` (`user_uid`),
    KEY `idx_albums_users_team_uid` (`team_uid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.albums_users: ~0 rows (ungefähr)
DELETE FROM `albums_users`;

-- Exportiere Struktur von Tabelle photoprism.audit_logins
DROP TABLE IF EXISTS `audit_logins`;
CREATE TABLE IF NOT EXISTS `audit_logins` (
    `client_ip` varchar(64) NOT NULL,
    `login_name` varchar(64) NOT NULL,
    `login_realm` varchar(64) NOT NULL,
    `login_status` varchar(32) DEFAULT NULL,
    `error_message` varchar(512) DEFAULT NULL,
    `error_repeated` bigint(20) DEFAULT NULL,
    `client_browser` varchar(512) DEFAULT NULL,
    `login_at` datetime DEFAULT NULL,
    `failed_at` datetime DEFAULT NULL,
    `banned_at` datetime DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`client_ip`,`login_name`,`login_realm`),
    KEY `idx_audit_logins_failed_at` (`failed_at`),
    KEY `idx_audit_logins_banned_at` (`banned_at`),
    KEY `idx_audit_logins_updated_at` (`updated_at`),
    KEY `idx_audit_logins_login_name` (`login_name`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.audit_logins: ~0 rows (ungefähr)
DELETE FROM `audit_logins`;
INSERT INTO `audit_logins` (`client_ip`, `login_name`, `login_realm`, `login_status`, `error_message`, `error_repeated`, `client_browser`, `login_at`, `failed_at`, `banned_at`, `created_at`, `updated_at`) VALUES
                                                                                                                                                                                                                 ('172.18.0.1', 'admin', 'api', 'OK', '', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-15 12:42:38', NULL, NULL, '2024-11-04 09:16:07', '2025-01-15 12:42:38'),
                                                                                                                                                                                                                 ('172.20.0.1', 'admin', 'api', 'OK', '', 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-14 09:43:06', NULL, NULL, '2025-01-14 09:43:06', '2025-01-14 09:43:06');

-- Exportiere Struktur von Tabelle photoprism.auth_clients
DROP TABLE IF EXISTS `auth_clients`;
CREATE TABLE IF NOT EXISTS `auth_clients` (
    `client_uid` varbinary(42) NOT NULL,
    `user_uid` varbinary(42) DEFAULT '',
    `user_name` varchar(200) DEFAULT NULL,
    `client_name` varchar(200) DEFAULT NULL,
    `client_role` varchar(64) DEFAULT '',
    `client_type` varbinary(16) DEFAULT NULL,
    `client_url` varbinary(255) DEFAULT '',
    `callback_url` varbinary(255) DEFAULT '',
    `auth_provider` varbinary(128) DEFAULT '',
    `auth_method` varbinary(128) DEFAULT '',
    `auth_scope` varchar(1024) DEFAULT '',
    `auth_expires` bigint(20) DEFAULT NULL,
    `auth_tokens` bigint(20) DEFAULT NULL,
    `auth_enabled` tinyint(1) DEFAULT NULL,
    `last_active` bigint(20) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`client_uid`),
    KEY `idx_auth_clients_user_uid` (`user_uid`),
    KEY `idx_auth_clients_user_name` (`user_name`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.auth_clients: ~0 rows (ungefähr)
DELETE FROM `auth_clients`;

-- Exportiere Struktur von Tabelle photoprism.auth_sessions
DROP TABLE IF EXISTS `auth_sessions`;
CREATE TABLE IF NOT EXISTS `auth_sessions` (
    `id` varbinary(2048) NOT NULL,
    `user_uid` varbinary(42) DEFAULT '',
    `user_name` varchar(200) DEFAULT NULL,
    `client_uid` varbinary(42) DEFAULT '',
    `client_name` varchar(200) DEFAULT '',
    `client_ip` varchar(64) DEFAULT NULL,
    `auth_provider` varbinary(128) DEFAULT '',
    `auth_method` varbinary(128) DEFAULT '',
    `auth_issuer` varbinary(255) DEFAULT '',
    `auth_id` varbinary(255) DEFAULT '',
    `auth_scope` varchar(1024) DEFAULT '',
    `grant_type` varbinary(64) DEFAULT '',
    `last_active` bigint(20) DEFAULT NULL,
    `sess_expires` bigint(20) DEFAULT NULL,
    `sess_timeout` bigint(20) DEFAULT NULL,
    `preview_token` varbinary(64) DEFAULT '',
    `download_token` varbinary(64) DEFAULT '',
    `access_token` varbinary(4096) DEFAULT '',
    `refresh_token` varbinary(2048) DEFAULT NULL,
    `id_token` varbinary(2048) DEFAULT NULL,
    `user_agent` varchar(512) DEFAULT NULL,
    `data_json` varbinary(4096) DEFAULT NULL,
    `ref_id` varbinary(16) DEFAULT '',
    `login_ip` varchar(64) DEFAULT NULL,
    `login_at` datetime DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_auth_sessions_user_uid` (`user_uid`),
    KEY `idx_auth_sessions_user_name` (`user_name`),
    KEY `idx_auth_sessions_client_uid` (`client_uid`),
    KEY `idx_auth_sessions_client_ip` (`client_ip`),
    KEY `idx_auth_sessions_auth_id` (`auth_id`),
    KEY `idx_auth_sessions_sess_expires` (`sess_expires`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.auth_sessions: ~1 rows (ungefähr)
DELETE FROM `auth_sessions`;
INSERT INTO `auth_sessions` (`id`, `user_uid`, `user_name`, `client_uid`, `client_name`, `client_ip`, `auth_provider`, `auth_method`, `auth_issuer`, `auth_id`, `auth_scope`, `grant_type`, `last_active`, `sess_expires`, `sess_timeout`, `preview_token`, `download_token`, `access_token`, `refresh_token`, `id_token`, `user_agent`, `data_json`, `ref_id`, `login_ip`, `login_at`, `created_at`, `updated_at`) VALUES
                                                                                                                                                                                                                                                                                                                                                                                                                        (_binary 0x61373361623035393661643635353332653662363939646430353462306436666131613062333339313935633862353536366134626231336230376139386235, _binary 0x75736d653437767a64783534766c3576, 'admin', _binary '', '', '172.18.0.1', _binary 0x6c6f63616c, _binary 0x64656661756c74, _binary '', _binary '', '', _binary 0x70617373776f7264, 1736944958, 1738154558, 604800, _binary 0x306c683070707979, _binary 0x33366e7238703937, _binary '', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL, _binary 0x73657373726a69316c6b6161, '172.18.0.1', '2025-01-15 12:42:38', '2025-01-15 12:42:38', '2025-01-15 12:42:38'),
                                                                                                                                                                                                                                                                                                                                                                                                                        (_binary 0x63346563656531346131616337363938356637343239653437643335313262373661336337613666373431646163303663393935363061636537363064393236, _binary 0x75736d653437767a64783534766c3576, 'admin', _binary '', '', '172.20.0.1', _binary 0x6c6f63616c, _binary 0x64656661756c74, _binary '', _binary '', '', _binary 0x70617373776f7264, 1736847786, 1738057386, 604800, _binary 0x306c683070707979, _binary 0x33366e7238703937, _binary '', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL, _binary 0x73657373776b726a37676371, '172.20.0.1', '2025-01-14 09:43:06', '2025-01-14 09:43:06', '2025-01-14 09:43:06'),
                                                                                                                                                                                                                                                                                                                                                                                                                        (_binary 0x66626133356337323566383136333265383733376333643264363838663633636430626638626662623661663736613733623464626539323764653932646532, _binary 0x75736d653437767a64783534766c3576, 'admin', _binary '', '', '172.18.0.1', _binary 0x6c6f63616c, _binary 0x64656661756c74, _binary '', _binary '', '', _binary 0x70617373776f7264, 1736859210, 1738068810, 604800, _binary 0x306c683070707979, _binary 0x33366e7238703937, _binary '', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', NULL, _binary 0x736573736c30763578773932, '172.18.0.1', '2025-01-14 12:53:30', '2025-01-14 12:53:30', '2025-01-14 12:53:30');

-- Exportiere Struktur von Tabelle photoprism.auth_users
DROP TABLE IF EXISTS `auth_users`;
CREATE TABLE IF NOT EXISTS `auth_users` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `user_uuid` varbinary(64) DEFAULT NULL,
    `user_uid` varbinary(42) DEFAULT NULL,
    `auth_provider` varbinary(128) DEFAULT '',
    `auth_method` varbinary(128) DEFAULT '',
    `auth_issuer` varbinary(255) DEFAULT '',
    `auth_id` varbinary(255) DEFAULT '',
    `user_name` varchar(200) DEFAULT NULL,
    `display_name` varchar(200) DEFAULT NULL,
    `user_email` varchar(255) DEFAULT NULL,
    `backup_email` varchar(255) DEFAULT NULL,
    `user_role` varchar(64) DEFAULT '',
    `user_attr` varchar(1024) DEFAULT NULL,
    `super_admin` tinyint(1) DEFAULT NULL,
    `can_login` tinyint(1) DEFAULT NULL,
    `login_at` datetime DEFAULT NULL,
    `expires_at` datetime DEFAULT NULL,
    `webdav` tinyint(1) DEFAULT NULL,
    `base_path` varbinary(1024) DEFAULT NULL,
    `upload_path` varbinary(1024) DEFAULT NULL,
    `can_invite` tinyint(1) DEFAULT NULL,
    `invite_token` varbinary(64) DEFAULT NULL,
    `invited_by` varchar(64) DEFAULT NULL,
    `verify_token` varbinary(64) DEFAULT NULL,
    `verified_at` datetime DEFAULT NULL,
    `consent_at` datetime DEFAULT NULL,
    `born_at` datetime DEFAULT NULL,
    `reset_token` varbinary(64) DEFAULT NULL,
    `preview_token` varbinary(64) DEFAULT NULL,
    `download_token` varbinary(64) DEFAULT NULL,
    `thumb` varbinary(128) DEFAULT '',
    `thumb_src` varbinary(8) DEFAULT '',
    `ref_id` varbinary(16) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `deleted_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uix_auth_users_user_uid` (`user_uid`),
    KEY `idx_auth_users_user_email` (`user_email`),
    KEY `idx_auth_users_expires_at` (`expires_at`),
    KEY `idx_auth_users_invite_token` (`invite_token`),
    KEY `idx_auth_users_born_at` (`born_at`),
    KEY `idx_auth_users_thumb` (`thumb`),
    KEY `idx_auth_users_user_uuid` (`user_uuid`),
    KEY `idx_auth_users_auth_id` (`auth_id`),
    KEY `idx_auth_users_user_name` (`user_name`),
    KEY `idx_auth_users_deleted_at` (`deleted_at`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.auth_users: ~2 rows (ungefähr)
DELETE FROM `auth_users`;
INSERT INTO `auth_users` (`id`, `user_uuid`, `user_uid`, `auth_provider`, `auth_method`, `auth_issuer`, `auth_id`, `user_name`, `display_name`, `user_email`, `backup_email`, `user_role`, `user_attr`, `super_admin`, `can_login`, `login_at`, `expires_at`, `webdav`, `base_path`, `upload_path`, `can_invite`, `invite_token`, `invited_by`, `verify_token`, `verified_at`, `consent_at`, `born_at`, `reset_token`, `preview_token`, `download_token`, `thumb`, `thumb_src`, `ref_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (-2, _binary '', _binary 0x75303030303030303030303030303032, _binary 0x6c696e6b, _binary '', _binary '', _binary '', '', 'Visitor', '', '', 'visitor', '', 0, 0, NULL, NULL, 0, _binary '', _binary '', 0, _binary '', '', _binary '', NULL, NULL, NULL, _binary '', _binary '', _binary '', _binary '', _binary '', _binary 0x7573657277766e6776767330, '2024-11-03 19:45:31', '2024-11-03 19:45:31', NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (-1, _binary '', _binary 0x75303030303030303030303030303031, _binary 0x6e6f6e65, _binary '', _binary '', _binary '', '', 'Unknown', '', '', '', '', 0, 0, NULL, NULL, 0, _binary '', _binary '', 0, _binary '', '', _binary '', NULL, NULL, NULL, _binary '', _binary '', _binary '', _binary '', _binary '', _binary 0x7573657262706569346e7577, '2024-11-03 19:45:31', '2024-11-03 19:45:31', NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (1, _binary '', _binary 0x75736d653437767a64783534766c3576, _binary 0x6c6f63616c, _binary '', _binary '', _binary '', 'admin', 'Admin', '', '', 'admin', '', 1, 1, '2025-01-15 12:42:38', NULL, 1, _binary '', _binary '', 1, _binary 0x7835383665377270, '', _binary '', NULL, NULL, NULL, _binary '', _binary 0x306c683070707979, _binary 0x33366e7238703937, _binary '', _binary '', _binary 0x7573657239323568626c3176, '2024-11-03 19:45:31', '2024-11-03 19:45:31', NULL);

-- Exportiere Struktur von Tabelle photoprism.auth_users_details
DROP TABLE IF EXISTS `auth_users_details`;
CREATE TABLE IF NOT EXISTS `auth_users_details` (
    `user_uid` varbinary(42) NOT NULL,
    `subj_uid` varbinary(42) DEFAULT NULL,
    `subj_src` varbinary(8) DEFAULT '',
    `place_id` varbinary(42) DEFAULT 'zz',
    `place_src` varbinary(8) DEFAULT NULL,
    `cell_id` varbinary(42) DEFAULT 'zz',
    `birth_year` int(11) DEFAULT NULL,
    `birth_month` int(11) DEFAULT NULL,
    `birth_day` int(11) DEFAULT NULL,
    `name_title` varchar(32) DEFAULT NULL,
    `given_name` varchar(64) DEFAULT NULL,
    `middle_name` varchar(64) DEFAULT NULL,
    `family_name` varchar(64) DEFAULT NULL,
    `name_suffix` varchar(32) DEFAULT NULL,
    `nick_name` varchar(64) DEFAULT NULL,
    `name_src` varbinary(8) DEFAULT NULL,
    `user_gender` varchar(16) DEFAULT NULL,
    `user_about` varchar(512) DEFAULT NULL,
    `user_bio` varchar(2048) DEFAULT NULL,
    `user_location` varchar(512) DEFAULT NULL,
    `user_country` varbinary(2) DEFAULT NULL,
    `user_phone` varchar(32) DEFAULT NULL,
    `site_url` varbinary(512) DEFAULT NULL,
    `profile_url` varbinary(512) DEFAULT NULL,
    `feed_url` varbinary(512) DEFAULT NULL,
    `avatar_url` varbinary(512) DEFAULT NULL,
    `org_title` varchar(64) DEFAULT NULL,
    `org_name` varchar(128) DEFAULT NULL,
    `org_email` varchar(255) DEFAULT NULL,
    `org_phone` varchar(32) DEFAULT NULL,
    `org_url` varbinary(512) DEFAULT NULL,
    `id_url` varbinary(512) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`user_uid`),
    KEY `idx_auth_users_details_org_email` (`org_email`),
    KEY `idx_auth_users_details_subj_uid` (`subj_uid`),
    KEY `idx_auth_users_details_place_id` (`place_id`),
    KEY `idx_auth_users_details_cell_id` (`cell_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.auth_users_details: ~3 rows (ungefähr)
DELETE FROM `auth_users_details`;
INSERT INTO `auth_users_details` (`user_uid`, `subj_uid`, `subj_src`, `place_id`, `place_src`, `cell_id`, `birth_year`, `birth_month`, `birth_day`, `name_title`, `given_name`, `middle_name`, `family_name`, `name_suffix`, `nick_name`, `name_src`, `user_gender`, `user_about`, `user_bio`, `user_location`, `user_country`, `user_phone`, `site_url`, `profile_url`, `feed_url`, `avatar_url`, `org_title`, `org_name`, `org_email`, `org_phone`, `org_url`, `id_url`, `created_at`, `updated_at`) VALUES
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           (_binary 0x75303030303030303030303030303031, _binary '', _binary '', _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, '', '', '', '', '', '', _binary '', '', '', '', '', _binary '', '', _binary '', _binary '', _binary '', _binary '', '', '', '', '', _binary '', _binary '', '2024-11-03 19:45:31', '2024-11-03 19:45:31'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           (_binary 0x75303030303030303030303030303032, _binary '', _binary '', _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, '', '', '', '', '', '', _binary '', '', '', '', '', _binary '', '', _binary '', _binary '', _binary '', _binary '', '', '', '', '', _binary '', _binary '', '2024-11-03 19:45:31', '2024-11-03 19:45:31'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           (_binary 0x75736d653437767a64783534766c3576, _binary '', _binary '', _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, '', '', '', '', '', '', _binary '', '', '', '', '', _binary '', '', _binary '', _binary '', _binary '', _binary '', '', '', '', '', _binary '', _binary '', '2024-11-03 19:45:31', '2024-11-03 19:45:31');

-- Exportiere Struktur von Tabelle photoprism.auth_users_settings
DROP TABLE IF EXISTS `auth_users_settings`;
CREATE TABLE IF NOT EXISTS `auth_users_settings` (
    `user_uid` varbinary(42) NOT NULL,
    `ui_theme` varbinary(32) DEFAULT NULL,
    `ui_language` varbinary(32) DEFAULT NULL,
    `ui_time_zone` varbinary(64) DEFAULT NULL,
    `maps_style` varbinary(32) DEFAULT NULL,
    `maps_animate` int(11) DEFAULT 0,
    `index_path` varbinary(1024) DEFAULT NULL,
    `index_rescan` int(11) DEFAULT 0,
    `import_path` varbinary(1024) DEFAULT NULL,
    `import_move` int(11) DEFAULT 0,
    `download_originals` int(11) DEFAULT 0,
    `download_media_raw` int(11) DEFAULT 0,
    `download_media_sidecar` int(11) DEFAULT 0,
    `upload_path` varbinary(1024) DEFAULT NULL,
    `default_page` varbinary(128) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`user_uid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.auth_users_settings: ~2 rows (ungefähr)
DELETE FROM `auth_users_settings`;
INSERT INTO `auth_users_settings` (`user_uid`, `ui_theme`, `ui_language`, `ui_time_zone`, `maps_style`, `maps_animate`, `index_path`, `index_rescan`, `import_path`, `import_move`, `download_originals`, `download_media_raw`, `download_media_sidecar`, `upload_path`, `default_page`, `created_at`, `updated_at`) VALUES
                                                                                                                                                                                                                                                                                                                         (_binary 0x75303030303030303030303030303031, _binary '', _binary '', _binary '', _binary '', 0, _binary '', 0, _binary '', 0, 0, 0, 0, _binary '', _binary '', '2024-11-03 19:45:31', '2024-11-03 19:45:31'),
                                                                                                                                                                                                                                                                                                                         (_binary 0x75303030303030303030303030303032, _binary '', _binary '', _binary '', _binary '', 0, _binary '', 0, _binary '', 0, 0, 0, 0, _binary '', _binary '', '2024-11-03 19:45:31', '2024-11-03 19:45:31'),
                                                                                                                                                                                                                                                                                                                         (_binary 0x75736d653437767a64783534766c3576, _binary '', _binary '', _binary '', _binary '', 0, _binary '', 0, _binary '', 0, 0, 0, 0, _binary '', _binary '', '2024-11-03 19:45:31', '2024-11-03 19:45:31');

-- Exportiere Struktur von Tabelle photoprism.auth_users_shares
DROP TABLE IF EXISTS `auth_users_shares`;
CREATE TABLE IF NOT EXISTS `auth_users_shares` (
    `user_uid` varbinary(42) NOT NULL,
    `share_uid` varbinary(42) NOT NULL,
    `link_uid` varbinary(42) DEFAULT NULL,
    `expires_at` datetime DEFAULT NULL,
    `comment` varchar(512) DEFAULT NULL,
    `perm` int(10) unsigned DEFAULT NULL,
    `ref_id` varbinary(16) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`user_uid`,`share_uid`),
    KEY `idx_auth_users_shares_share_uid` (`share_uid`),
    KEY `idx_auth_users_shares_expires_at` (`expires_at`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.auth_users_shares: ~0 rows (ungefähr)
DELETE FROM `auth_users_shares`;

-- Exportiere Struktur von Tabelle photoprism.cameras
DROP TABLE IF EXISTS `cameras`;
CREATE TABLE IF NOT EXISTS `cameras` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `camera_slug` varbinary(160) DEFAULT NULL,
    `camera_name` varchar(160) DEFAULT NULL,
    `camera_make` varchar(160) DEFAULT NULL,
    `camera_model` varchar(160) DEFAULT NULL,
    `camera_type` varchar(100) DEFAULT NULL,
    `camera_description` varchar(2048) DEFAULT NULL,
    `camera_notes` varchar(1024) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `deleted_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uix_cameras_camera_slug` (`camera_slug`),
    KEY `idx_cameras_deleted_at` (`deleted_at`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.cameras: ~0 rows (ungefähr)
DELETE FROM `cameras`;
INSERT INTO `cameras` (`id`, `camera_slug`, `camera_name`, `camera_make`, `camera_model`, `camera_type`, `camera_description`, `camera_notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
    (1, _binary 0x7a7a, 'Unknown', '', 'Unknown', '', '', '', '2024-11-03 19:45:31', '2024-11-03 19:45:31', NULL);

-- Exportiere Struktur von Tabelle photoprism.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
    `label_id` int(10) unsigned NOT NULL,
    `category_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`label_id`,`category_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.categories: ~0 rows (ungefähr)
DELETE FROM `categories`;

-- Exportiere Struktur von Tabelle photoprism.cells
DROP TABLE IF EXISTS `cells`;
CREATE TABLE IF NOT EXISTS `cells` (
    `id` varbinary(42) NOT NULL,
    `cell_name` varchar(200) DEFAULT NULL,
    `cell_street` varchar(100) DEFAULT NULL,
    `cell_postcode` varchar(50) DEFAULT NULL,
    `cell_category` varchar(50) DEFAULT NULL,
    `place_id` varbinary(42) DEFAULT 'zz',
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.cells: ~0 rows (ungefähr)
DELETE FROM `cells`;
INSERT INTO `cells` (`id`, `cell_name`, `cell_street`, `cell_postcode`, `cell_category`, `place_id`, `created_at`, `updated_at`) VALUES
    (_binary 0x7a7a, '', '', '', '', _binary 0x7a7a, '2024-11-03 19:45:31', '2024-11-03 19:45:31');

-- Exportiere Struktur von Tabelle photoprism.countries
DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
    `id` varbinary(2) NOT NULL,
    `country_slug` varbinary(160) DEFAULT NULL,
    `country_name` varchar(160) DEFAULT NULL,
    `country_description` varchar(2048) DEFAULT NULL,
    `country_notes` varchar(1024) DEFAULT NULL,
    `country_photo_id` int(10) unsigned DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uix_countries_country_slug` (`country_slug`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.countries: ~0 rows (ungefähr)
DELETE FROM `countries`;
INSERT INTO `countries` (`id`, `country_slug`, `country_name`, `country_description`, `country_notes`, `country_photo_id`) VALUES
    (_binary 0x7a7a, _binary 0x7a7a, 'Unknown', '', '', 0);

-- Exportiere Struktur von Tabelle photoprism.details
DROP TABLE IF EXISTS `details`;
CREATE TABLE IF NOT EXISTS `details` (
    `photo_id` int(10) unsigned NOT NULL,
    `keywords` varchar(2048) DEFAULT NULL,
    `keywords_src` varbinary(8) DEFAULT NULL,
    `notes` varchar(2048) DEFAULT NULL,
    `notes_src` varbinary(8) DEFAULT NULL,
    `subject` varchar(1024) DEFAULT NULL,
    `subject_src` varbinary(8) DEFAULT NULL,
    `artist` varchar(1024) DEFAULT NULL,
    `artist_src` varbinary(8) DEFAULT NULL,
    `copyright` varchar(1024) DEFAULT NULL,
    `copyright_src` varbinary(8) DEFAULT NULL,
    `license` varchar(1024) DEFAULT NULL,
    `license_src` varbinary(8) DEFAULT NULL,
    `software` varchar(1024) DEFAULT NULL,
    `software_src` varbinary(8) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`photo_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.details: ~31 rows (ungefähr)
DELETE FROM `details`;
INSERT INTO `details` (`photo_id`, `keywords`, `keywords_src`, `notes`, `notes_src`, `subject`, `subject_src`, `artist`, `artist_src`, `copyright`, `copyright_src`, `license`, `license_src`, `software`, `software_src`, `created_at`, `updated_at`) VALUES
                                                                                                                                                                                                                                                           (1, 'easy, grey, prod, stack', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '2024-11-04 09:16:31', '2025-01-14 08:43:57'),
                                                                                                                                                                                                                                                           (2, 'angirr, easy, grey, stakk', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '2024-11-04 09:16:34', '2025-01-14 08:43:57'),
                                                                                                                                                                                                                                                           (4, 'easy, grey, papriless, stakks', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '2024-11-04 09:16:38', '2025-01-14 08:43:57'),
                                                                                                                                                                                                                                                           (6, 'easy, grey, paperless, stack, transparent', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '2024-11-04 09:16:38', '2025-01-14 08:43:57'),
                                                                                                                                                                                                                                                           (25, 'easy, grey, main, stack', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '2024-11-04 09:20:21', '2025-01-14 08:43:57'),
                                                                                                                                                                                                                                                           (26, 'easy, grey, stack', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '2024-11-04 09:20:21', '2025-01-14 08:43:57'),
                                                                                                                                                                                                                                                           (27, 'easy, grey, stack', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '2024-11-04 09:20:21', '2025-01-14 08:43:57'),
                                                                                                                                                                                                                                                           (28, 'blue, easy, photoprism, sign, stack', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '2024-11-04 09:20:21', '2025-01-14 08:43:57'),
                                                                                                                                                                                                                                                           (29, 'easy, grey, paperless, stack', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '2024-11-04 09:20:21', '2025-01-14 08:43:57'),
                                                                                                                                                                                                                                                           (31, 'base, blue, easy, stack', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '', _binary '', '2024-11-04 09:20:22', '2025-01-14 08:43:57');

-- Exportiere Struktur von Tabelle photoprism.duplicates
DROP TABLE IF EXISTS `duplicates`;
CREATE TABLE IF NOT EXISTS `duplicates` (
    `file_name` varbinary(755) NOT NULL,
    `file_root` varbinary(16) NOT NULL DEFAULT '/',
    `file_hash` varbinary(128) DEFAULT '',
    `file_size` bigint(20) DEFAULT NULL,
    `mod_time` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`file_name`,`file_root`),
    KEY `idx_duplicates_file_hash` (`file_hash`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.duplicates: ~0 rows (ungefähr)
DELETE FROM `duplicates`;
INSERT INTO `duplicates` (`file_name`, `file_root`, `file_hash`, `file_size`, `mod_time`) VALUES
    (_binary 0x323032342f31312f32303234313130325f3135343032375f37314637324538332e6a7067, _binary 0x2f, _binary 0x39353031323261626632646262663334353162643733326264633737336333666164303937633838, 324880, 1730562027);

-- Exportiere Struktur von Tabelle photoprism.errors
DROP TABLE IF EXISTS `errors`;
CREATE TABLE IF NOT EXISTS `errors` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `error_time` datetime DEFAULT NULL,
    `error_level` varbinary(32) DEFAULT NULL,
    `error_message` varbinary(2048) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_errors_error_time` (`error_time`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.errors: ~0 rows (ungefähr)
DELETE FROM `errors`;

-- Exportiere Struktur von Tabelle photoprism.faces
DROP TABLE IF EXISTS `faces`;
CREATE TABLE IF NOT EXISTS `faces` (
    `id` varbinary(64) NOT NULL,
    `face_src` varbinary(8) DEFAULT NULL,
    `face_kind` int(11) DEFAULT NULL,
    `face_hidden` tinyint(1) DEFAULT NULL,
    `subj_uid` varbinary(42) DEFAULT '',
    `samples` int(11) DEFAULT NULL,
    `sample_radius` double DEFAULT NULL,
    `collisions` int(11) DEFAULT NULL,
    `collision_radius` double DEFAULT NULL,
    `embedding_json` mediumblob DEFAULT NULL,
    `matched_at` datetime DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_faces_subj_uid` (`subj_uid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.faces: ~0 rows (ungefähr)
DELETE FROM `faces`;

-- Exportiere Struktur von Tabelle photoprism.files
DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `photo_id` int(10) unsigned DEFAULT NULL,
    `photo_uid` varbinary(42) DEFAULT NULL,
    `photo_taken_at` datetime DEFAULT NULL,
    `time_index` varbinary(64) DEFAULT NULL,
    `media_id` varbinary(32) DEFAULT NULL,
    `media_utc` bigint(20) DEFAULT NULL,
    `instance_id` varbinary(64) DEFAULT NULL,
    `file_uid` varbinary(42) DEFAULT NULL,
    `file_name` varbinary(1024) DEFAULT NULL,
    `file_root` varbinary(16) DEFAULT '/',
    `original_name` varbinary(755) DEFAULT NULL,
    `file_hash` varbinary(128) DEFAULT NULL,
    `file_size` bigint(20) DEFAULT NULL,
    `file_codec` varbinary(32) DEFAULT NULL,
    `file_type` varbinary(16) DEFAULT NULL,
    `media_type` varbinary(16) DEFAULT NULL,
    `file_mime` varbinary(64) DEFAULT NULL,
    `file_primary` tinyint(1) DEFAULT NULL,
    `file_sidecar` tinyint(1) DEFAULT NULL,
    `file_missing` tinyint(1) DEFAULT NULL,
    `file_portrait` tinyint(1) DEFAULT NULL,
    `file_video` tinyint(1) DEFAULT NULL,
    `file_duration` bigint(20) DEFAULT NULL,
    `file_fps` double DEFAULT NULL,
    `file_frames` int(11) DEFAULT NULL,
    `file_width` int(11) DEFAULT NULL,
    `file_height` int(11) DEFAULT NULL,
    `file_orientation` int(11) DEFAULT NULL,
    `file_orientation_src` varbinary(8) DEFAULT '',
    `file_projection` varbinary(64) DEFAULT NULL,
    `file_aspect_ratio` float DEFAULT NULL,
    `file_hdr` tinyint(1) DEFAULT NULL,
    `file_watermark` tinyint(1) DEFAULT NULL,
    `file_color_profile` varbinary(64) DEFAULT NULL,
    `file_main_color` varbinary(16) DEFAULT NULL,
    `file_colors` varbinary(18) DEFAULT NULL,
    `File_luminance` varbinary(18) DEFAULT NULL,
    `file_diff` int(11) DEFAULT -1,
    `file_chroma` smallint(6) DEFAULT -1,
    `file_software` varchar(64) DEFAULT NULL,
    `file_error` varbinary(512) DEFAULT NULL,
    `mod_time` bigint(20) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `created_in` bigint(20) DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `updated_in` bigint(20) DEFAULT NULL,
    `published_at` datetime DEFAULT NULL,
    `deleted_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uix_files_file_uid` (`file_uid`),
    UNIQUE KEY `idx_files_name_root` (`file_name`,`file_root`),
    UNIQUE KEY `idx_files_search_media` (`media_id`),
    UNIQUE KEY `idx_files_search_timeline` (`time_index`),
    KEY `idx_files_photo_uid` (`photo_uid`),
    KEY `idx_files_photo_taken_at` (`photo_taken_at`),
    KEY `idx_files_media_utc` (`media_utc`),
    KEY `idx_files_file_hash` (`file_hash`),
    KEY `idx_files_photo_id` (`photo_id`,`file_primary`),
    KEY `idx_files_file_error` (`file_error`),
    KEY `idx_files_published_at` (`published_at`),
    KEY `idx_files_deleted_at` (`deleted_at`),
    KEY `idx_files_instance_id` (`instance_id`),
    KEY `idx_files_missing_root` (`file_missing`,`file_root`)
    ) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.files: ~32 rows (ungefähr)
DELETE FROM `files`;
INSERT INTO `files` (`id`, `photo_id`, `photo_uid`, `photo_taken_at`, `time_index`, `media_id`, `media_utc`, `instance_id`, `file_uid`, `file_name`, `file_root`, `original_name`, `file_hash`, `file_size`, `file_codec`, `file_type`, `media_type`, `file_mime`, `file_primary`, `file_sidecar`, `file_missing`, `file_portrait`, `file_video`, `file_duration`, `file_fps`, `file_frames`, `file_width`, `file_height`, `file_orientation`, `file_orientation_src`, `file_projection`, `file_aspect_ratio`, `file_hdr`, `file_watermark`, `file_color_profile`, `file_main_color`, `file_colors`, `File_luminance`, `file_diff`, `file_chroma`, `file_software`, `file_error`, `mod_time`, `created_at`, `created_in`, `updated_at`, `updated_in`, `published_at`, `deleted_at`) VALUES
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (1, 1, _binary 0x70736d6635726a79736a647334666a35, '2024-11-03 11:05:45', _binary 0x37393735383839363838393435352d393939393939393939392d302d66736d6635726a31366d39746a637135, _binary 0x393939393939393939392d302d66736d6635726a31366d39746a637135, 0, _binary '', _binary 0x66736d6635726a31366d39746a637135, _binary 0x323032342f31312f32303234313130335f3131303534355f37314637324538332e6a7067, _binary 0x2f, _binary 0x656173792d737461636b2d70726f642e6a7067, _binary 0x39353031323261626632646262663334353162643733326264633737336333666164303937633838, 324880, _binary 0x6a706567, _binary 0x6a7067, _binary 0x696d616765, _binary 0x696d6167652f6a706567, 1, 0, 0, 0, 0, 0, 0, 0, 1024, 1024, 1, _binary 0x6d657461, _binary '', 1, 0, 0, _binary '', _binary 0x67726579, _binary 0x313131313131313131, _binary 0x373735383837363635, 1023, 4, '', _binary '', 1730631945, '2024-11-04 09:16:31', 5104801373, '2024-11-04 09:20:22', 619055040, NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (2, 2, _binary 0x70736d6635726d39616d61347a31726c, '2024-11-03 23:16:16', _binary 0x37393735383839363736383338342d393939393939393939382d302d66736d6635726d726562706c70316431, _binary 0x393939393939393939382d302d66736d6635726d726562706c70316431, 0, _binary '', _binary 0x66736d6635726d726562706c70316431, _binary 0x323032342f31312f32303234313130335f3233313631365f42334241313046412e6a7067, _binary 0x2f, _binary 0x656173792d7374616b6b2d616e676972722e6a7067, _binary 0x30303361623565633535623864363266636331633732346431363831383633623961376536393030, 388848, _binary 0x6a706567, _binary 0x6a7067, _binary 0x696d616765, _binary 0x696d6167652f6a706567, 1, 0, 0, 0, 0, 0, 0, 0, 1024, 1024, 1, _binary 0x6d657461, _binary '', 1, 0, 0, _binary '', _binary 0x67726579, _binary 0x313131313131313131, _binary 0x363736383837363636, 1023, 3, '', _binary '', 1730675776, '2024-11-04 09:16:34', 7612973351, '2024-11-04 09:20:22', 569196251, NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (4, 4, _binary 0x70736d66357271683230306872763735, '2024-11-03 23:17:36', _binary 0x37393735383839363736383236342d393939393939393939362d302d66736d663572717a6c6d657971683162, _binary 0x393939393939393939362d302d66736d663572717a6c6d657971683162, 0, _binary '', _binary 0x66736d663572717a6c6d657971683162, _binary 0x323032342f31312f32303234313130335f3233313733365f31414542353632412e6a7067, _binary 0x2f, _binary 0x656173792d7374616b6b732d70617072696c6573732e6a7067, _binary 0x37376162353334613635633363643731663866636165333164326166616237393962336361653531, 372944, _binary 0x6a706567, _binary 0x6a7067, _binary 0x696d616765, _binary 0x696d6167652f6a706567, 1, 0, 0, 0, 0, 0, 0, 0, 1024, 1024, 1, _binary 0x6d657461, _binary '', 1, 0, 0, _binary '', _binary 0x67726579, _binary 0x313131313131313131, _binary 0x393838373737373738, 1023, 3, '', _binary '', 1730675856, '2024-11-04 09:16:38', 6392634200, '2024-11-04 09:20:22', 652307466, NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (6, 6, _binary 0x70736d663572716779346d3035333868, '2024-11-04 08:20:29', _binary 0x37393735383839353931373937312d393939393939393939342d302d66736d6635727173373434613435767a, _binary 0x393939393939393939342d302d66736d6635727173373434613435767a, 0, _binary '', _binary 0x66736d6635727173373434613435767a, _binary 0x323032342f31312f32303234313130345f3038323032395f39324146394638452e706e67, _binary 0x2f, _binary 0x656173792d737461636b2d70617065726c6573732d7472616e73706172656e742e706e67, _binary 0x35373238313666393163303330393332313235613933346337323766306361646532353138303336, 1225028, _binary 0x706e67, _binary 0x706e67, _binary 0x696d616765, _binary 0x696d6167652f706e67, 1, 0, 0, 0, 0, 0, 0, 0, 1024, 1024, 1, _binary 0x6d657461, _binary '', 1, 0, 0, _binary '', _binary 0x67726579, _binary 0x313131313131313130, _binary 0x333635363835343531, 1020, 3, '', _binary '', 1730708429, '2024-11-04 09:16:38', 11724166919, '2024-11-04 09:20:23', 570383613, NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (25, 25, _binary 0x70736d653039696a6e6b75376c647a39, '2024-11-02 12:39:55', _binary 0x37393735383839373837363034352d393939393939393937352d302d66736d66357878767a79366b75627073, _binary 0x393939393939393937352d302d66736d66357878767a79366b75627073, 0, _binary '', _binary 0x66736d66357878767a79366b75627073, _binary 0x323032342f31312f32303234313130325f3132333935355f46354332363745412e6a7067, _binary 0x2f, _binary 0x656173792d737461636b2d6d61696e2e6a7067, _binary 0x64323233303966316161353433326662396139626636356533656232336663616163353437376134, 312725, _binary 0x6a706567, _binary 0x6a7067, _binary 0x696d616765, _binary 0x696d6167652f6a706567, 1, 0, 0, 0, 0, 0, 0, 0, 1024, 1024, 1, _binary 0x6d657461, _binary '', 1, 0, 0, _binary '', _binary 0x67726579, _binary 0x313231313131313831, _binary 0x363736393837363536, 1023, 7, '', _binary '', 1730551195, '2024-11-04 09:20:21', 723862681, '2024-11-04 09:20:21', 0, NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (26, 25, _binary 0x70736d653039696a6e6b75376c647a39, '2024-11-02 12:39:55', _binary 0x37393735383839373837363034352d393939393939393937352d312d66736d663578783665336d6966736e73, _binary 0x393939393939393937352d312d66736d663578783665336d6966736e73, 1730551195000, _binary '', _binary 0x66736d663578783665336d6966736e73, _binary 0x323032342f31312f32303234313130325f3132333935355f46354332363745412e706e67, _binary 0x2f, _binary '', _binary 0x32353563653336306137356430643737626435663137386466376134303939653631376639656630, 2043556, _binary 0x706e67, _binary 0x706e67, _binary 0x696d616765, _binary 0x696d6167652f706e67, 0, 0, 0, 0, 0, 0, 0, 0, 1024, 1024, 1, _binary 0x6d657461, _binary '', 1, 0, 0, _binary '', _binary 0x67726579, _binary 0x313231313131313831, _binary 0x363736393837363536, 1023, 7, '', _binary '', 1730551253, '2024-11-04 09:20:21', 39176634, '2024-11-04 09:20:21', 0, NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (27, 26, _binary 0x70736d653039686978326e6b39323230, '2024-11-02 13:23:17', _binary 0x37393735383839373836373638332d393939393939393937342d302d66736d663578783277346c786d6d7679, _binary 0x393939393939393937342d302d66736d663578783277346c786d6d7679, 0, _binary '', _binary 0x66736d663578783277346c786d6d7679, _binary 0x323032342f31312f32303234313130325f3133323331375f43303343454546412e6a7067, _binary 0x2f, _binary 0x656173792d737461636b2d61672e6a7067, _binary 0x34306430343365346136623838393939306332666262376231626635623934633464626634326263, 318425, _binary 0x6a706567, _binary 0x6a7067, _binary 0x696d616765, _binary 0x696d6167652f6a706567, 1, 0, 0, 0, 0, 0, 0, 0, 1024, 1024, 1, _binary 0x6d657461, _binary '', 1, 0, 0, _binary '', _binary 0x67726579, _binary 0x313131313131313131, _binary 0x353735373837343634, 1023, 5, '', _binary '', 1730553797, '2024-11-04 09:20:21', 697628319, '2024-11-04 09:20:21', 0, NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (28, 27, _binary 0x70736d6530396834733134387032736f, '2024-11-02 13:24:26', _binary 0x37393735383839373836373537342d393939393939393937332d302d66736d6635787871776a6b7a6f303066, _binary 0x393939393939393937332d302d66736d6635787871776a6b7a6f303066, 0, _binary '', _binary 0x66736d6635787871776a6b7a6f303066, _binary 0x323032342f31312f32303234313130325f3133323432365f46434536414145442e6a7067, _binary 0x2f, _binary 0x656173792d737461636b2d61692e6a7067, _binary 0x35326534343138316631633139366162363764373131626465353130633038303333336266333464, 354633, _binary 0x6a706567, _binary 0x6a7067, _binary 0x696d616765, _binary 0x696d6167652f6a706567, 1, 0, 0, 0, 0, 0, 0, 0, 1024, 1024, 1, _binary 0x6d657461, _binary '', 1, 0, 0, _binary '', _binary 0x67726579, _binary 0x313131313131313136, _binary 0x363736373837343535, 1023, 4, '', _binary '', 1730553866, '2024-11-04 09:20:21', 747214993, '2024-11-04 09:20:21', 0, NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (29, 28, _binary 0x70736d6530396a77306473697a306a6e, '2024-11-02 13:25:20', _binary 0x37393735383839373836373438302d393939393939393937322d302d66736d66357878636d78327639687532, _binary 0x393939393939393937322d302d66736d66357878636d78327639687532, 0, _binary '', _binary 0x66736d66357878636d78327639687532, _binary 0x323032342f31312f32303234313130325f3133323532305f33374635394343452e6a7067, _binary 0x2f, _binary 0x656173792d737461636b2d70686f746f707269736d2e6a7067, _binary 0x39343663663135633765653335346538383963626537616663633830303535633030303264383261, 361237, _binary 0x6a706567, _binary 0x6a7067, _binary 0x696d616765, _binary 0x696d6167652f6a706567, 1, 0, 0, 0, 0, 0, 0, 0, 1024, 1024, 1, _binary 0x6d657461, _binary '', 1, 0, 0, _binary '', _binary 0x626c7565, _binary 0x363136363636363136, _binary 0x353735363636343635, 1023, 7, '', _binary '', 1730553920, '2024-11-04 09:20:21', 708551086, '2024-11-04 09:20:21', 0, NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (30, 29, _binary 0x70736d6530396939763130686e787875, '2024-11-02 14:40:12', _binary 0x37393735383839373835353938382d393939393939393937312d302d66736d6635787868386d6f7679686e79, _binary 0x393939393939393937312d302d66736d6635787868386d6f7679686e79, 0, _binary '', _binary 0x66736d6635787868386d6f7679686e79, _binary 0x323032342f31312f32303234313130325f3134343031325f45373042334632462e6a7067, _binary 0x2f, _binary 0x656173792d737461636b2d70617065726c6573732e6a7067, _binary 0x33326664633561333061623137633638336330383931316334656664313130376231356336636364, 333759, _binary 0x6a706567, _binary 0x6a7067, _binary 0x696d616765, _binary 0x696d6167652f6a706567, 1, 0, 0, 0, 0, 0, 0, 0, 1024, 1024, 1, _binary 0x6d657461, _binary '', 1, 0, 0, _binary '', _binary 0x67726579, _binary 0x313136313131313136, _binary 0x343735373937363635, 1023, 3, '', _binary '', 1730558412, '2024-11-04 09:20:21', 719026831, '2024-11-04 09:20:21', 0, NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        (32, 31, _binary 0x70736d653039696c766c67736a6e7068, '2024-11-02 15:36:27', _binary 0x37393735383839373834363337332d393939393939393936392d302d66736d663578796667683838656f6464, _binary 0x393939393939393936392d302d66736d663578796667683838656f6464, 0, _binary '', _binary 0x66736d663578796667683838656f6464, _binary 0x323032342f31312f32303234313130325f3135333632375f45363831393434362e6a7067, _binary 0x2f, _binary 0x656173792d737461636b2d626173652e6a7067, _binary 0x35313831623237376634363966653466396432613836666336383137643963303566316465316263, 381310, _binary 0x6a706567, _binary 0x6a7067, _binary 0x696d616765, _binary 0x696d6167652f6a706567, 1, 0, 0, 0, 0, 0, 0, 0, 1024, 1024, 1, _binary 0x6d657461, _binary '', 1, 0, 0, _binary '', _binary 0x626c7565, _binary 0x313131363636313131, _binary 0x373836383838363636, 1023, 6, '', _binary '', 1730561787, '2024-11-04 09:20:22', 715624553, '2024-11-04 09:20:22', 0, NULL, NULL);

-- Exportiere Struktur von Tabelle photoprism.files_share
DROP TABLE IF EXISTS `files_share`;
CREATE TABLE IF NOT EXISTS `files_share` (
    `file_id` int(10) unsigned NOT NULL,
    `service_id` int(10) unsigned NOT NULL,
    `remote_name` varbinary(255) NOT NULL,
    `status` varbinary(16) DEFAULT NULL,
    `error` varbinary(512) DEFAULT NULL,
    `errors` int(11) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`file_id`,`service_id`,`remote_name`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.files_share: ~0 rows (ungefähr)
DELETE FROM `files_share`;

-- Exportiere Struktur von Tabelle photoprism.files_sync
DROP TABLE IF EXISTS `files_sync`;
CREATE TABLE IF NOT EXISTS `files_sync` (
    `remote_name` varbinary(255) NOT NULL,
    `service_id` int(10) unsigned NOT NULL,
    `file_id` int(10) unsigned DEFAULT NULL,
    `remote_date` datetime DEFAULT NULL,
    `remote_size` bigint(20) DEFAULT NULL,
    `status` varbinary(16) DEFAULT NULL,
    `error` varbinary(512) DEFAULT NULL,
    `errors` int(11) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`remote_name`,`service_id`),
    KEY `idx_files_sync_file_id` (`file_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.files_sync: ~0 rows (ungefähr)
DELETE FROM `files_sync`;

-- Exportiere Struktur von Tabelle photoprism.folders
DROP TABLE IF EXISTS `folders`;
CREATE TABLE IF NOT EXISTS `folders` (
    `path` varbinary(1024) DEFAULT NULL,
    `root` varbinary(16) DEFAULT '',
    `folder_uid` varbinary(42) NOT NULL,
    `folder_type` varbinary(16) DEFAULT NULL,
    `folder_title` varchar(200) DEFAULT NULL,
    `folder_category` varchar(100) DEFAULT NULL,
    `folder_description` varchar(2048) DEFAULT NULL,
    `folder_order` varbinary(32) DEFAULT NULL,
    `folder_country` varbinary(2) DEFAULT 'zz',
    `folder_year` int(11) DEFAULT NULL,
    `folder_month` int(11) DEFAULT NULL,
    `folder_day` int(11) DEFAULT NULL,
    `folder_favorite` tinyint(1) DEFAULT NULL,
    `folder_private` tinyint(1) DEFAULT NULL,
    `folder_ignore` tinyint(1) DEFAULT NULL,
    `folder_watch` tinyint(1) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    `published_at` datetime DEFAULT NULL,
    `deleted_at` datetime DEFAULT NULL,
    PRIMARY KEY (`folder_uid`),
    UNIQUE KEY `idx_folders_path_root` (`path`,`root`),
    KEY `idx_folders_folder_category` (`folder_category`),
    KEY `idx_folders_country_year_month` (`folder_country`,`folder_year`,`folder_month`),
    KEY `idx_folders_published_at` (`published_at`),
    KEY `idx_folders_deleted_at` (`deleted_at`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.folders: ~3 rows (ungefähr)
DELETE FROM `folders`;
INSERT INTO `folders` (`path`, `root`, `folder_uid`, `folder_type`, `folder_title`, `folder_category`, `folder_description`, `folder_order`, `folder_country`, `folder_year`, `folder_month`, `folder_day`, `folder_favorite`, `folder_private`, `folder_ignore`, `folder_watch`, `created_at`, `updated_at`, `modified_at`, `published_at`, `deleted_at`) VALUES
                                                                                                                                                                                                                                                                                                                                                               (_binary '', _binary 0x696d706f7274, _binary 0x64736d66357264796732787a68766d76, _binary '', 'Import', '', '', _binary 0x6e616d65, _binary 0x7a7a, 2024, 11, 0, 0, 0, 0, 0, '2024-11-04 09:16:25', '2024-11-04 09:16:25', '2024-11-04 08:47:56', NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                               (_binary 0x323032342f3131, _binary 0x2f, _binary 0x64736d66357869323667323969716c37, _binary '', 'November 2024', '', '', _binary 0x6e616d65, _binary 0x7a7a, 2024, 11, 1, 0, 0, 0, 0, '2024-11-04 09:20:06', '2024-11-04 09:20:06', '2024-11-04 09:16:34', NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                               (_binary 0x32303234, _binary 0x2f, _binary 0x64736d6635786961743631736a306c70, _binary '', '2024', '', '', _binary 0x6e616d65, _binary 0x7a7a, 2024, 11, 0, 0, 0, 0, 0, '2024-11-04 09:20:06', '2024-11-04 09:20:06', '2024-11-03 18:19:49', NULL, NULL),
                                                                                                                                                                                                                                                                                                                                                               (_binary '', _binary 0x2f, _binary 0x64736d663578696a6174733933666c31, _binary '', 'Originals', '', '', _binary 0x6e616d65, _binary 0x7a7a, 2024, 11, 0, 0, 0, 0, 0, '2024-11-04 09:20:06', '2024-11-04 09:20:06', '2024-11-03 18:19:49', NULL, NULL);

-- Exportiere Struktur von Tabelle photoprism.keywords
DROP TABLE IF EXISTS `keywords`;
CREATE TABLE IF NOT EXISTS `keywords` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `keyword` varchar(64) DEFAULT NULL,
    `skip` tinyint(1) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_keywords_keyword` (`keyword`)
    ) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.keywords: ~41 rows (ungefähr)
DELETE FROM `keywords`;
INSERT INTO `keywords` (`id`, `keyword`, `skip`) VALUES
                                                     (1, 'easy', 0),
                                                     (2, 'grey', 0),
                                                     (3, 'prod', 0),
                                                     (4, 'stack', 0),
                                                     (5, 'angirr', 0),
                                                     (6, 'stakk', 0),
                                                     (7, 'main', 0),
                                                     (8, 'teal', 0),
                                                     (9, 'transparent', 0),
                                                     (10, 'papriless', 0),
                                                     (11, 'stakks', 0),
                                                     (12, 'iamwatchingyou', 0),
                                                     (13, 'sebr', 0),
                                                     (14, 'sign', 0),
                                                     (15, 'paperless', 0),
                                                     (16, 'assets', 0),
                                                     (17, 'black', 0),
                                                     (18, 'info', 0),
                                                     (19, 'entities', 0),
                                                     (20, 'test', 0),
                                                     (21, 'login', 0),
                                                     (22, 'readme', 0),
                                                     (23, 'rabbit', 0),
                                                     (24, 'white', 0),
                                                     (25, 'metadata', 0),
                                                     (26, 'blue', 0),
                                                     (27, 'prometheus', 0),
                                                     (28, 'crud', 0),
                                                     (29, 'electronics', 0),
                                                     (30, 'angular', 0),
                                                     (31, 'database', 0),
                                                     (32, 'dump', 0),
                                                     (33, 'backend', 0),
                                                     (34, 'code', 0),
                                                     (35, 'coverage', 0),
                                                     (36, 'green', 0),
                                                     (37, 'admin', 0),
                                                     (38, 'grafana', 0),
                                                     (39, 'photoprism', 0),
                                                     (40, 'api', 0),
                                                     (41, 'base', 0);

-- Exportiere Struktur von Tabelle photoprism.labels
DROP TABLE IF EXISTS `labels`;
CREATE TABLE IF NOT EXISTS `labels` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `label_uid` varbinary(42) DEFAULT NULL,
    `label_slug` varbinary(160) DEFAULT NULL,
    `custom_slug` varbinary(160) DEFAULT NULL,
    `label_name` varchar(160) DEFAULT NULL,
    `label_priority` int(11) DEFAULT NULL,
    `label_favorite` tinyint(1) DEFAULT NULL,
    `label_description` varchar(2048) DEFAULT NULL,
    `label_notes` varchar(1024) DEFAULT NULL,
    `photo_count` int(11) DEFAULT 1,
    `thumb` varbinary(128) DEFAULT '',
    `thumb_src` varbinary(8) DEFAULT '',
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `published_at` datetime DEFAULT NULL,
    `deleted_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uix_labels_label_uid` (`label_uid`),
    UNIQUE KEY `uix_labels_label_slug` (`label_slug`),
    KEY `idx_labels_published_at` (`published_at`),
    KEY `idx_labels_deleted_at` (`deleted_at`),
    KEY `idx_labels_custom_slug` (`custom_slug`),
    KEY `idx_labels_thumb` (`thumb`)
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.labels: ~3 rows (ungefähr)
DELETE FROM `labels`;
INSERT INTO `labels` (`id`, `label_uid`, `label_slug`, `custom_slug`, `label_name`, `label_priority`, `label_favorite`, `label_description`, `label_notes`, `photo_count`, `thumb`, `thumb_src`, `created_at`, `updated_at`, `published_at`, `deleted_at`) VALUES
                                                                                                                                                                                                                                                               (1, _binary 0x6c736d6635727168686f703738763774, _binary 0x7369676e, _binary 0x7369676e, 'Sign', 0, 0, '', '', 1, _binary 0x39343663663135633765653335346538383963626537616663633830303535633030303264383261, _binary '', '2024-11-04 09:16:38', '2025-01-14 08:43:57', NULL, NULL),
                                                                                                                                                                                                                                                               (2, _binary 0x6c736d6635787478726b786978333736, _binary 0x696e666f, _binary 0x696e666f, 'Info', 0, 0, '', '', 0, NULL, _binary '', '2024-11-04 09:20:17', '2024-11-04 09:20:22', NULL, NULL),
                                                                                                                                                                                                                                                               (3, _binary 0x6c736d663578766f69666c73756a3763, _binary 0x656c656374726f6e696373, _binary 0x656c656374726f6e696373, 'Electronics', 0, 0, '', '', 0, NULL, _binary '', '2024-11-04 09:20:19', '2024-11-04 09:20:19', NULL, NULL);

-- Exportiere Struktur von Tabelle photoprism.lenses
DROP TABLE IF EXISTS `lenses`;
CREATE TABLE IF NOT EXISTS `lenses` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `lens_slug` varbinary(160) DEFAULT NULL,
    `lens_name` varchar(160) DEFAULT NULL,
    `lens_make` varchar(160) DEFAULT NULL,
    `lens_model` varchar(160) DEFAULT NULL,
    `lens_type` varchar(100) DEFAULT NULL,
    `lens_description` varchar(2048) DEFAULT NULL,
    `lens_notes` varchar(1024) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `deleted_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uix_lenses_lens_slug` (`lens_slug`),
    KEY `idx_lenses_deleted_at` (`deleted_at`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.lenses: ~0 rows (ungefähr)
DELETE FROM `lenses`;
INSERT INTO `lenses` (`id`, `lens_slug`, `lens_name`, `lens_make`, `lens_model`, `lens_type`, `lens_description`, `lens_notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
    (1, _binary 0x7a7a, 'Unknown', '', 'Unknown', '', '', '', '2024-11-03 19:45:31', '2024-11-03 19:45:31', NULL);

-- Exportiere Struktur von Tabelle photoprism.links
DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
    `link_uid` varbinary(42) NOT NULL,
    `share_uid` varbinary(42) DEFAULT NULL,
    `share_slug` varbinary(160) DEFAULT NULL,
    `link_token` varbinary(160) DEFAULT NULL,
    `link_expires` int(11) DEFAULT NULL,
    `link_views` int(10) unsigned DEFAULT NULL,
    `max_views` int(10) unsigned DEFAULT NULL,
    `has_password` tinyint(1) DEFAULT NULL,
    `comment` varchar(512) DEFAULT NULL,
    `perm` int(10) unsigned DEFAULT NULL,
    `ref_id` varbinary(16) DEFAULT NULL,
    `created_by` varbinary(42) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    PRIMARY KEY (`link_uid`),
    UNIQUE KEY `idx_links_uid_token` (`share_uid`,`link_token`),
    KEY `idx_links_share_slug` (`share_slug`),
    KEY `idx_links_created_by` (`created_by`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.links: ~0 rows (ungefähr)
DELETE FROM `links`;

-- Exportiere Struktur von Tabelle photoprism.markers
DROP TABLE IF EXISTS `markers`;
CREATE TABLE IF NOT EXISTS `markers` (
    `marker_uid` varbinary(42) NOT NULL,
    `file_uid` varbinary(42) DEFAULT '',
    `marker_type` varbinary(8) DEFAULT '',
    `marker_src` varbinary(8) DEFAULT '',
    `marker_name` varchar(160) DEFAULT NULL,
    `marker_review` tinyint(1) DEFAULT NULL,
    `marker_invalid` tinyint(1) DEFAULT NULL,
    `subj_uid` varbinary(42) DEFAULT NULL,
    `subj_src` varbinary(8) DEFAULT '',
    `face_id` varbinary(64) DEFAULT NULL,
    `face_dist` double DEFAULT -1,
    `embeddings_json` mediumblob DEFAULT NULL,
    `landmarks_json` mediumblob DEFAULT NULL,
    `x` float DEFAULT NULL,
    `y` float DEFAULT NULL,
    `w` float DEFAULT NULL,
    `h` float DEFAULT NULL,
    `q` int(11) DEFAULT NULL,
    `size` int(11) DEFAULT -1,
    `score` smallint(6) DEFAULT NULL,
    `thumb` varbinary(128) DEFAULT '',
    `matched_at` datetime DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`marker_uid`),
    KEY `idx_markers_matched_at` (`matched_at`),
    KEY `idx_markers_file_uid` (`file_uid`),
    KEY `idx_markers_subj_uid_src` (`subj_uid`,`subj_src`),
    KEY `idx_markers_face_id` (`face_id`),
    KEY `idx_markers_thumb` (`thumb`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.markers: ~0 rows (ungefähr)
DELETE FROM `markers`;

-- Exportiere Struktur von Tabelle photoprism.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
    `id` varchar(16) NOT NULL,
    `dialect` varchar(16) DEFAULT NULL,
    `stage` varchar(16) DEFAULT NULL,
    `error` varchar(255) DEFAULT NULL,
    `source` varchar(16) DEFAULT NULL,
    `started_at` datetime DEFAULT NULL,
    `finished_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.migrations: ~31 rows (ungefähr)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `dialect`, `stage`, `error`, `source`, `started_at`, `finished_at`) VALUES
                                                                                                        ('20211121-094727', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20211124-120008', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-030000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-040000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-050000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-060000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-061000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-070000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-071000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-080000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-081000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-083000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-090000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-091000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220329-093000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220421-200000', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220521-000001', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220521-000002', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:30'),
                                                                                                        ('20220521-000003', 'mysql', 'main', '', '', '2024-11-03 19:45:30', '2024-11-03 19:45:31'),
                                                                                                        ('20220927-000100', 'mysql', 'main', '', '', '2024-11-03 19:45:31', '2024-11-03 19:45:31'),
                                                                                                        ('20221002-000100', 'mysql', 'main', '', '', '2024-11-03 19:45:31', '2024-11-03 19:45:31'),
                                                                                                        ('20221015-100000', 'mysql', 'pre', '', '', '2024-11-03 19:45:26', '2024-11-03 19:45:26'),
                                                                                                        ('20221015-100100', 'mysql', 'pre', '', '', '2024-11-03 19:45:26', '2024-11-03 19:45:26'),
                                                                                                        ('20230102-000001', 'mysql', 'main', '', '', '2024-11-03 19:45:31', '2024-11-03 19:45:31'),
                                                                                                        ('20230211-000001', 'mysql', 'main', '', '', '2024-11-03 19:45:31', '2024-11-03 19:45:31'),
                                                                                                        ('20230309-000001', 'mysql', 'main', '', '', '2024-11-03 19:45:31', '2024-11-03 19:45:31'),
                                                                                                        ('20230313-000001', 'mysql', 'main', '', '', '2024-11-03 19:45:31', '2024-11-03 19:45:31'),
                                                                                                        ('20240112-000001', 'mysql', 'main', '', '', '2024-11-03 19:45:31', '2024-11-03 19:45:31'),
                                                                                                        ('20240701-000001', 'mysql', 'main', '', '', '2024-11-03 19:45:31', '2024-11-03 19:45:31'),
                                                                                                        ('20240709-000001', 'mysql', 'pre', '', '', '2024-11-03 19:45:26', '2024-11-03 19:45:26'),
                                                                                                        ('20240915-000001', 'mysql', 'main', '', '', '2024-11-03 19:45:31', '2024-11-03 19:45:31');

-- Exportiere Struktur von Tabelle photoprism.passcodes
DROP TABLE IF EXISTS `passcodes`;
CREATE TABLE IF NOT EXISTS `passcodes` (
    `uid` varbinary(255) NOT NULL,
    `key_type` varchar(64) NOT NULL DEFAULT '',
    `key_url` varchar(2048) DEFAULT '',
    `recovery_code` varchar(255) DEFAULT '',
    `verified_at` datetime DEFAULT NULL,
    `activated_at` datetime DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`uid`,`key_type`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.passcodes: ~0 rows (ungefähr)
DELETE FROM `passcodes`;

-- Exportiere Struktur von Tabelle photoprism.passwords
DROP TABLE IF EXISTS `passwords`;
CREATE TABLE IF NOT EXISTS `passwords` (
    `uid` varbinary(255) NOT NULL,
    `hash` varbinary(255) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`uid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.passwords: ~0 rows (ungefähr)
DELETE FROM `passwords`;
INSERT INTO `passwords` (`uid`, `hash`, `created_at`, `updated_at`) VALUES
    (_binary 0x75736d653437767a64783534766c3576, _binary 0x243261243132242f5051477a335a2e77796968424c5072665a524c5275717a4e5232516d5746514d64316c44384270784f572f394f683358784e642e, '2024-11-03 19:45:31', '2024-11-03 19:45:31');

-- Exportiere Struktur von Tabelle photoprism.photos
DROP TABLE IF EXISTS `photos`;
CREATE TABLE IF NOT EXISTS `photos` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `uuid` varbinary(64) DEFAULT NULL,
    `taken_at` datetime DEFAULT NULL,
    `taken_at_local` datetime DEFAULT NULL,
    `taken_src` varbinary(8) DEFAULT NULL,
    `photo_uid` varbinary(42) DEFAULT NULL,
    `photo_type` varbinary(8) DEFAULT 'image',
    `type_src` varbinary(8) DEFAULT NULL,
    `photo_title` varchar(200) DEFAULT NULL,
    `title_src` varbinary(8) DEFAULT NULL,
    `photo_description` varchar(4096) DEFAULT NULL,
    `description_src` varbinary(8) DEFAULT NULL,
    `photo_path` varbinary(1024) DEFAULT NULL,
    `photo_name` varbinary(255) DEFAULT NULL,
    `original_name` varbinary(755) DEFAULT NULL,
    `photo_stack` tinyint(4) DEFAULT NULL,
    `photo_favorite` tinyint(1) DEFAULT NULL,
    `photo_private` tinyint(1) DEFAULT NULL,
    `photo_scan` tinyint(1) DEFAULT NULL,
    `photo_panorama` tinyint(1) DEFAULT NULL,
    `time_zone` varbinary(64) DEFAULT NULL,
    `place_id` varbinary(42) DEFAULT 'zz',
    `place_src` varbinary(8) DEFAULT NULL,
    `cell_id` varbinary(42) DEFAULT 'zz',
    `cell_accuracy` int(11) DEFAULT NULL,
    `photo_altitude` int(11) DEFAULT NULL,
    `photo_lat` double DEFAULT NULL,
    `photo_lng` double DEFAULT NULL,
    `photo_country` varbinary(2) DEFAULT 'zz',
    `photo_year` int(11) DEFAULT NULL,
    `photo_month` int(11) DEFAULT NULL,
    `photo_day` int(11) DEFAULT NULL,
    `photo_iso` int(11) DEFAULT NULL,
    `photo_exposure` varbinary(64) DEFAULT NULL,
    `photo_f_number` float DEFAULT NULL,
    `photo_focal_length` int(11) DEFAULT NULL,
    `photo_quality` smallint(6) DEFAULT NULL,
    `photo_faces` int(11) DEFAULT NULL,
    `photo_resolution` smallint(6) DEFAULT NULL,
    `photo_duration` bigint(20) DEFAULT NULL,
    `photo_color` smallint(6) DEFAULT -1,
    `camera_id` int(10) unsigned DEFAULT 1,
    `camera_serial` varbinary(160) DEFAULT NULL,
    `camera_src` varbinary(8) DEFAULT NULL,
    `lens_id` int(10) unsigned DEFAULT 1,
    `created_by` varbinary(42) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `edited_at` datetime DEFAULT NULL,
    `published_at` datetime DEFAULT NULL,
    `checked_at` datetime DEFAULT NULL,
    `estimated_at` datetime DEFAULT NULL,
    `deleted_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uix_photos_photo_uid` (`photo_uid`),
    KEY `idx_photos_camera_lens` (`camera_id`,`lens_id`),
    KEY `idx_photos_created_by` (`created_by`),
    KEY `idx_photos_checked_at` (`checked_at`),
    KEY `idx_photos_uuid` (`uuid`),
    KEY `idx_photos_taken_uid` (`taken_at`,`photo_uid`),
    KEY `idx_photos_ymd` (`photo_day`),
    KEY `idx_photos_place_id` (`place_id`),
    KEY `idx_photos_cell_id` (`cell_id`),
    KEY `idx_photos_photo_lng` (`photo_lng`),
    KEY `idx_photos_country_year_month` (`photo_country`,`photo_year`,`photo_month`),
    KEY `idx_photos_published_at` (`published_at`),
    KEY `idx_photos_deleted_at` (`deleted_at`),
    KEY `idx_photos_path_name` (`photo_path`,`photo_name`),
    KEY `idx_photos_photo_lat` (`photo_lat`)
    ) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.photos: ~10 rows (ungefähr)
DELETE FROM `photos`;
INSERT INTO `photos` (`id`, `uuid`, `taken_at`, `taken_at_local`, `taken_src`, `photo_uid`, `photo_type`, `type_src`, `photo_title`, `title_src`, `photo_description`, `description_src`, `photo_path`, `photo_name`, `original_name`, `photo_stack`, `photo_favorite`, `photo_private`, `photo_scan`, `photo_panorama`, `time_zone`, `place_id`, `place_src`, `cell_id`, `cell_accuracy`, `photo_altitude`, `photo_lat`, `photo_lng`, `photo_country`, `photo_year`, `photo_month`, `photo_day`, `photo_iso`, `photo_exposure`, `photo_f_number`, `photo_focal_length`, `photo_quality`, `photo_faces`, `photo_resolution`, `photo_duration`, `photo_color`, `camera_id`, `camera_serial`, `camera_src`, `lens_id`, `created_by`, `created_at`, `updated_at`, `edited_at`, `published_at`, `checked_at`, `estimated_at`, `deleted_at`) VALUES
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            (1, _binary '', '2024-11-03 11:05:45', '2024-11-03 11:05:45', _binary '', _binary 0x70736d6635726a79736a647334666a35, _binary 0x696d616765, _binary '', 'Easy Stack Prod', _binary '', '', _binary '', _binary 0x323032342f3131, _binary 0x32303234313130335f3131303534355f3731463732453833, _binary 0x656173792d737461636b2d70726f64, 0, 0, 0, 0, 0, _binary 0x555443, _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, 0, _binary 0x7a7a, -1, -1, -1, 0, _binary '', 0, 0, 3, 0, 1, 0, 1, 1, _binary '', _binary '', 1, _binary 0x75736d653437767a64783534766c3576, '2024-11-04 09:16:31', '2025-01-14 08:43:57', '2024-11-04 09:16:54', NULL, '2025-01-14 08:43:56', '2025-01-14 08:43:56', NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            (2, _binary '', '2024-11-03 23:16:16', '2024-11-03 23:16:16', _binary '', _binary 0x70736d6635726d39616d61347a31726c, _binary 0x696d616765, _binary '', 'Easy Stakk Angirr', _binary '', '', _binary '', _binary 0x323032342f3131, _binary 0x32303234313130335f3233313631365f4233424131304641, _binary 0x656173792d7374616b6b2d616e67697272, 0, 0, 0, 0, 0, _binary 0x555443, _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, 0, _binary 0x7a7a, -1, -1, -1, 0, _binary '', 0, 0, 3, 0, 1, 0, 1, 1, _binary '', _binary '', 1, _binary 0x75736d653437767a64783534766c3576, '2024-11-04 09:16:34', '2025-01-14 08:43:57', '2024-11-04 09:16:53', NULL, '2025-01-14 08:43:57', '2025-01-14 08:43:57', NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            (4, _binary '', '2024-11-03 23:17:36', '2024-11-03 23:17:36', _binary '', _binary 0x70736d66357271683230306872763735, _binary 0x696d616765, _binary '', 'Easy Stakks Papriless', _binary '', '', _binary '', _binary 0x323032342f3131, _binary 0x32303234313130335f3233313733365f3141454235363241, _binary 0x656173792d7374616b6b732d70617072696c657373, 0, 0, 0, 0, 0, _binary 0x555443, _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, 0, _binary 0x7a7a, -1, -1, -1, 0, _binary '', 0, 0, 3, 0, 1, 0, 1, 1, _binary '', _binary '', 1, _binary 0x75736d653437767a64783534766c3576, '2024-11-04 09:16:38', '2025-01-14 08:43:57', '2024-11-04 09:16:51', NULL, '2025-01-14 08:43:57', '2025-01-14 08:43:57', NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            (6, _binary '', '2024-11-04 08:20:29', '2024-11-04 08:20:29', _binary '', _binary 0x70736d663572716779346d3035333868, _binary 0x696d616765, _binary '', 'Easy Stack Paperless Transparent', _binary '', '', _binary '', _binary 0x323032342f3131, _binary 0x32303234313130345f3038323032395f3932414639463845, _binary 0x656173792d737461636b2d70617065726c6573732d7472616e73706172656e74, 0, 0, 0, 0, 0, _binary 0x555443, _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, 0, _binary 0x7a7a, -1, -1, -1, 0, _binary '', 0, 0, 3, 0, 1, 0, 1, 1, _binary '', _binary '', 1, _binary 0x75736d653437767a64783534766c3576, '2024-11-04 09:16:38', '2025-01-14 08:43:57', '2024-11-04 09:16:49', NULL, '2025-01-14 08:43:57', '2025-01-14 08:43:57', NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            (25, _binary '', '2024-11-02 12:39:55', '2024-11-02 12:39:55', _binary '', _binary 0x70736d653039696a6e6b75376c647a39, _binary 0x696d616765, _binary '', 'Easy Stack Main', _binary '', '', _binary '', _binary 0x323032342f3131, _binary 0x32303234313130325f3132333935355f4635433236374541, _binary 0x656173792d737461636b2d6d61696e, 0, 0, 0, 0, 0, _binary 0x555443, _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, 0, _binary 0x7a7a, 2024, 11, 2, 0, _binary '', 0, 0, 3, 0, 1, 0, 1, 1, _binary '', _binary '', 1, _binary 0x75736d64646531776c7833636b736b71, '2024-11-03 18:20:06', '2025-01-14 08:43:57', '2024-11-04 09:21:05', NULL, '2025-01-14 08:43:57', '2025-01-14 08:43:57', NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            (26, _binary '', '2024-11-02 13:23:17', '2024-11-02 13:23:17', _binary '', _binary 0x70736d653039686978326e6b39323230, _binary 0x696d616765, _binary '', 'Easy Stack AG', _binary '', '', _binary '', _binary 0x323032342f3131, _binary 0x32303234313130325f3133323331375f4330334345454641, _binary 0x656173792d737461636b2d6167, 0, 0, 0, 0, 0, _binary 0x555443, _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, 0, _binary 0x7a7a, 2024, 11, 2, 0, _binary '', 0, 0, 3, 0, 1, 0, 1, 1, _binary '', _binary '', 1, _binary 0x75736d64646531776c7833636b736b71, '2024-11-03 18:20:05', '2025-01-14 08:43:57', '2024-11-04 09:21:05', NULL, '2025-01-14 08:43:57', '2025-01-14 08:43:57', NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            (27, _binary '', '2024-11-02 13:24:26', '2024-11-02 13:24:26', _binary '', _binary 0x70736d6530396834733134387032736f, _binary 0x696d616765, _binary '', 'Easy Stack AI', _binary '', '', _binary '', _binary 0x323032342f3131, _binary 0x32303234313130325f3133323432365f4643453641414544, _binary 0x656173792d737461636b2d6169, 0, 0, 0, 0, 0, _binary 0x555443, _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, 0, _binary 0x7a7a, 2024, 11, 2, 0, _binary '', 0, 0, 3, 0, 1, 0, 1, 1, _binary '', _binary '', 1, _binary 0x75736d64646531776c7833636b736b71, '2024-11-03 18:20:05', '2025-01-14 08:43:57', '2024-11-04 09:21:04', NULL, '2025-01-14 08:43:57', '2025-01-14 08:43:57', NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            (28, _binary '', '2024-11-02 13:25:20', '2024-11-02 13:25:20', _binary '', _binary 0x70736d6530396a77306473697a306a6e, _binary 0x696d616765, _binary '', 'Easy Stack PhotoPrism', _binary '', '', _binary '', _binary 0x323032342f3131, _binary 0x32303234313130325f3133323532305f3337463539434345, _binary 0x656173792d737461636b2d70686f746f707269736d, 0, 0, 0, 0, 0, _binary 0x555443, _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, 0, _binary 0x7a7a, 2024, 11, 2, 0, _binary '', 0, 0, 3, 0, 1, 0, 6, 1, _binary '', _binary '', 1, _binary 0x75736d64646531776c7833636b736b71, '2024-11-03 18:20:07', '2025-01-14 08:43:57', '2024-11-04 09:21:03', NULL, '2025-01-14 08:43:57', '2025-01-14 08:43:57', NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            (29, _binary '', '2024-11-02 14:40:12', '2024-11-02 14:40:12', _binary '', _binary 0x70736d6530396939763130686e787875, _binary 0x696d616765, _binary '', 'Easy Stack Paperless', _binary '', '', _binary '', _binary 0x323032342f3131, _binary 0x32303234313130325f3134343031325f4537304233463246, _binary 0x656173792d737461636b2d70617065726c657373, 0, 0, 0, 0, 0, _binary 0x555443, _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, 0, _binary 0x7a7a, 2024, 11, 2, 0, _binary '', 0, 0, 3, 0, 1, 0, 1, 1, _binary '', _binary '', 1, _binary 0x75736d64646531776c7833636b736b71, '2024-11-03 18:20:06', '2025-01-14 08:43:57', '2024-11-04 09:21:02', NULL, '2025-01-14 08:43:57', '2025-01-14 08:43:57', NULL),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            (31, _binary '', '2024-11-02 15:36:27', '2024-11-02 15:36:27', _binary '', _binary 0x70736d653039696c766c67736a6e7068, _binary 0x696d616765, _binary '', 'Easy Stack Base', _binary '', '', _binary '', _binary 0x323032342f3131, _binary 0x32303234313130325f3135333632375f4536383139343436, _binary 0x656173792d737461636b2d62617365, 0, 0, 0, 0, 0, _binary 0x555443, _binary 0x7a7a, _binary '', _binary 0x7a7a, 0, 0, 0, 0, _binary 0x7a7a, 2024, 11, 2, 0, _binary '', 0, 0, 3, 0, 1, 0, 6, 1, _binary '', _binary '', 1, _binary 0x75736d64646531776c7833636b736b71, '2024-11-03 18:20:06', '2025-01-14 08:43:57', '2024-11-04 09:21:01', NULL, '2025-01-14 08:43:57', '2025-01-14 08:43:57', NULL);

-- Exportiere Struktur von Tabelle photoprism.photos_albums
DROP TABLE IF EXISTS `photos_albums`;
CREATE TABLE IF NOT EXISTS `photos_albums` (
    `photo_uid` varbinary(42) NOT NULL,
    `album_uid` varbinary(42) NOT NULL,
    `order` int(11) DEFAULT NULL,
    `hidden` tinyint(1) DEFAULT NULL,
    `missing` tinyint(1) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`photo_uid`,`album_uid`),
    KEY `idx_photos_albums_album_uid` (`album_uid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.photos_albums: ~0 rows (ungefähr)
DELETE FROM `photos_albums`;

-- Exportiere Struktur von Tabelle photoprism.photos_keywords
DROP TABLE IF EXISTS `photos_keywords`;
CREATE TABLE IF NOT EXISTS `photos_keywords` (
    `photo_id` int(10) unsigned NOT NULL,
    `keyword_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`photo_id`,`keyword_id`),
    KEY `idx_photos_keywords_keyword_id` (`keyword_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.photos_keywords: ~108 rows (ungefähr)
DELETE FROM `photos_keywords`;
INSERT INTO `photos_keywords` (`photo_id`, `keyword_id`) VALUES
                                                             (1, 1),
                                                             (2, 1),
                                                             (4, 1),
                                                             (6, 1),
                                                             (25, 1),
                                                             (26, 1),
                                                             (27, 1),
                                                             (28, 1),
                                                             (29, 1),
                                                             (31, 1),
                                                             (1, 2),
                                                             (2, 2),
                                                             (4, 2),
                                                             (6, 2),
                                                             (25, 2),
                                                             (26, 2),
                                                             (27, 2),
                                                             (29, 2),
                                                             (1, 3),
                                                             (1, 4),
                                                             (6, 4),
                                                             (25, 4),
                                                             (26, 4),
                                                             (27, 4),
                                                             (28, 4),
                                                             (29, 4),
                                                             (31, 4),
                                                             (2, 5),
                                                             (2, 6),
                                                             (25, 7),
                                                             (6, 9),
                                                             (4, 10),
                                                             (4, 11),
                                                             (28, 14),
                                                             (6, 15),
                                                             (29, 15),
                                                             (28, 26),
                                                             (31, 26),
                                                             (28, 39),
                                                             (31, 41);

-- Exportiere Struktur von Tabelle photoprism.photos_labels
DROP TABLE IF EXISTS `photos_labels`;
CREATE TABLE IF NOT EXISTS `photos_labels` (
    `photo_id` int(10) unsigned NOT NULL,
    `label_id` int(10) unsigned NOT NULL,
    `label_src` varbinary(8) DEFAULT NULL,
    `uncertainty` smallint(6) DEFAULT NULL,
    PRIMARY KEY (`photo_id`,`label_id`),
    KEY `idx_photos_labels_label_id` (`label_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.photos_labels: ~20 rows (ungefähr)
DELETE FROM `photos_labels`;
INSERT INTO `photos_labels` (`photo_id`, `label_id`, `label_src`, `uncertainty`) VALUES
    (28, 1, _binary 0x696d616765, 85);

-- Exportiere Struktur von Tabelle photoprism.photos_users
DROP TABLE IF EXISTS `photos_users`;
CREATE TABLE IF NOT EXISTS `photos_users` (
    `uid` varbinary(42) NOT NULL,
    `user_uid` varbinary(42) NOT NULL,
    `team_uid` varbinary(42) DEFAULT NULL,
    `perm` int(10) unsigned DEFAULT NULL,
    PRIMARY KEY (`uid`,`user_uid`),
    KEY `idx_photos_users_user_uid` (`user_uid`),
    KEY `idx_photos_users_team_uid` (`team_uid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.photos_users: ~0 rows (ungefähr)
DELETE FROM `photos_users`;

-- Exportiere Struktur von Tabelle photoprism.places
DROP TABLE IF EXISTS `places`;
CREATE TABLE IF NOT EXISTS `places` (
    `id` varbinary(42) NOT NULL,
    `place_label` varchar(400) DEFAULT NULL,
    `place_district` varchar(100) DEFAULT NULL,
    `place_city` varchar(100) DEFAULT NULL,
    `place_state` varchar(100) DEFAULT NULL,
    `place_country` varbinary(2) DEFAULT NULL,
    `place_keywords` varchar(300) DEFAULT NULL,
    `place_favorite` tinyint(1) DEFAULT NULL,
    `photo_count` int(11) DEFAULT 1,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_places_place_city` (`place_city`),
    KEY `idx_places_place_state` (`place_state`),
    KEY `idx_places_place_district` (`place_district`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.places: ~0 rows (ungefähr)
DELETE FROM `places`;
INSERT INTO `places` (`id`, `place_label`, `place_district`, `place_city`, `place_state`, `place_country`, `place_keywords`, `place_favorite`, `photo_count`, `created_at`, `updated_at`) VALUES
    (_binary 0x7a7a, 'Unknown', 'Unknown', 'Unknown', 'Unknown', _binary 0x7a7a, '', 0, 10, '2024-11-03 19:45:31', '2024-11-03 19:45:31');

-- Exportiere Struktur von Tabelle photoprism.reactions
DROP TABLE IF EXISTS `reactions`;
CREATE TABLE IF NOT EXISTS `reactions` (
    `uid` varbinary(42) NOT NULL,
    `user_uid` varbinary(42) NOT NULL,
    `reaction` varbinary(64) NOT NULL,
    `reacted` int(11) DEFAULT NULL,
    `reacted_at` datetime DEFAULT NULL,
    PRIMARY KEY (`uid`,`user_uid`,`reaction`),
    KEY `idx_reactions_reacted_at` (`reacted_at`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.reactions: ~0 rows (ungefähr)
DELETE FROM `reactions`;

-- Exportiere Struktur von Tabelle photoprism.services
DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `acc_name` varchar(160) DEFAULT NULL,
    `acc_owner` varchar(160) DEFAULT NULL,
    `acc_url` varchar(255) DEFAULT NULL,
    `acc_type` varbinary(255) DEFAULT NULL,
    `acc_key` varbinary(255) DEFAULT NULL,
    `acc_user` varbinary(255) DEFAULT NULL,
    `acc_pass` varbinary(255) DEFAULT NULL,
    `acc_timeout` varbinary(16) DEFAULT NULL,
    `acc_error` varbinary(512) DEFAULT NULL,
    `acc_errors` int(11) DEFAULT NULL,
    `acc_share` tinyint(1) DEFAULT NULL,
    `acc_sync` tinyint(1) DEFAULT NULL,
    `retry_limit` int(11) DEFAULT NULL,
    `share_path` varbinary(1024) DEFAULT NULL,
    `share_size` varbinary(16) DEFAULT NULL,
    `share_expires` int(11) DEFAULT NULL,
    `sync_path` varbinary(1024) DEFAULT NULL,
    `sync_status` varbinary(16) DEFAULT NULL,
    `sync_interval` int(11) DEFAULT NULL,
    `sync_date` datetime DEFAULT NULL,
    `sync_upload` tinyint(1) DEFAULT NULL,
    `sync_download` tinyint(1) DEFAULT NULL,
    `sync_filenames` tinyint(1) DEFAULT NULL,
    `sync_raw` tinyint(1) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `deleted_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_services_deleted_at` (`deleted_at`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.services: ~0 rows (ungefähr)
DELETE FROM `services`;

-- Exportiere Struktur von Tabelle photoprism.subjects
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
    `subj_uid` varbinary(42) NOT NULL,
    `subj_type` varbinary(8) DEFAULT '',
    `subj_src` varbinary(8) DEFAULT '',
    `subj_slug` varbinary(160) DEFAULT '',
    `subj_name` varchar(160) DEFAULT '',
    `subj_alias` varchar(160) DEFAULT '',
    `subj_about` varchar(512) DEFAULT NULL,
    `subj_bio` varchar(2048) DEFAULT NULL,
    `subj_notes` varchar(1024) DEFAULT NULL,
    `subj_favorite` tinyint(1) DEFAULT 0,
    `subj_hidden` tinyint(1) DEFAULT 0,
    `subj_private` tinyint(1) DEFAULT 0,
    `subj_excluded` tinyint(1) DEFAULT 0,
    `file_count` int(11) DEFAULT 0,
    `photo_count` int(11) DEFAULT 0,
    `thumb` varbinary(128) DEFAULT '',
    `thumb_src` varbinary(8) DEFAULT '',
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `deleted_at` datetime DEFAULT NULL,
    PRIMARY KEY (`subj_uid`),
    UNIQUE KEY `uix_subjects_subj_name` (`subj_name`),
    KEY `idx_subjects_deleted_at` (`deleted_at`),
    KEY `idx_subjects_subj_slug` (`subj_slug`),
    KEY `idx_subjects_thumb` (`thumb`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.subjects: ~0 rows (ungefähr)
DELETE FROM `subjects`;

-- Exportiere Struktur von Tabelle photoprism.versions
DROP TABLE IF EXISTS `versions`;
CREATE TABLE IF NOT EXISTS `versions` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `version` varchar(255) DEFAULT NULL,
    `edition` varchar(255) DEFAULT NULL,
    `error` varchar(255) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `migrated_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_version_edition` (`version`,`edition`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Exportiere Daten aus Tabelle photoprism.versions: ~0 rows (ungefähr)
DELETE FROM `versions`;
INSERT INTO `versions` (`id`, `version`, `edition`, `error`, `created_at`, `updated_at`, `migrated_at`) VALUES
    (1, '240915-e1280b2fb-Linux-AMD64-Plus', 'plus', '', '2024-11-03 19:45:26', '2025-01-15 12:41:52', '2025-01-15 12:41:52');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
