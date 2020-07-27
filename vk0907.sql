-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: vk0907
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (3,'Bitwolf'),(8,'Duobam'),(4,'Fixflex'),(7,'Flexidy'),(5,'Flowdesk'),(10,'Konklux'),(2,'Latlux'),(6,'Overhold'),(1,'Transcof'),(9,'Voltsillam');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint unsigned NOT NULL,
  `target_user_id` bigint unsigned NOT NULL,
  `satus` enum('requested','approved','unfriended','declined') DEFAULT 'requested',
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,4,'declined','2020-07-25 11:07:13',NULL),(3,1,'approved','2020-07-25 11:07:13','2020-07-27 10:10:15'),(4,2,'approved','2020-07-25 11:07:13','2020-07-28 20:10:15'),(4,5,'requested','2020-07-25 11:07:13',NULL),(8,5,'unfriended','2020-07-25 11:07:13',NULL);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `body` text,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,3,'Vectair Systems, Inc.',0,'2020-07-25 11:07:13'),(2,8,1,'Stiefel Laboratories Inc',1,'2020-07-25 11:07:13'),(3,10,5,'Mylan Pharmaceuticals Inc.',0,'2020-07-25 11:07:13'),(4,4,2,'Apotheca Company',1,'2020-07-25 11:07:13'),(5,4,6,'Allergy Laboratories, Inc.',0,'2020-07-25 11:07:13'),(6,3,5,'Nelco Laboratories, Inc.',1,'2020-07-25 11:07:13'),(7,1,4,'Roxane Laboratories, Inc',0,'2020-07-25 11:07:13'),(8,9,7,'Bryant Ranch Prepack',0,'2020-07-25 11:07:13'),(9,7,5,'Cardinal Health',1,'2020-07-25 11:07:13'),(10,8,1,'Uriel Pharmacy Inc.',1,'2020-07-25 11:07:13'),(11,9,5,'HyVee Inc',1,'2020-07-25 11:07:13'),(12,2,4,'Preferred Pharmaceuticals, Inc.',1,'2020-07-25 11:07:13'),(13,10,8,'LLC Federal Solutions',0,'2020-07-25 11:07:13'),(14,6,8,'Topco Associates LLC',1,'2020-07-25 11:07:13'),(15,10,5,'YBK Investment, INC',0,'2020-07-25 11:07:13'),(16,3,1,'REMEDYREPACK INC.',1,'2020-07-25 11:07:13'),(17,1,8,'Torrent Pharmaceuticals Limited',1,'2020-07-25 11:07:13'),(18,2,5,'American Health Packaging',0,'2020-07-25 11:07:13'),(19,4,8,'Aidarex Pharmaceuticals LLC',0,'2020-07-25 11:07:13'),(20,7,5,'Antigen Laboratories, Inc.',0,'2020-07-25 11:07:13');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,'eu.gif',9,'Morbi a ipsum.','2020-07-27 11:32:31','2020-07-27 11:32:31'),(2,'fusce.tiff',3,'Suspendisse potenti.','2020-07-27 11:32:46','2020-07-27 11:32:46'),(3,'volutpat sapien arcu.tiff',10,'Proin interdum mauris non ligula pellentesque ultrices.','2020-07-27 11:32:47','2020-07-27 11:32:47'),(4,'porttitor.tiff',3,'Proin at turpis a pede posuere nonummy.','2020-07-27 11:32:49','2020-07-27 11:32:49'),(5,'morbi porttitor.gif',6,'In hac habitasse platea dictumst.','2020-07-27 11:32:50','2020-07-27 11:32:50'),(6,'nunc vestibulum.tiff',6,'Maecenas tincidunt lacus at velit.','2020-07-27 11:32:51','2020-07-27 11:32:51'),(7,'nunc viverra.gif',4,'Fusce posuere felis sed lacus.','2020-07-27 11:32:52','2020-07-27 11:32:52'),(8,'eu.tiff',9,'In est risus, auctor sed, tristique in, tempus sit amet, sem.','2020-07-27 11:32:53','2020-07-27 11:32:53'),(9,'gravida.gif',2,'Integer non velit.','2020-07-27 11:32:53','2020-07-27 11:32:53'),(10,'sed justo pellentesque.gif',1,'In hac habitasse platea dictumst.','2020-07-27 11:32:55','2020-07-27 11:32:55');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `body` text,
  `attachments` json DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `hometown` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,'M','Natale','Pomroy','1996-05-01',55656,'2020-07-25 11:07:13','Shanban'),(2,2,'F','Vivien','Faulder','1996-05-01',45456,'2020-07-25 11:07:13','Winton'),(3,3,'F','Talia','Pilsworth','1988-06-14',45325732,'2020-07-25 11:07:13','Louredo'),(4,4,'F','Julianna','Tollet','1996-01-05',45752,'2020-07-25 11:07:13','Bonabéri'),(5,5,'F','Luci','Willeman','1989-09-06',6789789,'2020-07-25 11:07:13','Fort Worth'),(6,6,'M','Tabor','Lage','1996-07-30',787678,'2020-07-25 11:07:13','‘Anjarah'),(7,7,'M','Ferrel','Sentinella','1990-01-10',893453,'2020-07-25 11:07:13','Lyublino'),(8,8,'F','Karyn','Elland','1988-02-19',98778786,'2020-07-25 11:07:13','Suisan'),(9,9,'F','Dianna','Yantsurev','1991-06-24',4678,'2020-07-25 11:07:13','Kalkal Barat'),(10,10,'F','Nelly','Savery','1995-02-14',124878,'2020-07-25 11:07:13','Morrinhos');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repost`
--

DROP TABLE IF EXISTS `repost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repost` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `reposted_to` bigint unsigned NOT NULL,
  `reposted_from` bigint unsigned NOT NULL,
  `reposted_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `reposted_to` (`reposted_to`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `repost_ibfk_1` FOREIGN KEY (`reposted_to`) REFERENCES `users` (`id`),
  CONSTRAINT `repost_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repost`
--

LOCK TABLES `repost` WRITE;
/*!40000 ALTER TABLE `repost` DISABLE KEYS */;
/*!40000 ALTER TABLE `repost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `pass` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'shaste0@mail.ru','(133) 8872071','py92hb'),(2,'fcorradino1@howstuffworks.com','(597) 6636421','GbUi76Pxmhw'),(3,'ederby2@networksolutions.com','(420) 9216582','YUs2ZHypB6FH'),(4,'mandrea3@ameblo.jp','(492) 1025685','3AEZYI'),(5,'mcarren4@ocn.ne.jp','(534) 7990308','QlpuFLY'),(6,'fwhichelow5@slideshare.net','(927) 3508700','dewCYi4MRzL'),(7,'cmoxstead6@ask.com','(740) 1599633','MUgEUQbH8S'),(8,'acauderlie7@dion.ne.jp','(212) 7296227','a29PQVU8P3s'),(9,'dcattemull8@seattletimes.com','(113) 6555097','YGi6owX'),(10,'wburdekin9@about.com','(550) 6142895','LcZOXUk0fL');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_communities` (
  `user_id` bigint unsigned NOT NULL,
  `community_id` bigint unsigned NOT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,8,0),(1,9,1),(3,10,0),(4,8,0),(6,1,0),(7,1,0),(7,6,0),(8,8,0),(9,6,0),(10,6,0);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-27 11:58:23
