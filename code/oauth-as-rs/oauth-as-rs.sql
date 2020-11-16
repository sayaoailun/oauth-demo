-- --------------------------------------------------------
-- 主机:                           192.168.56.101
-- 服务器版本:                        5.7.31 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 oauth_as_rs 的数据库结构
DROP DATABASE IF EXISTS `oauth_as_rs`;
CREATE DATABASE IF NOT EXISTS `oauth_as_rs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `oauth_as_rs`;

-- 导出  表 oauth_as_rs.authorities 结构
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE IF NOT EXISTS `authorities` (
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authority` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  oauth_as_rs.authorities 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` (`username`, `authority`) VALUES
	('guojwe', 'read'),
	('guojwe', 'write');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;

-- 导出  表 oauth_as_rs.ClientDetails 结构
DROP TABLE IF EXISTS `ClientDetails`;
CREATE TABLE IF NOT EXISTS `ClientDetails` (
  `appId` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resourceIds` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appSecret` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grantTypes` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirectUrl` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorities` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additionalInformation` varchar(4096) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autoApproveScopes` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`appId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  oauth_as_rs.ClientDetails 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `ClientDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClientDetails` ENABLE KEYS */;

-- 导出  表 oauth_as_rs.oauth_access_token 结构
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE IF NOT EXISTS `oauth_access_token` (
  `token_id` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  oauth_as_rs.oauth_access_token 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;

-- 导出  表 oauth_as_rs.oauth_approvals 结构
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE IF NOT EXISTS `oauth_approvals` (
  `userId` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientId` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifiedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  oauth_as_rs.oauth_approvals 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oauth_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_approvals` ENABLE KEYS */;

-- 导出  表 oauth_as_rs.oauth_client_details 结构
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE IF NOT EXISTS `oauth_client_details` (
  `client_id` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_ids` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_secret` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorized_grant_types` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorities` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autoapprove` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  oauth_as_rs.oauth_client_details 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES
	('first-client', NULL, '{bcrypt}$2a$10$cyf5NfobcruKQ8XGjUJkEegr9ZWFqaea6vjpXWEaSqTa2xL9wjgQC', 'all', 'client_credentials,authorization_code', 'http://127.0.0.1:8082/app', 'read,write', 3600, 60, NULL, 'all'),
	('second-client', NULL, '{bcrypt}$2a$10$cyf5NfobcruKQ8XGjUJkEegr9ZWFqaea6vjpXWEaSqTa2xL9wjgQC', 'all', 'client_credentials,authorization_code', 'http://127.0.0.1:8083/app', 'read,write', 3600, 60, NULL, 'all');
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;

-- 导出  表 oauth_as_rs.oauth_client_token 结构
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE IF NOT EXISTS `oauth_client_token` (
  `token_id` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  oauth_as_rs.oauth_client_token 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;

-- 导出  表 oauth_as_rs.oauth_code 结构
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE IF NOT EXISTS `oauth_code` (
  `code` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  oauth_as_rs.oauth_code 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;

-- 导出  表 oauth_as_rs.oauth_refresh_token 结构
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_token` (
  `token_id` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  oauth_as_rs.oauth_refresh_token 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;

-- 导出  表 oauth_as_rs.users 结构
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  oauth_as_rs.users 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
	('guojwe', '{bcrypt}$2a$10$cyf5NfobcruKQ8XGjUJkEegr9ZWFqaea6vjpXWEaSqTa2xL9wjgQC', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
