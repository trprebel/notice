-- MySQL dump 10.13  Distrib 5.5.23, for Win64 (x86)
--
-- Host: localhost    Database: notice
-- ------------------------------------------------------
-- Server version	5.5.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `activityid` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `isshow` int(1) NOT NULL DEFAULT '1',
  `createdate` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  PRIMARY KEY (`activityid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'台山温泉',0,'2012-12-31 16:00:00'),(2,'qwe',0,'2012-12-31 16:00:00'),(3,'qwe',0,'2013-01-01 16:00:00'),(4,'游戏',0,'2013-10-22 12:09:57'),(5,'dhrtyhfgh',1,'2013-10-22 14:06:32');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertactivity after insert on activity  for each row 

begin 

update showtype set showtype.version=showtype.version+1 where showtype.type=3;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger updateactivity after update on activity  for each row 

begin 

update showtype set showtype.version=showtype.version+1 where showtype.type=3;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `activityimg`
--

DROP TABLE IF EXISTS `activityimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activityimg` (
  `imgid` int(11) NOT NULL AUTO_INCREMENT,
  `activityid` int(6) NOT NULL DEFAULT '0',
  `imgpath` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`imgid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activityimg`
--

LOCK TABLES `activityimg` WRITE;
/*!40000 ALTER TABLE `activityimg` DISABLE KEYS */;
INSERT INTO `activityimg` VALUES (1,1,'fwerfgfretert'),(2,1,'grehrhdrtzvd'),(3,4,'images/-417127129493444429.jpg'),(4,4,'images/156015678069015606.jpg'),(5,5,'images/5472747740988474341.jpg');
/*!40000 ALTER TABLE `activityimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ewprogress`
--

DROP TABLE IF EXISTS `ewprogress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ewprogress` (
  `progressid` int(11) NOT NULL AUTO_INCREMENT,
  `programid` int(11) NOT NULL DEFAULT '0',
  `cwprogress` varchar(255) NOT NULL DEFAULT '',
  `weeknum` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`progressid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ewprogress`
--

LOCK TABLES `ewprogress` WRITE;
/*!40000 ALTER TABLE `ewprogress` DISABLE KEYS */;
INSERT INTO `ewprogress` VALUES (1,6,'test edit',42),(2,19,'test edit',42),(3,6,'test log',42),(4,6,'test log too',42),(5,2,'test edit 2',42);
/*!40000 ALTER TABLE `ewprogress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importanteve`
--

DROP TABLE IF EXISTS `importanteve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `importanteve` (
  `month` int(3) NOT NULL AUTO_INCREMENT,
  `proid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`month`),
  KEY `forkey` (`proid`),
  CONSTRAINT `forkey` FOREIGN KEY (`proid`) REFERENCES `program` (`proid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importanteve`
--

LOCK TABLES `importanteve` WRITE;
/*!40000 ALTER TABLE `importanteve` DISABLE KEYS */;
INSERT INTO `importanteve` VALUES (1,4),(2,5),(3,6),(4,7),(5,8),(10,8),(11,8),(12,8),(6,9),(7,10),(8,13),(9,14);
/*!40000 ALTER TABLE `importanteve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `operate` varchar(200) NOT NULL,
  `time` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'admin','登陆系统！','2013-10-16 18:57:33'),(2,'admin','登陆系统！','2013-10-17 06:59:57'),(3,'admin','登陆系统！','2013-10-17 07:00:49'),(4,'admin','登陆系统！','2013-10-17 07:01:56'),(5,'admin','登陆系统！','2013-10-17 07:09:15'),(6,'admin','登陆系统！','2013-10-17 07:12:42'),(7,'admin','登陆系统！','2013-10-17 07:15:44'),(8,'admin','登陆系统！','2013-10-17 07:20:19'),(9,'admin','登陆系统！','2013-10-17 07:22:18'),(10,'admin','登陆系统！','2013-10-17 07:23:31'),(11,'admin','登陆系统！','2013-10-17 07:24:47'),(12,'admin','登陆系统！','2013-10-17 07:25:40'),(13,'admin','登陆系统！','2013-10-17 07:26:41'),(14,'admin','登陆系统！','2013-10-17 07:27:04'),(15,'admin','登陆系统！','2013-10-17 07:44:37'),(16,'admin','登陆系统！','2013-10-17 08:50:42'),(17,'admin','登陆系统！','2013-10-17 08:52:04'),(18,'admin','登陆系统！','2013-10-17 08:54:15'),(19,'admin','登陆系统！','2013-10-17 08:56:52'),(20,'admin','登陆系统！','2013-10-17 09:03:48'),(21,'admin','登陆系统！','2013-10-17 09:34:00'),(22,'admin','登陆系统！','2013-10-17 09:35:04'),(23,'admin','登陆系统！','2013-10-17 09:37:12'),(24,'admin','登陆系统！','2013-10-17 09:39:01'),(25,'admin','登陆系统！','2013-10-17 09:43:21'),(26,'admin','登陆系统！','2013-10-17 09:44:15'),(27,'admin','登陆系统！','2013-10-17 09:45:05'),(28,'admin','登陆系统！','2013-10-17 09:46:44'),(29,'admin','登陆系统！','2013-10-17 09:50:23'),(30,'admin','登陆系统！','2013-10-17 09:58:36'),(31,'admin','登陆系统！','2013-10-17 10:00:52'),(32,'admin','登陆系统！','2013-10-17 10:01:00'),(33,'admin','登陆系统！','2013-10-17 10:01:27'),(34,'admin','登陆系统！','2013-10-17 10:04:46'),(35,'admin','登陆系统！','2013-10-17 10:05:53'),(36,'admin','登陆系统！','2013-10-17 10:09:33'),(37,'admin','登陆系统！','2013-10-17 10:11:53'),(38,'admin','登陆系统！','2013-10-17 10:12:26'),(39,'admin','登陆系统！','2013-10-17 12:07:38'),(40,'admin','登陆系统！','2013-10-17 12:34:30'),(41,'admin','登陆系统！','2013-10-17 12:36:06'),(42,'admin','登陆系统！','2013-10-17 12:39:19'),(43,'admin','登陆系统！','2013-10-17 12:39:55'),(44,'admin','登陆系统！','2013-10-17 12:40:27'),(45,'admin','登陆系统！','2013-10-17 12:41:33'),(46,'admin','登陆系统！','2013-10-17 12:55:28'),(47,'admin','登陆系统！','2013-10-17 13:02:15'),(48,'admin','登陆系统！','2013-10-17 13:03:00'),(49,'admin','登陆系统！','2013-10-17 13:11:34'),(50,'admin','登陆系统！','2013-10-17 13:18:37'),(51,'admin','登陆系统！','2013-10-17 13:29:02'),(52,'admin','登陆系统！','2013-10-18 00:26:24'),(53,'admin','登陆系统！','2013-10-18 01:45:00'),(54,'admin','登陆系统！','2013-10-18 01:47:11'),(55,'admin','登陆系统！','2013-10-18 01:48:38'),(56,'admin','登陆系统！','2013-10-18 01:52:34'),(57,'admin','登陆系统！','2013-10-18 01:55:23'),(58,'admin','登陆系统！','2013-10-18 01:55:34'),(59,'admin','登陆系统！','2013-10-18 01:56:10'),(60,'admin','登陆系统！','2013-10-18 01:57:58'),(61,'admin','登陆系统！','2013-10-18 02:00:43'),(62,'admin','登陆系统！','2013-10-18 02:01:07'),(63,'admin','登陆系统！','2013-10-18 02:01:50'),(64,'admin','登陆系统！','2013-10-18 02:02:55'),(65,'admin','登陆系统！','2013-10-18 02:03:40'),(66,'admin','登陆系统！','2013-10-18 02:05:08'),(67,'admin','登陆系统！','2013-10-18 02:07:07'),(68,'admin','登陆系统！','2013-10-18 02:07:53'),(69,'admin','登陆系统！','2013-10-18 02:12:47'),(70,'manager','登陆系统！','2013-10-18 02:15:36'),(71,'manager','创建项目：开发项目','2013-10-18 02:18:44'),(72,'manager','登陆系统！','2013-10-18 02:19:58'),(73,'admin','登陆系统！','2013-10-18 02:20:37'),(74,'admin','登陆系统！','2013-10-18 02:25:05'),(75,'admin','登陆系统！','2013-10-18 02:25:12'),(76,'admin','登陆系统！','2013-10-18 02:25:24'),(77,'admin','登陆系统！','2013-10-18 02:25:43'),(78,'admin','登陆系统！','2013-10-18 02:26:43'),(79,'admin','登陆系统！','2013-10-18 02:26:49'),(80,'admin','登陆系统！','2013-10-18 02:28:47'),(81,'admin','登陆系统！','2013-10-18 02:29:09'),(82,'admin','登陆系统！','2013-10-18 02:30:34'),(83,'admin','登陆系统！','2013-10-18 02:32:09'),(84,'admin','登陆系统！','2013-10-18 02:32:13'),(85,'admin','登陆系统！','2013-10-18 02:32:26'),(86,'admin','登陆系统！','2013-10-18 02:35:44'),(87,'admin','登陆系统！','2013-10-18 02:36:06'),(88,'admin','登陆系统！','2013-10-18 02:36:09'),(89,'admin','登陆系统！','2013-10-18 02:36:38'),(90,'admin','登陆系统！','2013-10-18 02:37:38'),(91,'admin','登陆系统！','2013-10-18 02:38:24'),(92,'admin','登陆系统！','2013-10-18 02:39:19'),(93,'admin','登陆系统！','2013-10-18 02:39:31'),(94,'admin','登陆系统！','2013-10-18 02:55:12'),(95,'admin','登陆系统！','2013-10-18 02:55:51'),(96,'admin','登陆系统！','2013-10-18 02:57:22'),(97,'admin','登陆系统！','2013-10-18 03:03:46'),(98,'admin','登陆系统！','2013-10-18 03:05:44'),(99,'admin','登陆系统！','2013-10-18 03:08:50'),(100,'admin','修改项目属性为：1111 1111 0 sdf test edit 2 2013-10-25 2013-09-12 2013-10-15 2013-10-28 2013-11-09','2013-10-18 03:10:07'),(101,'admin','修改项目属性为：awe awe 1 qwe 项目开始！ 2013-10-16 2013-10-16 2013-10-16 2013-10-16 2013-10-16','2013-10-18 03:10:34'),(102,'admin','登陆系统！','2013-10-18 03:30:03'),(103,'manager','登陆系统！','2013-10-18 03:30:26'),(104,'manager','登陆系统！','2013-10-18 03:34:35'),(105,'manager','登陆系统！','2013-10-18 03:35:56'),(106,'user','登陆系统！','2013-10-18 03:38:14'),(107,'user','登陆系统！','2013-10-18 03:38:38'),(108,'manager','登陆系统！','2013-10-18 07:06:03'),(109,'manager','登陆系统！','2013-10-18 07:08:56'),(110,'manager','将proid为8的项目设为10月重点项目！','2013-10-18 07:09:00'),(111,'manager','登陆系统！','2013-10-18 07:10:04'),(112,'admin','登陆系统！','2013-10-18 07:10:39'),(113,'admin','登陆系统！','2013-10-18 07:28:03'),(114,'admin','登陆系统！','2013-10-18 08:32:25'),(115,'manager','登陆系统！','2013-10-18 08:32:43'),(116,'manager','登陆系统！','2013-10-18 08:33:17'),(117,'manager','登陆系统！','2013-10-18 08:34:19'),(118,'admin','登陆系统！','2013-10-22 00:54:49'),(119,'admin','登陆系统！','2013-10-22 00:54:49'),(120,'admin','登陆系统！','2013-10-22 05:22:44'),(121,'admin','登陆系统！','2013-10-22 05:31:41'),(122,'admin','登陆系统！','2013-10-22 05:35:52'),(123,'admin','登陆系统！','2013-10-22 05:39:17'),(124,'admin','登陆系统！','2013-10-22 05:42:03'),(125,'admin','登陆系统！','2013-10-22 05:42:18'),(126,'admin','登陆系统！','2013-10-22 05:44:56'),(127,'admin','登陆系统！','2013-10-22 05:51:35'),(128,'admin','登陆系统！','2013-10-22 05:52:06'),(129,'admin','登陆系统！','2013-10-22 06:18:17'),(130,'admin','登陆系统！','2013-10-22 06:19:23'),(131,'admin','登陆系统！','2013-10-22 06:19:59'),(132,'admin','登陆系统！','2013-10-22 06:33:06'),(133,'admin','登陆系统！','2013-10-22 06:39:07'),(134,'admin','登陆系统！','2013-10-22 06:39:33'),(135,'admin','登陆系统！','2013-10-22 07:31:52'),(136,'admin','登陆系统！','2013-10-22 07:33:45'),(137,'admin','登陆系统！','2013-10-22 07:35:49'),(138,'admin','登陆系统！','2013-10-22 07:38:25'),(139,'admin','登陆系统！','2013-10-22 07:41:34'),(140,'admin','登陆系统！','2013-10-22 07:46:57'),(141,'admin','登陆系统！','2013-10-22 08:09:58'),(142,'admin','登陆系统！','2013-10-22 08:13:43'),(143,'admin','登陆系统！','2013-10-22 08:15:45'),(144,'admin','登陆系统！','2013-10-22 08:17:59'),(145,'admin','登陆系统！','2013-10-22 08:30:01'),(146,'admin','登陆系统！','2013-10-22 08:30:40'),(147,'admin','登陆系统！','2013-10-22 08:52:02'),(148,'admin','登陆系统！','2013-10-22 08:52:51'),(149,'admin','登陆系统！','2013-10-22 09:02:02'),(150,'admin','登陆系统！','2013-10-22 09:13:54'),(151,'admin','登陆系统！','2013-10-22 09:20:55'),(152,'admin','登陆系统！','2013-10-22 09:32:16'),(153,'admin','登陆系统！','2013-10-22 09:35:46'),(154,'admin','登陆系统！','2013-10-22 09:38:49'),(155,'admin','登陆系统！','2013-10-22 09:39:16'),(156,'admin','登陆系统！','2013-10-22 09:40:16'),(157,'admin','登陆系统！','2013-10-22 09:40:48'),(158,'admin','登陆系统！','2013-10-22 09:41:30'),(159,'admin','登陆系统！','2013-10-22 09:42:02'),(160,'admin','登陆系统！','2013-10-22 09:43:50'),(161,'admin','登陆系统！','2013-10-22 09:44:04'),(162,'admin','登陆系统！','2013-10-22 09:47:55'),(163,'admin','登陆系统！','2013-10-22 09:51:34'),(164,'admin','登陆系统！','2013-10-22 12:07:23'),(165,'admin','登陆系统！','2013-10-22 12:08:20'),(166,'admin','登陆系统！','2013-10-22 12:09:33'),(167,'admin','登陆系统！','2013-10-22 12:13:52'),(168,'admin','登陆系统！','2013-10-22 12:48:33'),(169,'admin','登陆系统！','2013-10-22 12:50:52'),(170,'admin','登陆系统！','2013-10-22 12:57:30'),(171,'admin','登陆系统！','2013-10-22 12:59:03'),(172,'admin','登陆系统！','2013-10-22 13:01:42'),(173,'admin','登陆系统！','2013-10-22 13:05:38'),(174,'admin','登陆系统！','2013-10-22 13:05:54'),(175,'admin','登陆系统！','2013-10-22 13:06:24'),(176,'admin','登陆系统！','2013-10-22 13:18:06'),(177,'admin','登陆系统！','2013-10-22 13:19:45'),(178,'admin','登陆系统！','2013-10-22 13:32:01'),(179,'admin','登陆系统！','2013-10-22 13:39:39'),(180,'admin','登陆系统！','2013-10-22 13:53:08'),(181,'admin','登陆系统！','2013-10-22 13:53:37'),(182,'admin','发布公告qweradf','2013-10-22 13:53:57'),(183,'admin','创建项目：fghrth','2013-10-22 13:56:04'),(184,'admin','登陆系统！','2013-10-22 14:05:01'),(185,'admin','发布公告hdtyrt','2013-10-22 14:05:15'),(186,'admin','登陆系统！','2013-10-22 14:06:12'),(187,'admin','创建活动dhrtyhfgh','2013-10-22 14:06:33'),(188,'admin','为活动dhrtyhfgh添加活动图片images/5472747740988474341.jpg','2013-10-22 14:06:33'),(189,'admin','登陆系统！','2013-10-22 14:09:28'),(190,'admin','发布公告ghsret','2013-10-22 14:09:36'),(191,'admin','将proid为6的项目设为10月重点项目！','2013-10-22 14:13:34'),(192,'admin','登陆系统！','2013-10-22 14:13:51'),(193,'admin','登陆系统！','2013-10-22 14:18:46'),(194,'admin','登陆系统！','2013-10-22 14:19:27'),(195,'admin','登陆系统！','2013-10-22 14:19:55'),(196,'admin','登陆系统！','2013-10-22 14:21:57'),(197,'admin','将proid为5的项目设为10月重点项目！','2013-10-22 14:22:06'),(198,'admin','登陆系统！','2013-10-22 14:27:39'),(199,'admin','将proid为8的项目设为10月重点项目！','2013-10-22 14:27:45'),(200,'admin','登陆系统！','2013-10-22 14:31:31'),(201,'admin','登陆系统！','2013-10-22 14:32:41'),(202,'admin','登陆系统！','2013-10-22 14:33:58'),(203,'admin','登陆系统！','2013-10-23 06:07:39'),(204,'admin','登陆系统！','2013-10-23 06:09:04'),(205,'admin','登陆系统！','2013-10-23 06:11:56'),(206,'admin','登陆系统！','2013-10-23 06:13:06'),(207,'admin','登陆系统！','2013-10-23 06:13:06'),(208,'admin','登陆系统！','2013-10-23 06:13:35'),(209,'admin','登陆系统！','2013-10-23 06:14:21'),(210,'user','登陆系统！','2013-10-23 06:46:01'),(211,'user','登陆系统！','2013-10-23 06:46:37'),(212,'user','登陆系统！','2013-10-23 06:47:27'),(213,'user','登陆系统！','2013-10-23 06:48:46'),(214,'user','登陆系统！','2013-10-23 06:49:29'),(215,'user','登陆系统！','2013-10-23 06:50:09'),(216,'admin','登陆系统！','2013-10-23 06:50:36'),(217,'admin','登陆系统！','2013-10-23 06:51:10'),(218,'admin','登陆系统！','2013-10-23 06:51:56'),(219,'admin','登陆系统！','2013-10-23 06:52:29'),(220,'admin','登陆系统！','2013-10-23 06:54:38'),(221,'user','登陆系统！','2013-10-23 06:55:00'),(222,'user','登陆系统！','2013-10-23 06:57:07'),(223,'admin','登陆系统！','2013-10-23 06:57:22'),(224,'xzb','登陆系统！','2013-10-23 06:57:53'),(225,'xzb','登陆系统！','2013-10-23 07:04:18'),(226,'admin','登陆系统！','2013-10-23 07:44:40'),(227,'admin','登陆系统！','2013-10-23 07:44:40'),(228,'admin','登陆系统！','2013-10-23 12:56:23'),(229,'admin','登陆系统！','2013-10-23 12:57:48'),(230,'admin','设置显示类型为1','2013-10-23 12:57:53'),(231,'admin','登陆系统！','2013-10-23 13:01:47'),(232,'admin','设置显示类型为2','2013-10-23 13:01:53'),(233,'admin','登陆系统！','2013-10-23 13:04:47'),(234,'admin','登陆系统！','2013-10-23 13:52:18'),(235,'admin','登陆系统！','2013-10-23 13:53:31'),(236,'admin','登陆系统！','2013-10-23 13:56:26'),(237,'admin','登陆系统！','2013-10-23 13:58:16'),(238,'admin','登陆系统！','2013-10-23 14:15:03'),(239,'admin','登陆系统！','2013-10-23 14:15:33'),(240,'admin','登陆系统！','2013-10-23 14:15:49'),(241,'admin','登陆系统！','2013-10-23 14:17:15'),(242,'admin','登陆系统！','2013-10-23 14:23:30'),(243,'admin','登陆系统！','2013-10-23 14:24:20'),(244,'admin','登陆系统！','2013-10-23 14:34:41'),(245,'admin','登陆系统！','2013-10-23 14:51:20'),(246,'admin','登陆系统！','2013-10-23 14:51:58'),(247,'admin','登陆系统！','2013-10-23 14:53:51'),(248,'admin','登陆系统！','2013-10-23 14:54:14'),(249,'admin','登陆系统！','2013-10-24 02:47:01'),(250,'admin','登陆系统！','2013-10-24 02:50:59'),(251,'admin','登陆系统！','2013-10-24 02:52:08'),(252,'admin','登陆系统！','2013-10-24 02:53:34'),(253,'admin','登陆系统！','2013-10-24 02:58:27'),(254,'admin','登陆系统！','2013-10-24 03:02:03'),(255,'admin','登陆系统！','2013-10-24 10:00:49'),(256,'admin','登陆系统！','2013-10-28 01:29:00'),(257,'admin','登陆系统！','2013-10-28 01:29:17'),(258,'admin','登陆系统！','2013-10-28 01:29:17'),(259,'admin','登陆系统！','2013-10-28 01:29:42'),(260,'admin','登陆系统！','2013-10-28 01:30:53'),(261,'admin','登陆系统！','2013-10-28 01:31:32'),(262,'admin','登陆系统！','2013-10-28 01:31:45'),(263,'admin','登陆系统！','2013-10-28 01:33:35'),(264,'admin','登陆系统！','2013-10-28 01:33:35'),(265,'admin','登陆系统！','2013-10-28 01:34:24'),(266,'admin','登陆系统！','2013-10-28 02:08:32'),(267,'admin','登陆系统！','2013-10-28 02:17:29'),(268,'admin','登陆系统！','2013-10-28 02:17:29'),(269,'admin','登陆系统！','2013-10-28 02:47:15'),(270,'admin','登陆系统！','2013-10-28 02:48:03'),(271,'admin','登陆系统！','2013-10-28 02:49:15'),(272,'admin','登陆系统！','2013-10-28 02:49:38'),(273,'admin','登陆系统！','2013-10-28 02:49:38'),(274,'admin','登陆系统！','2013-10-28 02:57:15'),(275,'admin','登陆系统！','2013-10-28 02:58:33'),(276,'admin','登陆系统！','2013-10-28 03:00:20'),(277,'admin','登陆系统！','2013-10-28 03:00:20'),(278,'admin','登陆系统！','2013-10-28 03:06:02'),(279,'admin','登陆系统！','2013-10-28 03:07:41'),(280,'admin','登陆系统！','2013-10-28 03:14:47'),(281,'admin','登陆系统！','2013-10-28 03:16:11'),(282,'admin','登陆系统！','2013-10-28 03:16:17'),(283,'admin','登陆系统！','2013-10-28 03:18:35'),(284,'admin','登陆系统！','2013-10-28 03:19:25'),(285,'admin','登陆系统！','2013-10-28 03:19:50'),(286,'admin','登陆系统！','2013-10-28 03:20:15'),(287,'admin','登陆系统！','2013-10-28 03:20:45'),(288,'admin','登陆系统！','2013-10-28 03:20:45'),(289,'admin','登陆系统！','2013-10-28 03:23:41'),(290,'admin','登陆系统！','2013-10-28 03:24:15'),(291,'admin','登陆系统！','2013-10-28 03:27:32'),(292,'admin','登陆系统！','2013-10-28 03:29:53'),(293,'admin','将noticeid为1的公告设为显示的公告！','2013-10-28 03:30:02'),(294,'admin','登陆系统！','2013-10-28 03:37:28'),(295,'admin','登陆系统！','2013-10-28 03:41:37'),(296,'admin','登陆系统！','2013-10-28 03:42:59'),(297,'admin','登陆系统！','2013-10-28 03:43:44'),(298,'admin','登陆系统！','2013-10-28 04:16:57'),(299,'admin','登陆系统！','2013-10-28 04:17:23'),(300,'admin','登陆系统！','2013-10-28 04:17:23'),(301,'admin','登陆系统！','2013-10-28 04:19:33'),(302,'admin','登陆系统！','2013-10-28 04:19:50'),(303,'admin','登陆系统！','2013-10-28 04:20:20'),(304,'admin','登陆系统！','2013-10-28 04:20:59'),(305,'admin','登陆系统！','2013-10-28 04:21:35'),(306,'admin','登陆系统！','2013-10-28 04:22:15'),(307,'admin','登陆系统！','2013-10-28 04:22:52'),(308,'admin','登陆系统！','2013-10-28 04:23:03'),(309,'admin','登陆系统！','2013-10-28 04:23:31'),(310,'admin','登陆系统！','2013-10-28 04:24:40'),(311,'admin','登陆系统！','2013-10-28 04:25:23'),(312,'admin','登陆系统！','2013-10-28 04:25:37'),(313,'admin','登陆系统！','2013-10-28 04:25:41'),(314,'admin','登陆系统！','2013-10-28 04:26:38'),(315,'admin','登陆系统！','2013-10-28 04:29:17'),(316,'admin','登陆系统！','2013-10-28 04:31:06'),(317,'admin','登陆系统！','2013-10-28 04:34:06'),(318,'admin','登陆系统！','2013-10-28 04:35:28'),(319,'admin','登陆系统！','2013-10-28 05:55:29'),(320,'admin','登陆系统！','2013-10-28 05:55:29'),(321,'admin','登陆系统！','2013-10-28 05:56:51'),(322,'admin','登陆系统！','2013-10-28 05:57:46'),(323,'admin','登陆系统！','2013-10-28 05:58:36'),(324,'admin','登陆系统！','2013-10-28 05:59:16'),(325,'admin','登陆系统！','2013-10-28 05:59:47'),(326,'admin','登陆系统！','2013-10-28 06:00:48'),(327,'admin','登陆系统！','2013-10-28 06:01:26'),(328,'admin','登陆系统！','2013-10-28 06:04:37'),(329,'admin','登陆系统！','2013-10-28 06:04:53'),(330,'admin','登陆系统！','2013-10-28 06:05:16'),(331,'admin','登陆系统！','2013-10-28 06:05:42'),(332,'admin','登陆系统！','2013-10-28 06:06:29'),(333,'admin','登陆系统！','2013-10-28 06:06:45'),(334,'admin','登陆系统！','2013-10-28 06:07:02'),(335,'admin','登陆系统！','2013-10-28 06:09:31'),(336,'admin','登陆系统！','2013-10-28 06:09:56'),(337,'admin','登陆系统！','2013-10-28 06:11:08'),(338,'admin','登陆系统！','2013-10-28 06:14:09'),(339,'admin','登陆系统！','2013-10-28 06:20:20'),(340,'admin','登陆系统！','2013-10-28 06:20:57'),(341,'admin','登陆系统！','2013-10-28 06:26:27'),(342,'admin','登陆系统！','2013-10-28 06:27:28'),(343,'admin','登陆系统！','2013-10-28 06:32:01'),(344,'admin','登陆系统！','2013-10-28 06:34:25'),(345,'admin','登陆系统！','2013-10-28 06:36:07'),(346,'admin','登陆系统！','2013-10-28 06:37:02'),(347,'admin','登陆系统！','2013-10-28 06:37:23'),(348,'admin','登陆系统！','2013-10-28 06:37:49'),(349,'admin','登陆系统！','2013-10-28 06:38:18'),(350,'admin','登陆系统！','2013-10-28 06:38:44'),(351,'admin','登陆系统！','2013-10-28 06:38:57'),(352,'admin','登陆系统！','2013-10-28 06:39:07'),(353,'admin','登陆系统！','2013-10-28 06:39:37'),(354,'admin','登陆系统！','2013-10-28 06:41:00');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `noticeid` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `isshow` int(1) NOT NULL DEFAULT '1',
  `createdate` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  PRIMARY KEY (`noticeid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'欢迎XX领导莅临指导！','没有质量的数量永远等于零，全体质量人必须要为康佳上万营销将士提供优质产品为利器，为他们在异常激烈的市场竞争中赢得成功创造条件，这是我们全体质量人的历史重任！',1,'2012-12-31 16:00:00'),(2,'欢迎XX领导莅临指导',NULL,0,'2012-12-31 16:00:00'),(3,'欢迎XX领导','hello',0,'2013-10-22 06:33:32'),(4,'qweq','fwetre',0,'2013-10-22 06:39:16'),(5,'wrge','dgerwtw',0,'2013-10-22 06:39:41'),(6,'qweradf','fsrgsfgr',0,'2013-10-22 13:53:57'),(7,'hdtyrt','nmjdty',0,'2013-10-22 14:05:15'),(8,'ghsret','sdafert',0,'2013-10-22 14:09:36');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertnotice after insert on notice  for each row 

begin 

update showtype set showtype.version=showtype.version+1 where showtype.type=1;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger updatenotice after update on notice  for each row 

begin 

update showtype set showtype.version=showtype.version+1 where showtype.type=1;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `proid` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(255) NOT NULL DEFAULT '',
  `tvtype` varchar(200) NOT NULL DEFAULT '',
  `state` int(2) NOT NULL DEFAULT '0',
  `chargeperson` varchar(50) NOT NULL DEFAULT '',
  `weekprogress` varchar(255) DEFAULT NULL,
  `plandate` date NOT NULL DEFAULT '2013-01-01',
  `compdate` date NOT NULL DEFAULT '2013-01-01',
  `evaluatedate` date NOT NULL DEFAULT '2013-01-01',
  `systestdate` date NOT NULL DEFAULT '2013-01-01',
  `modelevaluatedate` date NOT NULL DEFAULT '2013-01-01',
  `subassdate` date NOT NULL DEFAULT '2013-01-01',
  PRIMARY KEY (`proid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'qwe','c1',1,'asd','lfjgh','2013-10-11','2013-10-12','2013-10-12','2013-10-23','2013-10-29','2013-11-06'),(2,'1111','1111',0,'sdf','test edit 2','2013-10-25','2013-01-01','2013-09-12','2013-10-15','2013-10-28','2013-11-09'),(3,'2222','1',1,'dfg','fghhk','2013-10-10','2013-10-09','2013-08-12','2013-09-23','2013-10-11','2013-10-24'),(4,'3333','1',1,'hg','fghfr','2013-10-05','2013-10-12','2013-10-23','2013-10-29','2013-11-06','2013-11-25'),(5,'4444','1',0,'kjhh','yuifhg','2013-10-02','2013-01-01','2013-10-26','2013-01-01','2013-01-01','2013-01-01'),(6,'5555','juuji',0,'fghdgf','test log too','2013-10-07','2013-01-01','2013-01-01','2013-10-15','2013-01-01','2013-01-01'),(7,'66666','1',1,'asdfw','vbndfg','2013-10-04','2013-10-02','2013-01-01','2013-01-01','2013-10-05','2013-01-01'),(8,'7777','12',0,'sdfg','ghjcvb','2013-10-17','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-10-03'),(9,'8888','as',1,'dzxczx','xcvbvfdsf','2013-10-18','2013-10-17','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(10,'9999','fd',1,'sfdg','ghj','2013-10-15','2013-10-16','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(11,'1122','sad',0,'sfdg','dfgdfg','2013-10-20','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(12,'1133','465431',0,'jkljk','werwa','2013-10-23','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(13,'1144','1144',0,'af','test edit','2013-10-28','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(14,'1155','1',0,'qwe','qwe','2013-11-02','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(15,'adfa','q',0,'qe','qwe','2013-11-05','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(16,'zxcv','qw',0,'qwe','qwe','2013-10-29','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(17,'asd','qw',0,'qwe','qwe','2013-11-10','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(18,'1166','ds',1,'sfg','cvbxc','2013-10-01','2013-10-05','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(19,'test','test',1,'test','test edit','2013-10-16','2013-10-16','2013-10-16','2013-10-16','2013-10-16','2013-10-16'),(20,'asdfwer','wsd',0,'xcvfg','dfggr','2013-10-29','2013-11-12','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(21,'awe','awe',1,'qwe','项目开始！','2013-10-16','2013-10-18','2013-10-16','2013-10-16','2013-10-16','2013-10-16'),(22,'sgd','sgd',0,'ada','项目开始！','2013-01-01','2013-01-01','2013-10-16','2013-10-24','2013-01-18','2013-01-19'),(23,'rete','fghh',0,'fghf','项目开始！','2013-10-17','2013-01-01','2013-10-19','2013-11-06','2013-11-07','2013-11-14'),(24,'test log','asf',0,'dfdfg','项目开始！','2013-10-17','2013-01-01','2013-10-19','2013-10-21','2013-10-25','2013-10-29'),(25,'qwe','q',0,'qwe','qwe','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(26,'qwe','qwe',0,'qwe','qwe','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(27,'qwe','qwe',0,'qwe','qwe','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(28,'qwe','qw',0,'qwe','qwe','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(29,'开发项目','原',0,'manager','项目开始！','2013-10-18','2013-01-01','2013-10-18','2013-10-18','2013-10-18','2013-10-18'),(30,'fghrth','fhdty',0,'gdhyjhjf','项目开始！','2013-10-22','2013-01-01','2013-10-22','2013-10-22','2013-10-22','2013-10-22');
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notice`.`ctrlversion_insert` AFTER INSERT ON `notice`.`program`

  FOR EACH ROW begin

update showtype set showtype.version=showtype.version+1 where showtype.type=2;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notice`.`ctrlversion_update` AFTER UPDATE ON `notice`.`program`

  FOR EACH ROW begin

update showtype set showtype.version=showtype.version+1 where showtype.type=2;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notice`.`ctrlversion_delete` AFTER DELETE ON `notice`.`program`

  FOR EACH ROW begin

update showtype set showtype.version=showtype.version+1 where showtype.type=2;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleid` int(3) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL DEFAULT '',
  `edit` int(1) NOT NULL DEFAULT '0',
  `addimpro` int(1) NOT NULL DEFAULT '0' COMMENT '添加重点项目',
  `notice` int(1) NOT NULL DEFAULT '0',
  `activity` int(1) NOT NULL DEFAULT '0',
  `showtype` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin',1,1,1,1,1),(2,'leader',1,1,1,1,1),(3,'dopm',1,1,0,0,0),(4,'administration',0,0,1,1,1),(5,'user',0,0,0,0,0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showtype`
--

DROP TABLE IF EXISTS `showtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showtype` (
  `type` int(1) NOT NULL DEFAULT '0',
  `url` varchar(500) NOT NULL DEFAULT '',
  `version` int(11) NOT NULL DEFAULT '0',
  `isshow` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showtype`
--

LOCK TABLES `showtype` WRITE;
/*!40000 ALTER TABLE `showtype` DISABLE KEYS */;
INSERT INTO `showtype` VALUES (3,'http://127.0.0.1:8080/Notice/',2,0),(2,'http://127.0.0.1:8080/Notice/',4,1),(1,'http://127.0.0.1:8080/Notice/',10,0);
/*!40000 ALTER TABLE `showtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `roleid` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123',1),(2,'leader','123',2),(3,'manager','123',5),(4,'dopm','123',3),(5,'user','123',5),(6,'xzb','123',4),(7,'123','111',1),(8,'1111','111',5);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `version` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (21);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-28 18:05:10
