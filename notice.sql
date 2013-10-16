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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ewprogress`
--

LOCK TABLES `ewprogress` WRITE;
/*!40000 ALTER TABLE `ewprogress` DISABLE KEYS */;
INSERT INTO `ewprogress` VALUES (1,6,'test edit',42),(2,19,'test edit',42);
/*!40000 ALTER TABLE `ewprogress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importanteve`
--

DROP TABLE IF EXISTS `importanteve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `importanteve` (
  `month` int(3) NOT NULL DEFAULT '0',
  `event` int(11) NOT NULL DEFAULT '0',
  KEY `id` (`event`),
  CONSTRAINT `id` FOREIGN KEY (`event`) REFERENCES `program` (`proid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importanteve`
--

LOCK TABLES `importanteve` WRITE;
/*!40000 ALTER TABLE `importanteve` DISABLE KEYS */;
INSERT INTO `importanteve` VALUES (1,2),(2,3),(3,5),(4,8),(5,10),(6,13),(7,6),(8,6),(9,10),(10,2),(11,17),(12,3);
/*!40000 ALTER TABLE `importanteve` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'qwe','c1',1,'asd','lfjgh','2013-10-11','2013-10-12','2013-10-12','2013-10-23','2013-10-29','2013-11-06'),(2,'1111','c1',0,'sdf','dfghs','2013-10-25','2013-01-01','2013-09-12','2013-10-15','2013-10-28','2013-11-09'),(3,'2222','1',1,'dfg','fghhk','2013-10-10','2013-10-09','2013-08-12','2013-09-23','2013-10-11','2013-10-24'),(4,'3333','1',1,'hg','fghfr','2013-10-05','2013-10-12','2013-10-23','2013-10-29','2013-11-06','2013-11-25'),(5,'4444','1',0,'kjhh','yuifhg','2013-10-02','2013-01-01','2013-10-26','2013-01-01','2013-01-01','2013-01-01'),(6,'5555','5555',0,'fghdgf','test edit','2013-10-07','2013-01-01','2013-01-01','2013-10-15','2013-01-01','2013-01-01'),(7,'66666','1',1,'asdfw','vbndfg','2013-10-04','2013-10-02','2013-01-01','2013-01-01','2013-10-05','2013-01-01'),(8,'7777','12',0,'sdfg','ghjcvb','2013-10-17','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-10-03'),(9,'8888','as',1,'dzxczx','xcvbvfdsf','2013-10-18','2013-10-17','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(10,'9999','fd',1,'sfdg','ghj','2013-10-15','2013-10-16','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(11,'1122','sad',0,'sfdg','dfgdfg','2013-10-20','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(12,'1133','465431',0,'jkljk','werwa','2013-10-23','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(13,'1144','1144',0,'af','test edit','2013-10-28','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(14,'1155','1',0,'qwe','qwe','2013-11-02','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(15,'adfa','q',0,'qe','qwe','2013-11-05','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(16,'zxcv','qw',0,'qwe','qwe','2013-10-29','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(17,'asd','qw',0,'qwe','qwe','2013-11-10','2013-01-01','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(18,'1166','ds',1,'sfg','cvbxc','2013-10-01','2013-10-05','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(19,'test','test',1,'test','test edit','2013-10-16','2013-10-16','2013-10-16','2013-10-16','2013-10-16','2013-10-16'),(20,'asdfwer','wsd',0,'xcvfg','dfggr','2013-10-29','2013-11-12','2013-01-01','2013-01-01','2013-01-01','2013-01-01'),(21,'awe','qwe',0,'qwe','项目开始！','2013-10-16','2013-01-01','2013-10-16','2013-10-16','2013-10-16','2013-10-16'),(22,'sgd','sgd',0,'ada','项目开始！','2013-01-01','2013-01-01','2013-10-16','2013-10-24','2013-01-18','2013-01-19');
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL DEFAULT '',
  `role` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123','admin');
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
INSERT INTO `version` VALUES (9);
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

-- Dump completed on 2013-10-16 23:38:41
