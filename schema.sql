-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 03/09/2014 às 00h51min
-- Versão do Servidor: 5.5.37
-- Versão do PHP: 5.4.29-2+deb.sury.org~precise+1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `baiak860`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(20) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `page_lastday` int(11) NOT NULL,
  `email_new` varchar(255) NOT NULL,
  `email_new_time` int(15) NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '0',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL,
  `last_post` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(255) NOT NULL,
  `viptime` int(15) NOT NULL DEFAULT '0',
  `vip_time` int(15) NOT NULL DEFAULT '0',
  `vipdays` int(15) NOT NULL DEFAULT '0',
  `salt` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `premdays`, `lastday`, `email`, `key`, `blocked`, `warnings`, `group_id`, `page_lastday`, `email_new`, `email_new_time`, `created`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `premium_points`, `vote`, `last_post`, `flag`, `viptime`, `vip_time`, `vipdays`, `salt`) VALUES
(1, '1', '356a192b7913b04c54574d18c28d46e6395428ab', 65535, 1403233043, 'hjuhf@hotmail.com', 'cd3aacdb0a47c2067fed', 0, 0, 1, 1275095419, '', 0, 0, '', '', 3, '0', 0, 0, 0, 1274912789, '', 0, 0, 0, ''),
(2, '2', '4f9fb344c4a6283fd1c60fd1e415cd3f07f378fc', 0, 1403230678, '', '0', 0, 0, 1, 0, '', 0, 0, '', '', 0, '0', 0, 0, 0, 0, '', 0, 0, 0, 'Y6DrpOxqpGRh2YO5ap4-n74Z3VlkQ8mcrBNmW69'),
(3, 'otservme', 'cf5625076da1c5ce05cb187bfb50f4ca7a69ef2b', 0, 1403230678, '', '0', 0, 0, 1, 0, '', 0, 0, '', '', 0, '0', 0, 0, 0, 0, '', 0, 0, 0, 'rA4uLY8w5Go6Zr8Yu2I-4jL9TX46jA5FmODS63w'),
(4, '363639', '692a1faf282a35a58edc009029a878e5bb5b3118', 0, 1403230678, '', '0', 0, 0, 1, 0, '', 0, 0, '', '', 0, '0', 0, 0, 0, 0, '', 0, 0, 0, 'i7RMON985437DFAz934-ybU29a7NSD28z249DEc');

--
-- Gatilhos `accounts`
--
DROP TRIGGER IF EXISTS `ondelete_accounts`;
DELIMITER //
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts`
 FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE IF NOT EXISTS `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  KEY `account_id` (`account_id`),
  KEY `player_id` (`player_id`),
  KEY `world_id` (`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) unsigned NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) unsigned NOT NULL DEFAULT '4294967295' COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL,
  `reason` int(10) NOT NULL DEFAULT '0',
  `added` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `action` int(10) unsigned NOT NULL DEFAULT '0',
  `statement` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`value`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `environment_killers`
--

CREATE TABLE IF NOT EXISTS `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `kill_id` (`kill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `environment_killers`
--

INSERT INTO `environment_killers` (`kill_id`, `name`) VALUES
(1, 'a rotworm');

-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE IF NOT EXISTS `global_storage` (
  `key` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `key` (`key`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE IF NOT EXISTS `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `balance` bigint(20) unsigned NOT NULL,
  `description` text NOT NULL,
  `logo_gfx_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Gatilhos `guilds`
--
DROP TRIGGER IF EXISTS `oncreate_guilds`;
DELIMITER //
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds`
 FOR EACH ROW BEGIN
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_guilds`;
DELIMITER //
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds`
 FOR EACH ROW BEGIN
	UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE IF NOT EXISTS `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_kills`
--

CREATE TABLE IF NOT EXISTS `guild_kills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guild_kills_ibfk_1` (`war_id`),
  KEY `guild_kills_ibfk_2` (`death_id`),
  KEY `guild_kills_ibfk_3` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE IF NOT EXISTS `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE IF NOT EXISTS `guild_wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT '0',
  `end` bigint(20) NOT NULL DEFAULT '0',
  `frags` int(10) unsigned NOT NULL DEFAULT '0',
  `payment` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guild_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `enemy_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `guild_id` (`guild_id`),
  KEY `enemy_id` (`enemy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `lastwarning` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `town` int(10) unsigned NOT NULL DEFAULT '0',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `rent` int(10) unsigned NOT NULL DEFAULT '0',
  `doors` int(10) unsigned NOT NULL DEFAULT '0',
  `beds` int(10) unsigned NOT NULL DEFAULT '0',
  `tiles` int(10) unsigned NOT NULL DEFAULT '0',
  `guild` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clear` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `houses`
--

INSERT INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
(1, 0, 0, 0, 0, 0, 'Tower 1', 1, 87, 2300000, 0, 1, 0, 115, 0, 0),
(2, 0, 0, 0, 0, 0, 'Tower II', 1, 47, 980000, 0, 0, 0, 49, 0, 0),
(3, 0, 0, 0, 0, 0, 'Small Street IV', 1, 19, 520000, 0, 1, 2, 26, 0, 0),
(4, 0, 0, 0, 0, 0, '', 0, 10, 80000, 0, 1, 2, 16, 0, 0),
(5, 0, 0, 0, 0, 0, '', 0, 30, 200000, 0, 2, 2, 40, 0, 0),
(6, 0, 0, 0, 0, 0, 'Flat VI', 1, 10, 80000, 0, 0, 2, 16, 0, 0),
(8, 0, 0, 0, 0, 0, 'Pirate Street', 0, 44, 1220000, 0, 1, 4, 61, 0, 0),
(11, 0, 0, 0, 0, 0, '', 0, 9, 105000, 0, 1, 0, 21, 0, 0),
(12, 0, 0, 0, 0, 0, '', 0, 107, 885000, 0, 3, 2, 177, 0, 0),
(13, 0, 0, 0, 0, 0, '', 0, 41, 255000, 0, 2, 2, 51, 0, 0),
(14, 0, 0, 0, 0, 0, '', 0, 51, 380000, 0, 3, 2, 76, 0, 0),
(15, 0, 0, 0, 0, 0, '', 0, 60, 360000, 0, 2, 2, 72, 0, 0),
(16, 0, 0, 0, 0, 0, '', 0, 48, 300000, 0, 2, 2, 60, 0, 0),
(17, 0, 0, 0, 0, 0, '', 0, 91, 860000, 0, 9, 8, 172, 0, 0),
(18, 0, 0, 0, 0, 0, '', 0, 39, 285000, 0, 2, 2, 57, 0, 0),
(21, 0, 0, 0, 0, 0, '', 0, 36, 255000, 0, 2, 2, 51, 0, 0),
(23, 0, 0, 0, 0, 0, '', 0, 39, 400000, 0, 3, 0, 80, 0, 0),
(24, 0, 0, 0, 0, 0, '', 0, 39, 325000, 0, 3, 0, 65, 0, 0),
(25, 0, 0, 0, 0, 0, 'Great Street I', 1, 18, 500000, 0, 1, 2, 25, 0, 0),
(26, 0, 0, 0, 0, 0, 'Great Street II', 1, 28, 680000, 0, 1, 2, 34, 0, 0),
(27, 0, 0, 0, 0, 0, '', 0, 47, 440000, 0, 3, 4, 88, 0, 0),
(28, 0, 0, 0, 0, 0, '', 0, 14, 180000, 0, 2, 4, 36, 0, 0),
(29, 0, 0, 0, 0, 0, 'Pharao Flat I', 3, 14, 225000, 0, 2, 4, 45, 0, 0),
(30, 0, 0, 0, 0, 0, 'Pharao Flat II', 3, 51, 410000, 0, 3, 0, 82, 0, 0),
(31, 0, 0, 0, 0, 0, 'River Street IV', 1, 0, 160000, 0, 0, 0, 8, 0, 0),
(32, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 1, 0, 0),
(33, 0, 0, 0, 0, 0, 'River Street VI', 1, 0, 160000, 0, 0, 0, 8, 0, 0),
(34, 0, 0, 0, 0, 0, 'Pharao Flat VI', 3, 0, 5000, 0, 0, 0, 1, 0, 0),
(35, 0, 0, 0, 0, 0, 'Condominio Europa II', 1, 10, 320000, 0, 1, 2, 16, 0, 0),
(36, 0, 0, 0, 0, 0, 'Condominio Europa III', 1, 28, 660000, 0, 1, 2, 33, 0, 0),
(37, 0, 0, 0, 0, 0, 'Upper Street I', 1, 32, 760000, 10000, 2, 2, 38, 0, 0),
(38, 0, 0, 0, 0, 0, 'Upper Street II', 1, 10, 300000, 0, 2, 2, 15, 0, 0),
(39, 0, 0, 0, 0, 0, 'Upper Street III', 1, 13, 360000, 0, 1, 2, 18, 0, 0),
(40, 0, 0, 0, 0, 0, 'Upper Street IV', 1, 20, 560000, 0, 2, 2, 28, 0, 0),
(41, 0, 0, 0, 0, 0, 'Upper Street V', 1, 23, 560000, 0, 1, 2, 28, 0, 0),
(42, 0, 0, 0, 0, 0, 'Heavy Depot House', 1, 19, 480000, 0, 1, 2, 24, 0, 0),
(43, 0, 0, 0, 0, 0, 'Alfon Flat VI', 4, 0, 25000, 0, 0, 0, 5, 0, 0),
(44, 0, 0, 0, 0, 0, 'Small Street V', 1, 26, 640000, 0, 1, 2, 32, 0, 0),
(45, 0, 0, 0, 0, 0, 'Small Street VI', 1, 10, 280000, 0, 1, 2, 14, 0, 0),
(46, 0, 0, 0, 0, 0, 'Small Street VII', 1, 14, 380000, 0, 1, 2, 19, 0, 0),
(47, 0, 0, 0, 0, 0, 'Alfon Flat X', 4, 10, 90000, 0, 1, 2, 18, 0, 0),
(48, 0, 0, 0, 0, 0, 'Alfon Flat XI', 4, 10, 75000, 0, 1, 2, 15, 0, 0),
(49, 0, 0, 0, 0, 0, 'Alfon Flat XII', 4, 14, 120000, 0, 1, 4, 24, 0, 0),
(50, 0, 0, 0, 0, 0, 'Alfon Flat XIII', 4, 10, 80000, 0, 1, 2, 16, 0, 0),
(51, 0, 0, 0, 0, 0, 'Alfon Flat XIV', 4, 10, 80000, 0, 1, 2, 16, 0, 0),
(52, 0, 0, 0, 0, 0, 'Safe House I', 1, 14, 400000, 0, 1, 2, 20, 0, 0),
(53, 0, 0, 0, 0, 0, 'Safe House II', 1, 6, 220000, 0, 1, 2, 11, 0, 0),
(54, 0, 0, 0, 0, 0, 'Safe House III', 1, 8, 260000, 0, 0, 2, 13, 0, 0),
(55, 0, 0, 0, 0, 0, 'Safe House IV', 1, 6, 220000, 0, 1, 2, 11, 0, 0),
(56, 0, 0, 0, 0, 0, 'Port house I', 1, 15, 380000, 0, 1, 2, 19, 0, 0),
(57, 0, 0, 0, 0, 0, 'Port house II', 1, 13, 360000, 0, 2, 2, 18, 0, 0),
(58, 0, 0, 0, 0, 0, 'Alfon House VI', 4, 38, 400000, 0, 2, 2, 80, 0, 0),
(59, 0, 0, 0, 0, 0, 'Hydraland I', 3, 30, 620000, 0, 0, 0, 31, 0, 0),
(60, 0, 0, 0, 0, 0, 'Hydraland II', 3, 30, 620000, 0, 0, 0, 31, 0, 0),
(61, 0, 0, 0, 0, 0, 'Hydraland III', 3, 42, 860000, 0, 0, 0, 43, 0, 0),
(62, 0, 0, 0, 0, 0, 'Hydraland IV', 3, 42, 860000, 0, 0, 0, 43, 0, 0),
(63, 0, 0, 0, 0, 0, 'Hydraland V', 3, 30, 620000, 0, 0, 0, 31, 0, 0),
(64, 0, 0, 0, 0, 0, 'Hydraland VI', 3, 15, 320000, 0, 0, 0, 16, 0, 0),
(65, 0, 0, 0, 0, 0, 'Hydraland VII', 3, 15, 320000, 0, 0, 0, 16, 0, 0),
(66, 0, 0, 0, 0, 0, 'Hydraland VIII', 3, 27, 580000, 0, 0, 0, 29, 0, 0),
(67, 0, 0, 0, 0, 0, 'Mountain Flat B', 2, 31, 170000, 0, 1, 2, 34, 0, 0),
(68, 0, 0, 0, 0, 0, 'Mountain Flat C', 2, 30, 165000, 0, 1, 2, 33, 0, 0),
(69, 0, 0, 0, 0, 0, 'Condominio Europa VI', 1, 0, 20000, 0, 0, 0, 1, 0, 0),
(70, 0, 0, 0, 0, 0, 'Liberty Bay I', 2, 26, 640000, 0, 0, 0, 32, 0, 0),
(71, 0, 0, 0, 0, 0, 'Liberty Bay II', 2, 37, 780000, 0, 0, 0, 39, 0, 0),
(72, 0, 0, 0, 0, 0, 'Liberty Bay III', 2, 45, 940000, 0, 0, 0, 47, 0, 0),
(73, 0, 0, 0, 0, 0, 'Liberty Bay IV', 2, 37, 780000, 0, 0, 0, 39, 0, 0),
(74, 0, 0, 0, 0, 0, 'Liberty Bay V', 2, 86, 1780000, 0, 0, 0, 89, 0, 0),
(75, 0, 0, 0, 0, 0, 'Liberty Bay VI', 2, 38, 820000, 0, 1, 0, 41, 0, 0),
(76, 0, 0, 0, 0, 0, 'Liberty Bay VII', 2, 33, 700000, 0, 0, 0, 35, 0, 0),
(77, 0, 0, 0, 0, 0, 'Liberty Bay VIII', 2, 26, 540000, 0, 0, 0, 27, 0, 0),
(78, 0, 0, 0, 0, 0, 'Liberty Bay IX', 2, 33, 700000, 0, 0, 0, 35, 0, 0),
(79, 0, 0, 0, 0, 0, 'Liberty Bay X', 2, 33, 700000, 0, 0, 0, 35, 0, 0),
(80, 0, 0, 0, 0, 0, 'Liberty Bay XI', 2, 33, 700000, 0, 0, 0, 35, 0, 0),
(81, 0, 0, 0, 0, 0, 'Liberty Bay XII', 2, 26, 540000, 0, 0, 0, 27, 0, 0),
(82, 0, 0, 0, 0, 0, 'Liberty Bay XIII', 2, 33, 700000, 0, 0, 0, 35, 0, 0),
(83, 0, 0, 0, 0, 0, 'Liberty Bay XIV', 2, 21, 440000, 0, 0, 0, 22, 0, 0),
(84, 0, 0, 0, 0, 0, 'Liberty Bay XV', 2, 23, 500000, 0, 0, 0, 25, 0, 0),
(85, 0, 0, 0, 0, 0, 'Liberty Bay XVI', 2, 18, 380000, 0, 0, 0, 19, 0, 0),
(86, 0, 0, 0, 0, 0, 'Venom House I', 5, 24, 125000, 0, 1, 0, 25, 0, 0),
(87, 0, 0, 0, 0, 0, 'Venom House II', 5, 70, 355000, 0, 1, 0, 71, 0, 0),
(88, 0, 0, 0, 0, 0, 'Venom House III', 5, 35, 180000, 0, 1, 0, 36, 0, 0),
(89, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 31, 0, 0),
(90, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 32, 0, 0),
(91, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 45, 0, 0),
(92, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 31, 0, 0),
(93, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 15, 0, 0),
(94, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 13, 0, 0),
(95, 0, 0, 0, 0, 0, 'Infernium House IV', 6, 40, 205000, 0, 0, 0, 41, 0, 0),
(96, 0, 0, 0, 0, 0, 'Infernium Flats I', 6, 25, 130000, 0, 0, 0, 26, 0, 0),
(97, 0, 0, 0, 0, 0, 'Infernium Flats II', 6, 25, 130000, 0, 0, 0, 26, 0, 0),
(98, 0, 0, 0, 0, 0, 'Infernium Flats III', 6, 25, 130000, 0, 0, 0, 26, 0, 0),
(99, 0, 0, 0, 0, 0, 'Infernium Flats IV', 6, 25, 130000, 0, 0, 0, 26, 0, 0),
(100, 0, 0, 0, 0, 0, 'Infernium Flats V', 6, 25, 130000, 0, 0, 0, 26, 0, 0),
(101, 0, 0, 0, 0, 0, 'Infernium Flats VI', 6, 25, 130000, 0, 0, 0, 26, 0, 0),
(102, 0, 0, 0, 0, 0, 'Infernium Flats VII', 6, 25, 130000, 0, 0, 0, 26, 0, 0),
(103, 0, 0, 0, 0, 0, 'Infernium Flats VIII', 6, 25, 130000, 0, 0, 0, 26, 0, 0),
(104, 0, 0, 0, 0, 0, 'Infernium Flats IX', 6, 25, 130000, 0, 0, 0, 26, 0, 0),
(105, 0, 0, 0, 0, 0, 'Infernium Flats X', 6, 25, 130000, 0, 0, 0, 26, 0, 0),
(106, 0, 0, 0, 0, 0, 'Infernium Flats XI', 6, 25, 130000, 0, 0, 0, 26, 0, 0),
(107, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 14, 0, 0),
(108, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 2, 24, 0, 0),
(109, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 2, 52, 0, 0),
(110, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 36, 0, 0),
(111, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 35, 0, 0),
(112, 0, 0, 0, 0, 0, 'Favela House 2', 1, 51, 1140000, 0, 1, 2, 57, 0, 0),
(113, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 22, 0, 0),
(114, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 32, 0, 0),
(115, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 26, 0, 0),
(116, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 33, 0, 0),
(117, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 25, 0, 0),
(118, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 59, 0, 0),
(119, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 4, 71, 0, 0),
(120, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 4, 72, 0, 0),
(121, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 4, 73, 0, 0),
(122, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 4, 76, 0, 0),
(123, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 4, 59, 0, 0),
(124, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 4, 59, 0, 0),
(125, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 8, 163, 0, 0),
(126, 0, 0, 0, 0, 0, 'River Street Max', 1, 0, 280000, 0, 0, 0, 14, 0, 0),
(127, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 22, 0, 0),
(128, 0, 0, 0, 0, 0, '', 0, 34, 240000, 0, 1, 6, 48, 0, 0),
(129, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 22, 0, 0),
(130, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 30, 0, 0),
(131, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 37, 0, 0),
(132, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 20, 0, 0),
(133, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 19, 0, 0),
(134, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 20, 0, 0),
(135, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 20, 0, 0),
(136, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 35, 0, 0),
(137, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 56, 0, 0),
(138, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 30, 0, 0),
(139, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 30, 0, 0),
(140, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 35, 0, 0),
(141, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 35, 0, 0),
(142, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 36, 0, 0),
(143, 0, 0, 0, 0, 0, '', 0, 30, 180000, 0, 1, 2, 36, 0, 0),
(144, 0, 0, 0, 0, 0, '', 0, 56, 330000, 0, 1, 4, 66, 0, 0),
(145, 0, 0, 0, 0, 0, '', 0, 30, 175000, 0, 1, 2, 35, 0, 0),
(146, 0, 0, 0, 0, 0, '', 0, 30, 190000, 0, 2, 2, 38, 0, 0),
(147, 0, 0, 0, 0, 0, '', 0, 44, 245000, 0, 1, 4, 49, 0, 0),
(148, 0, 0, 0, 0, 0, '', 0, 42, 230000, 0, 2, 2, 46, 0, 0),
(149, 0, 0, 0, 0, 0, '', 0, 42, 230000, 0, 2, 2, 46, 0, 0),
(150, 0, 0, 0, 0, 0, '', 0, 26, 155000, 0, 1, 4, 31, 0, 0),
(151, 0, 0, 0, 0, 0, '', 0, 20, 135000, 0, 1, 4, 27, 0, 0),
(152, 0, 0, 0, 0, 0, '', 0, 14, 120000, 0, 1, 4, 24, 0, 0),
(153, 0, 0, 0, 0, 0, '', 0, 20, 150000, 0, 1, 4, 30, 0, 0),
(154, 0, 0, 0, 0, 0, '', 0, 20, 150000, 0, 1, 4, 30, 0, 0),
(155, 0, 0, 0, 0, 0, '', 0, 38, 290000, 0, 2, 4, 58, 0, 0),
(156, 0, 0, 0, 0, 0, '', 0, 78, 445000, 0, 3, 4, 89, 0, 0),
(157, 0, 0, 0, 0, 0, '', 0, 94, 800000, 0, 6, 4, 160, 0, 0),
(158, 0, 0, 0, 0, 0, '', 0, 47, 275000, 0, 1, 3, 55, 0, 0),
(159, 0, 0, 0, 0, 0, '', 0, 33, 305000, 0, 4, 2, 61, 0, 0),
(160, 0, 0, 0, 0, 0, 'Yalahar 1', 5, 181, 5420000, 0, 7, 4, 271, 0, 0),
(161, 0, 0, 0, 0, 0, 'Yalahar 2', 5, 147, 5700000, 0, 7, 4, 285, 0, 0),
(162, 0, 0, 0, 0, 0, 'Yalahar 4', 5, 145, 4780000, 0, 3, 6, 239, 0, 0),
(163, 0, 0, 0, 0, 0, 'Yalahar 3', 5, 107, 3760000, 0, 6, 4, 188, 0, 0),
(164, 0, 0, 0, 0, 0, 'Yalahar 5', 5, 18, 740000, 0, 1, 12, 37, 0, 0),
(165, 0, 0, 0, 0, 0, 'Yalahar 6', 5, 4, 140000, 0, 1, 0, 7, 0, 0),
(166, 0, 0, 0, 0, 0, 'Yalahar 7', 5, 24, 640000, 0, 1, 6, 32, 0, 0),
(167, 0, 0, 0, 0, 0, 'Yalahar 17', 5, 11, 340000, 0, 1, 4, 17, 0, 0),
(168, 0, 0, 0, 0, 0, 'Yalahar 18', 5, 7, 260000, 0, 1, 4, 13, 0, 0),
(169, 0, 0, 0, 0, 0, 'Yalahar 16', 5, 29, 1180000, 0, 4, 6, 59, 0, 0),
(170, 0, 0, 0, 0, 0, 'Yalahar 19', 5, 28, 1320000, 0, 3, 6, 66, 0, 0),
(171, 0, 0, 0, 0, 0, 'Yalahar 20', 5, 9, 340000, 0, 1, 6, 17, 0, 0),
(172, 0, 0, 0, 0, 0, 'Yalahar 21', 5, 8, 480000, 0, 1, 6, 24, 0, 0),
(173, 0, 0, 0, 0, 0, 'Yalahar 8', 5, 3, 180000, 0, 1, 2, 9, 0, 0),
(174, 0, 0, 0, 0, 0, 'Yalahar 9', 5, 3, 180000, 0, 1, 2, 9, 0, 0),
(175, 0, 0, 0, 0, 0, 'Yalahar 11', 5, 3, 180000, 0, 1, 2, 9, 0, 0),
(176, 0, 0, 0, 0, 0, 'Yalahar 10', 5, 3, 180000, 0, 1, 2, 9, 0, 0),
(177, 0, 0, 0, 0, 0, 'Yalahar 12', 5, 3, 180000, 0, 1, 2, 9, 0, 0),
(178, 0, 0, 0, 0, 0, 'Yalahar 13', 5, 3, 180000, 0, 1, 2, 9, 0, 0),
(179, 0, 0, 0, 0, 0, 'Yalahar 14', 5, 3, 180000, 0, 1, 2, 9, 0, 0),
(180, 0, 0, 0, 0, 0, 'Yalahar 15', 5, 3, 200000, 0, 1, 2, 10, 0, 0),
(181, 0, 0, 0, 0, 0, 'Yalahar 22', 5, 22, 940000, 0, 2, 8, 47, 0, 0),
(182, 0, 0, 0, 0, 0, 'Yalahar 24', 5, 135, 3760000, 0, 5, 4, 188, 0, 0),
(183, 0, 0, 0, 0, 0, 'Yalahar 25', 5, 133, 3700000, 0, 4, 4, 185, 0, 0),
(184, 0, 0, 0, 0, 0, 'Yalahar 23', 5, 129, 4460000, 0, 4, 7, 223, 0, 0),
(185, 0, 0, 0, 0, 0, 'Yalahar 26', 5, 9, 420000, 0, 1, 6, 21, 0, 0),
(186, 0, 0, 0, 0, 0, 'Yalahar 27', 5, 4, 200000, 0, 1, 2, 10, 0, 0),
(187, 0, 0, 0, 0, 0, 'Yalahar 33', 5, 12, 600000, 0, 1, 8, 30, 0, 0),
(188, 0, 0, 0, 0, 0, 'Yalahar 36', 5, 16, 740000, 0, 1, 4, 37, 0, 0),
(189, 0, 0, 0, 0, 0, 'Yalahar 38', 5, 3, 240000, 0, 1, 2, 12, 0, 0),
(190, 0, 0, 0, 0, 0, 'Yalahar 37', 5, 6, 360000, 0, 1, 2, 18, 0, 0),
(191, 0, 0, 0, 0, 0, 'Yalahar 29', 5, 3, 300000, 0, 1, 6, 15, 0, 0),
(192, 0, 0, 0, 0, 0, 'Yalahar 28', 5, 8, 420000, 0, 1, 2, 21, 0, 0),
(193, 0, 0, 0, 0, 0, 'Yalahar 30', 5, 19, 920000, 0, 3, 8, 46, 0, 0),
(194, 0, 0, 0, 0, 0, 'Yalahar 32', 5, 37, 940000, 0, 1, 0, 47, 0, 0),
(195, 0, 0, 0, 0, 0, 'Yalahar 31', 5, 11, 520000, 0, 1, 4, 26, 0, 0),
(196, 0, 0, 0, 0, 0, 'Yalahar 34', 5, 9, 540000, 0, 1, 6, 27, 0, 0),
(197, 0, 0, 0, 0, 0, 'Yalahar 35', 5, 16, 960000, 0, 1, 6, 48, 0, 0),
(198, 0, 0, 0, 0, 0, 'Yalahar 41', 5, 9, 520000, 0, 1, 4, 26, 0, 0),
(199, 0, 0, 0, 0, 0, 'Yalahar 40', 5, 5, 360000, 0, 1, 0, 18, 0, 0),
(200, 0, 0, 0, 0, 0, 'Yalahar 39', 5, 23, 940000, 0, 1, 6, 47, 0, 0),
(201, 0, 0, 0, 0, 0, '', 0, 6, 45000, 0, 1, 2, 9, 0, 0),
(202, 0, 0, 0, 0, 0, '', 0, 6, 45000, 0, 1, 2, 9, 0, 0),
(203, 0, 0, 0, 0, 0, '', 0, 8, 55000, 0, 1, 2, 11, 0, 0),
(204, 0, 0, 0, 0, 0, '', 0, 67, 555000, 0, 2, 2, 111, 0, 0),
(205, 0, 0, 0, 0, 0, 'Yalahar 44', 5, 97, 3260000, 0, 4, 4, 163, 0, 0),
(206, 0, 0, 0, 0, 0, 'Yalahar 45', 5, 123, 3440000, 0, 2, 4, 172, 0, 0),
(207, 0, 0, 0, 0, 0, 'Guild House Yalahar', 5, 446, 17540000, 0, 11, 58, 877, 0, 0),
(208, 0, 0, 0, 0, 0, 'Yalahar 48', 5, 111, 4320000, 0, 4, 4, 216, 0, 0),
(209, 0, 0, 0, 0, 0, 'Yalahar 49', 5, 176, 6720000, 0, 4, 6, 336, 0, 0),
(210, 0, 0, 0, 0, 0, 'Yalahar 50', 5, 87, 3040000, 0, 2, 4, 152, 0, 0),
(211, 0, 0, 0, 0, 0, 'Yalahar 51', 5, 7, 240000, 0, 1, 2, 12, 0, 0),
(212, 0, 0, 0, 0, 0, 'Yalahar 52', 5, 7, 240000, 0, 1, 2, 12, 0, 0),
(213, 0, 0, 0, 0, 0, 'Yalahar 53', 5, 20, 700000, 0, 1, 4, 35, 0, 0),
(214, 0, 0, 0, 0, 0, 'Yalahar 54', 5, 6, 580000, 0, 1, 0, 29, 0, 0),
(215, 0, 0, 0, 0, 0, 'Yalahar 42', 5, 52, 1940000, 0, 4, 2, 97, 0, 0),
(216, 0, 0, 0, 0, 0, 'Yalahar 46', 5, 11, 660000, 0, 1, 4, 33, 0, 0),
(217, 0, 0, 0, 0, 0, 'Yalahar 47', 5, 5, 360000, 0, 1, 0, 18, 0, 0),
(218, 0, 0, 0, 0, 0, '', 0, 12, 165000, 0, 1, 2, 33, 0, 0),
(219, 0, 0, 0, 0, 0, 'Yalahar 43', 5, 79, 3300000, 0, 5, 8, 165, 0, 0),
(220, 0, 0, 0, 0, 0, '', 0, 9, 140000, 0, 1, 2, 28, 0, 0),
(221, 0, 0, 0, 0, 0, '', 0, 32, 320000, 0, 6, 4, 64, 0, 0),
(222, 0, 0, 0, 0, 0, '', 0, 31, 440000, 0, 5, 8, 88, 0, 0),
(223, 0, 0, 0, 0, 0, '', 0, 16, 210000, 0, 1, 4, 42, 0, 0),
(224, 0, 0, 0, 0, 0, '', 0, 16, 175000, 0, 1, 4, 35, 0, 0),
(225, 0, 0, 0, 0, 0, '', 0, 26, 280000, 0, 1, 2, 56, 0, 0),
(226, 0, 0, 0, 0, 0, '', 0, 32, 270000, 0, 1, 4, 54, 0, 0),
(227, 0, 0, 0, 0, 0, '', 0, 46, 455000, 0, 1, 4, 91, 0, 0),
(228, 0, 0, 0, 0, 0, '', 0, 20, 270000, 0, 5, 4, 54, 0, 0),
(234, 0, 0, 0, 0, 0, 'Thais 1', 6, 15, 720000, 0, 1, 0, 36, 0, 0),
(235, 0, 0, 0, 0, 0, 'Thais 2', 6, 24, 1000000, 0, 2, 0, 50, 0, 0),
(236, 0, 0, 0, 0, 0, 'Thais 3', 6, 16, 600000, 0, 1, 0, 30, 0, 0),
(237, 0, 0, 0, 0, 0, 'Thais 4', 6, 12, 400000, 0, 1, 0, 20, 0, 0),
(238, 0, 0, 0, 0, 0, 'Thais 5', 6, 22, 620000, 0, 2, 0, 31, 0, 0),
(239, 0, 0, 0, 0, 0, 'Thais 6', 6, 32, 1400000, 0, 3, 6, 70, 0, 0),
(240, 0, 0, 0, 0, 0, 'Thais 7', 6, 48, 1560000, 0, 4, 6, 78, 0, 0),
(241, 0, 0, 0, 0, 0, 'Thais 8', 6, 161, 5800000, 0, 13, 24, 290, 0, 0),
(242, 0, 0, 0, 0, 0, 'Thais 9', 6, 14, 480000, 0, 1, 4, 24, 0, 0),
(243, 0, 0, 0, 0, 0, 'Thais 10', 6, 10, 300000, 0, 1, 2, 15, 0, 0),
(244, 0, 0, 0, 0, 0, 'Thais 11', 6, 12, 380000, 0, 1, 4, 19, 0, 0),
(245, 0, 0, 0, 0, 0, 'Thais 12', 6, 12, 500000, 0, 1, 4, 25, 0, 0),
(246, 0, 0, 0, 0, 0, 'Thais 13', 6, 10, 400000, 0, 1, 2, 20, 0, 0),
(247, 0, 0, 0, 0, 0, 'Thais 14', 6, 10, 300000, 0, 1, 2, 15, 0, 0),
(248, 0, 0, 0, 0, 0, 'Thais 15', 6, 10, 300000, 0, 1, 2, 15, 0, 0),
(249, 0, 0, 0, 0, 0, 'Thais 16', 6, 10, 300000, 0, 1, 2, 15, 0, 0),
(250, 0, 0, 0, 0, 0, 'Thais 17', 6, 12, 460000, 0, 1, 4, 23, 0, 0),
(251, 0, 0, 0, 0, 0, 'Thais 18', 6, 10, 300000, 0, 1, 2, 15, 0, 0),
(252, 0, 0, 0, 0, 0, 'Thais 19', 6, 12, 600000, 0, 1, 4, 30, 0, 0),
(253, 0, 0, 0, 0, 0, 'Thais 20', 6, 10, 300000, 0, 1, 2, 15, 0, 0),
(254, 0, 0, 0, 0, 0, 'Thais 21', 6, 10, 300000, 0, 1, 2, 15, 0, 0),
(255, 0, 0, 0, 0, 0, 'Thais 22', 6, 10, 300000, 0, 1, 2, 15, 0, 0),
(256, 0, 0, 0, 0, 0, 'Thais 23', 6, 10, 300000, 0, 1, 2, 15, 0, 0),
(257, 0, 0, 0, 0, 0, 'Thais 24', 6, 44, 1420000, 0, 5, 6, 71, 0, 0),
(258, 0, 0, 0, 0, 0, 'Thais 25', 6, 24, 660000, 0, 1, 6, 33, 0, 0),
(259, 0, 0, 0, 0, 0, 'Thais 26', 6, 34, 1100000, 0, 3, 6, 55, 0, 0),
(260, 0, 0, 0, 0, 0, 'Thais 27', 6, 12, 460000, 0, 1, 4, 23, 0, 0),
(261, 0, 0, 0, 0, 0, 'Thais 28', 6, 20, 600000, 0, 1, 4, 30, 0, 0),
(262, 0, 0, 0, 0, 0, 'Thais 29', 6, 20, 540000, 0, 1, 4, 27, 0, 0),
(263, 0, 0, 0, 0, 0, 'Thais 30', 6, 14, 440000, 0, 1, 2, 22, 0, 0),
(264, 0, 0, 0, 0, 0, 'Thais 31', 6, 14, 380000, 0, 1, 2, 19, 0, 0),
(265, 0, 0, 0, 0, 0, 'Thais 32', 6, 14, 400000, 0, 1, 2, 20, 0, 0),
(266, 0, 0, 0, 0, 0, 'Thais 33', 6, 14, 380000, 0, 1, 2, 19, 0, 0),
(267, 0, 0, 0, 0, 0, 'Thais 34', 6, 14, 400000, 0, 1, 2, 20, 0, 0),
(268, 0, 0, 0, 0, 0, 'Thais 35', 6, 12, 420000, 0, 1, 4, 21, 0, 0),
(269, 0, 0, 0, 0, 0, 'Thais 36', 6, 14, 380000, 0, 1, 2, 19, 0, 0),
(270, 0, 0, 0, 0, 0, 'Thais 37', 6, 16, 580000, 0, 2, 2, 29, 0, 0),
(271, 0, 0, 0, 0, 0, 'Thais 38', 6, 25, 720000, 0, 2, 4, 36, 0, 0),
(272, 0, 0, 0, 0, 0, 'Thais 39', 6, 25, 780000, 0, 2, 4, 39, 0, 0),
(273, 0, 0, 0, 0, 0, 'Thais 40', 6, 16, 720000, 0, 2, 2, 36, 0, 0),
(274, 0, 0, 0, 0, 0, 'Thais 41', 6, 16, 540000, 0, 2, 2, 27, 0, 0),
(275, 0, 0, 0, 0, 0, 'Thais 42', 6, 14, 480000, 0, 1, 2, 24, 0, 0),
(276, 0, 0, 0, 0, 0, 'Thais 43', 6, 16, 500000, 0, 2, 2, 25, 0, 0),
(277, 0, 0, 0, 0, 0, 'Thais 44', 6, 14, 440000, 0, 1, 2, 22, 0, 0),
(278, 0, 0, 0, 0, 0, 'Thais 45', 6, 16, 540000, 0, 2, 2, 27, 0, 0),
(279, 0, 0, 0, 0, 0, 'Thais 46', 6, 25, 860000, 0, 2, 4, 43, 0, 0),
(280, 0, 0, 0, 0, 0, 'Thais 47', 6, 25, 780000, 0, 2, 4, 39, 0, 0),
(281, 0, 0, 0, 0, 0, 'Thais 48', 6, 16, 600000, 0, 2, 2, 30, 0, 0),
(282, 0, 0, 0, 0, 0, 'Thais 49', 6, 14, 500000, 0, 1, 2, 25, 0, 0),
(283, 0, 0, 0, 0, 0, 'Thais 50', 6, 14, 500000, 0, 1, 2, 25, 0, 0),
(284, 0, 0, 0, 0, 0, 'Thais 51', 6, 46, 1840000, 0, 7, 8, 92, 0, 0),
(285, 0, 0, 0, 0, 0, 'Thais 52', 6, 46, 1960000, 0, 7, 8, 98, 0, 0),
(286, 0, 0, 0, 0, 0, 'Thais 53', 6, 46, 1940000, 0, 6, 8, 97, 0, 0),
(287, 0, 0, 0, 0, 0, 'Thais 54', 6, 14, 400000, 0, 1, 2, 20, 0, 0),
(288, 0, 0, 0, 0, 0, 'Thais 55', 6, 63, 2440000, 0, 3, 48, 122, 0, 0),
(289, 0, 0, 0, 0, 0, 'Thais 56', 6, 146, 4640000, 0, 11, 20, 232, 0, 0),
(290, 0, 0, 0, 0, 0, 'Thais 57', 6, 43, 1320000, 0, 2, 2, 66, 0, 0),
(291, 0, 0, 0, 0, 0, 'Thais 58', 6, 16, 700000, 0, 1, 4, 35, 0, 0),
(292, 0, 0, 0, 0, 0, 'Thais 59', 6, 12, 500000, 0, 1, 4, 25, 0, 0),
(293, 0, 0, 0, 0, 0, 'Thais 60', 6, 16, 560000, 0, 1, 4, 28, 0, 0),
(294, 0, 0, 0, 0, 0, 'Thais 61', 6, 14, 560000, 0, 1, 4, 28, 0, 0),
(295, 0, 0, 0, 0, 0, 'Thais 62', 6, 10, 400000, 0, 1, 2, 20, 0, 0),
(296, 0, 0, 0, 0, 0, 'Thais 63', 6, 10, 320000, 0, 1, 2, 16, 0, 0),
(297, 0, 0, 0, 0, 0, 'Thais 64', 6, 10, 300000, 0, 1, 2, 15, 0, 0),
(298, 0, 0, 0, 0, 0, 'Thais 65', 6, 10, 300000, 0, 1, 2, 15, 0, 0),
(299, 0, 0, 0, 0, 0, 'Thais 66', 6, 10, 300000, 0, 1, 2, 15, 0, 0),
(300, 0, 0, 0, 0, 0, 'Thais 67', 6, 43, 1460000, 0, 3, 0, 73, 0, 0),
(301, 0, 0, 0, 0, 0, 'Thais 68', 6, 19, 700000, 0, 2, 2, 35, 0, 0),
(302, 0, 0, 0, 0, 0, 'Thais 69', 6, 42, 1040000, 0, 2, 4, 52, 0, 0),
(303, 0, 0, 0, 0, 0, 'Thais 70', 6, 29, 780000, 0, 1, 4, 39, 0, 0),
(304, 0, 0, 0, 0, 0, 'Thais 71', 6, 36, 900000, 0, 1, 2, 45, 0, 0),
(305, 0, 0, 0, 0, 0, 'Thais 72', 6, 29, 820000, 0, 1, 4, 41, 0, 0),
(307, 0, 0, 0, 0, 0, 'Thais 73', 6, 32, 1040000, 0, 2, 4, 52, 0, 0),
(308, 0, 0, 0, 0, 0, 'Thais 74', 6, 17, 760000, 0, 2, 2, 38, 0, 0),
(309, 0, 0, 0, 0, 0, 'Thais 75', 6, 36, 1020000, 0, 3, 4, 51, 0, 0),
(310, 0, 0, 0, 0, 0, 'Thais 76', 6, 51, 1520000, 0, 4, 4, 76, 0, 0),
(311, 0, 0, 0, 0, 0, 'Thais 77', 6, 21, 600000, 0, 1, 4, 30, 0, 0),
(312, 0, 0, 0, 0, 0, 'Thais 78', 6, 21, 780000, 0, 1, 4, 39, 0, 0),
(313, 0, 0, 0, 0, 0, 'Thais 79', 6, 21, 680000, 0, 1, 4, 34, 0, 0),
(314, 0, 0, 0, 0, 0, 'Thais 80', 6, 21, 680000, 0, 1, 4, 34, 0, 0),
(315, 0, 0, 0, 0, 0, 'Thais 81', 6, 16, 600000, 0, 1, 4, 30, 0, 0),
(316, 0, 0, 0, 0, 0, 'Thais 82', 6, 16, 660000, 0, 1, 4, 33, 0, 0),
(317, 0, 0, 0, 0, 0, 'Thais 83', 6, 16, 600000, 0, 1, 4, 30, 0, 0),
(318, 0, 0, 0, 0, 0, 'Thais 84', 6, 16, 560000, 0, 1, 4, 28, 0, 0),
(319, 0, 0, 0, 0, 0, 'Thais 85', 6, 16, 560000, 0, 1, 4, 28, 0, 0),
(320, 0, 0, 0, 0, 0, 'Thais 86', 6, 16, 600000, 0, 1, 4, 30, 0, 0),
(321, 0, 0, 0, 0, 0, 'Thais 87', 6, 57, 2120000, 0, 7, 8, 106, 0, 0),
(322, 0, 0, 0, 0, 0, 'Thais 88', 6, 10, 400000, 0, 1, 2, 20, 0, 0),
(323, 0, 0, 0, 0, 0, 'Thais  89', 6, 10, 500000, 0, 1, 2, 25, 0, 0),
(324, 0, 0, 0, 0, 0, 'Thais 90', 6, 10, 500000, 0, 1, 2, 25, 0, 0),
(325, 0, 0, 0, 0, 0, 'Thais 91', 6, 14, 500000, 0, 1, 4, 25, 0, 0),
(326, 0, 0, 0, 0, 0, 'Thais  92', 6, 10, 460000, 0, 1, 2, 23, 0, 0),
(327, 0, 0, 0, 0, 0, 'Thais 93', 6, 10, 400000, 0, 1, 2, 20, 0, 0),
(328, 0, 0, 0, 0, 0, 'Thais 94', 6, 10, 400000, 0, 1, 2, 20, 0, 0),
(329, 0, 0, 0, 0, 0, 'Thais 96', 6, 10, 400000, 0, 1, 2, 20, 0, 0),
(330, 0, 0, 0, 0, 0, 'Thais 95', 6, 16, 560000, 0, 1, 2, 28, 0, 0),
(331, 0, 0, 0, 0, 0, 'Thais 97', 6, 10, 400000, 0, 1, 2, 20, 0, 0),
(332, 0, 0, 0, 0, 0, 'Thais 98', 6, 16, 700000, 0, 1, 2, 35, 0, 0),
(333, 0, 0, 0, 0, 0, 'Thais 99', 6, 10, 500000, 0, 1, 2, 25, 0, 0),
(334, 0, 0, 0, 0, 0, 'Thais 100', 6, 13, 580000, 0, 1, 2, 29, 0, 0),
(335, 0, 0, 0, 0, 0, 'Thais 101', 6, 13, 400000, 0, 1, 2, 20, 0, 0),
(336, 0, 0, 0, 0, 0, 'Thais 102', 6, 13, 480000, 0, 1, 2, 24, 0, 0),
(1268, 0, 0, 0, 0, 0, 'Unnamed House #1268', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1269, 0, 0, 0, 0, 0, 'Unnamed House #1269', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1270, 0, 0, 0, 0, 0, 'Unnamed House #1270', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1271, 0, 0, 0, 0, 0, 'Unnamed House #1271', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1272, 0, 0, 0, 0, 0, 'Unnamed House #1272', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1273, 0, 0, 0, 0, 0, 'Unnamed House #1273', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1274, 0, 0, 0, 0, 0, 'Unnamed House #1274', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1275, 0, 0, 0, 0, 0, 'Unnamed House #1275', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1276, 0, 0, 0, 0, 0, 'Unnamed House #1276', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1277, 0, 0, 0, 0, 0, 'Unnamed House #1277', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1278, 0, 0, 0, 0, 0, 'Unnamed House #1278', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1279, 0, 0, 0, 0, 0, 'Unnamed House #1279', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1280, 0, 0, 0, 0, 0, 'Unnamed House #1280', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1281, 0, 0, 0, 0, 0, 'Unnamed House #1281', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1282, 0, 0, 0, 0, 0, 'Unnamed House #1282', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1284, 0, 0, 0, 0, 0, 'Unnamed House #1284', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1285, 0, 0, 0, 0, 0, 'Unnamed House #1285', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1286, 0, 0, 0, 0, 0, 'Unnamed House #1286', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1287, 0, 0, 0, 0, 0, 'Unnamed House #1287', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1288, 0, 0, 0, 0, 0, 'Unnamed House #1288', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1289, 0, 0, 0, 0, 0, 'Unnamed House #1289', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1290, 0, 0, 0, 0, 0, 'Unnamed House #1290', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1291, 0, 0, 0, 0, 0, 'Unnamed House #1291', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1292, 0, 0, 0, 0, 0, 'Unnamed House #1292', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1293, 0, 0, 0, 0, 0, 'Unnamed House #1293', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1294, 0, 0, 0, 0, 0, 'Unnamed House #1294', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1295, 0, 0, 0, 0, 0, 'Unnamed House #1295', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1296, 0, 0, 0, 0, 0, 'Unnamed House #1296', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1297, 0, 0, 0, 0, 0, 'Unnamed House #1297', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1298, 0, 0, 0, 0, 0, 'Unnamed House #1298', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1299, 0, 0, 0, 0, 0, 'Unnamed House #1299', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1300, 0, 0, 0, 0, 0, 'Unnamed House #1300', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1301, 0, 0, 0, 0, 0, 'Unnamed House #1301', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1302, 0, 0, 0, 0, 0, 'Unnamed House #1302', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1303, 0, 0, 0, 0, 0, 'Unnamed House #1303', 9, 0, 5000, 0, 0, 0, 1, 0, 0),
(1304, 0, 0, 0, 0, 0, 'Unnamed House #1304', 9, 180, 1080000, 0, 4, 4, 216, 0, 0),
(1305, 0, 0, 0, 0, 0, 'Unnamed House #1305', 9, 114, 720000, 0, 4, 4, 144, 0, 0),
(1306, 0, 0, 0, 0, 0, 'Unnamed House #1306', 9, 121, 830000, 0, 5, 8, 166, 0, 0),
(1307, 0, 0, 0, 0, 0, 'Unnamed House #1307', 9, 87, 510000, 0, 2, 4, 102, 0, 0),
(1308, 0, 0, 0, 0, 0, 'Unnamed House #1308', 9, 16, 145000, 0, 1, 10, 29, 0, 0),
(1309, 0, 0, 0, 0, 0, 'Unnamed House #1309', 9, 16, 105000, 0, 1, 4, 21, 0, 0),
(1310, 0, 0, 0, 0, 0, 'Unnamed House #1310', 9, 17, 170000, 0, 1, 8, 34, 0, 0),
(1311, 0, 0, 0, 0, 0, 'Unnamed House #1311', 9, 14, 105000, 0, 1, 6, 21, 0, 0),
(1312, 0, 0, 0, 0, 0, 'Unnamed House #1312', 9, 20, 125000, 0, 1, 4, 25, 0, 0),
(1319, 0, 0, 0, 0, 0, 'Unnamed House #1319', 9, 24, 180000, 0, 1, 2, 36, 0, 0),
(1320, 0, 0, 0, 0, 0, 'Unnamed House #1320', 9, 81, 640000, 0, 5, 8, 128, 0, 0),
(1321, 0, 0, 0, 0, 0, 'Unnamed House #1321', 9, 97, 610000, 0, 4, 4, 122, 0, 0),
(1322, 0, 0, 0, 0, 0, 'Unnamed House #1322', 9, 98, 550000, 0, 1, 4, 110, 0, 0),
(1323, 0, 0, 0, 0, 0, 'Unnamed House #1323', 9, 53, 385000, 0, 3, 2, 77, 0, 0),
(1324, 0, 0, 0, 0, 0, 'Unnamed House #1324', 9, 61, 400000, 0, 3, 4, 80, 0, 0),
(1325, 0, 0, 0, 0, 0, 'Unnamed House #1325', 9, 19, 205000, 0, 3, 8, 41, 0, 0),
(1326, 0, 0, 0, 0, 0, 'Unnamed House #1326', 9, 93, 635000, 0, 3, 12, 127, 0, 0),
(1327, 0, 0, 0, 0, 0, 'Unnamed House #1327', 9, 19, 200000, 0, 3, 8, 40, 0, 0),
(1329, 0, 0, 0, 0, 0, 'Unnamed House #1329', 9, 4, 35000, 0, 1, 2, 7, 0, 0),
(1330, 0, 0, 0, 0, 0, 'Unnamed House #1330', 9, 9, 90000, 0, 1, 6, 18, 0, 0),
(1331, 0, 0, 0, 0, 0, 'Unnamed House #1331', 9, 13, 115000, 0, 1, 8, 23, 0, 0),
(1332, 0, 0, 0, 0, 0, 'Unnamed House #1332', 9, 16, 120000, 0, 1, 4, 24, 0, 0),
(1333, 0, 0, 0, 0, 0, 'Unnamed House #1333', 9, 9, 100000, 0, 1, 6, 20, 0, 0),
(1334, 0, 0, 0, 0, 0, 'Unnamed House #1334', 9, 11, 105000, 0, 1, 4, 21, 0, 0),
(1335, 0, 0, 0, 0, 0, 'Unnamed House #1335', 9, 3, 40000, 0, 1, 2, 8, 0, 0),
(1336, 0, 0, 0, 0, 0, 'Unnamed House #1336', 9, 6, 55000, 0, 1, 2, 11, 0, 0),
(1337, 0, 0, 0, 0, 0, 'Unnamed House #1337', 9, 9, 75000, 0, 1, 4, 15, 0, 0),
(1338, 0, 0, 0, 0, 0, 'Unnamed House #1338', 9, 5, 50000, 0, 1, 0, 10, 0, 0),
(1339, 0, 0, 0, 0, 0, 'Unnamed House #1339', 9, 129, 825000, 0, 3, 4, 165, 0, 0),
(1340, 0, 0, 0, 0, 0, 'Unnamed House #1340', 9, 67, 385000, 0, 2, 4, 77, 0, 0),
(1341, 0, 0, 0, 0, 0, 'Unnamed House #1341', 9, 135, 855000, 0, 5, 4, 171, 0, 0),
(1342, 0, 0, 0, 0, 0, 'Unnamed House #1342', 9, 243, 1430000, 0, 4, 0, 286, 0, 0),
(1343, 0, 0, 0, 0, 0, 'Unnamed House #1343', 9, 68, 550000, 0, 9, 0, 110, 0, 0),
(1344, 0, 0, 0, 0, 0, 'Unnamed House #1344', 9, 232, 1490000, 0, 10, 0, 298, 0, 0),
(1345, 0, 0, 0, 0, 0, 'Unnamed House #1345', 9, 148, 1120000, 0, 8, 4, 224, 0, 0),
(1346, 0, 0, 0, 0, 0, 'Unnamed House #1346', 9, 186, 1150000, 0, 7, 0, 230, 0, 0),
(1347, 0, 0, 0, 0, 0, 'Unnamed House #1347', 9, 124, 695000, 0, 6, 2, 139, 0, 0),
(1348, 0, 0, 0, 0, 0, 'Unnamed House #1348', 9, 145, 890000, 0, 3, 6, 178, 0, 0),
(1365, 0, 0, 0, 0, 0, 'Unnamed House #1365', 9, 16, 105000, 0, 1, 4, 21, 0, 0),
(1366, 0, 0, 0, 0, 0, 'Unnamed House #1366', 9, 17, 235000, 0, 1, 10, 47, 0, 0),
(1367, 0, 0, 0, 0, 0, 'Unnamed House #1367', 9, 28, 235000, 0, 2, 6, 47, 0, 0),
(1368, 0, 0, 0, 0, 0, 'Unnamed House #1368', 9, 8, 80000, 0, 1, 6, 16, 0, 0),
(1369, 0, 0, 0, 0, 0, 'Unnamed House #1369', 9, 9, 80000, 0, 1, 6, 16, 0, 0),
(1380, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 1, 0, 0),
(1381, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 1, 0, 0),
(1382, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 1, 0, 0),
(1383, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 1, 0, 0),
(1434, 0, 0, 0, 0, 0, 'Unnamed House #1434', 1, 0, 85000, 0, 0, 0, 17, 0, 0),
(1435, 0, 0, 0, 0, 0, 'Saara House 1', 1, 33, 245000, 0, 1, 2, 49, 0, 0),
(1436, 0, 0, 0, 0, 0, 'Saara House 2', 1, 65, 495000, 0, 1, 0, 99, 0, 0),
(1437, 0, 0, 0, 0, 0, 'Saara House 3', 1, 110, 610000, 10000, 1, 10, 122, 0, 0),
(1438, 0, 0, 0, 0, 0, 'Saara House 4', 1, 62, 325000, 10000, 1, 2, 65, 0, 0),
(1439, 0, 0, 0, 0, 0, 'Saara House 5', 1, 66, 395000, 10000, 2, 4, 79, 0, 0),
(1440, 0, 0, 0, 0, 0, 'Saara House 6', 1, 22, 130000, 10000, 1, 2, 26, 0, 0),
(1441, 0, 0, 0, 0, 0, 'Saara House 7', 1, 19, 175000, 10000, 1, 2, 35, 0, 0),
(1442, 0, 0, 0, 0, 0, 'Saara House 10', 1, 19, 120000, 10000, 1, 2, 24, 0, 0),
(1443, 0, 0, 0, 0, 0, 'Saara House 9', 1, 60, 325000, 10000, 1, 4, 65, 0, 0),
(1444, 0, 0, 0, 0, 0, 'Demona House 2', 1, 53, 315000, 10000, 2, 6, 63, 0, 0),
(1445, 0, 0, 0, 0, 0, 'Demona House 1', 1, 38, 260000, 10000, 2, 2, 52, 0, 0),
(1446, 0, 0, 0, 0, 0, 'Demona House 5', 1, 33, 185000, 100000, 1, 2, 37, 0, 0),
(1447, 0, 0, 0, 0, 0, 'Demona House 3', 1, 36, 205000, 100000, 1, 4, 41, 0, 0),
(1448, 0, 0, 0, 0, 0, 'Demona House 4', 1, 25, 150000, 100000, 1, 2, 30, 0, 0),
(1449, 0, 0, 0, 0, 0, 'Saara House 8', 1, 78, 450000, 10000, 1, 0, 90, 0, 0),
(1450, 0, 0, 0, 0, 0, 'Dahilia House 1', 1, 87, 535000, 10000, 2, 2, 107, 0, 0),
(1451, 0, 0, 0, 0, 0, 'Dahilia House 2', 1, 23, 130000, 10000, 1, 2, 26, 0, 0),
(1452, 0, 0, 0, 0, 0, 'Dahilia House 3', 1, 23, 130000, 10000, 1, 2, 26, 0, 0),
(1453, 0, 0, 0, 0, 0, 'Dahilia House 4', 1, 23, 145000, 10000, 1, 2, 29, 0, 0),
(1454, 0, 0, 0, 0, 0, 'Dahilia House 5', 1, 23, 135000, 10000, 1, 2, 27, 0, 0),
(1455, 0, 0, 0, 0, 0, 'Dahilia House 6', 1, 23, 130000, 10000, 1, 2, 26, 0, 0),
(1456, 0, 0, 0, 0, 0, 'Dahilia House 7', 1, 23, 135000, 10000, 1, 2, 27, 0, 0),
(1458, 0, 0, 0, 0, 0, 'Dahilia House 8', 1, 23, 130000, 10000, 1, 2, 26, 0, 0),
(1459, 0, 0, 0, 0, 0, 'Dahilia House 9', 1, 23, 135000, 10000, 1, 2, 27, 0, 0),
(1460, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 2, 46, 0, 0),
(1461, 0, 0, 0, 0, 0, 'Unnamed House #1461', 1, 49, 270000, 0, 1, 4, 54, 0, 0),
(1462, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 58, 0, 0),
(1463, 0, 7, 0, 0, 1274909811, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 26, 0, 0),
(1464, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 27, 0, 0),
(1465, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 27, 0, 0),
(1466, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 26, 0, 0),
(1467, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 27, 0, 0),
(1468, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 26, 0, 0),
(1469, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 26, 0, 0),
(1470, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 26, 0, 0),
(1471, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 2, 107, 0, 0),
(1473, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 32, 0, 0),
(1474, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 1, 38, 0, 0),
(1478, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 33, 0, 0),
(1479, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 4, 85, 0, 0),
(1480, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 41, 0, 0),
(1481, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 82, 0, 0),
(1482, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 46, 0, 0),
(1484, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 71, 0, 0),
(1485, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 28, 0, 0),
(1486, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 34, 0, 0),
(1487, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 40, 0, 0),
(1488, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 86, 0, 0),
(1489, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 21, 0, 0),
(1490, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 13, 0, 0),
(1491, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 13, 0, 0),
(1492, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 10, 0, 0),
(1493, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 20, 0, 0),
(1494, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 4, 57, 0, 0),
(1495, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 41, 0, 0),
(1496, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 56, 0, 0),
(1497, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 4, 53, 0, 0),
(1498, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 4, 38, 0, 0),
(1499, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 4, 75, 0, 0),
(1500, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 4, 69, 0, 0),
(1501, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 4, 60, 0, 0),
(1502, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 4, 73, 0, 0),
(1503, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 4, 68, 0, 0),
(1504, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 4, 36, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_auctions`
--

CREATE TABLE IF NOT EXISTS `house_auctions` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `bid` int(10) unsigned NOT NULL DEFAULT '0',
  `limit` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` bigint(20) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `house_id` (`house_id`,`world_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_data`
--

CREATE TABLE IF NOT EXISTS `house_data` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE IF NOT EXISTS `house_lists` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL,
  `list` text NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `killers`
--

CREATE TABLE IF NOT EXISTS `killers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `war` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `death_id` (`death_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `killers`
--

INSERT INTO `killers` (`id`, `death_id`, `final_hit`, `unjustified`, `war`) VALUES
(1, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagsegurotransacoes`
--

CREATE TABLE IF NOT EXISTS `pagsegurotransacoes` (
  `TransacaoID` varchar(36) NOT NULL,
  `VendedorEmail` varchar(200) NOT NULL,
  `Referencia` varchar(200) DEFAULT NULL,
  `TipoFrete` char(2) DEFAULT NULL,
  `ValorFrete` decimal(10,2) DEFAULT NULL,
  `Extras` decimal(10,2) DEFAULT NULL,
  `Anotacao` text,
  `TipoPagamento` varchar(50) NOT NULL,
  `StatusTransacao` varchar(50) NOT NULL,
  `CliNome` varchar(200) NOT NULL,
  `CliEmail` varchar(200) NOT NULL,
  `CliEndereco` varchar(200) NOT NULL,
  `CliNumero` varchar(10) DEFAULT NULL,
  `CliComplemento` varchar(100) DEFAULT NULL,
  `CliBairro` varchar(100) NOT NULL,
  `CliCidade` varchar(100) NOT NULL,
  `CliEstado` char(2) NOT NULL,
  `CliCEP` varchar(9) NOT NULL,
  `CliTelefone` varchar(14) DEFAULT NULL,
  `NumItens` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `TransacaoID` (`TransacaoID`,`StatusTransacao`),
  KEY `Referencia` (`Referencia`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) NOT NULL DEFAULT '0',
  `soul` int(10) unsigned NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastip` int(10) unsigned NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `stamina` bigint(20) NOT NULL DEFAULT '151200000' COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT '2',
  `loss_experience` int(11) NOT NULL DEFAULT '100',
  `loss_mana` int(11) NOT NULL DEFAULT '100',
  `loss_skills` int(11) NOT NULL DEFAULT '100',
  `loss_containers` int(11) NOT NULL DEFAULT '100',
  `loss_items` int(11) NOT NULL DEFAULT '100',
  `premend` int(11) NOT NULL DEFAULT '0' COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `marriage` int(10) unsigned NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT '0',
  `nick_verify` int(11) NOT NULL DEFAULT '0',
  `old_name` varchar(255) NOT NULL DEFAULT '',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `worldtransfer` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `rep` int(11) NOT NULL DEFAULT '0',
  `show_quests` tinyint(4) NOT NULL DEFAULT '1',
  `show_skills` tinyint(4) NOT NULL DEFAULT '1',
  `stars` int(11) NOT NULL DEFAULT '0',
  `show_bars` tinyint(4) NOT NULL DEFAULT '1',
  `show_eq` tinyint(4) NOT NULL DEFAULT '1',
  `show_outfit` tinyint(4) NOT NULL DEFAULT '1',
  `cast` tinyint(4) NOT NULL DEFAULT '0',
  `castViewers` int(11) NOT NULL DEFAULT '0',
  `castDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`),
  KEY `account_id` (`account_id`),
  KEY `group_id` (`group_id`),
  KEY `online` (`online`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `promotion`, `deleted`, `description`, `created`, `nick_verify`, `old_name`, `hide_char`, `worldtransfer`, `comment`, `rep`, `show_quests`, `show_skills`, `stars`, `show_bars`, `show_eq`, `show_outfit`, `cast`, `castViewers`, `castDescription`) VALUES
(1, 'Account Manager', 0, 1, 1, 1, 0, 150, 150, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 1, 160, 54, 7, '', 1000, 0, 1401138817, 1500154545, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 0, 1, 1, 0, 1, 1, 1, 0, 0, ''),
(2, 'Rook Sample', 0, 1, 2, 1, 0, 150, 150, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 0, 50, 50, 7, '', 1000, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 0, 1, 1, 0, 1, 1, 1, 0, 0, ''),
(3, 'Sorcerer Sample', 0, 1, 2, 8, 1, 185, 185, 9300, 0, 0, 0, 0, 136, 0, 0, 35, 35, 0, 0, 1, 160, 54, 7, '', 1000, 0, 1274907859, 16777343, 1, 0, 0, 0, '', 1274907861, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 0, 1, 1, 0, 1, 1, 1, 0, 0, ''),
(4, 'Druid Sample', 0, 1, 2, 8, 2, 185, 185, 9300, 117, 0, 114, 115, 136, 0, 0, 35, 35, 0, 0, 1, 160, 54, 7, '', 1000, 0, 1274907849, 16777343, 1, 0, 0, 0, '', 1274907852, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 0, 1, 1, 0, 1, 1, 1, 0, 0, ''),
(5, 'Paladin Sample', 0, 1, 2, 8, 3, 185, 185, 9300, 0, 0, 0, 0, 136, 0, 0, 35, 35, 0, 0, 1, 160, 54, 7, '', 1000, 0, 1274907856, 16777343, 1, 0, 0, 0, '', 1274907858, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 0, 1, 1, 0, 1, 1, 1, 0, 0, ''),
(6, 'Knight Sample', 0, 1, 2, 8, 4, 185, 185, 9300, 0, 0, 0, 0, 136, 0, 0, 35, 35, 0, 0, 1, 160, 54, 7, '', 1000, 0, 1274907853, 16777343, 1, 0, 0, 0, '', 1274907855, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 0, 1, 1, 0, 1, 1, 1, 0, 0, ''),
(7, 'Samples', 0, 1, 2, 8, 2, 185, 185, 4200, 68, 76, 78, 39, 128, 0, 0, 35, 35, 0, 100, 1, 160, 54, 7, 0x30, 435, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 151200000, 2, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 0, 1, 1, 0, 1, 1, 1, 0, 0, ''),
(8, 'Otpanel', 0, 1, 3, 11, 1, 200, 200, 13905, 68, 76, 78, 39, 128, 0, 1, 125, 125, 1155, 100, 1, 160, 57, 7, '', 465, 1, 1398709015, 665597385, 1, 0, 0, 0, '', 1398709019, 0, 0, 151200000, 2, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 0, 1, 1, 0, 1, 1, 1, 0, 0, ''),
(9, 'Muleke', 0, 1, 4, 8, 2, 185, 185, 4200, 68, 76, 78, 39, 128, 0, 0, 35, 35, 0, 100, 1, 160, 54, 7, 0x30, 435, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 151200000, 2, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 0, 1, 1, 0, 1, 1, 1, 0, 0, '');

--
-- Gatilhos `players`
--
DROP TRIGGER IF EXISTS `oncreate_players`;
DELIMITER //
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players`
 FOR EACH ROW BEGIN
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_players`;
DELIMITER //
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players`
 FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
	UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_advances`
--

CREATE TABLE IF NOT EXISTS `player_advances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `skill` int(11) DEFAULT NULL,
  `oldlevel` int(11) DEFAULT NULL,
  `newlevel` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE IF NOT EXISTS `player_deaths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `player_deaths`
--

INSERT INTO `player_deaths` (`id`, `player_id`, `date`, `level`) VALUES
(1, 8, 1398709013, 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE IF NOT EXISTS `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
--

CREATE TABLE IF NOT EXISTS `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(8, 1, 101, 2457, 1, ''),
(8, 3, 102, 1987, 1, ''),
(8, 4, 103, 2463, 1, ''),
(8, 5, 104, 2525, 1, ''),
(8, 6, 105, 2190, 1, ''),
(8, 7, 106, 2647, 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_killers`
--

CREATE TABLE IF NOT EXISTS `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  KEY `kill_id` (`kill_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE IF NOT EXISTS `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_skills`
--

CREATE TABLE IF NOT EXISTS `player_skills` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `skillid` tinyint(2) NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(2, 0, 10, 0),
(2, 1, 10, 0),
(2, 2, 10, 0),
(2, 3, 10, 0),
(2, 4, 10, 0),
(2, 5, 10, 0),
(2, 6, 10, 0),
(3, 0, 10, 0),
(3, 1, 10, 0),
(3, 2, 10, 0),
(3, 3, 10, 0),
(3, 4, 10, 0),
(3, 5, 10, 0),
(3, 6, 10, 0),
(4, 0, 10, 0),
(4, 1, 10, 0),
(4, 2, 10, 0),
(4, 3, 10, 0),
(4, 4, 10, 0),
(4, 5, 10, 0),
(4, 6, 10, 0),
(5, 0, 10, 0),
(5, 1, 10, 0),
(5, 2, 10, 0),
(5, 3, 10, 0),
(5, 4, 10, 0),
(5, 5, 10, 0),
(5, 6, 10, 0),
(6, 0, 10, 0),
(6, 1, 10, 0),
(6, 2, 10, 0),
(6, 3, 10, 0),
(6, 4, 10, 0),
(6, 5, 10, 0),
(6, 6, 10, 0),
(7, 0, 10, 0),
(7, 1, 10, 0),
(7, 2, 10, 0),
(7, 3, 10, 0),
(7, 4, 10, 0),
(7, 5, 10, 0),
(7, 6, 10, 0),
(8, 0, 10, 0),
(8, 1, 10, 0),
(8, 2, 10, 0),
(8, 3, 10, 0),
(8, 4, 10, 0),
(8, 5, 13, 236),
(8, 6, 10, 0),
(9, 0, 10, 0),
(9, 1, 10, 0),
(9, 2, 10, 0),
(9, 3, 10, 0),
(9, 4, 10, 0),
(9, 5, 10, 0),
(9, 6, 10, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_spells`
--

CREATE TABLE IF NOT EXISTS `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`name`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storage`
--

CREATE TABLE IF NOT EXISTS `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`key`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(8, 42300, '0'),
(8, 42301, '0'),
(8, 42302, '0'),
(8, 42303, '0'),
(8, 42304, '0'),
(8, 42305, '0'),
(8, 42306, '0'),
(8, 42307, '0'),
(8, 42308, '0'),
(8, 42309, '0'),
(8, 42310, '0'),
(8, 42311, '0'),
(8, 42312, '0'),
(8, 42313, '0'),
(8, 42314, '0'),
(8, 42315, '0'),
(8, 42316, '0'),
(8, 42317, '0'),
(8, 42318, '0'),
(8, 42319, '0'),
(8, 42320, '0'),
(8, 42321, '0'),
(8, 42322, '0'),
(8, 42323, '0'),
(8, 42324, '0'),
(8, 42325, '0'),
(8, 42326, '0'),
(8, 42327, '0'),
(8, 42328, '0'),
(8, 42329, '0'),
(8, 42350, '0'),
(8, 42352, '0'),
(8, 42355, '0'),
(8, 50000, '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_viplist`
--

CREATE TABLE IF NOT EXISTS `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  KEY `player_id` (`player_id`),
  KEY `vip_id` (`vip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE IF NOT EXISTS `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `config` (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '26'),
('encryption', '2'),
('vahash_key', 'MZ72-AGP2-9CB3-JF5R');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_motd`
--

CREATE TABLE IF NOT EXISTS `server_motd` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_motd`
--

INSERT INTO `server_motd` (`id`, `world_id`, `text`) VALUES
(1, 0, 'Welcome to The Forgotten Server!'),
(2, 0, 'Bem vindo ao SEUOTSERV');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_record`
--

CREATE TABLE IF NOT EXISTS `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL,
  UNIQUE KEY `record` (`record`,`world_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_record`
--

INSERT INTO `server_record` (`record`, `world_id`, `timestamp`) VALUES
(1, 0, 1396243085),
(2, 0, 1398708908);

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_reports`
--

CREATE TABLE IF NOT EXISTS `server_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `world_id` (`world_id`),
  KEY `reads` (`reads`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tiles`
--

CREATE TABLE IF NOT EXISTS `tiles` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `house_id` int(10) unsigned NOT NULL,
  `x` int(5) unsigned NOT NULL,
  `y` int(5) unsigned NOT NULL,
  `z` tinyint(2) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`),
  KEY `x` (`x`,`y`,`z`),
  KEY `house_id` (`house_id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_items`
--

CREATE TABLE IF NOT EXISTS `tile_items` (
  `tile_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `zaypay_payment`
--

CREATE TABLE IF NOT EXISTS `zaypay_payment` (
  `payID` bigint(30) NOT NULL,
  `account_id` int(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`payID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_bug_tracker`
--

CREATE TABLE IF NOT EXISTS `z_bug_tracker` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_changelog`
--

CREATE TABLE IF NOT EXISTS `z_changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `where` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_forum`
--

CREATE TABLE IF NOT EXISTS `z_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `section` (`section`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_monsters`
--

CREATE TABLE IF NOT EXISTS `z_monsters` (
  `hide_creature` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `speed_lvl` int(11) NOT NULL DEFAULT '1',
  `use_haste` tinyint(1) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `summonable` tinyint(1) NOT NULL,
  `convinceable` tinyint(1) NOT NULL,
  `race` varchar(255) NOT NULL,
  `gfx_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_monsters`
--

INSERT INTO `z_monsters` (`hide_creature`, `name`, `mana`, `exp`, `health`, `speed_lvl`, `use_haste`, `voices`, `immunities`, `summonable`, `convinceable`, `race`, `gfx_name`) VALUES
(0, 'Amazon', 390, 60, 110, 1, 0, '"Yeeee ha!", "Your head shall be mine!"', '', 1, 1, 'blood', 'amazon.gif'),
(0, 'Valkyrie', 450, 85, 190, 1, 0, '"Another head for me!", "Head off!", "Your head will be mine!", "Stand still!", "One more head for me!"', '', 1, 1, 'blood', 'valkyrie.gif'),
(0, 'Carrion Worm', 380, 70, 145, 1, 0, '', '', 0, 1, 'blood', 'carrionworm.gif'),
(0, 'Rotworm', 305, 40, 65, 1, 0, '', '', 0, 1, 'blood', 'rotworm.gif'),
(0, 'Kongra', 0, 115, 340, 1, 1, '"Hugah!", "Ungh! Ungh!", "Huaauaauaauaa!"', '', 0, 0, 'blood', 'kongra.gif'),
(0, 'Merlkin', 0, 145, 235, 1, 0, '"Ugh! Ugh! Ugh!", "Holy banana!", "Chakka! Chakka!"', 'outfit, drunk, invisible', 0, 0, 'blood', 'merlkin.gif'),
(0, 'Sibang', 0, 105, 225, 1, 1, '"Eeeeek! Eeeeek", "Huh! Huh! Huh!", "Ahhuuaaa!"', 'outfit, drunk, invisible', 0, 0, 'blood', 'sibang.gif'),
(0, 'Crystal Spider', 0, 900, 1250, 60, 1, '"Screeech!"', 'paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'crystalspider.gif'),
(0, 'Giant Spider', 0, 900, 1300, 30, 1, '', 'outfit, drunk, invisible', 0, 0, 'venom', 'giantspider.gif'),
(0, 'Poison Spider', 270, 22, 26, 1, 0, '', '', 1, 1, 'venom', 'poisonspider.gif'),
(0, 'Scorpion', 310, 45, 45, 1, 0, '', '', 1, 1, 'venom', 'scorpion.gif'),
(0, 'Spider', 210, 12, 20, 1, 0, '', '', 1, 1, 'venom', 'spider.gif'),
(0, 'Tarantula', 485, 120, 225, 30, 1, '', 'outfit, drunk', 1, 1, 'venom', 'tarantula.gif'),
(0, 'Drasilla', 0, 700, 1320, 1, 0, '"FCHHHHHHHH!", "GROOOOAAAAAAAAR!", "DIRTY LITTLE HUMANS", "YOU CAN''T KEEP ME HERE FOREVER"', 'invisible', 0, 0, 'blood', 'drasilla.gif'),
(0, 'Grimgor Guteater', 0, 670, 1115, 10, 0, '"Dont run, You''re burning off precious fat."', 'invisible', 0, 0, 'blood', 'grimgorguteater.gif'),
(0, 'Slim', 0, 580, 1025, 1, 0, '"Zhroozzzzs."', 'invisible', 0, 0, 'undead', 'slim.gif'),
(0, 'Spirit Of Earth', 0, 800, 1285, 1, 0, '"Show your strengh ... or perish."', 'invisible', 0, 0, 'undead', 'spiritofearth.gif'),
(0, 'Spirit Of Fire', 0, 950, 2140, 1, 0, '"Feel the heat."', 'invisible', 0, 0, 'blood', 'spiritoffire.gif'),
(0, 'Spirit Of Water', 0, 850, 1517, 1, 0, '"Blubb"', 'invisible', 0, 0, 'undead', 'spiritofwater.gif'),
(0, 'Darakan The Executioner', 0, 1600, 3500, 1, 0, '"FIGHT LIKE A BARBARIAN!", "VICTORY IS MINE!", "I AM your father!", "To be the man you have to beat the man!"', 'invisible', 0, 1, 'blood', 'darakantheexecutioner.gif'),
(0, 'Deathbringer', 0, 5100, 10000, 40, 0, '"YOU FOOLS WILL PAY!", "YOU ALL WILL DIE!!", "DEATH, DESTRUCTION!", "I will eat your soul!"', 'invisible', 0, 0, 'undead', 'deathbringer.gif'),
(0, 'Gnorre Chyllson', 0, 4000, 7100, 75, 0, '"I am like the merciless northwind.", "Snow will be your death shroud.", "Feel the wrath of father chyll!"', 'paralyze, invisible', 0, 0, 'blood', 'gnorrechyllson.gif'),
(0, 'Norgle Glacierbeard', 0, 2100, 4300, 1, 0, '"I''ll extinguish you warmbloods.", "REVENGE!", "Far too hot.", "DISGUSTING WARMBLOODS!", "Revenge is sweetest when served cold."', 'invisible', 0, 1, 'blood', 'norgleglacierbeard.gif'),
(0, 'Svoren The Mad', 0, 3000, 6300, 1, 0, '"NO mommy NO. Leave me alone!", "Not that tower again!"', 'invisible', 0, 1, 'blood', 'svorenthemad.gif'),
(0, 'The Masked Marauder', 0, 3500, 6800, 15, 0, '"Didn''t you leave your house door open?", "Oops, your shoelaces are open!"', 'invisible', 0, 0, 'blood', 'themaskedmarauder.gif'),
(0, 'The Obliverator', 0, 6000, 9500, 30, 0, '"NO ONE WILL BEAT ME!"', 'invisible', 0, 0, 'fire', 'theobliverator.gif'),
(0, 'The Pit Lord', 0, 2500, 4500, 25, 1, '"I''LL GET YOU ALL!", "I won''t let you escape!", "I''ll crush you beneath my feet!"', 'invisible', 0, 0, 'blood', 'thepitlord.gif'),
(0, 'Webster', 0, 1200, 1750, 35, 1, '"You are lost!", "Come my little morsel."', 'invisible', 0, 0, 'undead', 'webster.gif'),
(0, 'Barbarian Bloodwalker', 590, 195, 305, 1, 1, '"YAAAHEEE!", "SLAUGHTER!", "CARNAGE!", "You can run but you can''t hide"', '', 0, 1, 'blood', 'barbarianbloodwalker.gif'),
(0, 'Barbarian Brutetamer', 0, 90, 145, 25, 0, '"To me, creatures of the wild!", "My instincts tell me about your cowardice."', 'lifedrain, paralyze, outfit, invisible', 0, 0, 'blood', 'barbarianbrutetamer.gif'),
(0, 'Barbarian Headsplitter', 450, 85, 100, 25, 0, '"I will regain my honor with your blood!", "Surrender is not option!", "Its you or me!"', 'paralyze', 0, 1, 'blood', 'barbarianheadsplitter.gif'),
(0, 'Barbarian Skullhunter', 450, 85, 135, 25, 0, '"You will become my trophy.", "Fight harder, coward.", "Show that you are a worthy opponent."', 'drunk, paralyze', 0, 1, 'blood', 'barbarianskullhunter.gif'),
(0, 'Bear', 300, 23, 80, 1, 0, '"grrrr", "groar"', '', 1, 1, 'blood', 'bear.gif'),
(0, 'Panda', 300, 23, 80, 10, 0, '"Grrrr", "Groar"', '', 1, 1, 'blood', 'panda.gif'),
(0, 'Polar Bear', 315, 28, 85, 1, 0, '"Grrrrrr", "GROARRR!"', '', 1, 1, 'blood', 'polarbear.gif'),
(0, 'Beholder', 0, 170, 260, 1, 0, '"Eye for eye!", "Here''s looking at you!", "Let me take a look at you!", "You''ve got the look!"', 'invisible', 0, 0, 'venom', 'beholder.gif'),
(0, 'Braindeath', 0, 895, 1225, 25, 0, '"You have disturbed my thoughts!", "Let me turn you into something more useful!", "Let me taste your brain!", "You will be punished!"', 'earth, death, invisible', 0, 0, 'undead', 'braindeath.gif'),
(0, 'Elder Beholder', 0, 280, 1100, 25, 0, '"Let me take a look at you!", "Inferior creatures, bow before my power!"', 'lifedrain, invisible', 0, 0, 'blood', 'elderbeholder.gif'),
(0, 'Gazer', 0, 90, 120, 10, 1, '"Mommy!?", "Buuuuhaaaahhaaaaa!", "Me need mana!"', 'invisible', 0, 0, 'venom', 'gazer.gif'),
(0, 'Bog Raider', 0, 1300, 800, 40, 1, '"Tchhh!", "Slurp!"', 'paralyze, invisible', 0, 0, 'venom', 'bograider.gif'),
(0, 'Carniphila', 0, 150, 255, 10, 0, '', 'invisible', 0, 0, 'venom', 'carniphila.gif'),
(0, 'Defiler', 0, 2500, 3650, 20, 0, '"Blubb"', 'paralyze, invisible', 0, 0, 'venom', 'defiler.gif'),
(0, 'Haunted Treeling', 0, 310, 450, 20, 0, '', 'earth', 0, 0, 'undead', 'hauntedtreeling.gif'),
(0, 'Slime', 0, 160, 150, 1, 0, '', '', 0, 0, 'venom', 'slime.gif'),
(0, 'Son Of Verminor', 0, 5900, 8500, 1, 0, '', 'poison', 0, 0, 'venom', 'sonofverminor.gif'),
(0, 'Spit Nettle', 0, 20, 150, 1, 0, '', 'paralyze, invisible', 0, 0, 'venom', 'spitnettle.gif'),
(0, 'Chicken', 220, 0, 15, 1, 0, '"gokgoooook", "cluck cluck"', '', 1, 1, 'blood', 'chicken.gif'),
(0, 'Dire Penguin', 0, 120, 173, 1, 0, '', 'lifedrain, paralyze, outfit, invisible', 0, 0, 'blood', 'direpenguin.gif'),
(0, 'Flamingo', 250, 0, 25, 1, 0, '', '', 1, 1, 'blood', 'flamingo.gif'),
(0, 'Parrot', 250, 0, 25, 10, 0, '"BR? PL? SWE?", "Screeech!", "Neeeewbiiieee!", "You advanshed, you advanshed!", "Hope you die and loooosh it!", "Hunterrr ish PK!", "Shhtop whining! Rrah", "I''m heeerrre! Screeeech!", "Leeave orrr hunted!!", "Blesshhh my stake! Screeech!", "Tarrrrp?", "You are corrrrupt! Corrrrupt!", "You powerrrrrrabuserrrrr!", "You advanshed, you advanshed!"', '', 1, 1, 'blood', 'parrot.gif'),
(0, 'Penguin', 300, 1, 33, 1, 0, '', '', 1, 1, 'blood', 'penguin.gif'),
(0, 'Seagull', 250, 0, 25, 1, 0, '', '', 1, 0, 'blood', 'seagull.gif'),
(0, 'Terror Bird', 490, 150, 300, 30, 0, '"CRAAAHHH!", "Gruuuh Gruuuh.", "Carrah Carrah!"', '', 1, 1, 'blood', 'terrorbird.gif'),
(0, 'Acid Blob', 0, 250, 250, 1, 0, '', 'death, earth', 0, 0, 'venom', 'acidblob.gif'),
(0, 'Death Blob', 0, 300, 320, 5, 0, '', '', 0, 0, 'undead', 'deathblob.gif'),
(0, 'Mercury Blob', 0, 180, 150, 1, 0, '"Crackle"', 'death', 0, 0, 'undead', 'mercuryblob.gif'),
(0, 'Annihilon', 0, 10000, 60000, 80, 1, '"Annihilation!"', 'lifedrain, invisible', 0, 0, 'fire', 'annihilon.gif'),
(0, 'Apprentice Sheng', 0, 100, 95, 1, 0, '"I will protect the secrets of my master!", "This isle will become ours alone!", "Kaplar!"', 'energy', 0, 0, 'blood', 'apprenticesheng.gif'),
(0, 'Bones', 0, 3750, 9500, 40, 0, '"Your new name is breakfast.", "Keep that dog away!", "Out Fluffy! Out! Bad dog!"', 'drunk, invisible', 0, 0, 'undead', 'bones.gif'),
(0, 'Brutus Bloodbeard', 0, 500, 1200, 10, 0, '', 'invisible', 0, 0, 'blood', 'brutusbloodbeard.gif'),
(0, 'Countess Sorrow', 0, 5150, 7200, 15, 0, '', 'physical, poison, ice, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'countesssorrow.gif'),
(0, 'Deadeye Devious', 0, 500, 2000, 40, 0, '"Let''s kill ''em", "Arrrgh!", "You''ll never take me alive!"', 'invisible', 0, 0, 'blood', 'deadeyedevious.gif'),
(0, 'Demodras', 0, 4000, 4500, 5, 0, '"I WILL SET THE WORLD IN FIRE!", "I WILL PROTECT MY BROOD!"', 'paralyze, invisible', 0, 0, 'blood', 'demodras.gif'),
(0, 'Dharalion', 0, 380, 380, 10, 1, '"Feel my wrath!", "Noone will stop my ascension!", "My powers are divine!"', 'fire, poison, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'dharalion.gif'),
(0, 'Dracola', 0, 7750, 15850, 95, 0, '"DEATH CAN''T STOP MY HUNGER!"', 'paralyze, invisible', 0, 0, 'undead', 'dracola.gif'),
(0, 'Fernfang', 0, 400, 400, 10, 1, '"You desecrated this place!", "I will cleanse this isle!", "Grrrrrrr", "Yoooohhuuuu!"', 'invisible', 0, 0, 'blood', 'fernfang.gif'),
(0, 'Ferumbras', 0, 12000, 35000, 50, 1, '"NOONE WILL STOP ME THIS TIME!", "THE POWER IS MINE!"', 'lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'venom', 'ferumbras.gif'),
(0, 'Fluffy', 0, 3550, 4500, 45, 0, '"Wooof!"', 'drunk, invisible', 0, 0, 'blood', 'fluffy.gif'),
(0, 'General Murius', 0, 300, 550, 10, 0, '"Feel the power of the Mooh''Tah!", "You will get what you deserve!", "For the king!"', 'invisible', 0, 0, 'blood', 'generalmurius.gif'),
(0, 'Ghazbaran', 0, 15000, 60000, 90, 1, '"COME HERE AND DIE!", "COME AND GIVE ME SOME AMUSEMENT!", "IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?", "I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!", "FLAWLESS VICTORY!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'ghazbaran.gif'),
(0, 'Golgordan', 0, 10000, 40000, 65, 0, '"Latrivan your fool"', 'death', 0, 0, 'fire', 'golgordan.gif'),
(0, 'Grorlam', 0, 2400, 3000, 10, 1, '', 'paralyze, invisible', 0, 0, 'blood', 'grorlam.gif'),
(0, 'Hellgorak', 0, 10000, 40000, 70, 0, '"I''ll sacrifice yours souls to seven!", "I''m bad news for you mortals!", "No man can defeat me!", "Your puny skills are no match for me.", "I smell your fear.", "Delicious!"', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'hellgorak.gif'),
(0, 'Koshei The Deathless', 0, 0, 2000, 85, 0, '"Your pain will be beyond imagination!", "You can''t defeat me! I will ressurect and take your soul!", "Death is my ally!", "Welcome to my domain, visitor!", "You will be my toy on the other side!", "What a disgusting smell of life!"', 'death, earth, paralyze, invisible', 0, 0, 'undead', 'kosheithedeathless.gif'),
(0, 'Latrivan', 0, 10000, 40000, 60, 0, '"I might reward you for killing my brother ~ with a swift dead!"', 'fire', 0, 0, 'fire', 'latrivan.gif'),
(0, 'Lethal Lissy', 0, 500, 1450, 10, 0, '', 'invisible', 0, 0, 'blood', 'lethallissy.gif'),
(0, 'Leviathan', 0, 5000, 6000, 269, 0, '"CHHHRRRR", "HISSSS"', 'ice, paralyze, invisible, drown', 0, 0, 'blood', 'leviathan.gif'),
(0, 'Lord Of The Elements', 0, 8000, 10000, 75, 0, '', 'holy, earth, physical, fire, death, invisible', 0, 0, 'undead', 'lordoftheelements.gif'),
(0, 'Mad Technomancer', 0, 55, 1000, 1, 0, '"I''m going to make them an offer they can''t refuse.", "My masterplan cannot fail!", "Gentlemen, you can''t fight here! This is the War Room!"', 'invisible', 0, 0, 'blood', 'madtechnomancer.gif'),
(0, 'Madareth', 0, 10000, 55000, 80, 0, '"I am going to play with yourself!"', 'energy, fire, invisible', 0, 0, 'fire', 'madareth.gif'),
(0, 'Man In The Cave', 0, 555, 485, 1, 0, '"THE MONKS ARE MINE", "I will rope you up! All of you!", "You have been roped up!", "A MIC to rule them all!"', 'fire, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'maninthecave.gif'),
(0, 'Massacre', 0, 9800, 30000, 85, 1, '', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'massacre.gif'),
(0, 'Minishabaal', 0, 4000, 3500, 240, 1, '"I had Princess Lumelia as breakfast!", "Naaa-Nana-Naaa-Naaa!", "My brother will come and get you for this!", "Get them Fluffy!", "He He He!", "Pftt, Ferumbras such an upstart!", "My dragon is not that old, it''s just second hand!", "My other dragon is a red one!", "When I am big I want to become the ruthless eighth!", "WHERE''S FLUFFY?", "Muahaha!"', 'invisible', 0, 0, 'blood', 'minishabaal.gif'),
(0, 'Morgaroth', 0, 15000, 55000, 90, 1, '"I AM MORGAROTH, LORD OF THE TRIANGLE... AND YOU ARE LOST!", "MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS!", "THE TRIANGLE OF TERROR WILL RISE!", "ZATHROTH! LOOK AT THE DESTRUCTION I AM CAUSING IN YOUR NAME!"', 'paralyze, invisible', 0, 0, 'undead', 'morgaroth.gif'),
(0, 'Mr. Punish', 0, 5500, 12000, 125, 0, '', 'energy, fire, poison, invisible', 0, 0, 'undead', 'mr.punish.gif'),
(0, 'Munster', 250, 23, 58, 1, 0, '"Meeeeep!"', '', 1, 1, 'blood', 'munster.gif'),
(0, 'Necropharus', 0, 700, 750, 10, 0, '"You will rise as my servant!", "Praise to my master Urgith!"', 'poison, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'necropharus.gif'),
(0, 'Orshabaal', 0, 9999, 22500, 80, 1, '"PRAISED BE MY MASTERS, THE RUTHLESS SEVEN!", "YOU ARE DOOMED!", "ORSHABAAL IS BACK!", "Be prepared for the day my masters will come for you!", "SOULS FOR ORSHABAAL!"', 'lifedrain, paralyze, invisible', 0, 0, 'fire', 'orshabaal.gif'),
(0, 'Ron The Ripper', 0, 500, 1500, 10, 0, '', '', 0, 0, 'blood', 'rontheripper.gif'),
(0, 'Rotworm Queen', 0, 300, 85, 1, 0, '', '', 0, 0, 'blood', 'rotwormqueen.gif'),
(0, 'The Abomination', 0, 25000, 38050, 60, 0, '"Blubb"', 'poison, outfit, drunk, invisible', 0, 0, 'venom', 'theabomination.gif'),
(0, 'The Count', 0, 1750, 4600, 75, 0, '', 'lifedrain, death, invisible', 0, 0, 'undead', 'thecount.gif'),
(0, 'The Evil Eye', 0, 500, 1200, 10, 0, '"Inferior creatures, bow before my power!"', 'invisible', 0, 0, 'blood', 'theevileye.gif'),
(0, 'The Handmaiden', 0, 3850, 14500, 115, 1, '', 'energy, fire, ice, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'thehandmaiden.gif'),
(0, 'The Horned Fox', 0, 200, 265, 1, 0, '"You will never get me!", "I''ll be back!", "Catch me, if you can!", "Help me, boys!"', 'invisible', 0, 0, 'blood', 'thehornedfox.gif'),
(0, 'The Imperor', 0, 8000, 15000, 55, 1, '"Muahaha!", "He he he!"', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'theimperor.gif'),
(0, 'The Old Widow', 0, 2800, 3200, 10, 1, '', 'fire, poison, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'theoldwidow.gif'),
(0, 'Thul', 0, 1800, 3000, 40, 0, '"Gaaahhh!"', '', 0, 0, 'undead', 'thul.gif'),
(0, 'Tibia Bug', 250, 50, 270, 10, 0, '"My father was a year 2k bug.", "Psst, I''ll make you rich.", "You are bugged ... by me!"', 'energy, fire, drunk', 1, 1, 'venom', 'tibiabug.gif'),
(0, 'Tiquandas Revenge', 0, 1755, 2000, 110, 0, '', 'invisible', 0, 0, 'venom', 'tiquandasrevenge.gif'),
(0, 'Undead Minion', 620, 550, 850, 5, 0, '', 'fire, poison, lifedrain, drunk', 0, 1, 'undead', 'undeadminion.gif'),
(0, 'Ushuriel', 0, 10000, 50000, 65, 1, '', 'lifedrain, paralyze, invisible', 0, 0, 'fire', 'ushuriel.gif'),
(0, 'Xenia', 450, 255, 290, 1, 0, '"Stand still!", "One more head for me!", "Head off!"', '', 1, 1, 'blood', 'xenia.gif'),
(0, 'Zugurosh', 0, 10000, 95000, 60, 0, '"You will run out of resources soon enough!!", "One little mistake and your all are mine!", "I sense your strength fading!"', 'death, paralyze, invisible', 0, 0, 'fire', 'zugurosh.gif'),
(0, 'Dog', 220, 0, 20, 1, 0, '"Wuff! Wuff!"', '', 1, 1, 'blood', 'dog.gif'),
(0, 'Hellhound', 0, 6800, 7500, 45, 0, '"GROOOWL!", "GRRRRR!"', 'paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'hellhound.gif'),
(0, 'Husky', 420, 0, 140, 1, 0, '"Yoooohuuuu!", "Grrrrrrr", "Ruff, ruff!"', '', 1, 1, 'blood', 'husky.gif'),
(0, 'War Wolf', 0, 55, 140, 1, 0, '"Grrrrrrr", "Yoooohhuuuu!"', '', 0, 1, 'blood', 'warwolf.gif'),
(0, 'Werewolf', 0, 1450, 1955, 50, 0, '"BLOOD!", "HRAAAAAAAAAARRRRRR!"', 'paralyze, invisible', 0, 0, 'blood', 'werewolf.gif'),
(0, 'Winter Wolf', 260, 20, 30, 1, 0, '', '', 1, 1, 'blood', 'winterwolf.gif'),
(0, 'Wolf', 255, 18, 25, 1, 0, '', '', 1, 1, 'blood', 'wolf.gif'),
(0, 'Chakoya Toolshaper', 0, 40, 80, 25, 0, '"Chikuva!!", "Jinuma jamjam!", "Suvituka siq chuqua!", "Kiyosa sipaju!"', '', 0, 0, 'blood', 'chakoyatoolshaper.gif'),
(0, 'Chakoya Tribewarden', 305, 40, 68, 25, 0, '"Quisavu tukavi!", "Si siyoqua jamjam!", "Achuq! jinuma!", "Si ji jusipa!"', '', 0, 1, 'blood', 'chakoyatribewarden.gif'),
(0, 'Chakoya Windcaller', 305, 48, 84, 25, 0, '"Mupi! Si siyoqua jinuma!", "Siqsiq ji jusipa!", "Jagura taluka taqua!", "Quatu nguraka!"', '', 0, 1, 'blood', 'chakoyawindcaller.gif'),
(0, 'Blood Crab', 505, 160, 290, 1, 0, '', '', 1, 0, 'blood', 'bloodcrab.gif'),
(0, 'Crab', 305, 30, 55, 1, 0, '"crab crab!"', '', 1, 1, 'blood', 'crab.gif'),
(0, 'Ice Golem', 0, 295, 385, 1, 0, '"Chrr."', 'paralyze, invisible', 0, 0, 'undead', 'icegolem.gif'),
(0, 'Acolyte Of The Cult', 0, 300, 390, 5, 0, '"Praise voodoo!"', 'invisible', 0, 0, 'blood', 'acolyteofthecult.gif'),
(0, 'Adept Of The Cult', 0, 400, 430, 1, 0, '', 'invisible', 0, 0, 'blood', 'adeptofthecult.gif'),
(0, 'Enlightened Of The Cult', 0, 500, 700, 1, 0, '', 'paralyze', 0, 0, 'blood', 'enlightenedofthecult.gif'),
(0, 'Novice Of The Cult', 0, 100, 285, 1, 0, '"Fear us!", "You will not tell anyone what you have seen.", "Your curiosity will be punished!"', '', 0, 0, 'blood', 'noviceofthecult.gif'),
(0, 'Dark Torturer', 0, 3500, 7350, 15, 0, '"You like it, don''t you?", "IahaEhheAie!"', 'invisible', 0, 0, 'blood', 'darktorturer.gif'),
(0, 'Demon', 0, 6000, 8200, 30, 1, '"MUHAHAHAHA!", "I SMELL FEEEEEAAAR!", "CHAMEK ATH UTHUL ARAK!", "Your resistance is futile!", "Your soul will be mine!"', 'lifedrain, paralyze, invisible', 0, 0, 'fire', 'demon.gif'),
(0, 'Destroyer', 0, 2000, 3700, 25, 1, '"Destructiooooon!", "It''s a good day to destroy!"', 'paralyze, invisible', 0, 0, 'blood', 'destroyer.gif'),
(0, 'Diabolic Imp', 0, 1950, 1950, 70, 1, '"Muahaha!", "He he he!"', 'paralyze, invisible', 0, 0, 'blood', 'diabolicimp.gif'),
(0, 'Fire Devil', 530, 110, 200, 1, 0, '"Hot, eh?", "Hell, oh hell!"', '', 1, 1, 'blood', 'firedevil.gif'),
(0, 'Fury', 0, 4000, 4100, 120, 0, '"Ahhhhrrrr!", "Waaaaah!", "Carnage!"', 'paralyze, invisible', 0, 0, 'blood', 'fury.gif'),
(0, 'Gozzler', 800, 180, 240, 1, 1, '"Huhuhuhuuu!", "Let the fun begin!", "Yihahaha!", "I''ll bite you! Nyehehehehe!"', 'invisible', 1, 0, 'blood', 'gozzler.gif'),
(0, 'Hand Of Cursed Fate', 0, 3850, 10500, 15, 1, '', 'paralyze, invisible', 0, 0, 'blood', 'handofcursedfate.gif'),
(0, 'Hellspawn', 0, 2550, 3500, 70, 0, '"Your fragile bones are like toothpicks to me.", "You little weasel will not live to see another day.", "I''m just a messenger of what''s yet to come."', 'paralyze, invisible', 0, 0, 'blood', 'hellspawn.gif'),
(0, 'Juggernaut', 0, 6500, 20000, 30, 1, '"WAHHHH!", "RAAARRR!", "GRRRRRR!"', 'paralyze, invisible', 0, 0, 'blood', 'juggernaut.gif'),
(0, 'Nightmare', 0, 2150, 2700, 25, 1, '"Close your eyes... I want to show you something!", "I will haunt you forever!", "I will make you scream!", "Pffffrrrrrrrrrrrr.", "Take a ride with me.", "Weeeheeheeeheee!"', 'invisible', 0, 0, 'blood', 'nightmare.gif'),
(0, 'Nightmare Scion', 0, 1350, 1400, 60, 1, '"Weeeheeheee!"', 'earth, death, invisible', 0, 0, 'blood', 'nightmarescion.gif'),
(0, 'Plaguesmith', 0, 3350, 8250, 20, 1, '"You are looking a bit feverish today!", "Hachoo!", "Cough Cough!"', 'paralyze, invisible', 0, 0, 'blood', 'plaguesmith.gif'),
(0, 'Ungreez', 10000, 5000, 8200, 55, 0, '"I''ll teach you that even heros can die", "You wil die Begging like the others did"', 'energy, fire, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'ungreez.gif'),
(0, 'Blue Djinn', 0, 215, 330, 1, 0, '"Simsalabim", "Feel the power of my magic, tiny mortal!", "Be careful what you wish for.", "Wishes can come true."', 'paralyze, invisible', 0, 0, 'blood', 'bluedjinn.gif'),
(0, 'Efreet', 0, 325, 550, 25, 0, '"I grant you a deathwish!", "Good wishes are for fairytales"', 'paralyze, invisible', 0, 0, 'blood', 'efreet.gif'),
(0, 'Green Djinn', 0, 215, 330, 1, 0, '"I grant you a deathwish!", "Muhahahaha!", "I wish you a merry trip to hell!", "Good wishes are for fairytales"', 'paralyze, invisible', 0, 0, 'blood', 'greendjinn.gif'),
(0, 'Marid', 0, 325, 550, 1, 0, '"Simsalabim", "Feel the power of my magic, tiny mortal!", "Wishes can come true.", "Djinns will soon again be the greatest!"', 'paralyze, invisible', 0, 0, 'blood', 'marid.gif'),
(0, 'Dragon Lord', 0, 2100, 1900, 10, 0, '"ZCHHHHH", "YOU WILL BURN!"', 'paralyze, invisible', 0, 0, 'blood', 'dragonlord.gif'),
(0, 'Dragon Lord Hatchling', 0, 645, 750, 1, 0, '"Fchu?", "Rooawwrr"', 'paralyze, invisible', 0, 0, 'blood', 'dragonlordhatchling.gif'),
(0, 'Dragon', 0, 700, 1000, 1, 0, '"GROOAAARRR", "FCHHHHH"', 'paralyze, invisible', 0, 0, 'blood', 'dragon.gif'),
(0, 'Dragon Hatchling', 0, 185, 380, 1, 0, '"Fchu?", "Rooawwrr"', 'paralyze, invisible', 0, 0, 'blood', 'dragonhatchling.gif'),
(0, 'Frost Dragon', 0, 2300, 1800, 20, 0, '"YOU WILL FREEZE!", "ZCHHHHH!", "I am so cool", "Chill out!."', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'frostdragon.gif'),
(0, 'Frost Dragon Hatchling', 0, 745, 800, 1, 0, '"Rooawwrr", "Fchu?"', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'frostdragonhatchling.gif'),
(0, 'Wyrm', 0, 1450, 1825, 40, 0, '"GRRR!", "GROOOOAAAAAAAAR!"', 'energy, paralyze, invisible', 0, 0, 'blood', 'wyrm.gif'),
(0, 'Dwarf Geomancer', 0, 245, 380, 1, 0, '"Hail Durin!", "Earth is the strongest element.", "Dust to dust."', 'invisible', 0, 0, 'blood', 'dwarfgeomancer.gif'),
(0, 'Dwarf Guard', 650, 165, 245, 1, 0, '"Hail Durin!"', 'invisible', 1, 1, 'blood', 'dwarfguard.gif'),
(0, 'Dwarf Soldier', 360, 70, 135, 1, 0, '"Hail Durin!"', '', 1, 1, 'blood', 'dwarfsoldier.gif'),
(0, 'Dwarf', 320, 45, 90, 1, 0, '"Hail Durin!"', '', 1, 1, 'blood', 'dwarf.gif'),
(0, 'Dworc Fleshhunter', 0, 35, 85, 10, 0, '"Grak brrretz!", "Grow truk grrrrr.", "Prek tars, dekklep zurk."', '', 0, 1, 'blood', 'dworcfleshhunter.gif'),
(0, 'Dworc Venomsniper', 0, 30, 80, 10, 0, '"grak brrretz!", "grow truk grrrrr.", "prek tars, dekklep zurk."', '', 0, 1, 'blood', 'dworcvenomsniper.gif'),
(0, 'Dworc Voodoomaster', 0, 50, 80, 10, 1, '"grak brrretz!", "grow truk grrrrr.", "prek tars, dekklep zurk."', '', 0, 1, 'blood', 'dworcvoodoomaster.gif'),
(0, 'Elephant', 500, 160, 320, 10, 0, '"Hooooot-Toooooot!", "Tooooot.", "Troooooot!"', '', 1, 1, 'blood', 'elephant.gif'),
(0, 'Mammoth', 0, 110, 190, 1, 0, '"Troooooot!", "Hooooot-Toooooot!", "Tooooot."', '', 0, 0, 'blood', 'mammoth.gif'),
(0, 'Elf Arcanist', 0, 175, 220, 5, 0, '"Feel my wrath!", "For the Daughter of the Stars!", "I''ll bring balance upon you!", "Tha''shi Cenath!", "Vihil Ealuel!"', 'invisible', 0, 0, 'blood', 'elfarcanist.gif'),
(0, 'Elf Scout', 360, 75, 160, 3, 0, '"Tha''shi Ab''Dendriel!", "Feel the sting of my arrows!", "Thy blood will quench the soil''s thirst!", "Evicor guide my arrow.", "Your existence will end here!"', 'invisible', 1, 1, 'blood', 'elfscout.gif'),
(0, 'Elf', 320, 42, 100, 1, 0, '"Ulathil beia Thratha!", "Bahaha aka!", "You are not welcome here.", "Flee as long as you can.", "Death to the defilers!"', 'invisible', 1, 1, 'blood', 'elf.gif'),
(0, 'Charged Energy Elemental', 0, 450, 500, 25, 0, '', 'energy, invisible', 0, 0, 'undead', 'chargedenergyelemental.gif'),
(0, 'Energy Elemental', 0, 450, 500, 15, 0, '', 'ice, fire, energy, invisible', 0, 0, 'undead', 'energyelemental.gif'),
(0, 'Energy Overlord', 0, 2800, 4000, 35, 0, '', 'ice, energy, poison, invisible', 0, 0, 'undead', 'energyoverlord.gif'),
(0, 'Massive Energy Elemental', 0, 850, 1100, 40, 0, '', 'ice, energy, fire, invisible', 0, 0, 'undead', 'massiveenergyelemental.gif'),
(0, 'Overcharged Energy Elemental', 0, 1300, 1700, 40, 0, '', 'ice, energy, invisible', 0, 0, 'undead', 'overchargedenergyelemental.gif'),
(0, 'Cat', 220, 0, 20, 1, 0, '"Mew!", "Meow!", "Meow meow!"', '', 1, 1, 'blood', 'cat.gif'),
(0, 'Lion', 320, 30, 80, 1, 0, '"Groarrr!"', '', 1, 1, 'blood', 'lion.gif'),
(0, 'Tiger', 420, 40, 75, 10, 1, '', '', 1, 1, 'blood', 'tiger.gif'),
(0, 'Azure Frog', 305, 20, 60, 5, 0, '"Ribbit, ribbit!"', '', 1, 0, 'blood', 'azurefrog.gif'),
(0, 'Coral Frog', 305, 20, 60, 5, 0, '"Ribbit!"', '', 1, 0, 'blood', 'coralfrog.gif'),
(0, 'Crimson Frog', 305, 20, 60, 5, 0, '"Ribbit!"', '', 1, 0, 'blood', 'crimsonfrog.gif'),
(0, 'Green Frog', 305, 0, 60, 5, 0, '"Ribbit!", "Ribbit! Ribbit!"', '', 1, 0, 'venom', 'greenfrog.gif'),
(0, 'Orchid Frog', 0, 20, 60, 5, 0, '', '', 0, 0, 'blood', 'orchidfrog.gif'),
(0, 'Toad', 400, 60, 135, 10, 0, '"Ribbit, ribbit!", "Ribbit!"', '', 1, 0, 'blood', 'toad.gif'),
(0, 'Damaged Worker Golem', 0, 95, 260, 25, 0, '"Klonk klonk klonk", "Failure! Failire!", "Good morning citizen. How may I serve you?", "Target identified: Rat! Termination initiated!"', 'invisible, paralyze', 0, 0, 'energy', 'damagedworkergolem.gif'),
(0, 'Earth Elemental', 0, 450, 650, 55, 0, '', 'paralyze, invisible, earth, energy', 0, 0, 'undead', 'earthelemental.gif'),
(0, 'Earth Overlord', 0, 2800, 4000, 55, 0, '', 'paralyze, invisible, earth, energy', 0, 0, 'undead', 'earthoverlord.gif'),
(0, 'Gargoyle', 0, 150, 450, 15, 0, '"Harrrr Harrrr!", "Stone sweet stone.", "Feel my claws, softskin.", "Chhhhhrrrrk!", "There is a stone in your shoe!"', 'lifedrain', 0, 0, 'blood', 'gargoyle.gif'),
(0, 'Stone Golem', 590, 280, 270, 1, 0, '', 'paralyze', 1, 1, 'blood', 'stonegolem.gif'),
(0, 'Jagged Earth Elemental', 0, 1300, 1500, 30, 0, '"Stomp STOMP"', 'paralyze, invisible, earth', 0, 0, 'undead', 'jaggedearthelemental.gif'),
(0, 'Massive Earth Elemental', 0, 850, 1330, 35, 0, '', 'paralyze, invisible, earth, energy', 0, 0, 'undead', 'massiveearthelemental.gif'),
(0, 'Muddy Earth Elemental', 0, 450, 650, 20, 0, '', 'paralyze, invisible, earth', 0, 0, 'undead', 'muddyearthelemental.gif'),
(0, 'War Golem', 0, 2550, 4300, 30, 1, '"Azerus barada nikto!", "Klonk klonk klonk", "Engaging Enemy!", "Threat level processed.", "Charging weapon systems!", "Auto repair in progress.", "The battle is joined!", "Termination initialized!", "Rrrtttarrrttarrrtta"', 'invisible, paralyze', 0, 0, 'energy', 'wargolem.gif'),
(0, 'Worker Golem', 0, 1250, 1400, 25, 0, '"INTRUDER ALARM!", "klonk klonk klonk", "Rrrtttarrrttarrrtta", "Awaiting orders.", "Secret objective complete."', 'invisible, paralyze', 0, 0, 'energy', 'workergolem.gif'),
(0, 'Ghost', 100, 120, 150, 1, 0, '"Huh!", "Shhhhhh", "Buuuuuh"', 'lifedrain, paralyze', 0, 0, 'undead', 'ghost.gif'),
(0, 'Phantasm', 0, 3300, 3950, 30, 0, '"Oh my, you forgot to put your pants on!", "Weeheeheeheehee!", "Its nothing but a dream!", "Give in!"', 'paralyze, invisible', 0, 0, 'undead', 'phantasm.gif'),
(0, 'Pirate Ghost', 0, 250, 275, 5, 0, '"Yooh Ho Hooh Ho!", "Hell is waiting for You!", "It''s alive!", "The curse! Aww the curse!", "You will not get my treasure!"', 'paralyze', 0, 0, 'undead', 'pirateghost.gif'),
(0, 'Spectre', 0, 2100, 1350, 15, 0, '"Revenge ... is so ... sweet!", "Life...force! Feed me your... lifeforce!"', 'paralyze, invisible', 0, 0, 'undead', 'spectre.gif'),
(0, 'Wisp', 0, 0, 115, 1, 1, '"Crackle!", "Tsshh"', 'physical, paralyze, drunk', 0, 1, 'undead', 'wisp.gif'),
(0, 'Behemoth', 0, 2500, 4000, 30, 1, '"You''re so little!", "Human flesh - delicious!", "Crush the intruders!"', 'paralyze, invisible', 0, 0, 'blood', 'behemoth.gif'),
(0, 'Cyclops', 490, 150, 260, 1, 0, '"Il lorstok human!", "Toks utat.", "Human, uh whil dyh!", "Youh ah trak!", "Let da mashing begin!"', '', 1, 1, 'blood', 'cyclops.gif'),
(0, 'Cyclops Drone', 525, 200, 325, 1, 0, '"Fee! Fie! Foe! Fum!", "Luttl pest!", "Me makking you pulp!", "Humy tasy! Hum hum!"', '', 0, 1, 'blood', 'cyclopsdrone.gif'),
(0, 'Cyclops Smith', 695, 255, 435, 1, 0, '"Outis emoi g'' onoma.", "Whack da humy!", "Ai humy phary ty kaynon"', '', 0, 1, 'blood', 'cyclopssmith.gif'),
(0, 'Frost Giant', 490, 150, 270, 1, 0, '"Hmm Humansoup", "Stand still ya tasy snack!", "Joh Thun!", "Brore Smode!", "Horre Sjan Flan!", "Forle Bramma!"', '', 0, 1, 'blood', 'frostgiant.gif'),
(0, 'Frost Giantess', 490, 150, 275, 1, 0, '"Ymirs Mjalle!", "No run so much, must stay fat!", "Horre, Sjan Flan!", "Damned fast food.", "Come kiss the cook!"', '', 0, 1, 'blood', 'frostgiantess.gif'),
(0, 'Yeti', 0, 460, 950, 25, 0, '"Yooodelaaahooohooo!", "Yooodelaaaheeeheee!"', 'invisible', 0, 0, 'blood', 'yeti.gif'),
(0, 'Goblin', 290, 25, 50, 1, 0, '"Me have him!", "Zig Zag! Gobo attack!", "Help! Goblinkiller!", "Bugga! Bugga!", "Me green, me mean!"', '', 1, 1, 'blood', 'goblin.gif'),
(0, 'Goblin Assassin', 360, 52, 75, 1, 0, '"Goblin Powahhh!"', '', 1, 1, 'blood', 'goblinassassin.gif'),
(0, 'Goblin Leader', 290, 50, 75, 1, 0, '"Go go, Gobo attack !!", "Me the greenest and the meanest!", "Me have power to crush you!", "Goblinkiller! Catch him !!"', '', 1, 1, 'blood', 'goblinleader.gif'),
(0, 'Goblin Scavenger', 310, 37, 60, 1, 0, '"Shiny, Shiny!", "You mean!", "All mine!", "Uhh!"', '', 1, 1, 'blood', 'goblinscavenger.gif'),
(0, 'Grynch Clan Goblin', 0, 4, 80, 90, 1, '"T''was not me hand in your pocket!", "Look! Cool stuff in house. Let''s get it!", "Uhh! Nobody home!", "Me just borrowed it!", "Me no steal! Me found it!", "Me had it for five minutes. It''s family heirloom now!", "Nice human won''t hurt little, good goblin?", "Gimmegimme!", "Invite me in you lovely house plx!", "Other Goblin stole it!", "All presents mine!", "Me got ugly ones purse", "Free itans plz!", "Not me! Not me!", "Guys, help me here! Guys? Guys???", "That only much dust in me pocket! Honest!", "Can me have your stuff?", "Halp, Big dumb one is after me!", "Uh, So many shiny things!", "Utani hur hur hur!", "Mee? Stealing? Never!!!", "Oh what fun it is to steal a one-horse open sleigh!", "Must have it! Must have it!", "Where me put me lockpick?", "Catch me if you can!"', 'fire, invisible', 0, 0, 'blood', 'grynchclangoblin.gif'),
(0, 'Ice Overlord', 0, 1950, 2800, 85, 0, '', 'fire, lifedrain, paralyze, invisible', 0, 0, 'undead', 'iceoverlord.gif'),
(0, 'Massive Water Elemental', 0, 800, 1250, 140, 0, '', 'paralyze, invisible', 0, 0, 'undead', 'massivewaterelemental.gif'),
(0, 'Roaring Water Elemental', 0, 1300, 1750, 85, 0, '', 'fire, lifedrain, paralyze, invisible', 0, 0, 'undead', 'roaringwaterelemental.gif'),
(0, 'Slick Water Elemental', 0, 450, 550, 30, 0, '"Blubb", "Splipsh Splash"', 'ice', 0, 0, 'undead', 'slickwaterelemental.gif'),
(0, 'Water Elemental', 0, 450, 550, 115, 0, '', 'paralyze, invisible', 0, 0, 'undead', 'waterelemental.gif'),
(0, 'Ancient Scarab', 0, 720, 1000, 55, 1, '', 'paralyze, invisible', 0, 0, 'venom', 'ancientscarab.gif'),
(0, 'Butterfly', 0, 0, 2, 40, 0, '', 'poison, paralyze, drunk', 0, 0, 'venom', 'butterfly.gif'),
(0, 'Bug', 250, 18, 29, 10, 0, '', '', 1, 1, 'venom', 'bug.gif'),
(0, 'Centipede', 335, 30, 70, 1, 0, '', '', 1, 1, 'venom', 'centipede.gif'),
(0, 'Cockroach', 0, 0, 1, 1, 0, '', 'poison', 0, 0, 'venom', 'cockroach.gif'),
(0, 'Larva', 355, 40, 70, 1, 0, '', 'paralyze', 1, 1, 'venom', 'larva.gif'),
(0, 'Scarab', 395, 120, 320, 1, 1, '', 'paralyze', 1, 1, 'venom', 'scarab.gif'),
(0, 'Wasp', 280, 25, 35, 120, 0, '"Bssssss"', '', 1, 1, 'venom', 'wasp.gif'),
(0, 'Lizard Sentinel', 0, 110, 265, 10, 0, '"Tssss!"', 'invisible', 0, 1, 'blood', 'lizardsentinel.gif'),
(0, 'Lizard Snakecharmer', 0, 210, 325, 1, 0, '"I ssssmell warm blood!", "Shhhhhhhh"', 'invisible', 0, 0, 'blood', 'lizardsnakecharmer.gif'),
(0, 'Lizard Templar', 0, 115, 410, 1, 0, '"Hissss!"', '', 0, 0, 'blood', 'lizardtemplar.gif'),
(0, 'Wyvern', 0, 515, 795, 48, 0, '"Shriiiek"', 'drunk, invisible', 0, 0, 'blood', 'wyvern.gif'),
(0, 'Minotaur Archer', 390, 65, 100, 1, 0, '"Ruan Wihmpy!", "Kaplar!"', '', 1, 1, 'blood', 'minotaurarcher.gif'),
(0, 'Minotaur Guard', 550, 160, 185, 1, 0, '"Kirll Karrrl!", "Kaplar!"', '', 1, 1, 'blood', 'minotaurguard.gif'),
(0, 'Minotaur Mage', 0, 150, 155, 1, 0, '"Learrn tha secrret uf deathhh!", "Kaplar!"', 'invisible', 0, 0, 'blood', 'minotaurmage.gif'),
(0, 'Minotaur', 330, 50, 100, 1, 0, '"Kaplar!"', '', 1, 1, 'blood', 'minotaur.gif'),
(0, 'Badger', 200, 5, 20, 1, 0, '', '', 1, 1, 'blood', 'badger.gif'),
(0, 'Bat', 250, 10, 30, 1, 0, '', '', 1, 1, 'blood', 'bat.gif'),
(0, 'Deer', 260, 0, 25, 1, 0, '', '', 1, 1, 'blood', 'deer.gif'),
(0, 'Hacker', 0, 45, 430, 15, 1, '"Feel the wrath of me dos attack!", "You''re next!", "Gimme free gold!", "Me sooo smart!", "Me have a cheating link for you!", "Me is GM!", "Gimme your password!", "Me just need the code!", "Me not stink!", "Me other char is highlevel!"', 'energy, fire, poison, drunk', 0, 1, 'blood', 'hacker.gif'),
(0, 'The Halloween Hare', 0, 0, 2000, 1, 0, '', '', 0, 0, 'blood', 'thehalloweenhare.gif'),
(0, 'Hyaena', 275, 20, 60, 1, 0, '', '', 1, 1, 'blood', 'hyaena.gif'),
(0, 'Pig', 255, 0, 150, 1, 0, '', '', 1, 1, 'blood', 'pig.gif'),
(0, 'Rabbit', 220, 0, 15, 1, 0, '', '', 1, 1, 'blood', 'rabbit.gif'),
(0, 'Silver Rabbit', 220, 0, 15, 1, 0, '', '', 1, 1, 'blood', 'silverrabbit.gif'),
(0, 'Skunk', 200, 3, 20, 1, 0, '', '', 1, 1, 'blood', 'skunk.gif'),
(0, 'Squirrel', 220, 0, 20, 135, 0, '"Chchch"', '', 1, 1, 'blood', 'squirrel.gif'),
(0, 'Dark Monk', 480, 145, 190, 1, 1, '"You are no match to us!", "This is where your path will end!", "Your end has come!"', 'invisible', 0, 1, 'blood', 'darkmonk.gif'),
(0, 'Monk', 600, 200, 240, 1, 1, '"Repent Heretic!", "A prayer to the almighty one!", "I will punish the sinners!"', 'invisible', 1, 0, 'blood', 'monk.gif'),
(0, 'Mutated Bat', 0, 615, 900, 13, 0, '', 'death, earth, drown, invisible, drunk', 0, 0, 'blood', 'mutatedbat.gif'),
(0, 'Mutated Human', 0, 150, 240, 13, 0, '"Take that creature off my back!! I can fell it!", "HEEEEEEEELP!", "You will be the next infected one... GRAAAAAAAAARRR!", "Science... is a curse.", "Run as fast as you can.", "Oh by the gods! What is this... aaaaaargh!"', 'death, earth, paralyze, lifedrain, drunk, drown, invisible', 0, 0, 'blood', 'mutatedhuman.gif'),
(0, 'Mutated Rat', 0, 450, 550, 13, 0, '"Grrrrrrrrrrrrrr!", "Fcccccchhhhhh"', 'death, earth, paralyze, lifedrain, drunk, drown, invisible', 0, 0, 'blood', 'mutatedrat.gif'),
(0, 'Mutated Tiger', 0, 750, 1100, 13, 0, '"GRAAARRRRRR", "CHHHHHHHHHHH"', 'paralyze, drunk, invisible', 0, 0, 'blood', 'mutatedtiger.gif'),
(0, 'Necromancer', 0, 580, 580, 1, 0, '"Your corpse will be mine!", "Taste the sweetness of death!"', 'invisible', 0, 0, 'blood', 'necromancer.gif'),
(0, 'Priestess', 0, 420, 390, 1, 0, '"Your energy is mine.", "Now, your life has come to an end, hahahha!", "Throw the soul on the altar!"', 'invisible', 0, 0, 'blood', 'priestess.gif'),
(0, 'Orc Berserker', 590, 195, 210, 15, 1, '"KRAK ORRRRRRK!"', '', 1, 1, 'blood', 'orcberserker.gif'),
(0, 'Orc Leader', 640, 270, 450, 5, 0, '"Ulderek futgyr human!"', '', 1, 1, 'blood', 'orcleader.gif'),
(0, 'Orc Rider', 0, 110, 180, 60, 1, '"Grrrrrrr", "Orc arga Huummmak!"', '', 0, 1, 'blood', 'orcrider.gif'),
(0, 'Orc Shaman', 0, 110, 115, 1, 0, '"Huumans stinkk!"', 'invisible', 0, 0, 'blood', 'orcshaman.gif'),
(0, 'Orc Spearman', 310, 38, 105, 1, 0, '"Ugaar!"', '', 1, 1, 'blood', 'orcspearman.gif'),
(0, 'Orc Warlord', 0, 670, 950, 35, 0, '"Ranat Ulderek!", "Orc buta bana!", "Ikem rambo zambo!", "Futchi maruk buta!"', 'invisible', 0, 0, 'blood', 'orcwarlord.gif'),
(0, 'Orc Warrior', 360, 50, 125, 1, 0, '"Grow truk grrrr.", "Trak grrrr brik.", "Alk!"', '', 1, 1, 'blood', 'orcwarrior.gif'),
(0, 'Orc', 300, 25, 70, 1, 0, '"Grak brrretz!", "Grow truk grrrrr.", "Prek tars, dekklep zurk."', '', 1, 1, 'blood', 'orc.gif'),
(0, 'Assassin', 450, 105, 175, 2, 1, '"Die!", "Feel the hand of death!", "You are on my deathlist!"', 'invisible', 0, 1, 'blood', 'assassin.gif'),
(0, 'Bandit', 450, 65, 245, 1, 0, '"Your money or your life!", "Hand me your purse!"', '', 1, 1, 'blood', 'bandit.gif'),
(0, 'Black Knight', 0, 1600, 1800, 115, 0, '"MINE!", "No prisoners!", "NO MERCY!", "By Bolg''s Blood!", "You''re no match for me!"', 'paralyze, invisible', 0, 0, 'blood', 'blackknight.gif'),
(0, 'Crazed Beggar', 300, 35, 100, 1, 0, '"Hehehe!", "Raahhh!", "You are one of THEM! Die!", "Wanna buy roses??"', '', 1, 1, 'blood', 'crazedbeggar.gif'),
(0, 'Gang Member', 420, 70, 295, 1, 0, '"This is our territory!", "Help me guys!", "I don''t like the way you look!", "You''re wearing the wrong colours!"', '', 1, 1, 'blood', 'gangmember.gif'),
(0, 'Gladiator', 470, 90, 185, 1, 1, '"You are no match for me!", "Feel my prowess", "Fight!", "Take this!"', '', 0, 1, 'blood', 'gladiator.gif'),
(0, 'Hero', 0, 1200, 1400, 24, 0, '"Let''s have a fight!", "Welcome to my battleground.", "Have you seen princess Lumelia?", "I will sing a tune at your grave."', 'paralyze, invisible', 0, 0, 'blood', 'hero.gif'),
(0, 'Hunter', 0, 150, 150, 1, 0, '"Guess who we''re hunting, haha!", "Guess who we are hunting!", "Bullseye!", "You''ll make a nice trophy!"', '', 0, 1, 'blood', 'hunter.gif'),
(0, 'Nomad', 420, 60, 160, 1, 0, '"We are the true sons of the desert!", "I will leave your remains to the vultures!", "We are swift as the wind of the desert!"', '', 1, 1, 'blood', 'nomad.gif'),
(0, 'Poacher', 530, 70, 90, 1, 0, '"You will not live to tell anyone!", "You are my game today!", "Look what has stepped into my trap!"', '', 0, 1, 'blood', 'poacher.gif'),
(0, 'Primitive', 0, 45, 200, 40, 0, '"We don''t need a future!", "I''ll rook you all!", "They thought they''d beaten us!", "You are history!", "There can only be one world!", "Valor who?", "Die noob!", "There are no dragons!", "I''ll quit forever! Again ...", "You all are noobs!", "Beware of the cyclops!", "Just had a disconnect.", "Magic is only good for girls!", "We''ll be back!"', 'energy, fire, drunk, invisible', 0, 0, 'blood', 'primitive.gif'),
(0, 'Smuggler', 390, 48, 130, 1, 0, '"I will silence you forever!", "You saw something you shouldn''t!"', '', 1, 1, 'blood', 'smuggler.gif'),
(0, 'Stalker', 0, 90, 150, 1, 0, '', 'invisible', 0, 0, 'blood', 'stalker.gif'),
(0, 'Wild Warrior', 420, 55, 120, 1, 1, '"An enemy!", "Gimme your money!"', '', 1, 1, 'blood', 'wildwarrior.gif'),
(0, 'Ashmunrah', 0, 3100, 5000, 50, 0, '"No mortal or undead will steal my secrets!", "Ahhhh all those long years."', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'ashmunrah.gif'),
(0, 'Dipthrah', 0, 2900, 4200, 50, 0, '"Come closer to learn the final lesson.", "You can''t escape death forever."', 'invisible', 0, 0, 'undead', 'dipthrah.gif'),
(0, 'Mahrdis', 0, 3050, 3900, 60, 0, '"Ashes to ashes!", "Fire, Fire!", "The eternal flame demands its due!", "This is why I''m hot.", "May my flames engulf you!"', 'invisible', 0, 0, 'undead', 'mahrdis.gif'),
(0, 'Morguthis', 0, 3000, 4800, 50, 1, '"Vengeance!", "You will make a fine trophy.", "Come and fight me, cowards!", "I am the supreme warrior!", "Let me hear the music of battle.", "Anotherone to bite the dust!"', 'paralyze, invisible', 0, 0, 'undead', 'morguthis.gif'),
(0, 'Omruc', 0, 2950, 4300, 75, 0, '"Now chhhou shhhee me ... Now chhhou don''t!!", "Chhhhou are marked ashhh my prey.", "Psssst, I am over chhhere."', 'paralyze, invisible', 0, 0, 'undead', 'omruc.gif'),
(0, 'Rahemos', 0, 3100, 3700, 50, 0, '"It''s a kind of magic.", "Abrah Kadabrah!", "Nothing hidden in my wrappings.", "It''s not a trick, it''s Rahemos.", "Meet my friend from hell.", "I will make you believe in magic."', 'paralyze, invisible', 0, 0, 'undead', 'rahemos.gif'),
(0, 'Thalas', 0, 2950, 4100, 50, 0, '"You will become a feast for my maggots."', 'invisible', 0, 0, 'undead', 'thalas.gif'),
(0, 'Vashresamun', 0, 2950, 4000, 60, 1, '"Come my maidens, we have visitors!", "Are you enjoying my music?", "If music is the food of death, drop dead."', 'invisible', 0, 0, 'undead', 'vashresamun.gif'),
(0, 'Pirate Buccaneer', 595, 250, 425, 5, 0, '"Give up!", "Hiyaa", "Plundeeeeer!"', 'invisible', 1, 0, 'blood', 'piratebuccaneer.gif'),
(0, 'Pirate Corsair', 775, 350, 675, 5, 0, '"Give up!", "Hiyaa!", "Plundeeeeer!"', 'invisible', 0, 1, 'blood', 'piratecorsair.gif'),
(0, 'Pirate Cutthroat', 495, 175, 325, 5, 0, '"Give up!", "Hiyaa!", "Plundeeeeer!"', 'invisible', 0, 1, 'blood', 'piratecutthroat.gif'),
(0, 'Pirate Marauder', 490, 125, 210, 5, 0, '"Plundeeeeer!", "Give up!", "Hiyaa!"', 'invisible', 0, 1, 'blood', 'piratemarauder.gif'),
(0, 'Blazing Fire Elemental', 0, 580, 580, 1, 0, '', 'fire', 0, 0, 'fire', 'blazingfireelemental.gif'),
(0, 'Blistering Fire Elemental', 0, 1300, 1500, 5, 0, '', 'fire', 0, 0, 'fire', 'blisteringfireelemental.gif'),
(0, 'Fire Elemental', 690, 220, 280, 1, 0, '', 'paralyze, invisible', 1, 1, 'fire', 'fireelemental.gif'),
(0, 'Fire Overlord', 0, 2800, 4000, 40, 0, '', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'fireoverlord.gif'),
(0, 'Hellfire Fighter', 0, 3900, 3800, 20, 0, '', 'paralyze, invisible', 0, 0, 'fire', 'hellfirefighter.gif'),
(0, 'Massive Fire Elemental', 0, 950, 1800, 20, 0, '', 'fire, lifedrain, paralyze, invisible', 0, 0, 'fire', 'massivefireelemental.gif'),
(0, 'Quara Constrictor', 670, 250, 450, 150, 0, '"Gaaahhh!", "Gluh! Gluh!", "Tssss!", "Boohaa!"', 'lifedrain, paralyze', 0, 1, 'blood', 'quaraconstrictor.gif'),
(0, 'Quara Constrictor Scout', 670, 250, 450, 35, 0, '', 'fire, ice', 0, 1, 'undead', 'quaraconstrictorscout.gif'),
(0, 'Quara Hydromancer', 0, 800, 1100, 150, 0, '"Qua hah tsh!", "Teech tsha tshul!", "Quara tsha Fach!", "Tssssha Quara!", "Blubber.", "Blup."', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'quarahydromancer.gif'),
(0, 'Quara Hydromancer Scout', 0, 800, 1100, 30, 0, '"Qua hah tsh!"', 'ice, fire, lifedrain, paralyze, invisible', 0, 0, 'undead', 'quarahydromancerscout.gif'),
(0, 'Quara Mantassin', 480, 400, 800, 150, 0, '"Zuerk Pachak!", "Shrrrr"', 'lifedrain', 0, 1, 'blood', 'quaramantassin.gif'),
(0, 'Quara Mantassin Scout', 480, 100, 220, 25, 0, '"Zuerk Pachak!", "Shrrrr"', 'ice, fire, lifedrain, paralyze, invisible', 0, 1, 'blood', 'quaramantassinscout.gif'),
(0, 'Quara Pincher', 0, 1200, 1800, 160, 0, '"Clank clank!", "Clap!", "Crrrk! Crrrk!"', 'lifedrain, invisible', 0, 0, 'blood', 'quarapincher.gif'),
(0, 'Quara Pincher Scout', 0, 600, 775, 15, 0, '"Clank clank!", "Clap!"', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'quarapincherscout.gif'),
(0, 'Quara Predator', 0, 1600, 2200, 150, 1, '"Rrrah!", "Rraaar!"', 'lifedrain, invisible', 0, 0, 'blood', 'quarapredator.gif'),
(0, 'Quara Predator Scout', 0, 400, 890, 35, 0, '"Gnarrr!"', 'ice, fire, lifedrain, paralyze, invisible', 0, 0, 'blood', 'quarapredatorscout.gif'),
(0, 'Cave Rat', 250, 10, 30, 1, 0, '"Meeeeep!", "Meep!"', '', 1, 1, 'blood', 'caverat.gif'),
(0, 'Rat', 200, 5, 20, 1, 0, '"Meep!"', '', 1, 1, 'blood', 'rat.gif'),
(0, 'Crocodile', 350, 40, 105, 10, 0, '', '', 1, 1, 'blood', 'crocodile.gif'),
(0, 'Hydra', 0, 2100, 2350, 20, 0, '"FCHHHHH", "HISSSS"', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'hydra.gif'),
(0, 'Rift Worm', 0, 1195, 2800, 1, 0, '', 'invisible', 0, 0, 'blood', 'riftworm.gif'),
(0, 'Rift Scythe', 0, 2000, 3600, 75, 0, '', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'riftscythe.gif'),
(0, 'Rift Brood', 0, 1600, 3000, 40, 0, '', 'ice, fire, invisible', 0, 0, 'energy', 'riftbrood.gif'),
(0, 'Cobra', 275, 30, 65, 1, 0, '"Zzzzzz", "Fsssss"', 'drunk', 1, 1, 'blood', 'cobra.gif'),
(0, 'Sea Serpent', 0, 2300, 3200, 219, 0, '"CHHHRRRR", "HISSSS"', 'ice, paralyze, invisible, drown', 0, 0, 'blood', 'seaserpent.gif'),
(0, 'Serpent Spawn', 0, 2350, 3000, 10, 1, '"Sssssouls for the one", "HISSSS", "Tsssse one will risssse again", "I bring your deathhh, mortalssss"', 'paralyze, invisible', 0, 0, 'venom', 'serpentspawn.gif'),
(0, 'Snake', 205, 10, 15, 1, 0, '"Zzzzzzt"', '', 1, 1, 'blood', 'snake.gif'),
(0, 'Young Sea Serpent', 390, 1000, 1500, 219, 0, '"CHHHRRRR", "HISSSS"', 'ice, invisible, drown, paralyze', 0, 0, 'blood', 'youngseaserpent.gif'),
(0, 'Black Sheep', 250, 0, 20, 1, 0, '"Maeh"', '', 1, 1, 'blood', 'blacksheep.gif'),
(0, 'Sheep', 250, 0, 20, 1, 0, '"Maeh"', '', 1, 1, 'blood', 'sheep.gif'),
(0, 'Mimic', 0, 0, 30, 1, 0, '', '', 0, 0, 'blood', 'mimic.gif'),
(0, 'Betrayed Wraith', 0, 3500, 4200, 45, 1, '"Rrrah!", "Gnarr!", "Tcharrr!"', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'betrayedwraith.gif'),
(0, 'Bonebeast', 0, 580, 515, 1, 0, '"Cccchhhhhhhhh!", "Knooorrrrr!"', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'bonebeast.gif'),
(0, 'Demon Skeleton', 620, 240, 400, 5, 0, '', 'paralyze', 1, 1, 'undead', 'demonskeleton.gif'),
(0, 'Dreadbeast', 800, 580, 515, 1, 0, '', 'poison, paralyze', 0, 1, 'undead', 'dreadbeast.gif'),
(0, 'Lost Soul', 0, 4000, 5800, 15, 1, '"Forgive Meeeee!", "Mouuuurn meeee!"', 'paralyze, invisible', 0, 0, 'undead', 'lostsoul.gif'),
(0, 'Pirate Skeleton', 0, 85, 190, 5, 0, '', '', 0, 0, 'undead', 'pirateskeleton.gif'),
(0, 'Skeleton', 300, 35, 50, 1, 0, '', '', 1, 1, 'undead', 'skeleton.gif'),
(0, 'Skeleton Warrior', 350, 65, 45, 1, 0, '', 'death', 1, 1, 'undead', 'skeletonwarrior.gif'),
(0, 'Undead Dragon', 0, 7200, 8350, 40, 0, '"FEEEED MY ETERNAL HUNGER!", "I SENSE LIFE"', 'paralyze, invisible', 0, 0, 'undead', 'undeaddragon.gif'),
(0, 'Undead Gladiator', 0, 800, 1000, 25, 0, '"Let''s battle it out in a duel!", "Bring it!", "I''ll fight here in eternity and beyond.", "I will not give up!", "Another foolish adventurer who tries to beat me."', 'invisible', 0, 0, 'undead', 'undeadgladiator.gif'),
(0, 'Dark Apprentice', 0, 100, 225, 1, 0, '"Outch!", "Oops, I did it again.", "From the spirits that I called Sir, deliver me!", "I must dispose of my masters enemies!"', 'invisible', 0, 0, 'blood', 'darkapprentice.gif'),
(0, 'Dark Magician', 0, 185, 325, 1, 0, '"Feel the power of my runes!", "Killing you is getting expensive!", "My secrets are mine alone!"', 'invisible', 0, 0, 'blood', 'darkmagician.gif'),
(0, 'Ice Witch', 0, 580, 650, 1, 0, '"So you think you are cool?", "I hope it is not too cold for you! HeHeHe.", "Freeze!"', 'paralyze, invisible', 0, 0, 'blood', 'icewitch.gif'),
(0, 'Infernalist', 0, 4000, 3650, 20, 0, '"Nothing will remain but your scorched bones!", "Some like it hot!", "It''s cooking time!", "Feel the heat of battle!"', 'energy, fire, paralyze, invisible', 0, 0, 'blood', 'infernalist.gif'),
(0, 'Mad Scientist', 0, 205, 325, 1, 0, '"Die in the name of Science!", "You will regret interrupting my studies!", "Let me test this!", "I will study your corpse!"', 'invisible', 0, 0, 'blood', 'madscientist.gif'),
(0, 'Medusa', 0, 4050, 4500, 10, 0, '"You will ssuch a fine ssstatue!", "There isss no chhhanccce of esscape", "Are you tired or why are you moving thhat sslow"', 'earth, paralyze, invisible', 0, 0, 'blood', 'medusa.gif'),
(0, 'Warlock', 0, 4000, 3500, 1, 0, '"Learn the secret of our magic! YOUR death!", "Even a rat is a better mage than you.", "We don''t like intruders!"', 'paralyze, invisible', 0, 0, 'blood', 'warlock.gif'),
(0, 'Witch', 0, 120, 300, 1, 0, '"Horax pokti! Hihihihi!", "Herba budinia ex!"', 'invisible', 0, 0, 'blood', 'witch.gif'),
(0, 'Thornback Tortoise', 490, 150, 300, 1, 0, '', '', 0, 1, 'blood', 'thornbacktortoise.gif'),
(0, 'Tortoise', 445, 90, 150, 1, 0, '', '', 0, 1, 'blood', 'tortoise.gif'),
(0, 'Deathslicer', 0, 320, 2000, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'deathslicer.gif'),
(0, 'Eye Of The Seven', 0, 0, 1, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit', 0, 0, 'venom', 'eyeoftheseven.gif'),
(0, 'Flamethrower', 0, 0, 9950, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'flamethrower.gif'),
(0, 'Magicthrower', 0, 0, 9950, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'magicthrower.gif'),
(0, 'Plaguethrower', 0, 0, 9950, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'plaguethrower.gif'),
(0, 'Poisonthrower', 0, 0, 9950, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'poisonthrower.gif'),
(0, 'Shredderthrower', 0, 0, 9950, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'shredderthrower.gif'),
(0, 'Frost Troll', 300, 23, 55, 1, 0, '"Brrrr", "Broar!"', '', 1, 1, 'blood', 'frosttroll.gif'),
(0, 'Island Troll', 290, 20, 50, 1, 0, '"Hmmm, turtles", "Hmmm, dogs", "Hmmm, wormds", "Groar", "Gruntz!"', '', 1, 0, 'blood', 'islandtroll.gif'),
(0, 'Swamp Troll', 320, 65, 55, 1, 0, '"Grrrr", "Groar!", "Me strong! Me ate spinach!"', '', 1, 1, 'venom', 'swamptroll.gif'),
(0, 'Troll', 290, 20, 50, 1, 0, '"Grrrr", "Groar", "Gruntz!", "Hmmm, bugs.", "Hmmm, dogs."', '', 1, 1, 'blood', 'troll.gif'),
(0, 'Troll Champion', 340, 30, 75, 1, 0, '"Meee maity!", "Grrrr", "Whaaaz up!?", "Gruntz!"', '', 1, 1, 'blood', 'trollchampion.gif'),
(0, 'Banshee', 0, 900, 1000, 1, 0, '"Are you ready to rock?", "That''s what I call easy listening!", "Let the music play!", "I will mourn your death!", "IIIIEEEeeeeeehhhHHHHH!", "Dance for me your dance of death!", "Feel my gentle kiss of death."', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'banshee.gif'),
(0, 'Blightwalker', 0, 3350, 8900, 10, 0, '"I can see you decaying!", "Let me taste your mortality!"', 'paralyze', 0, 0, 'undead', 'blightwalker.gif'),
(0, 'Crypt Shambler', 0, 195, 330, 1, 0, '"Uhhhhhhh!", "Aaaaahhhh!", "Hoooohhh!", "Chhhhhhh!"', 'lifedrain, paralyze', 0, 1, 'undead', 'cryptshambler.gif'),
(0, 'Ghoul', 450, 85, 100, 1, 0, '', 'lifedrain, paralyze, invisible', 1, 1, 'blood', 'ghoul.gif'),
(0, 'Grim Reaper', 0, 4500, 4100, 90, 0, '"Death!", "Come a little closer!", "The end is near!"', 'paralyze, invisible', 0, 0, 'undead', 'grimreaper.gif'),
(0, 'Lich', 0, 900, 880, 50, 0, '"Doomed be the living!", "You will endure agony beyond thy death!", "Death awaits all!", "Thy living flesh offends me!", "Death and Decay!"', 'paralyze, invisible', 0, 0, 'undead', 'lich.gif');
INSERT INTO `z_monsters` (`hide_creature`, `name`, `mana`, `exp`, `health`, `speed_lvl`, `use_haste`, `voices`, `immunities`, `summonable`, `convinceable`, `race`, `gfx_name`) VALUES
(0, 'Mummy', 0, 150, 240, 1, 0, '"I will ssswallow your sssoul!", "Mort ulhegh dakh visss.", "Flesssh to dussst!", "I will tassste life again!", "Ahkahra exura belil mort!", "Yohag Sssetham!"', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'mummy.gif'),
(0, 'Vampire', 0, 305, 450, 1, 1, '"BLOOD!", "Let me kiss your neck.", "I smell warm blood.", "I call you, my bats! Come!"', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'vampire.gif'),
(0, 'Vampire Bride', 0, 1050, 1200, 1, 0, '"Kneel before your Mistress!", "Dead is the new alive.", "Come, let me kiss you, darling. Oh wait, I meant kill.", "Enjoy the pain - I know you love it."', 'death, invisible', 0, 0, 'blood', 'vampirebride.gif'),
(0, 'Zombie', 0, 280, 500, 1, 0, '"Mst.... klll....", "Whrrrr... ssss.... mmm.... grrrrl", "Dnnnt... cmmm... clsrrr....", "Httt.... hmnnsss..."', 'death, energy, ice, earth, lifedrain, paralyze', 0, 0, 'undead', 'zombie.gif');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_news_tickers`
--

CREATE TABLE IF NOT EXISTS `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_news_tickers`
--

INSERT INTO `z_news_tickers` (`date`, `author`, `image_id`, `text`, `hide_ticker`) VALUES
(1274867862, 1, 1, 'Site online e funcional!', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_comunication`
--

CREATE TABLE IF NOT EXISTS `z_ots_comunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls`
--

CREATE TABLE IF NOT EXISTS `z_polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls_answers`
--

CREATE TABLE IF NOT EXISTS `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_item`
--

CREATE TABLE IF NOT EXISTS `z_shop_history_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `z_shop_history_item`
--

INSERT INTO `z_shop_history_item` (`id`, `to_name`, `to_account`, `from_nick`, `from_account`, `price`, `offer_id`, `trans_state`, `trans_start`, `trans_real`) VALUES
(1, 'Administer', 5028381, '', 5028381, 10, 0, 'realized', 1274909244, 1274909270),
(2, 'Administer', 5028381, '', 5028381, 10, 0, 'realized', 1274909252, 1274909270),
(3, 'Administer', 5028381, '', 5028381, 10, 0, 'realized', 1274909260, 1274909270),
(4, 'Administer', 5028381, '', 5028381, 10, 0, 'realized', 1274909294, 1274909301),
(5, 'Administer', 5028381, '', 5028381, 10, 0, 'realized', 1274909300, 1274909301),
(6, 'Administer', 5028381, '', 5028381, 10, 0, 'realized', 1274909488, 1274909518),
(7, 'Administer', 5028381, '', 5028381, 10, 0, 'realized', 1274912368, 1274975030);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_pacc`
--

CREATE TABLE IF NOT EXISTS `z_shop_history_pacc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_offer`
--

CREATE TABLE IF NOT EXISTS `z_shop_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_spells`
--

CREATE TABLE IF NOT EXISTS `z_spells` (
  `name` varchar(255) NOT NULL,
  `spell` varchar(255) NOT NULL,
  `spell_type` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0',
  `mlvl` int(11) NOT NULL DEFAULT '0',
  `soul` int(11) NOT NULL DEFAULT '0',
  `pacc` varchar(255) NOT NULL,
  `vocations` varchar(255) NOT NULL,
  `conj_count` int(11) NOT NULL DEFAULT '0',
  `hide_spell` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD CONSTRAINT `guild_kills_ibfk_1` FOREIGN KEY (`war_id`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_2` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_3` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `house_data`
--
ALTER TABLE `house_data`
  ADD CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `killers`
--
ALTER TABLE `killers`
  ADD CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_advances`
--
ALTER TABLE `player_advances`
  ADD CONSTRAINT `player_advances_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_killers`
--
ALTER TABLE `player_killers`
  ADD CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_skills`
--
ALTER TABLE `player_skills`
  ADD CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `server_reports`
--
ALTER TABLE `server_reports`
  ADD CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `tile_items`
--
ALTER TABLE `tile_items`
  ADD CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
