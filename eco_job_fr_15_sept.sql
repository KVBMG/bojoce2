-- MySQL dump 10.16  Distrib 10.1.19-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.19-MariaDB

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
-- Table structure for table `alert_mail`
--

DROP TABLE IF EXISTS `alert_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `criter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DE967ECCA76ED395` (`user_id`),
  CONSTRAINT `FK_DE967ECCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_mail`
--

LOCK TABLES `alert_mail` WRITE;
/*!40000 ALTER TABLE `alert_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrat_type`
--

DROP TABLE IF EXISTS `contrat_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrat_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C18AF237A4D60759` (`libelle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrat_type`
--

LOCK TABLES `contrat_type` WRITE;
/*!40000 ALTER TABLE `contrat_type` DISABLE KEYS */;
INSERT INTO `contrat_type` VALUES (1,'CDD'),(2,'CDI');
/*!40000 ALTER TABLE `contrat_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cu_vi`
--

DROP TABLE IF EXISTS `cu_vi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cu_vi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` int(11) NOT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cu_vi`
--

LOCK TABLES `cu_vi` WRITE;
/*!40000 ALTER TABLE `cu_vi` DISABLE KEYS */;
INSERT INTO `cu_vi` VALUES (1,'Adnan','Mohammed',0,'Ingénieur','59b913ce5750b.jpg','2017-09-13 13:17:34');
/*!40000 ALTER TABLE `cu_vi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offre`
--

DROP TABLE IF EXISTS `offre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contrat_id` int(11) NOT NULL,
  `recruteur_id` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `localisation` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AF86866F1823061F` (`contrat_id`),
  KEY `IDX_AF86866FBB0859F1` (`recruteur_id`),
  CONSTRAINT `FK_AF86866F1823061F` FOREIGN KEY (`contrat_id`) REFERENCES `contrat_type` (`id`),
  CONSTRAINT `FK_AF86866FBB0859F1` FOREIGN KEY (`recruteur_id`) REFERENCES `utilisateur` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre`
--

LOCK TABLES `offre` WRITE;
/*!40000 ALTER TABLE `offre` DISABLE KEYS */;
INSERT INTO `offre` VALUES (3,1,2,1,'Java','What is Java ?',1,48.85661400000001,2.3522219000000177,'Paris, France',NULL),(4,2,2,1,'How to keep your translations well organized in Symfony2','We are working at the moment on a big internationalized project, and we have consequently many translations in our application. These translations are dispatched in many bundles (7 for now) and are used throughout the application. At the begining of the d',1,48.85661400000001,2.3522219000000177,'Paris, France',NULL),(5,1,2,1,'Efficient Elasticsearch indexing configuration','This post is about elasticsearch which is a great search engine.            The biggest difficulty we meet is that we do not know how to configure it to have relevant search results. Another difficulty is (sorry to say that), the documentation is not ve',1,48.8657844,2.307314099999985,'Champs-Élysées, Pari',NULL),(12,1,2,1,'Configure WSSE on Symfony2 with FOSRestBundle','The client–server communication is further constrained by no client context being stored on the server between requests. Each request from any client contains all of the information necessary to service the request, and any session state is held in the cl',1,0,0,'',NULL),(13,2,2,1,'DateTimePicker field type with Symfony2 and jQuery','In this third post, we’ll explain how to create a great custom field type that uses jQuery DatePicker to handle date input, and then, how to extend it to create a datetime field type. And the best? The datepicker is localized according to the user’s local',1,0,0,'',NULL),(14,1,2,1,'Currency Change rates update on Symfony2 using openexchangerates.org API','In this post, we’ll explain how to create and maintain a database with currencies and change rates.\r\n            In order to update our changes rates, we will user openexchangerates.org solution. (Exists as free, premium and pro)\r\n        ',1,0,0,'',NULL),(15,1,2,2,'Create a breadcrumb menu with KnpMenuBundle','In this first post, I’ll explain how to make a breadcrumb menu with the great KnpMenuBundle. The documentation explains the basics and how to make a common menu, but a breadcrumb menu has a particular behaviour.\r\n        ',1,0,0,'',NULL),(16,2,2,2,'Create new log file/channel for a Symfony2 Service (With monolog)','In this article about WSSE and Rest, we describe how to create a new log file/channel with monolog in Symfony2\r\n        ',1,0,0,'',NULL),(17,2,2,2,'Create a custom form theme block with Twig','I wanted to use the following block. As you see, in addition to the specific p element, the div and their specific classes, the big difference with the native Twig form_row method is that the radio labels are not in a label tag (but there is a label tag f',1,0,0,'',NULL),(18,2,2,2,'Export datas to a csv file with Symfony2','I recently had to export a huge set of data to a csv file. This is easy and fast to do if you don’t care about memory and User Experience. I wanted the memory consumption does not increase with the volume of data.\r\n            I got inspiration from this ',1,0,0,'',NULL),(19,2,2,2,'Install Rest in Symfony2 existing application','As we needed a connection between a Symfony2 web application and an Android application, we had to learn and understand how to make this in a simple and secured way, based on our existing entities.\r\n            We chose WSSE for security access, FOSRestBu',1,0,0,'',NULL),(20,2,2,2,'How to use WSSE in Android app','How to use WSSE in Android app',0,0,0,'',NULL),(21,1,2,1,'Essai','Post',1,48.85661400000001,2.3522219000000177,'Paris, France','2017-09-13 07:17:17'),(22,1,2,1,'Fanampiny','Ajout simple',0,48.84430380000001,2.374377299999992,'Paris Gare de Lyon, ','2017-09-15 03:58:09'),(23,1,2,1,'Faharoa','Blalalbalbalb',0,45.525587,4.874338999999964,'Vienne, France','2017-09-15 03:59:13');
/*!40000 ALTER TABLE `offre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sess_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `sess_data` blob NOT NULL,
  `sess_time` int(10) unsigned NOT NULL,
  `sess_lifetime` mediumint(9) NOT NULL,
  PRIMARY KEY (`sess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('3rcqqgcarv0b1aest1qpk5i8b3','_sf2_attributes|a:4:{s:18:\"_csrf/authenticate\";s:43:\"IFzKlYEh7VZlEr1OVG6YBj1zPNMOLAVl4PUAlM4vD10\";s:18:\"_csrf/registration\";s:43:\"dHQ3LgYXS-5QleVusubtQyPc7ipPFWTZ0-8oOpG9S4Y\";s:28:\"BDC_IsSolved_registercaptcha\";s:4:\"b:1;\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:1:{s:7:\"success\";a:1:{i:0;s:42:\"L\'utilisateur a été créé avec succès.\";}}_sf2_meta|a:3:{s:1:\"u\";i:1505441309;s:1:\"c\";i:1505441307;s:1:\"l\";s:1:\"0\";}',1505441309,1440),('emb9ff3r7kq1rv12hogc6h8to1','_sf2_attributes|a:1:{s:18:\"_csrf/authenticate\";s:43:\"FF7qIDdmIxt88ZPPqdiLOPg5329ugYq9aKlLDOhBD8w\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1505307069;s:1:\"c\";i:1505307068;s:1:\"l\";s:1:\"0\";}',1505307069,1440),('iunbcvb98hr5ppcrt6tr5fr0r5','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:49:\"http://127.0.0.1/ecojob/web/app_dev.php/candidat/\";s:18:\"_csrf/authenticate\";s:43:\"xRZ7BsfTaqcMxLTZphVkAL23051ob5ZRb3qUaIGP-dk\";s:14:\"_security_main\";s:885:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":797:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:757:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":285:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:26:\"adnanmohammed769@yahoo.com\";i:7;s:26:\"adnanmohammed769@yahoo.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1505320759;s:1:\"c\";i:1505320011;s:1:\"l\";s:1:\"0\";}',1505320759,1440),('j9sl05jrmooqo4a28v5r1p5h83','_sf2_attributes|a:1:{s:14:\"_security_main\";s:765:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":677:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:637:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1505441258;s:1:\"c\";i:1505441257;s:1:\"l\";s:1:\"0\";}',1505441258,1440);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8CDE5729A4D60759` (`libelle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Candidat'),(2,'Recruteur');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_offre`
--

DROP TABLE IF EXISTS `user_offre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_offre` (
  `user_id` int(11) NOT NULL,
  `offre_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`offre_id`),
  KEY `IDX_4D447D37A76ED395` (`user_id`),
  KEY `IDX_4D447D374CC8505A` (`offre_id`),
  CONSTRAINT `FK_4D447D374CC8505A` FOREIGN KEY (`offre_id`) REFERENCES `offre` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4D447D37A76ED395` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_offre`
--

LOCK TABLES `user_offre` WRITE;
/*!40000 ALTER TABLE `user_offre` DISABLE KEYS */;
INSERT INTO `user_offre` VALUES (1,3);
/*!40000 ALTER TABLE `user_offre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `curriculum_id` int(11) DEFAULT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D1C63B392FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1D1C63B3A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_1D1C63B3C05FB297` (`confirmation_token`),
  UNIQUE KEY `UNIQ_1D1C63B35AEA4428` (`curriculum_id`),
  KEY `IDX_1D1C63B3C54C8C93` (`type_id`),
  CONSTRAINT `FK_1D1C63B35AEA4428` FOREIGN KEY (`curriculum_id`) REFERENCES `cu_vi` (`id`),
  CONSTRAINT `FK_1D1C63B3C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,1,1,'Adnan','adnan','adnanmohammed769@yahoo.com','adnanmohammed769@yahoo.com',1,'ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w','TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==','2017-09-14 19:58:54',NULL,NULL,'a:2:{i:0;s:13:\"ROLE_CANDIDAT\";i:1;s:10:\"ROLE_ADMIN\";}','2017-07-13 07:49:12'),(2,2,NULL,'Nomena','nomena','fidiarilantov@yahoo.com','fidiarilantov@yahoo.com',1,'jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ','erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==','2017-09-15 03:57:14',NULL,NULL,'a:1:{i:0;s:14:\"ROLE_RECRUTEUR\";}','2017-07-13 10:27:02'),(3,1,NULL,'Administrateur','administrateur','infermedica@gmail.com','infermedica@gmail.com',1,'SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4','+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==','2017-09-15 04:08:27',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}','2017-09-15 04:06:42');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-15  5:08:35
