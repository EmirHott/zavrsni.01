CREATE DATABASE  IF NOT EXISTS `book_shop` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `book_shop`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: book_shop
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_title` varchar(100) NOT NULL,
  `book_pagenumber` int NOT NULL,
  `book_publication_date` date NOT NULL,
  `book_rating` decimal(2,1) DEFAULT NULL,
  `publisher_id` int NOT NULL,
  `book_img_id` int NOT NULL,
  `book_info` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `fk_publisher_id_idx` (`publisher_id`),
  KEY `fk_book_img_id_idx` (`book_img_id`),
  CONSTRAINT `fk_book_img_id` FOREIGN KEY (`book_img_id`) REFERENCES `books_img` (`books_img_id`),
  CONSTRAINT `fk_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`publisher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Lord of the Rings ',1209,'1955-10-20',4.5,1,1,'One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them'),(2,'The Way of Kings ',1007,'2010-08-31',4.6,2,2,'Roshar is a world of stone and storms. Uncanny tempests of incredible power sweep across the rocky terrain so frequently that they have shaped ecology and civilization alike. Animals hide in shells, trees pull in branches, and grass retracts into the soilless ground. Cities are built only where the topography offers shelter.'),(3,'The Complete Stories and Poems',821,'1984-08-15',4.3,3,3,'This single volume brings together all of Poe\'s stories and poems, and illuminates the diverse and multifaceted genius of one of the greatest and most influential figures in American literary history.'),(4,'Miss Memory Lane: A Memoir ',256,'2022-05-31',4.3,4,4,'A brutally honest and moving memoir of lust, abuse, addiction, stardom, and redemption from Arrow and Teen Wolf actor Colton Haynes.'),(6,'The Emperor\'s Soul ',175,'2012-10-11',4.4,6,6,'Shai is a Forger, a foreigner who can flawlessly copy and re-create any item by rewriting its history with skillful magic. Condemned to death after trying to steal the emperor’s scepter, she is given one opportunity to save herself. '),(7,'The Hobbit ',366,'2002-08-15',4.2,1,7,'In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.'),(8,'Dracula',488,'1986-05-12',4.0,7,8,'A rich selection of background and source materials is provided in three areas: Contexts includes probable inspirations for Dracula in the earlier works of James Malcolm Rymer and Emily Gerard. Also included are a discussion of Stoker\'s working notes for the novel and \"Dracula\'s Guest,\" the original opening chapter to Dracula.'),(9,'The Diary of a Young Girl',283,'1993-06-20',4.1,8,9,'Discovered in the attic in which she spent the last years of her life, Anne Frank’s remarkable diary has become a world classic—a powerful reminder of the horrors of war and an eloquent testament to the human spirit. ');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-15 14:36:14
