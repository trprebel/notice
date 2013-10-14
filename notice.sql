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
  `weekprocess` varchar(255) DEFAULT NULL,
  `plandate` date NOT NULL DEFAULT '2013-01-01',
  `compdate` date NOT NULL DEFAULT '2013-01-01',
  PRIMARY KEY (`proid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'qwe','c1',1,'asd','lfjgh','2013-10-11','2013-10-12'),(2,'1111','1',0,'sdf','dfghs','2013-10-25','2013-01-01'),(3,'2222','1',1,'dfg','fghhk','2013-10-10','2013-10-09'),(4,'3333','1',1,'hg','fghfr','2013-10-05','2013-10-12'),(5,'4444','1',0,'kjhh','yuifhg','2013-10-02','2013-01-01'),(6,'5555','1',0,'fghdgf','dfhjghj','2013-10-07','2013-01-01'),(7,'66666','1',1,'dfhh','vbndfg','2013-10-04','2013-10-02'),(8,'7777','12',0,'sdfg','ghjcvb','2013-10-17','2013-01-01'),(9,'8888','as',1,'dzxczx','xcvbvfdsf','2013-10-18','2013-10-17'),(10,'9999','fd',1,'sfdg','ghj','2013-10-15','2013-10-16'),(11,'1122','sad',0,'sfdg','dfgdfg','2013-10-20','2013-01-01'),(12,'1133','465431',0,'jkljk','werwa','2013-10-23','2013-01-01'),(13,'1144','asf',0,'af','sdf','2013-10-28','2013-01-01'),(14,'1155','1',0,'qwe','qwe','2013-11-02','2013-01-01'),(15,'adfa','q',0,'qe','qwe','2013-11-05','2013-01-01'),(16,'zxcv','qw',0,'qwe','qwe','2013-10-29','2013-01-01'),(17,'asd','qw',0,'qwe','qwe','2013-11-10','2013-01-01');
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-14 22:11:38
