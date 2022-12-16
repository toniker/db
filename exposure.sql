CREATE DATABASE  IF NOT EXISTS `exposure` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exposure`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: exposure
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

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
INSERT INTO `admin` VALUES (1),(2);
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
INSERT INTO `asset` VALUES (1,'/assets/1/1.jpg','2022-12-16 15:12:18',0,529145,'Thessaloniki',1080,1920,'The sky','Canon',NULL,1),(7,'/assets/1/7.jpg','2022-12-16 17:14:20',0,110259,'',400,400,'meme','','/thumbnails/1/7.jpg',1),(21,'/assets/2/21.png','2022-12-16 15:13:18',0,1190523,'Nafplio',2000,3000,'','','/thumbnails/2/21.jpg',2),(54,'/assets/3/54.mp4','2022-12-16 15:15:18',1,380541096,'',3840,2160,'','Canon',NULL,3);
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
INSERT INTO `asset_has_person` VALUES (21,1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
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
INSERT INTO `image` VALUES (1,100,400,NULL),(7,NULL,NULL,NULL),(21,80,400,55);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Giota');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Antonis','keremidis@auth.gr','pass1','2022-12-16 15:26:35'),(2,'Dimitris','kapralos@auth.gr','pass2','2022-12-16 15:26:35'),(3,'Evi','nestoropo@auth.gr','pass3','2022-12-16 15:27:20');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `video` VALUES (54,30,5122);
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
/*!50013 DEFINER=`antonis`@`%` SQL SECURITY DEFINER */
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
/*!50013 DEFINER=`antonis`@`%` SQL SECURITY DEFINER */
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
/*!50013 DEFINER=`antonis`@`%` SQL SECURITY DEFINER */
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

-- Dump completed on 2022-12-16 15:42:31
