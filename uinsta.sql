-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: uinsta
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `source_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-auth-user_id-user-id` (`user_id`),
  CONSTRAINT `fk-auth-user_id-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed`
--

DROP TABLE IF EXISTS `feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `author_nickname` int(70) DEFAULT NULL,
  `author_picture` varchar(255) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `post_filename` varchar(255) NOT NULL,
  `post_description` text,
  `post_created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed`
--

LOCK TABLES `feed` WRITE;
/*!40000 ALTER TABLE `feed` DISABLE KEYS */;
INSERT INTO `feed` VALUES (3,3,4,'Dusty Bednar',0,'/img/profile_default_image.jpg',9,'6f/3d/9384ee5d8fe61b25f7a73f32c6687de791a4.jpg','Geek',1595631198),(4,4,5,'Mya Welch',1,'/img/profile_default_image.jpg',10,'57/26/62141e48d87ce5443db3fc141925323978f4.jpg','Arch Linux',1595631255),(5,3,5,'Mya Welch',1,'/img/profile_default_image.jpg',10,'57/26/62141e48d87ce5443db3fc141925323978f4.jpg','Arch Linux',1595631255),(6,4,5,'Mya Welch',1,'/img/profile_default_image.jpg',11,'6a/31/cb821cfb5265bf2ac6009667f52abe8a3886.jpg','Kali Linux',1595631294),(7,3,5,'Mya Welch',1,'/img/profile_default_image.jpg',11,'6a/31/cb821cfb5265bf2ac6009667f52abe8a3886.jpg','Kali Linux',1595631294);
/*!40000 ALTER TABLE `feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1595236387),('m130524_201442_init',1595236389),('m190124_110200_add_verification_token_column_to_user_table',1595236390),('m200720_093653_create_auth_table',1595238114),('m200720_144420_alter_user_table',1595256424),('m200723_143335_create_post_table',1595514984),('m200724_213940_create_feed_table',1595627080);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `description` text,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (9,4,'6f/3d/9384ee5d8fe61b25f7a73f32c6687de791a4.jpg','Geek',1595631198),(10,5,'57/26/62141e48d87ce5443db3fc141925323978f4.jpg','Arch Linux',1595631255),(11,5,'6a/31/cb821cfb5265bf2ac6009667f52abe8a3886.jpg','Kali Linux',1595631294);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `type` int(3) DEFAULT NULL,
  `nickname` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'Jaylen Donnelly','1GnvuwbzI-BugJ0ScSM_QvptIkfQGlbx','$2y$13$O4vEX6dZ7Ib1k7f03vSMHOGgm3ndJ3wzBtC.xTJIi4qOjIixk139C',NULL,'jbruen@gmail.com',10,1595494213,1595494213,NULL,'Aliquid aperiam nihil perspiciatis tempora commodi. Veritatis fuga sed ea doloribus velit. Alias qui ea qui eveniet fuga. A et quibusdam repudiandae ut.',NULL,'IP4zh',NULL),(4,'Dusty Bednar','TzysVhNqe5eBR9Iuxde0VomLJoYrHycf','$2y$13$O4vEX6dZ7Ib1k7f03vSMHOGgm3ndJ3wzBtC.xTJIi4qOjIixk139C',NULL,'candice77@durgan.info',10,1595494214,1595494214,NULL,'Ut et totam quia earum. Et sequi voluptatem est. Cupiditate nemo labore fuga qui reiciendis aut. Eaque occaecati iste dignissimos natus.',NULL,'n4tNhYaAz','30/78/b24b595462a004c89b13b7842f888975219c.jpg'),(5,'Mya Welch','1Wmeexp58yflwROIN-nK2kPG-9c3v-8M','$2y$13$O4vEX6dZ7Ib1k7f03vSMHOGgm3ndJ3wzBtC.xTJIi4qOjIixk139C',NULL,'leola.trantow@sauer.net',10,1595494214,1595494214,NULL,'Officiis facere maxime repudiandae est officiis occaecati. Vitae enim similique quia voluptates et aut neque. Omnis et sunt eum quia aliquam aliquam odit.',NULL,'1eOnl5JBcSlN1',NULL),(6,'Emilio Sporer','aXnTrdzE_gODv59kbSAHuC9Z4Svzu8A8','$2y$13$O4vEX6dZ7Ib1k7f03vSMHOGgm3ndJ3wzBtC.xTJIi4qOjIixk139C',NULL,'bergnaum.katherine@braun.com',10,1595494214,1595494214,NULL,'Et sapiente aperiam repellat totam aperiam. Maiores accusamus pariatur ratione qui sequi deleniti. Sed voluptatem quam ipsum sequi earum aut et quia.',NULL,'YIFOcp2RsqIpKJd',NULL),(7,'Dorian Lang','4oLQwF_HDA4yEJoWowKzTxRbUXWOcQLx','$2y$13$O4vEX6dZ7Ib1k7f03vSMHOGgm3ndJ3wzBtC.xTJIi4qOjIixk139C',NULL,'bogan.murl@hotmail.com',10,1595494214,1595494214,NULL,'Quia eos magnam quo est. Qui debitis aut odit consectetur ut tempora. Id et et quod minima dolor exercitationem. Quidem harum aut totam aliquid voluptatem dolor sit.',NULL,'jgYzeWonwG',NULL),(8,'Miguel Reinger','dzluXSS5TvbyIsKLxI0SQXShjBpAWdtn','$2y$13$O4vEX6dZ7Ib1k7f03vSMHOGgm3ndJ3wzBtC.xTJIi4qOjIixk139C',NULL,'emilia86@herzog.com',10,1595494214,1595494214,NULL,'Non facere sunt eum voluptatem dignissimos quia. Dolorum odit ut quia sunt sunt. Quae a fuga velit ut in. Et beatae nulla non hic eligendi perspiciatis.',NULL,'LRtTgf3pRCVDay',NULL),(9,'George Fisher','wvYbF7hQvFR9u1C-PXBRAHQFLsQGn2rd','$2y$13$O4vEX6dZ7Ib1k7f03vSMHOGgm3ndJ3wzBtC.xTJIi4qOjIixk139C',NULL,'sydnee67@hotmail.com',10,1595494214,1595494214,NULL,'Sit id eum sed. Sunt quod et nemo atque ab voluptatem. Praesentium nostrum quia quia fugiat beatae velit necessitatibus. Ipsa numquam et dolorum nesciunt et.',NULL,'HRKxg9N1',NULL),(10,'Ms. Gilda Ernser','vGa-__2TWCJCKFp4f9zsqvnW03uROcSt','$2y$13$O4vEX6dZ7Ib1k7f03vSMHOGgm3ndJ3wzBtC.xTJIi4qOjIixk139C',NULL,'crohan@gmail.com',10,1595494214,1595494214,NULL,'Eveniet doloremque dolore iste qui fugiat. Fugit laboriosam assumenda aut enim ex blanditiis. Ab qui architecto aut error optio beatae. Qui placeat reprehenderit deleniti nemo.',NULL,'lL_1krj7gPYH5',NULL);
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

-- Dump completed on 2020-07-25 12:02:03
