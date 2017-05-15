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


-- Dumping database structure for automateddb
CREATE DATABASE IF NOT EXISTS `automateddb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `automateddb`;

-- Dumping structure for table automateddb.assessment_schedule
CREATE TABLE IF NOT EXISTS `assessment_schedule` (
  `GROUP_ID` int(11) NOT NULL,
  `PROBLEM_ID` int(11) NOT NULL,
  `SCHEDULE_ID` int(11) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `ENABLE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`PROBLEM_ID`),
  UNIQUE KEY `SCHEDULE_ID` (`SCHEDULE_ID`),
  KEY `FKA4828B74E9FED684` (`GROUP_ID`),
  KEY `FKA4828B74E4B44004` (`PROBLEM_ID`),
  CONSTRAINT `FKA4828B74E4B44004` FOREIGN KEY (`PROBLEM_ID`) REFERENCES `problems` (`PROBLEM_ID`),
  CONSTRAINT `FKA4828B74E9FED684` FOREIGN KEY (`GROUP_ID`) REFERENCES `groups` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table automateddb.assessment_schedule: ~2 rows (approximately)
/*!40000 ALTER TABLE `assessment_schedule` DISABLE KEYS */;
INSERT INTO `assessment_schedule` (`GROUP_ID`, `PROBLEM_ID`, `SCHEDULE_ID`, `START_DATE`, `END_DATE`, `ENABLE`) VALUES
	(3, 1, 2, '2017-05-07 00:00:00', '2017-05-09 00:00:00', b'1'),
	(4, 1, 1, '2017-05-07 00:00:00', '2017-05-07 00:00:00', b'1');
/*!40000 ALTER TABLE `assessment_schedule` ENABLE KEYS */;

-- Dumping structure for table automateddb.candidate
CREATE TABLE IF NOT EXISTS `candidate` (
  `CANDIDATE_ID` int(11) NOT NULL,
  `EMPLOYEE_ID` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ID`),
  UNIQUE KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  KEY `FK1E5195839ABBA370` (`USER_ID`),
  KEY `FK1E519583E9FED684` (`GROUP_ID`),
  CONSTRAINT `FK1E5195839ABBA370` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  CONSTRAINT `FK1E519583E9FED684` FOREIGN KEY (`GROUP_ID`) REFERENCES `groups` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table automateddb.candidate: ~1 rows (approximately)
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` (`CANDIDATE_ID`, `EMPLOYEE_ID`, `NAME`, `USER_ID`, `GROUP_ID`) VALUES
	(1, '101', 'Daniel', 102, 3);
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;

-- Dumping structure for table automateddb.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `GROUP_ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table automateddb.groups: ~5 rows (approximately)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`GROUP_ID`, `NAME`) VALUES
	(3, 'DBA'),
	(1, 'Dev'),
	(2, 'QA'),
	(5, 'uuu'),
	(4, 'web');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table automateddb.problems
CREATE TABLE IF NOT EXISTS `problems` (
  `PROBLEM_ID` int(11) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `INPUT` longtext,
  `OUTPUT` longtext,
  `TIMELIMIT` int(11) DEFAULT NULL,
  PRIMARY KEY (`PROBLEM_ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table automateddb.problems: ~1 rows (approximately)
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` (`PROBLEM_ID`, `NAME`, `DESCRIPTION`, `INPUT`, `OUTPUT`, `TIMELIMIT`) VALUES
	(1, 'web Dev', 'Development on Web', 'One', 'One', 2);
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;

-- Dumping structure for table automateddb.scores
CREATE TABLE IF NOT EXISTS `scores` (
  `CANDIDATE_ID` int(11) NOT NULL,
  `PROBLEM_ID` int(11) NOT NULL,
  `TOTAL_SCORE` double DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ID`,`PROBLEM_ID`),
  KEY `FKC9E4942156BBA304` (`CANDIDATE_ID`),
  KEY `FKC9E49421E4B44004` (`PROBLEM_ID`),
  CONSTRAINT `FKC9E4942156BBA304` FOREIGN KEY (`CANDIDATE_ID`) REFERENCES `candidate` (`CANDIDATE_ID`),
  CONSTRAINT `FKC9E49421E4B44004` FOREIGN KEY (`PROBLEM_ID`) REFERENCES `problems` (`PROBLEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table automateddb.scores: ~0 rows (approximately)
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;

-- Dumping structure for table automateddb.solutions
CREATE TABLE IF NOT EXISTS `solutions` (
  `CANDIDATE_ID` int(11) NOT NULL,
  `PROBLEM_ID` int(11) NOT NULL,
  `SUBMIT_NUMBER` int(11) DEFAULT NULL,
  `SUBMITTED_ON` datetime DEFAULT NULL,
  `FILENAME` varchar(255) DEFAULT NULL,
  `SOURCE_CODE` longtext,
  `COMPILER` varchar(255) DEFAULT NULL,
  `COMPILER_STATE` varchar(255) DEFAULT NULL,
  `COMPILER_ERROR` longtext,
  PRIMARY KEY (`CANDIDATE_ID`,`PROBLEM_ID`),
  KEY `FKC4BC621A56BBA304` (`CANDIDATE_ID`),
  KEY `FKC4BC621AE4B44004` (`PROBLEM_ID`),
  CONSTRAINT `FKC4BC621A56BBA304` FOREIGN KEY (`CANDIDATE_ID`) REFERENCES `candidate` (`CANDIDATE_ID`),
  CONSTRAINT `FKC4BC621AE4B44004` FOREIGN KEY (`PROBLEM_ID`) REFERENCES `problems` (`PROBLEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table automateddb.solutions: ~0 rows (approximately)
/*!40000 ALTER TABLE `solutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `solutions` ENABLE KEYS */;

-- Dumping structure for table automateddb.testcases
CREATE TABLE IF NOT EXISTS `testcases` (
  `TESTCASE_ID` int(11) NOT NULL,
  `DESCRIPTION` longtext,
  `INPUT_DATA` longtext,
  `EXPECTED_OUTPUT` longtext,
  `SCORE` double DEFAULT NULL,
  `PROBLEM_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TESTCASE_ID`),
  KEY `FKB9D8B1F1E4B44004` (`PROBLEM_ID`),
  CONSTRAINT `FKB9D8B1F1E4B44004` FOREIGN KEY (`PROBLEM_ID`) REFERENCES `problems` (`PROBLEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table automateddb.testcases: ~1 rows (approximately)
/*!40000 ALTER TABLE `testcases` DISABLE KEYS */;
INSERT INTO `testcases` (`TESTCASE_ID`, `DESCRIPTION`, `INPUT_DATA`, `EXPECTED_OUTPUT`, `SCORE`, `PROBLEM_ID`) VALUES
	(1, 'WebApp', 'One', 'One', 1, 1);
/*!40000 ALTER TABLE `testcases` ENABLE KEYS */;

-- Dumping structure for table automateddb.users
CREATE TABLE IF NOT EXISTS `users` (
  `USER_ID` int(11) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `IPADDRESS` varchar(15) DEFAULT NULL,
  `IS_ADMIN` bit(1) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USERNAME` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table automateddb.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`USER_ID`, `USERNAME`, `PASSWORD`, `IPADDRESS`, `IS_ADMIN`) VALUES
	(101, 'shekarsprm@gmail.com', 'shekar', '172.16.128.32', b'1'),
	(102, '101', '101', '0:0:0:0:0:0:0:1', b'0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
