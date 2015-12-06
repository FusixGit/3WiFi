-- ------------------------------
-- Структура базы данных 3WiFi --
-- ------------------------------

-- Дамп структуры базы данных 3wifi
CREATE DATABASE IF NOT EXISTS `3wifi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `3wifi`;

-- Дамп структуры таблицы 3wifi.base
CREATE TABLE `base` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`cmtid` INT(10) UNSIGNED NULL DEFAULT NULL,
	`IP` INT(10) NULL DEFAULT NULL,
	`Port` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
	`Authorization` TINYTEXT NULL,
	`name` TINYTEXT NOT NULL,
	`RadioOff` BIT(1) NOT NULL DEFAULT b'0',
	`Hidden` BIT(1) NOT NULL DEFAULT b'0',
	`NoBSSID` TINYINT(3) UNSIGNED NOT NULL,
	`BSSID` BIGINT(15) UNSIGNED NOT NULL,
	`ESSID` VARCHAR(32) NOT NULL,
	`Security` TINYINT(1) UNSIGNED NOT NULL,
	`WiFiKey` VARCHAR(64) NOT NULL,
	`WPSPIN` INT(8) UNSIGNED NOT NULL,
	`LANIP` INT(10) NULL DEFAULT NULL,
	`LANMask` INT(10) NULL DEFAULT NULL,
	`WANIP` INT(10) NULL DEFAULT NULL,
	`WANMask` INT(10) NULL DEFAULT NULL,
	`WANGateway` INT(10) NULL DEFAULT NULL,
	`DNS1` INT(10) NULL DEFAULT NULL,
	`DNS2` INT(10) NULL DEFAULT NULL,
	`DNS3` INT(10) NULL DEFAULT NULL,
	`uid` INT(11) UNSIGNED NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	INDEX `BSSID` (`BSSID`),
	INDEX `ESSID` (`ESSID`),
	INDEX `Time` (`time`),
	UNIQUE INDEX `WIFI` (`NoBSSID`, `BSSID`, `ESSID`, `WiFiKey`, `WPSPIN`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM ROW_FORMAT=FIXED;

-- Дамп структуры таблицы 3wifi.geo
CREATE TABLE `geo` (
	`BSSID` BIGINT(15) UNSIGNED NOT NULL,
	`latitude` FLOAT(12,8) NULL DEFAULT NULL,
	`longitude` FLOAT(12,8) NULL DEFAULT NULL,
	`quadkey` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
	PRIMARY KEY (`BSSID`),
	INDEX `quadkey` (`quadkey`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM ROW_FORMAT=FIXED;

-- Дамп структуры таблицы 3wifi.comments
CREATE TABLE `comments` (
	`cmtid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`cmtval` VARCHAR(127) NOT NULL,
	PRIMARY KEY (`cmtid`),
	UNIQUE INDEX `comment` (`cmtval`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;

-- Дамп структуры таблицы 3wifi.tasks
CREATE TABLE `tasks` (
	`tid` CHAR(32) NOT NULL,
	`tstate` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`created` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	`modified` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	`ext` CHAR(4) NOT NULL,
	`comment` TINYTEXT NOT NULL,
	`checkexist` BIT(1) NOT NULL,
	`nowait` BIT(1) NOT NULL,
	`lines` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`accepted` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`onmap` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`warns` TEXT NOT NULL,
	`uid` INT(11) UNSIGNED NULL DEFAULT NULL,
	PRIMARY KEY (`tid`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

-- Дамп структуры таблицы 3wifi.ranges
CREATE TABLE `ranges` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`startIP` INT(10) UNSIGNED NOT NULL,
	`endIP` INT(10) UNSIGNED NOT NULL,
	`descr` TEXT NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `RANGE` (`startIP`, `endIP`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

-- Дамп структуры таблицы 3wifi.stats
CREATE TABLE `stats` (
	`StatId` INT(15) UNSIGNED NOT NULL,
	`Value` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`LastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`StatId`)
) COLLATE='utf8_general_ci' ENGINE=MEMORY;

-- Дамп структуры таблицы 3wifi.mem_base
CREATE TABLE `mem_base` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`cmtid` INT(10) UNSIGNED NULL DEFAULT NULL,
	`IP` INT(10) NULL DEFAULT NULL,
	`Port` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
	`Authorization` VARCHAR(64) NULL DEFAULT NULL,
	`name` VARCHAR(64) NOT NULL,
	`RadioOff` BIT(1) NOT NULL DEFAULT b'0',
	`Hidden` BIT(1) NOT NULL DEFAULT b'0',
	`NoBSSID` TINYINT(3) UNSIGNED NOT NULL,
	`BSSID` BIGINT(15) UNSIGNED NOT NULL,
	`ESSID` VARCHAR(32) NOT NULL,
	`Security` TINYINT(1) UNSIGNED NOT NULL,
	`WiFiKey` VARCHAR(64) NOT NULL,
	`WPSPIN` INT(8) UNSIGNED NOT NULL,
	`LANIP` INT(10) NULL DEFAULT NULL,
	`LANMask` INT(10) NULL DEFAULT NULL,
	`WANIP` INT(10) NULL DEFAULT NULL,
	`WANMask` INT(10) NULL DEFAULT NULL,
	`WANGateway` INT(10) NULL DEFAULT NULL,
	`DNS1` INT(10) NULL DEFAULT NULL,
	`DNS2` INT(10) NULL DEFAULT NULL,
	`DNS3` INT(10) NULL DEFAULT NULL,
	`uid` INT(11) UNSIGNED NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	INDEX `BSSID` (`BSSID`),
	INDEX `ESSID` (`ESSID`),
	INDEX `Time` (`time`),
	UNIQUE INDEX `WIFI` (`NoBSSID`, `BSSID`, `ESSID`, `WiFiKey`, `WPSPIN`)
) COLLATE='utf8_general_ci' ENGINE=MEMORY ROW_FORMAT=FIXED;

-- Дамп структуры таблицы 3wifi.mem_geo
CREATE TABLE `mem_geo` (
	`BSSID` BIGINT(15) UNSIGNED NOT NULL,
	`latitude` FLOAT(12,8) NULL DEFAULT NULL,
	`longitude` FLOAT(12,8) NULL DEFAULT NULL,
	`quadkey` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
	PRIMARY KEY (`BSSID`),
	INDEX `quadkey` (`quadkey`)
) COLLATE='utf8_general_ci' ENGINE=MEMORY ROW_FORMAT=FIXED;

-- Дамп структуры для таблицы 3wifi.users
CREATE TABLE `users` (
	`uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`login` varchar(30) NOT NULL,
	`nick` varchar(30) NOT NULL,
	`pass_hash` char(32) NOT NULL,
	`autologin` char(32) NOT NULL,
	`salt` char(32) NOT NULL,
	`level` int(10) unsigned NOT NULL DEFAULT '0',
	`ip_hash` char(32) NOT NULL,
	PRIMARY KEY (`uid`),
	UNIQUE KEY `login` (`login`),
	UNIQUE KEY `nick` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы 3wifi.users
INSERT INTO `users` (`uid`, `login`, `nick`, `pass_hash`, `autologin`, `salt`, `level`, `ip_hash`) VALUES
	(1, 'admin', 'Administrator', 'SET {md5(pass.salt)} HERE!', 'SET {md5(\'bla-bla-bla\')} HERE!', 'SET {salt} HERE!', 2, 'DO NOT CHANGE THIS!');
