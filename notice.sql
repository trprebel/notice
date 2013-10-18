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
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'admin','登陆系统！','2013-10-16 18:57:33'),(2,'admin','登陆系统！','2013-10-17 06:59:57'),(3,'admin','登陆系统！','2013-10-17 07:00:49'),(4,'admin','登陆系统！','2013-10-17 07:01:56'),(5,'admin','登陆系统！','2013-10-17 07:09:15'),(6,'admin','登陆系统！','2013-10-17 07:12:42'),(7,'admin','登陆系统！','2013-10-17 07:15:44'),(8,'admin','登陆系统！','2013-10-17 07:20:19'),(9,'admin','登陆系统！','2013-10-17 07:22:18'),(10,'admin','登陆系统！','2013-10-17 07:23:31'),(11,'admin','登陆系统！','2013-10-17 07:24:47'),(12,'admin','登陆系统！','2013-10-17 07:25:40'),(13,'admin','登陆系统！','2013-10-17 07:26:41'),(14,'admin','登陆系统！','2013-10-17 07:27:04'),(15,'admin','登陆系统！','2013-10-17 07:44:37'),(16,'admin','登陆系统！','2013-10-17 08:50:42'),(17,'admin','登陆系统！','2013-10-17 08:52:04'),(18,'admin','登陆系统！','2013-10-17 08:54:15'),(19,'admin','登陆系统！','2013-10-17 08:56:52'),(20,'admin','登陆系统！','2013-10-17 09:03:48'),(21,'admin','登陆系统！','2013-10-17 09:34:00'),(22,'admin','登陆系统！','2013-10-17 09:35:04'),(23,'admin','登陆系统！','2013-10-17 09:37:12'),(24,'admin','登陆系统！','2013-10-17 09:39:01'),(25,'admin','登陆系统！','2013-10-17 09:43:21'),(26,'admin','登陆系统！','2013-10-17 09:44:15'),(27,'admin','登陆系统！','2013-10-17 09:45:05'),(28,'admin','登陆系统！','2013-10-17 09:46:44'),(29,'admin','登陆系统！','2013-10-17 09:50:23'),(30,'admin','登陆系统！','2013-10-17 09:58:36'),(31,'admin','登陆系统！','2013-10-17 10:00:52'),(32,'admin','登陆系统！','2013-10-17 10:01:00'),(33,'admin','登陆系统！','2013-10-17 10:01:27'),(34,'admin','登陆系统！','2013-10-17 10:04:46'),(35,'admin','登陆系统！','2013-10-17 10:05:53'),(36,'admin','登陆系统！','2013-10-17 10:09:33'),(37,'admin','登陆系统！','2013-10-17 10:11:53'),(38,'admin','登陆系统！','2013-10-17 10:12:26'),(39,'admin','登陆系统！','2013-10-17 12:07:38'),(40,'admin','登陆系统！','2013-10-17 12:34:30'),(41,'admin','登陆系统！','2013-10-17 12:36:06'),(42,'admin','登陆系统！','2013-10-17 12:39:19'),(43,'admin','登陆系统！','2013-10-17 12:39:55'),(44,'admin','登陆系统！','2013-10-17 12:40:27'),(45,'admin','登陆系统！','2013-10-17 12:41:33'),(46,'admin','登陆系统！','2013-10-17 12:55:28'),(47,'admin','登陆系统！','2013-10-17 13:02:15'),(48,'admin','登陆系统！','2013-10-17 13:03:00'),(49,'admin','登陆系统！','2013-10-17 13:11:34'),(50,'admin','登陆系统！','2013-10-17 13:18:37'),(51,'admin','登陆系统！','2013-10-17 13:29:02'),(52,'admin','登陆系统！','2013-10-18 00:26:24'),(53,'admin','登陆系统！','2013-10-18 01:45:00'),(54,'admin','登陆系统！','2013-10-18 01:47:11'),(55,'admin','登陆系统！','2013-10-18 01:48:38'),(56,'admin','登陆系统！','2013-10-18 01:52:34'),(57,'admin','登陆系统！','2013-10-18 01:55:23'),(58,'admin','登陆系统！','2013-10-18 01:55:34'),(59,'admin','登陆系统！','2013-10-18 01:56:10'),(60,'admin','登陆系统！','2013-10-18 01:57:58'),(61,'admin','登陆系统！','2013-10-18 02:00:43'),(62,'admin','登陆系统！','2013-10-18 02:01:07'),(63,'admin','登陆系统！','2013-10-18 02:01:50'),(64,'admin','登陆系统！','2013-10-18 02:02:55'),(65,'admin','登陆系统！','2013-10-18 02:03:40'),(66,'admin','登陆系统！','2013-10-18 02:05:08'),(67,'admin','登陆系统！','2013-10-18 02:07:07'),(68,'admin','登陆系统！','2013-10-18 02:07:53'),(69,'admin','登陆系统！','2013-10-18 02:12:47'),(70,'manager','登陆系统！','2013-10-18 02:15:36'),(71,'manager','创建项目：开发项目','2013-10-18 02:18:44'),(72,'manager','登陆系统！','2013-10-18 02:19:58'),(73,'admin','登陆系统！','2013-10-18 02:20:37'),(74,'admin','登陆系统！','2013-10-18 02:25:05'),(75,'admin','登陆系统！','2013-10-18 02:25:12'),(76,'admin','登陆系统！','2013-10-18 02:25:24'),(77,'admin','登陆系统！','2013-10-18 02:25:43'),(78,'admin','登陆系统！','2013-10-18 02:26:43'),(79,'admin','登陆系统！','2013-10-18 02:26:49'),(80,'admin','登陆系统！','2013-10-18 02:28:47'),(81,'admin','登陆系统！','2013-10-18 02:29:09'),(82,'admin','登陆系统！','2013-10-18 02:30:34'),(83,'admin','登陆系统！','2013-10-18 02:32:09'),(84,'admin','登陆系统！','2013-10-18 02:32:13'),(85,'admin','登陆系统！','2013-10-18 02:32:26'),(86,'admin','登陆系统！','2013-10-18 02:35:44'),(87,'admin','登陆系统！','2013-10-18 02:36:06'),(88,'admin','登陆系统！','2013-10-18 02:36:09'),(89,'admin','登陆系统！','2013-10-18 02:36:38'),(90,'admin','登陆系统！','2013-10-18 02:37:38'),(91,'admin','登陆系统！','2013-10-18 02:38:24'),(92,'admin','登陆系统！','2013-10-18 02:39:19'),(93,'admin','登陆系统！','2013-10-18 02:39:31'),(94,'admin','登陆系统！','2013-10-18 02:55:12'),(95,'admin','登陆系统！','2013-10-18 02:55:51'),(96,'admin','登陆系统！','2013-10-18 02:57:22'),(97,'admin','登陆系统！','2013-10-18 03:03:46'),(98,'admin','登陆系统！','2013-10-18 03:05:44'),(99,'admin','登陆系统！','2013-10-18 03:08:50'),(100,'admin','修改项目属性为：1111 1111 0 sdf test edit 2 2013-10-25 2013-09-12 2013-10-15 2013-10-28 2013-11-09','2013-10-18 03:10:07'),(101,'admin','修改项目属性为：awe awe 1 qwe 项目开始！ 2013-10-16 2013-10-16 2013-10-16 2013-10-16 2013-10-16','2013-10-18 03:10:34'),(102,'admin','登陆系统！','2013-10-18 03:30:03'),(103,'manager','登陆系统！','2013-10-18 03:30:26'),(104,'manager','登陆系统！','2013-10-18 03:34:35'),(105,'manager','登陆系统！','2013-10-18 03:35:56'),(106,'user','登陆系统！','2013-10-18 03:38:14'),(107,'user','登陆系统！','2013-10-18 03:38:38'),(108,'manager','登陆系统！','2013-10-18 07:06:03'),(109,'manager','登陆系统！','2013-10-18 07:08:56'),(110,'manager','将proid为8的项目设为10月重点项目！','2013-10-18 07:09:00'),(111,'manager','登陆系统！','2013-10-18 07:10:04'),(112,'admin','登陆系统！','2013-10-18 07:10:39'),(113,'admin','登陆系统！','2013-10-18 07:28:03'),(114,'admin','登陆系统！','2013-10-18 08:32:25'),(115,'manager','登陆系统！','2013-10-18 08:32:43'),(116,'manager','登陆系统！','2013-10-18 08:33:17'),(117,'manager','登陆系统！','2013-10-18 08:34:19');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'qwe','c1',1,'asd','lfjgh','2013-10-11','2013-10-12','2013-10-12','2013-10-23','2013-10-29','2013-11-06'),(2,'1111','1111',0,'sdf','test edit 2','2013-10-25','2013-01-01','2013-09-12','2013-10-15','2013-10-28','2013-11-09'),(3,'2222','1',1,'dfg','fghhk','2013-10-10','2013-10-09','2013-08-12','2013-09-23','2013-10-11','2013-10-24'),(4,'3333','1',1,'hg','fghfr','2013-10-05','2013-10-12','2013-10-23','2013-10-29','2013-11-06','2013-11-25'),(5,'4444','1',0,'kjhh','yuifhg','2013-10-02','2013-01-01','2013-10-26','2013-01-01','2013-01-01','2013-01-01'),(6,'5555','5555',0,'fghdgf','test log too','2013-10-07','2013-01-01','2013-01-01','2013-10-15','2013-01-01','2013-01-01'),(7,'66666','1',1,'asdfw','vbndfg','2013-10-04','2013-10-02','2013-01-01','2013-01-01','2013-10-05','2013-01-01'),(8,'7777','12',0,'sdfg','ghjcvb','2013-10-17','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-10-03'),(9,'8888','as',1,'dzxczx','xcvbvfdsf','2013-10-18','2013-10-17','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(10,'9999','fd',1,'sfdg','ghj','2013-10-15','2013-10-16','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(11,'1122','sad',0,'sfdg','dfgdfg','2013-10-20','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(12,'1133','465431',0,'jkljk','werwa','2013-10-23','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(13,'1144','1144',0,'af','test edit','2013-10-28','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(14,'1155','1',0,'qwe','qwe','2013-11-02','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(15,'adfa','q',0,'qe','qwe','2013-11-05','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(16,'zxcv','qw',0,'qwe','qwe','2013-10-29','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(17,'asd','qw',0,'qwe','qwe','2013-11-10','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(18,'1166','ds',1,'sfg','cvbxc','2013-10-01','2013-10-05','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(19,'test','test',1,'test','test edit','2013-10-16','2013-10-16','2013-10-16','2013-10-16','2013-10-16','2013-10-16'),(20,'asdfwer','wsd',0,'xcvfg','dfggr','2013-10-29','2013-11-12','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(21,'awe','awe',1,'qwe','项目开始！','2013-10-16','2013-10-18','2013-10-16','2013-10-16','2013-10-16','2013-10-16'),(22,'sgd','sgd',0,'ada','项目开始！','2013-01-01','2013-01-01','2013-10-16','2013-10-24','2013-01-18','2013-01-19'),(23,'rete','fghh',0,'fghf','项目开始！','2013-10-17','2013-01-01','2013-10-19','2013-11-06','2013-11-07','2013-11-14'),(24,'test log','asf',0,'dfdfg','项目开始！','2013-10-17','2013-01-01','2013-10-19','2013-10-21','2013-10-25','2013-10-29'),(25,'qwe','q',0,'qwe','qwe','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(26,'qwe','qwe',0,'qwe','qwe','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(27,'qwe','qwe',0,'qwe','qwe','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(28,'qwe','qw',0,'qwe','qwe','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(29,'开发项目','原',0,'manager','项目开始！','2013-10-18','2013-01-01','2013-10-18','2013-10-18','2013-10-18','2013-10-18');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger ctrlversion_insert after insert on program  for each row 
begin
update version set version.version=version.version+1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger ctrlversion_update after update on program  for each row 
begin
update version set version.version=version.version+1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger ctrlversion_delete after delete on program  for each row 
begin
update version set version.version=version.version+1;
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
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin',1,1),(2,'leader',1,1),(3,'dopm',1,1),(4,'user',0,0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123',1),(2,'leader','123',2),(3,'manager','123',4),(4,'dopm','123',3),(5,'user','123',4);
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
INSERT INTO `version` VALUES (20);
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

-- Dump completed on 2013-10-18 18:16:44
