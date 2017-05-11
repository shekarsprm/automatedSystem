-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.23-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5169
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for automateddev
CREATE DATABASE IF NOT EXISTS `automateddev` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `automateddev`;

-- Dumping structure for table automateddev.audit_info
CREATE TABLE IF NOT EXISTS `audit_info` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `HOSTNAME` varchar(100) DEFAULT NULL,
  `IPADDRESS` varchar(100) DEFAULT NULL,
  `VIEWDATE` date DEFAULT NULL,
  `VIEWDATEANDTIME` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `BROWSER` varchar(100) DEFAULT NULL,
  `SYSTEMUSERNAME` varchar(256) DEFAULT NULL,
  `USERAGENT` varchar(256) DEFAULT NULL,
  `VISTORRANID` varchar(256) DEFAULT NULL,
  `OSNAME` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Dumping data for table automateddev.audit_info: ~16 rows (approximately)
/*!40000 ALTER TABLE `audit_info` DISABLE KEYS */;
INSERT INTO `audit_info` (`ID`, `HOSTNAME`, `IPADDRESS`, `VIEWDATE`, `VIEWDATEANDTIME`, `BROWSER`, `SYSTEMUSERNAME`, `USERAGENT`, `VISTORRANID`, `OSNAME`) VALUES
	(1, 'Welcome-PC', '192.168.166.1', '2017-05-09', '2017-05-09 00:44:54.424000', 'MSIE', 'Welcome', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; .NET4.0C; .NET4.0E)', '10945984542981104299211011142109', 'Windows 7'),
	(2, 'Welcome-PC', '192.168.166.1', '2017-05-09', '2017-05-09 00:48:46.903000', 'MSIE', 'Welcome', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; .NET4.0C; .NET4.0E)', '110110224342100112382971', 'Windows 7'),
	(3, 'Welcome-PC', '192.168.166.1', '2017-05-09', '2017-05-09 00:50:05.554000', 'MSIE', 'Welcome', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; .NET4.0C; .NET4.0E)', '98245142459743439910041114', 'Windows 7'),
	(4, 'Welcome-PC', '192.168.166.1', '2017-05-09', '2017-05-09 00:51:29.296000', 'MSIE', 'Welcome', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; .NET4.0C; .NET4.0E)', '1009911143972411197111143972', 'Windows 7'),
	(5, 'Welcome-PC', '192.168.166.1', '2017-05-09', '2017-05-09 06:34:04.520000', 'MSIE', 'Welcome', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; .NET4.0C; .NET4.0E)', '9898138110984249742110211', 'Windows 7'),
	(6, 'Welcome-PC', '192.168.166.1', '2017-05-09', '2017-05-09 06:39:00.068000', 'MSIE', 'Welcome', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; .NET4.0C; .NET4.0E)', '4211042421101093810945110433810045', 'Windows 7'),
	(7, 'Welcome-PC', '192.168.166.1', '2017-05-09', '2017-05-09 06:41:33.051000', 'MSIE', 'Welcome', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; .NET4.0C; .NET4.0E)', '994511021104311011011019797297', 'Windows 7'),
	(8, 'Welcome-PC', '192.168.166.1', '2017-05-09', '2017-05-09 06:41:46.772000', 'Chrome', 'Welcome', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36', '49749811097110984542981101112', 'Windows 7'),
	(9, 'Welcome-PC', '169.254.121.252', '2017-05-09', '2017-05-09 07:40:00.896000', 'Firefox', 'Welcome', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', '1100297439798994311111110010099', 'Windows 7'),
	(10, 'Welcome-PC', '169.254.121.252', '2017-05-09', '2017-05-09 07:40:03.759000', 'Firefox', 'Welcome', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', '3899110424399443100421091104597', 'Windows 7'),
	(11, 'Welcome-PC', '169.254.121.252', '2017-05-09', '2017-05-09 07:40:06.325000', 'Firefox', 'Welcome', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', '243974345421004343119811143', 'Windows 7'),
	(12, 'Welcome-PC', '192.168.0.6', '2017-05-09', '2017-05-09 08:30:50.961000', 'Firefox', 'Welcome', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', '38100111110982984381002439999', 'Windows 7'),
	(13, 'Welcome-PC', '192.168.0.6', '2017-05-09', '2017-05-09 08:31:52.758000', 'Firefox', 'Welcome', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', '1104110411024310922109111110111', 'Windows 7'),
	(14, 'Welcome-PC', '192.168.0.6', '2017-05-09', '2017-05-09 08:32:40.951000', 'MSIE', 'Welcome', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; .NET4.0C; .NET4.0E)', '993838974545245197111974238', 'Windows 7'),
	(15, 'Welcome-PC', '192.168.0.6', '2017-05-09', '2017-05-09 08:33:26.818000', 'Firefox', 'Welcome', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0', '29945389897111100298459810045', 'Windows 7'),
	(16, 'Welcome-PC', '192.168.166.1', '2017-05-10', '2017-05-10 23:27:20.839000', 'MSIE', 'Welcome', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; .NET4.0C; .NET4.0E)', '99111091411199109143111100109', 'Windows 7');
/*!40000 ALTER TABLE `audit_info` ENABLE KEYS */;

-- Dumping structure for table automateddev.users
CREATE TABLE IF NOT EXISTS `users` (
  `USERNAME` varchar(255) DEFAULT NULL,
  `ACCOUNTSTATUS` varchar(255) DEFAULT NULL,
  `CONSECUTIVELOGINFAILURES` int(10) DEFAULT NULL,
  `LOGIN_LAN_ID` varchar(255) NOT NULL,
  `EMAIL_ID` varchar(255) DEFAULT NULL,
  `EXPIRATIONDATE` date DEFAULT NULL,
  `EXPIREPASSWORD` int(10) DEFAULT NULL,
  `FULLNAME` varchar(255) DEFAULT NULL,
  `LASTLOGIN` date DEFAULT NULL,
  `LAST_MODIFIED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LASTPASSWORDCHANGEDATE` date DEFAULT NULL,
  `LAST_UPDATED_BY` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PAST_PASSWORDS_ONE` varchar(255) DEFAULT NULL,
  `PAST_PASSWORDS_TWO` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `ROLE` varchar(255) DEFAULT NULL,
  `USER_COMMENT` varchar(255) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `LOCATION` varchar(255) DEFAULT NULL,
  `OCCUPATION` varchar(90) DEFAULT NULL,
  `USER_OFFICE_PHONE_NUMBER` varchar(80) DEFAULT NULL,
  `USER_IMG_LOCATION` varchar(155) DEFAULT NULL,
  `USER_CHANGE_IMAGE_TYPE` varchar(155) DEFAULT NULL,
  `USER_IMG_NAME` varchar(255) DEFAULT NULL,
  `USER_IMG_SIZE` varchar(255) DEFAULT NULL,
  `USER_FACEBOOK_ID` varchar(255) DEFAULT NULL,
  `USER_TWITTER_ID` varchar(255) DEFAULT NULL,
  `USER_LINKED_ID` varchar(255) DEFAULT NULL,
  `USER_ABOUT_ME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LOGIN_LAN_ID`),
  UNIQUE KEY `EMAIL_ID` (`EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table automateddev.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
