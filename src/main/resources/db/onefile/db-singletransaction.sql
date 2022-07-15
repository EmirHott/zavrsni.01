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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(50) NOT NULL,
  `author_surname` varchar(50) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'J.R.R','Tolkien'),(2,'Brandon','Sanderson'),(3,'Edgar Allan ','Poe'),(4,'Colton ','Haynes'),(6,'Bram','Stoker'),(7,'Anne ','Frank');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_genre`
--

DROP TABLE IF EXISTS `book_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_genre` (
  `genre_id` int NOT NULL,
  `book_id` int NOT NULL,
  PRIMARY KEY (`genre_id`,`book_id`),
  KEY `fk_genre_id_idx` (`genre_id`),
  KEY `fk_book_id_idx` (`book_id`),
  CONSTRAINT `fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `fk_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_genre`
--

LOCK TABLES `book_genre` WRITE;
/*!40000 ALTER TABLE `book_genre` DISABLE KEYS */;
INSERT INTO `book_genre` VALUES (1,1),(1,2),(1,3),(1,6),(1,7),(1,8),(2,4),(3,9),(4,3);
/*!40000 ALTER TABLE `book_genre` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `books_authors`
--

DROP TABLE IF EXISTS `books_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_authors` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `fk_book_id_idx` (`book_id`),
  KEY `fk_book_id2_idx` (`book_id`),
  KEY `fk_author_id_idx` (`author_id`),
  CONSTRAINT `fk_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  CONSTRAINT `fk_book_id2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_authors`
--

LOCK TABLES `books_authors` WRITE;
/*!40000 ALTER TABLE `books_authors` DISABLE KEYS */;
INSERT INTO `books_authors` VALUES (1,1),(2,2),(3,3),(4,4),(6,2),(7,1),(8,6),(9,7);
/*!40000 ALTER TABLE `books_authors` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Fiction'),(2,'Nonfiction'),(3,'Drama'),(4,'Poetry');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `note_text` varchar(250) DEFAULT NULL,
  `status_id` int NOT NULL,
  `note_title` varchar(45) NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `fk_status_id_idx` (`status_id`),
  KEY `fk_user_id3_idx` (`user_id`),
  KEY `fk_book_id3_idx` (`book_id`),
  KEY `fk_book_id4_idx` (`book_id`),
  CONSTRAINT `fk_book_id4` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `fk_status_id` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`),
  CONSTRAINT `fk_user_id3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,3,1,'test test test Test',1,'test'),(2,5,2,'testestestes',2,'title'),(4,3,2,'test test',1,'testtitle'),(5,5,1,'test123',2,'Test'),(7,5,1,'dfsdfsdfsdfdsf',1,'Note');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privilege` (
  `privilege_id` int NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(50) NOT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Houghton Mifflin Harcourt '),(2,'Tor Books'),(3,'Doubleday & Company, Inc. '),(4,'Atria Books'),(6,'Tachyon Publications'),(7,'Norton'),(8,'Bantam');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` int NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status_UNIQUE` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (2,'Not Read'),(1,'Read');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_username` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(250) NOT NULL,
  `privilege_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_username_UNIQUE` (`user_username`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`),
  KEY `fk_privileg_id_idx` (`privilege_id`),
  CONSTRAINT `fk_privileg_id` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Ado','Adic@gmail.com','PBKDF2WithHmacSHA256:2048:mrYV6UgCICnCE8NnqBCOThS/RJJDrXsdgwixePvSolg=:63LVc4hn2c4AbrrD5nau+N5q0wyKU/lLpTue+XoiNpo=',2),(3,'Emir','emir@gmail.com','PBKDF2WithHmacSHA256:2048:lQGbUaD5/3uleFEYtjdf6gHc0j7oToIDcqUUnFZIF4c=:ikfcfasnOtCUL9JRikbsvJd6hDD5tAptZPhu6M1+Dd8=',1),(4,'Edod','edod@gmail.com','PBKDF2WithHmacSHA256:2048:PExFLbjaWSUa+3FxB2+hZdRJXBksztNQXehdC9PXARk=:I1V9lUCesSflk4t0Ny1LMKW6hjx6i9V/Z890v0K4Syw=',2),(5,'Abna','abna@gmail.com','PBKDF2WithHmacSHA256:2048:rodG9AsCDhghOnzbaHQCn7lfqWHaVHGCtCuymXwT0t4=:bmjZ1eu7+ZEi+LtI/NYwduSE/o5tRPJOt+6D+Y7E/h4=',2);
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

-- Dump completed on 2022-07-15 14:39:54
