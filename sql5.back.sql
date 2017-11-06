-- MySQL dump 10.15  Distrib 10.0.31-MariaDB, for Linux (x86_64)
--
-- Host: sql5-2.aquaray.com    Database: eco_job_fr
-- ------------------------------------------------------
-- Server version	5.6.33-1~dotdeb+7.1-log

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre`
--

LOCK TABLES `offre` WRITE;
/*!40000 ALTER TABLE `offre` DISABLE KEYS */;
INSERT INTO `offre` VALUES (3,1,2,1,'Java','What is Java ?',1,48.85661400000001,2.3522219000000177,'Paris, France',NULL),(4,2,2,1,'How to keep your translations well organized in Symfony2','We are working at the moment on a big internationalized project, and we have consequently many translations in our application. These translations are dispatched in many bundles (7 for now) and are used throughout the application. At the begining of the d',1,48.85661400000001,2.3522219000000177,'Paris, France',NULL),(5,1,2,1,'Efficient Elasticsearch indexing configuration','This post is about elasticsearch which is a great search engine.            The biggest difficulty we meet is that we do not know how to configure it to have relevant search results. Another difficulty is (sorry to say that), the documentation is not ve',1,48.8657844,2.307314099999985,'Champs-Élysées, Pari',NULL),(12,1,2,1,'Configure WSSE on Symfony2 with FOSRestBundle','The client–server communication is further constrained by no client context being stored on the server between requests. Each request from any client contains all of the information necessary to service the request, and any session state is held in the cl',1,45.764043,4.835658999999964,'Lyon, France',NULL),(13,2,2,1,'DateTimePicker field type with Symfony2 and jQuery','In this third post, we’ll explain how to create a great custom field type that uses jQuery DatePicker to handle date input, and then, how to extend it to create a datetime field type. And the best? The datepicker is localized according to the user’s local',1,43.604652,1.4442090000000007,'Toulouse, France',NULL),(14,1,2,1,'Currency Change rates update on Symfony2 using openexchangerates.org API','In this post, we’ll explain how to create and maintain a database with currencies and change rates.            In order to update our changes rates, we will user openexchangerates.org solution. (Exists as free, premium and pro)',1,44.837789,-0.5791799999999512,'Bordeaux, France',NULL),(15,1,2,1,'Create a breadcrumb menu with KnpMenuBundle','In this first post, I’ll explain how to make a breadcrumb menu with the great KnpMenuBundle. The documentation explains the basics and how to make a common menu, but a breadcrumb menu has a particular behaviour.',1,43.296482,5.369779999999992,'Marseille, France',NULL),(16,2,2,1,'Create new log file/channel for a Symfony2 Service (With monolog)','In this article about WSSE and Rest, we describe how to create a new log file/channel with monolog in Symfony2',1,48.57340529999999,7.752111300000024,'Strasbourg, France',NULL),(17,2,2,1,'Create a custom form theme block with Twig','I wanted to use the following block. As you see, in addition to the specific p element, the div and their specific classes, the big difference with the native Twig form_row method is that the radio labels are not in a label tag (but there is a label tag f',1,47.218371,-1.553621000000021,'Nantes, France',NULL),(18,2,2,1,'Export datas to a csv file with Symfony2','I recently had to export a huge set of data to a csv file. This is easy and fast to do if you don’t care about memory and User Experience. I wanted the memory consumption does not increase with the volume of data.            I got inspiration from this',1,50.62924999999999,3.057256000000052,'Lille, France',NULL),(19,2,2,1,'Install Rest in Symfony2 existing application','As we needed a connection between a Symfony2 web application and an Android application, we had to learn and understand how to make this in a simple and secured way, based on our existing entities.            We chose WSSE for security access, FOSRestBu',1,43.7101728,7.261953199999994,'Nice, France',NULL),(20,2,2,1,'How to use WSSE in Android app','How to use WSSE in Android app',1,43.610769,3.8767159999999876,'Montpellier, France',NULL),(21,1,2,1,'Essai','Post',1,48.85661400000001,2.3522219000000177,'Paris, France','2017-09-13 07:17:17'),(22,1,2,1,'Fanampiny','Ajout simple',1,48.84430380000001,2.374377299999992,'Paris Gare de Lyon, ','2017-09-15 03:58:09'),(23,1,2,1,'Faharoa','Blalalbalbalb',1,45.525587,4.874338999999964,'Vienne, France','2017-09-15 03:59:13');
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
INSERT INTO `sessions` VALUES ('0078554ecd13881c055da72b4931cbbc','_sf2_attributes|a:1:{s:18:\"_csrf/authenticate\";s:43:\"KwrLd7kuvKNSSL0405kXu9DeckDLEzy9gW8QKd54-Qw\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1506111510;s:1:\"c\";i:1506111507;s:1:\"l\";s:1:\"0\";}',1506111510,1440),('48e5784ea1c296488b94cd1b483aa3f0','_sf2_attributes|a:2:{s:18:\"_csrf/authenticate\";s:43:\"ACGNRic1NWtZcbQ4TCT_ygAEWPnRaxBjfgO5zWzWits\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1506557525;s:1:\"c\";i:1506557515;s:1:\"l\";s:1:\"0\";}',1506557525,1440),('7c640f7acfc7f32e8927f33574ac89b6','_sf2_attributes|a:1:{s:18:\"_csrf/registration\";s:43:\"wHg20OMYjsWSIUuVW_vB_VAwLqxeU9zBLsg73pLG5hs\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1506202917;s:1:\"c\";i:1506202917;s:1:\"l\";s:1:\"0\";}BDC_SessionSalt|s:32:\"7bed8c7c88cebd2926384655881f962b\";',1506202918,1440),('7fe2aa2576567dda093d437ad0e857d0','_sf2_attributes|a:1:{s:18:\"_csrf/authenticate\";s:43:\"7Z_vX36j2TKoAvI-f9xGrc41ZSzcvp-d-z5pSIti7JE\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1506018927;s:1:\"c\";i:1506018926;s:1:\"l\";s:1:\"0\";}',1506018927,1440),('9f9c416fde64f4ece74c6d67167913b3','_sf2_attributes|a:4:{s:18:\"_csrf/registration\";s:43:\"OKQ4gwEmPCNGZ5ZNXfhq3vFFW-9C7-bPW2TNTXW_UzI\";s:34:\"BDC_CodeCollection_registercaptcha\";s:416:\"O:18:\"BDC_CodeCollection\":1:{s:37:\"\0BDC_CodeCollection\0_ow45y2pibxbhcs32\";a:1:{s:32:\"b97396b390b7683bbd486c2071d1391d\";O:8:\"BDC_Code\":6:{s:37:\"\0BDC_Code\0_Ol7hsa2e5tt56dggd3heygvyy3\";s:4:\"SZXY\";s:37:\"\0BDC_Code\0_1s5oibui5vw6prv0krvf6ux6iz\";i:1506030999;s:37:\"\0BDC_Code\0_19z8h3rhcd1hqjwz7ifx69v7u1\";N;s:27:\"\0BDC_Code\0_oghxkggvc7oqwbsf\";b:1;s:27:\"\0BDC_Code\0_Ot6x6dc7cv6ocn9v\";N;s:27:\"\0BDC_Code\0_O17uu0pk3wr7rjd4\";i:0;}}}\";s:18:\"_csrf/authenticate\";s:43:\"4HWjGZZWQXME5AlVBKC0KKy-Z_7uej2R3LNsq7852Lc\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1506031037;s:1:\"c\";i:1506031029;s:1:\"l\";s:1:\"0\";}BDC_SessionSalt|s:32:\"c325a3fe24f690a316ddafbfec4658b2\";',1506031037,1440),('b03656f2be3f6514992e6962fd9f4f51','_sf2_attributes|a:2:{s:18:\"_csrf/authenticate\";s:43:\"-czrBRommJVIhASar7dHTaJGWj55hpAf-qv06UnV4uI\";s:14:\"_security_main\";s:885:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":797:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:757:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":285:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:26:\"adnanmohammed769@yahoo.com\";i:7;s:26:\"adnanmohammed769@yahoo.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1506181342;s:1:\"c\";i:1506180859;s:1:\"l\";s:1:\"0\";}',1506181342,1440),('be7c04c43d885d7bb66ab4a3f1e52d4d','_sf2_attributes|a:5:{s:26:\"_security.main.target_path\";s:52:\"http://eco-job.fr/valfid/developpement/web/candidat/\";s:18:\"_csrf/authenticate\";s:43:\"mqFLKxdfEBV7ELFL8K5eGubj7UqFqP-PaHyn3zQJaBU\";s:23:\"_security.last_username\";s:3:\"med\";s:18:\"_csrf/registration\";s:43:\"qkcAs-1f1OAybV2QGP5Cp-Mmk_-Q-sphzgmo8RAbeac\";s:34:\"BDC_CodeCollection_registercaptcha\";s:416:\"O:18:\"BDC_CodeCollection\":1:{s:37:\"\0BDC_CodeCollection\0_ow45y2pibxbhcs32\";a:1:{s:32:\"0ff717f053077d57c369c9cb4efe9442\";O:8:\"BDC_Code\":6:{s:37:\"\0BDC_Code\0_Ol7hsa2e5tt56dggd3heygvyy3\";s:4:\"OJUS\";s:37:\"\0BDC_Code\0_1s5oibui5vw6prv0krvf6ux6iz\";i:1506019553;s:37:\"\0BDC_Code\0_19z8h3rhcd1hqjwz7ifx69v7u1\";N;s:27:\"\0BDC_Code\0_oghxkggvc7oqwbsf\";b:1;s:27:\"\0BDC_Code\0_Ot6x6dc7cv6ocn9v\";N;s:27:\"\0BDC_Code\0_O17uu0pk3wr7rjd4\";i:0;}}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1506019554;s:1:\"c\";i:1506018751;s:1:\"l\";s:1:\"0\";}BDC_SessionSalt|s:32:\"b0aeeb23db6b8a3fb013afdbb754383b\";',1506019554,1440),('c37baa399eb3d0fccf38e45796e3ec13','_sf2_attributes|a:0:{}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1506059814;s:1:\"c\";i:1506059814;s:1:\"l\";s:1:\"0\";}',1506059815,1440),('ce057b2f99b78f6d091bc47f9539473a','_sf2_attributes|a:0:{}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1506462665;s:1:\"c\";i:1506462639;s:1:\"l\";s:1:\"0\";}',1506462665,1440),('e78b7fa2b3f74d77ee51e20cbc70df30','_sf2_attributes|a:1:{s:18:\"_csrf/authenticate\";s:43:\"VGeNk5n97FueKW-ODQq23Y22ro14H8tPmG_NVUwiDYg\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1506170508;s:1:\"c\";i:1506170508;s:1:\"l\";s:1:\"0\";}',1506170509,1440),('facefeb644f199c7469a47a815fe3b21','_sf2_attributes|a:1:{s:18:\"_csrf/registration\";s:43:\"UF2L0OGLGHQj1ARI5yKA8aKuGWzGuvt8lj_lZNFfHM8\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1506060096;s:1:\"c\";i:1506060096;s:1:\"l\";s:1:\"0\";}BDC_SessionSalt|s:32:\"cf5d8685a3d68cb459bb286da6d4a14f\";',1506060098,1440);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,1,1,'Adnan','adnan','adnanmohammed769@yahoo.com','adnanmohammed769@yahoo.com',1,'ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w','TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==','2017-09-23 17:34:19',NULL,NULL,'a:2:{i:0;s:13:\"ROLE_CANDIDAT\";i:1;s:10:\"ROLE_ADMIN\";}','2017-07-13 07:49:12'),(2,2,NULL,'Nomena','nomena','fidiarilantov@yahoo.com','fidiarilantov@yahoo.com',1,'jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ','erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==','2017-09-20 08:46:51',NULL,NULL,'a:1:{i:0;s:14:\"ROLE_RECRUTEUR\";}','2017-07-13 10:27:02'),(3,1,NULL,'Administrateur','administrateur','infermedica@gmail.com','infermedica@gmail.com',1,'SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4','+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==','2017-09-28 02:11:55',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}','2017-09-15 04:06:42'),(4,1,NULL,'martine','martine','martineleroy1789@gmail.com','martineleroy1789@gmail.com',1,'4wjYzgYPzG.P9181o8yJPFqWZIl4GUkXwN.zo9VjM10','4EVOGciCiEcxvMiRNdrbH5htqycV+c+JKKpV3ZPLwTl6Yv0N2a4+EnID78Zfiqva3rKi9g+arIEJ7/B3Cd8SEA==','2017-09-16 21:38:55',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}','2017-09-16 21:32:32');
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

-- Dump completed on 2017-09-28  3:18:12
