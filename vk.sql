-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: vk2
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `like_id` bigint unsigned NOT NULL,
  `liked_to` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `liked_to` (`liked_to`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`liked_to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'shaste0@about.me','(133) 8872071','py92hb'),(2,'fcorradino1@howstuffworks.com','(597) 6636421','GbUi76Pxmhw'),(3,'ederby2@networksolutions.com','(420) 9216582','YUs2ZHypB6FH'),(4,'mandrea3@ameblo.jp','(492) 1025685','3AEZYI'),(5,'mcarren4@ocn.ne.jp','(534) 7990308','QlpuFLY'),(6,'fwhichelow5@slideshare.net','(927) 3508700','dewCYi4MRzL'),(7,'cmoxstead6@ask.com','(740) 1599633','MUgEUQbH8S'),(8,'acauderlie7@dion.ne.jp','(212) 7296227','a29PQVU8P3s'),(9,'dcattemull8@seattletimes.com','(113) 6555097','YGi6owX'),(10,'wburdekin9@about.com','(550) 6142895','LcZOXUk0fL'),(11,'mchaffina@umich.edu','(533) 3626044','ixaqz41zs6'),(12,'rstapellsb@wordpress.com','(789) 8065680','jqoe9Cn6IqZ'),(13,'msainsburybrownc@umich.edu','(902) 2604045','0LQFK1wwjDb'),(14,'fploverd@ted.com','(452) 7856048','j4rbCd96'),(15,'jkonzele@sphinn.com','(785) 8652891','ZRi1dO'),(16,'mcalvertf@reference.com','(464) 7081745','GgLPDNkwC'),(17,'tweinsg@ameblo.jp','(876) 7257515','XRgocd78jfL'),(18,'wcardenosoh@nhs.uk','(966) 2478902','4ea7lX3q'),(19,'joveringtoni@angelfire.com','(570) 3166814','0xasBUVbFct'),(20,'ahayseyj@myspace.com','(853) 2638312','lUyVi823seRN'),(21,'efranzinik@census.gov','(787) 7968687','BzS0tNWA8'),(22,'gcardonl@cdbaby.com','(262) 1356587','OWjvfJNoBnVa'),(23,'nbinnellm@nature.com','(305) 1041831','cF31i4JSdG'),(24,'nbuxceyn@census.gov','(904) 2103282','P5rHbuL'),(25,'komearao@state.tx.us','(346) 5381977','Xk2SaaLJ'),(26,'sswatheridgep@abc.net.au','(340) 1557958','oZTmwvAMdAd7'),(27,'ggisbournq@oaic.gov.au','(294) 3463256','H6V1Yry7'),(28,'cdeknevetr@moonfruit.com','(848) 2054872','4ON5uq4fG5y'),(29,'jmingers@domainmarket.com','(847) 3998351','rAhCPyHcy'),(30,'dprimmert@patch.com','(879) 6883512','hV0E85Oy0'),(31,'acootesu@hud.gov','(798) 3904322','9EPHI0ITG9'),(32,'karpev@liveinternet.ru','(741) 6995252','uikM5P'),(33,'codohertyw@meetup.com','(323) 4069491','AX6yWGY6Upz'),(34,'aohernx@amazon.com','(415) 5688331','lnA25pl'),(35,'mgoochy@1und1.de','(492) 3548562','9ysxdH'),(36,'sskeggsz@eventbrite.com','(912) 4755158','E3h7fFuE8'),(37,'oeneas10@shinystat.com','(216) 4672539','X68Y71WBxyn'),(38,'dbigham11@webnode.com','(472) 6168348','TqPFFYlDr4Qp'),(39,'cjimes12@ihg.com','(647) 9397618','UtkmIhPJ'),(40,'jbarthelmes13@omniture.com','(307) 9680319','Gzk8TnbTTd'),(41,'cmac14@unblog.fr','(503) 4222796','PQ7IlnEzzlU4'),(42,'pdeancywillis15@fc2.com','(227) 2661553','g64OGgj1zg'),(43,'lninnotti16@usgs.gov','(605) 4984236','ixJStLtpPF'),(44,'gstukings17@netscape.com','(752) 8184030','GjUmZ5U4UI'),(45,'hyatman18@free.fr','(229) 5186220','F5TN8t'),(46,'dleggen19@exblog.jp','(621) 4763768','3DqoLw7q09lO'),(47,'bcaselick1a@quantcast.com','(326) 5240594','ayVW7cm'),(48,'goshiel1b@ocn.ne.jp','(456) 7786081','H3QjFme'),(49,'ksmythin1c@reference.com','(337) 3179437','ZeUh5uh7'),(50,'cbenneyworth1d@icio.us','(615) 3960186','2Z1eEsBi'),(51,'rnovichenko1e@nsw.gov.au','(106) 7733756','1DRZg8NVPX'),(52,'eborwick1f@nsw.gov.au','(643) 1745951','tAIUaDkU'),(53,'ahardey1g@php.net','(760) 5362233','Jut3dGeqr'),(54,'bhaselup1h@github.com','(204) 2093939','EKGcfFv1WTo'),(55,'vdowglass1i@ucsd.edu','(777) 1133814','JlwJ1Z'),(56,'jkemmis1j@histats.com','(288) 3356695','Wx7ceBLwB'),(57,'dfarris1k@samsung.com','(105) 3840342','vb8O7WI7r9'),(58,'wmogenot1l@foxnews.com','(123) 3885180','xQI4W2aVFUW'),(59,'rburgon1m@privacy.gov.au','(684) 3315173','blXuXTi'),(60,'cmcnerlin1n@shutterfly.com','(914) 4586518','FLsGgF'),(61,'tbarkworth1o@mysql.com','(730) 2862565','MYVwA3YFud5m'),(62,'jjoly1p@webeden.co.uk','(360) 1773404','BGTDGCKSPJOm'),(63,'jiwanicki1q@moonfruit.com','(341) 6739175','Q4Z5Xy'),(64,'efairlem1r@prweb.com','(428) 8757932','gP2J93F'),(65,'ddullard1s@google.ca','(240) 4417174','Qd2ZstKz'),(66,'hepine1t@ihg.com','(811) 1172032','EOEkFFkeoWZb'),(67,'rpicken1u@shop-pro.jp','(499) 2859798','O2w1QTXr'),(68,'bbladder1v@symantec.com','(812) 2200464','ofy0hv6'),(69,'lflorio1w@ucoz.ru','(455) 8222275','26e9yGd'),(70,'leastcourt1x@dell.com','(738) 7393498','3evSCdLp8E'),(71,'shaily1y@epa.gov','(756) 3600383','hpQ4u5uka'),(72,'jbrockhurst1z@nymag.com','(973) 8230017','nlzyN2yP4U'),(73,'dgaw20@privacy.gov.au','(438) 1902366','0jSCjJV1o'),(74,'mqualtrough21@google.com.au','(961) 9487795','19EQUt42lWB'),(75,'ptidmas22@desdev.cn','(227) 5370562','bGhC6vnM'),(76,'fvigars23@typepad.com','(330) 4688932','OXXoFn'),(77,'kepsley24@house.gov','(217) 4396318','Ck0oBx'),(78,'crillett25@wiley.com','(821) 6679731','3pJSvx09eU'),(79,'bmillan26@xrea.com','(867) 1109908','d7YCmc'),(80,'bduberry27@odnoklassniki.ru','(673) 1486409','I7AO0PcVYPD'),(81,'obodley28@stanford.edu','(588) 4015091','qcobnGu3'),(82,'rbenford29@newsvine.com','(452) 1409779','UJHQFrWAx'),(83,'lpepperd2a@prnewswire.com','(343) 1074483','KwRJ4d0RAk'),(84,'abarkes2b@networksolutions.com','(920) 3807416','sigYam0o'),(85,'mbrashaw2c@canalblog.com','(743) 9003534','tsTDXZeCHbF'),(86,'wdibdall2d@time.com','(840) 7295437','zFHzVnbCmM5v'),(87,'bconyard2e@mayoclinic.com','(781) 6405912','8htCT0Sh'),(88,'cheintzsch2f@baidu.com','(770) 6160594','fdBHEqdvwddx'),(89,'twroath2g@ebay.com','(889) 9825179','ON0vCMkxJX'),(90,'dcaldera2h@jiathis.com','(418) 1757757','Vd4Wl2xe'),(91,'ngreave2i@msn.com','(415) 1271007','us1Oa3I'),(92,'mdarell2j@oracle.com','(568) 1312333','m1bQPO'),(93,'vwastell2k@tuttocitta.it','(902) 2931732','XALTmVR2f0'),(94,'aglew2l@infoseek.co.jp','(698) 9900685','fKXtC77GVkU'),(95,'bswinfen2m@ucla.edu','(564) 4118858','ToHyP29X4k'),(96,'aweatherby2n@engadget.com','(609) 6893848','iITMnVXJ3asw'),(97,'bhumfrey2o@vistaprint.com','(911) 7264320','pDBmIBhi'),(98,'ghuddles2p@salon.com','(416) 8188614','klfd14Eocze'),(99,'llongmaid2q@hao123.com','(378) 5579944','mabtzsQum'),(100,'tshernock2r@dedecms.com','(739) 8244599','t5yCzHZnT5');
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
  `is_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
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

-- Dump completed on 2020-07-19 15:38:29
