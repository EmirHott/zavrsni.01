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
-- Table structure for table `books_img`
--

DROP TABLE IF EXISTS `books_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_img` (
  `books_img_id` int NOT NULL AUTO_INCREMENT,
  `book_img` varchar(200) DEFAULT NULL,
  `book_img_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`books_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_img`
--

LOCK TABLES `books_img` WRITE;
/*!40000 ALTER TABLE `books_img` DISABLE KEYS */;
INSERT INTO `books_img` VALUES (1,'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1330855500l/13510444.jpg','lotr-img'),(2,'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1388184640l/7235533.jpg','wotk-img'),(3,'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327942676l/23919.jpg','tcsp-img'),(4,'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1651710873l/59348310.jpg','mml-img'),(6,'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1343059311l/13578175.jpg','emps-img'),(7,'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546071216l/5907.jpg','hobi-img'),(8,'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1387151694l/17245.jpg','drac-img'),(9,'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1560816565l/48855.jpg','tdoyg-img');
/*!40000 ALTER TABLE `books_img` ENABLE KEYS */;
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
