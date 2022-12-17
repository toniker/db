CREATE DATABASE  IF NOT EXISTS `exposure` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exposure`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: exposure
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `Albums by User`
--

DROP TABLE IF EXISTS `Albums by User`;
/*!50001 DROP VIEW IF EXISTS `Albums by User`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Albums by User` AS SELECT 
 1 AS `name`,
 1 AS `title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Collections by Asset`
--

DROP TABLE IF EXISTS `Collections by Asset`;
/*!50001 DROP VIEW IF EXISTS `Collections by Asset`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Collections by Asset` AS SELECT 
 1 AS `collectionID`,
 1 AS `assetID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Person by Assets`
--

DROP TABLE IF EXISTS `Person by Assets`;
/*!50001 DROP VIEW IF EXISTS `Person by Assets`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Person by Assets` AS SELECT 
 1 AS `pid`,
 1 AS `name`,
 1 AS `Aid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `user_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_admin_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (5);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `collection_id` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`collection_id`),
  CONSTRAINT `fk_album_collection1` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Paris Holidays',NULL),(4,'Christmas','Christmas with the family in Thessaloniki'),(5,'Athens',''),(7,'Hiking weekend',NULL);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `isFavorite` tinyint DEFAULT NULL,
  `fileSize` int NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  `height` int NOT NULL,
  `width` int NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `deviceName` varchar(45) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asset_user1_idx` (`user_id`),
  CONSTRAINT `fk_asset_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES (1,'/assets/1/1.jpg','2022-12-16 15:12:18',0,529145,'Thessaloniki',1080,1920,'The sky','Canon','/thumbnails/1/1.jpg',1),(2,'/assets/1/2.png','2021-10-01 12:30:40',1,478008,NULL,3024,4032,NULL,'Pixel 6a',NULL,2),(3,'/assets/2/3.mp4','2020-02-20 22:51:01',1,156234890,'Athens',1080,1920,NULL,'S10 ',NULL,2),(4,'/assets/2/4.jpg','2015-10-06 23:18:02',0,123154,NULL,1080,2340,'Party',NULL,'/thumbnails/2/4.jpg',4),(5,'/assets/1/5.png','2018-11-09 12:50:22',1,234146,NULL,3024,4032,NULL,NULL,NULL,3),(6,'/assets/3/6.mp4','2022-06-20 18:59:32',1,234146734,'Kordelio',3840,2160,NULL,'iPhone 7',NULL,4),(7,'/assets/1/7.jpg','2022-12-16 17:14:20',0,110259,'',400,400,'meme','','/thumbnails/1/7.jpg',1),(8,'/assets/2/8.jpg','2008-08-15 14:44:39',0,22436,NULL,800,600,NULL,NULL,NULL,3),(9,'/assets/2/9.png','2018-03-25 12:54:19',1,531231,'Athens',3000,4000,NULL,NULL,'/thumbnails/2/9.jpg',4),(10,'/assets/2/10.mp4','2019-01-12 10:29:50',0,24579124,NULL,1920,1080,NULL,'Huawei Mate 20',NULL,3),(11,'/assets/1/11.mp4','2017-07-10 12:19:52',0,12908732,'Athens',3840,2160,'','Canon EOS 70D',NULL,2),(12,'/assets/2/12.png','2014-05-08 08:24:40',0,234135,NULL,1080,1920,NULL,NULL,'/thumbnails/2/12.jpg',1),(13,'/assets/3/13.jpg','2011-03-12 19:30:20',1,123462,'Thessaloniki',720,1080,NULL,NULL,NULL,1),(14,'/assets/2/14.mp4','2019-02-02 10:50:49',1,312643422,'Evosmos',1920,1080,NULL,'iPhone se','/thumbnails/2/14.jpg',4),(15,'/assets/1/15.jpg','2010-03-03 16:09:12',1,423563,NULL,3024,4032,NULL,'SM-G975F',NULL,2),(17,'/assets/3/17.jpg','2020-07-05 10:12:29',0,124544,'Santorini',1080,1920,NULL,NULL,'/thumbnails/3/17.jpg',4),(18,'/assets/3/18.jpg','2020-07-05 18:25:09',1,12354,NULL,3024,4032,NULL,NULL,'/thumbnails/3/18.jpg',4),(21,'/assets/2/21.png','2022-03-16 15:13:18',0,1190523,'Nafplio',2000,3000,'','','/thumbnails/2/21.jpg',2),(24,'/assets/2/24.png','2020-05-07 20:12:59',1,45632,NULL,2000,3000,NULL,'iPhone 13',NULL,1),(30,'/assets/1/30.jpg','2022-05-09 09:34:27',0,26780,NULL,1080,1920,NULL,NULL,NULL,3),(54,'/assets/3/54.mp4','2022-05-10 15:15:18',1,380541096,'Rome',3840,2160,'','Canon',NULL,3);
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_has_person`
--

DROP TABLE IF EXISTS `asset_has_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_has_person` (
  `asset_id` int NOT NULL,
  `person_id` int NOT NULL,
  PRIMARY KEY (`asset_id`,`person_id`),
  KEY `fk_asset_has_person_person1_idx` (`person_id`),
  KEY `fk_asset_has_person_asset1_idx` (`asset_id`),
  CONSTRAINT `fk_asset_has_person_asset1` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`),
  CONSTRAINT `fk_asset_has_person_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_has_person`
--

LOCK TABLES `asset_has_person` WRITE;
/*!40000 ALTER TABLE `asset_has_person` DISABLE KEYS */;
INSERT INTO `asset_has_person` VALUES (8,1),(21,1),(5,2),(2,3),(15,3),(1,4),(13,5),(24,6);
/*!40000 ALTER TABLE `asset_has_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `thumbnail` varchar(45) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_collection_user1_idx` (`user_id`),
  CONSTRAINT `fk_collection_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (1,'2022-12-16 15:12:14','/thumbnails/1/1.jpg',0),(2,'2020-09-11 12:11:38',NULL,1),(3,'2019-01-02 09:39:29',NULL,2),(4,'2010-04-10 17:24:19','/thumbnails/2/4.jpg',4),(5,'2015-06-09 23:21:10','/thumbnails/3/5.jpg',4),(6,'2027-07-02 10:49:01',NULL,1),(7,'2017-08-13 11:11:11','/thumbnails/2/7.jpg',3),(8,'2012-09-20 09:37:27',NULL,0);
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_has_asset`
--

DROP TABLE IF EXISTS `collection_has_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_has_asset` (
  `collection_id` int NOT NULL,
  `asset_id` int NOT NULL,
  PRIMARY KEY (`collection_id`,`asset_id`),
  KEY `fk_collection_has_asset_asset1_idx` (`asset_id`),
  KEY `fk_collection_has_asset_collection1_idx` (`collection_id`),
  CONSTRAINT `fk_collection_has_asset_asset1` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`),
  CONSTRAINT `fk_collection_has_asset_collection1` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_has_asset`
--

LOCK TABLES `collection_has_asset` WRITE;
/*!40000 ALTER TABLE `collection_has_asset` DISABLE KEYS */;
INSERT INTO `collection_has_asset` VALUES (2,1),(4,1),(5,2),(5,3),(7,4),(1,5),(7,6),(4,7),(1,8),(7,9),(1,10),(5,11),(2,12),(4,12),(4,13),(7,14),(3,15),(8,17),(8,18),(3,21),(2,24),(6,30),(6,54);
/*!40000 ALTER TABLE `collection_has_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `asset_id` int NOT NULL,
  `shutterSpeed` int DEFAULT NULL,
  `iso` int DEFAULT NULL,
  `focalLength` int DEFAULT NULL,
  PRIMARY KEY (`asset_id`),
  CONSTRAINT `fk_image_asset1` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,100,400,53),(2,100,2230,40),(4,25,5667,40),(5,100,1661,20),(7,NULL,NULL,NULL),(8,200,400,43),(9,100,200,60),(12,NULL,NULL,NULL),(13,50,400,41),(15,50,125,38),(17,200,100,40),(18,50,100,30),(21,80,400,55),(24,100,125,42),(30,171,40,20);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memory`
--

DROP TABLE IF EXISTS `memory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memory` (
  `collection_id` int NOT NULL,
  `theme` varchar(45) NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  `isFavorite` tinyint DEFAULT NULL,
  PRIMARY KEY (`collection_id`),
  CONSTRAINT `fk_memory_collection1` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memory`
--

LOCK TABLES `memory` WRITE;
/*!40000 ALTER TABLE `memory` DISABLE KEYS */;
INSERT INTO `memory` VALUES (2,'Jump back in','Epanomi',0),(3,'Hiking','Olympos',1),(6,'Trip to Italy','Rome-Naples',1),(8,'Summer 2020','Santorini',0);
/*!40000 ALTER TABLE `memory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Giota'),(2,'Mitsos'),(3,'Antonis'),(4,'Evi'),(5,'Efthi'),(6,'Chri');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Antonis','keremidis@auth.gr','pass1','2022-12-16 15:26:35'),(2,'Dimitris','kapralos@auth.gr','pass2','2022-12-16 15:26:35'),(3,'Evi','nestoropo@auth.gr','pass3','2022-12-16 15:27:20'),(4,'Giorgos','giorgos@gmail.com','pass4','2022-12-16 16:08:10'),(5,'Admin','admin@gmail.com','pass5','2022-12-16 10:18:13');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `user_AFTER_INSERT` AFTER INSERT ON `user` FOR EACH ROW BEGIN
  IF (NEW.name = '' or NEW.email = '' or NEW.password = '') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Name or Email or Password cannot be empty';
  END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_collaborates_in_album`
--

DROP TABLE IF EXISTS `user_collaborates_in_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_collaborates_in_album` (
  `album_collection_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`album_collection_id`,`user_id`),
  KEY `fk_album_has_user_user1_idx` (`user_id`),
  KEY `fk_album_has_user_album1_idx` (`album_collection_id`),
  CONSTRAINT `fk_album_has_user_album1` FOREIGN KEY (`album_collection_id`) REFERENCES `album` (`collection_id`),
  CONSTRAINT `fk_album_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_collaborates_in_album`
--

LOCK TABLES `user_collaborates_in_album` WRITE;
/*!40000 ALTER TABLE `user_collaborates_in_album` DISABLE KEYS */;
INSERT INTO `user_collaborates_in_album` VALUES (4,1),(5,1),(5,2),(1,3),(5,3),(7,4);
/*!40000 ALTER TABLE `user_collaborates_in_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `asset_id` int NOT NULL,
  `framerate` int DEFAULT NULL,
  `duration` float NOT NULL,
  PRIMARY KEY (`asset_id`),
  CONSTRAINT `fk_video_asset1` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (3,60,671),(6,1680,4223),(10,1080,412),(11,1080,232),(14,3025,2314),(54,30,5122);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Albums by User`
--

/*!50001 DROP VIEW IF EXISTS `Albums by User`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Albums by User` AS select `user`.`name` AS `name`,`album`.`title` AS `title` from ((`album` join `user_collaborates_in_album` on((`album`.`collection_id` = `user_collaborates_in_album`.`album_collection_id`))) join `user` on((`user`.`id` = `user_collaborates_in_album`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Collections by Asset`
--

/*!50001 DROP VIEW IF EXISTS `Collections by Asset`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Collections by Asset` AS select `collection`.`id` AS `collectionID`,`asset`.`id` AS `assetID` from ((`asset` join `collection_has_asset` on((`asset`.`id` = `collection_has_asset`.`asset_id`))) join `collection` on((`collection_has_asset`.`collection_id` = `collection`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Person by Assets`
--

/*!50001 DROP VIEW IF EXISTS `Person by Assets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Person by Assets` AS select `person`.`id` AS `pid`,`person`.`name` AS `name`,`asset`.`id` AS `Aid` from ((`person` join `asset_has_person` on((`person`.`id` = `asset_has_person`.`person_id`))) join `asset` on((`asset`.`id` = `asset_has_person`.`asset_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-17 15:45:25
