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
-- Table structure for table `c_v_file`
--

DROP TABLE IF EXISTS `c_v_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_v_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `about` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_v_file`
--

LOCK TABLES `c_v_file` WRITE;
/*!40000 ALTER TABLE `c_v_file` DISABLE KEYS */;
INSERT INTO `c_v_file` VALUES (1,'59e60e474db3b.pdf','2017-10-17 16:05:59','');
/*!40000 ALTER TABLE `c_v_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidature`
--

DROP TABLE IF EXISTS `candidature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offre_id` int(11) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_candidature` datetime NOT NULL,
  `recruteur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E33BD3B84CC8505A` (`offre_id`),
  KEY `IDX_E33BD3B88D0EB82` (`candidat_id`),
  KEY `IDX_E33BD3B8BB0859F1` (`recruteur_id`),
  CONSTRAINT `FK_E33BD3B84CC8505A` FOREIGN KEY (`offre_id`) REFERENCES `offre` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E33BD3B88D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E33BD3B8BB0859F1` FOREIGN KEY (`recruteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidature`
--

LOCK TABLES `candidature` WRITE;
/*!40000 ALTER TABLE `candidature` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrat_categorie`
--

DROP TABLE IF EXISTS `contrat_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrat_categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C27AA1C48947610D` (`designation`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrat_categorie`
--

LOCK TABLES `contrat_categorie` WRITE;
/*!40000 ALTER TABLE `contrat_categorie` DISABLE KEYS */;
INSERT INTO `contrat_categorie` VALUES (1,'Biologie / chimie / Sciences'),(2,'Commercial / Vente'),(3,'Confection / Artisan'),(4,'Conseiller client / Call center'),(5,'Consultant / Enquêteur'),(6,'Droit / Juriste'),(7,'Enseignement');
/*!40000 ALTER TABLE `contrat_categorie` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cu_vi`
--

LOCK TABLES `cu_vi` WRITE;
/*!40000 ALTER TABLE `cu_vi` DISABLE KEYS */;
INSERT INTO `cu_vi` VALUES (1,'Adnan','Mohammed',0,'Ingénieur','59b913ce5750b.jpg','2017-09-13 13:17:34'),(2,'Adnan','Mohammed',201245850,'Teste 12','59dedaf0a8e81.jpg','2017-10-12 05:01:04');
/*!40000 ALTER TABLE `cu_vi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6BD307FE2904019` (`thread_id`),
  KEY `IDX_B6BD307FF624B39D` (`sender_id`),
  CONSTRAINT `FK_B6BD307FE2904019` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B6BD307FF624B39D` FOREIGN KEY (`sender_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,2,'Bonjour Mr Adnan! Nous avons lu votre cv et ....','2017-10-06 06:13:39'),(2,2,4,'sdfsdf','2017-10-12 05:14:55');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_metadata`
--

DROP TABLE IF EXISTS `message_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4632F005537A1329` (`message_id`),
  KEY `IDX_4632F0059D1C3019` (`participant_id`),
  CONSTRAINT `FK_4632F005537A1329` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4632F0059D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_metadata`
--

LOCK TABLES `message_metadata` WRITE;
/*!40000 ALTER TABLE `message_metadata` DISABLE KEYS */;
INSERT INTO `message_metadata` VALUES (1,1,1,1),(2,1,2,1),(3,2,2,1),(4,2,4,1);
/*!40000 ALTER TABLE `message_metadata` ENABLE KEYS */;
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
  `categorie_id` int(11) NOT NULL,
  `valid_at` datetime DEFAULT NULL,
  `suspendu` tinyint(1) NOT NULL DEFAULT '0',
  `expire_at` int(11) DEFAULT '3',
  `modification_valided` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `IDX_AF86866F1823061F` (`contrat_id`),
  KEY `IDX_AF86866FBB0859F1` (`recruteur_id`),
  KEY `IDX_AF86866FBCF5E72D` (`categorie_id`),
  CONSTRAINT `FK_AF86866F1823061F` FOREIGN KEY (`contrat_id`) REFERENCES `contrat_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AF86866FBB0859F1` FOREIGN KEY (`recruteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AF86866FBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `contrat_categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre`
--

LOCK TABLES `offre` WRITE;
/*!40000 ALTER TABLE `offre` DISABLE KEYS */;
INSERT INTO `offre` VALUES (3,1,2,1,'Java','What is Java ?',1,48.85661400000001,2.3522219000000177,'Paris, France','2017-10-17 15:19:58',2,'2018-12-02 23:50:20',1,1,1),(4,2,2,1,'How to keep your translations well organized in Symfony2[edited]','We are working at the moment on a big internationalized project, and we have consequently many translations in our application. These translations are dispatched in many bundles (7 for now) and are used throughout the application. At the begining of the d',1,48.856614,2.3522219,'Paris, France','2017-10-17 15:19:58',2,'2017-10-22 13:40:29',0,1,1),(5,1,2,1,'Efficient Elasticsearch indexing configuration','This post is about elasticsearch which is a great search engine.            The biggest difficulty we meet is that we do not know how to configure it to have relevant search results. Another difficulty is (sorry to say that), the documentation is not ve',1,48.8657844,2.307314099999985,'Champs-Élysées, Pari','2017-10-17 15:19:58',2,NULL,0,NULL,1),(12,1,2,1,'Configure WSSE on Symfony2 with FOSRestBundle','The client–server communication is further constrained by no client context being stored on the server between requests. Each request from any client contains all of the information necessary to service the request, and any session state is held in the cl',1,45.764043,4.835658999999964,'Lyon, France','2017-10-17 15:19:58',2,NULL,0,1,1),(13,2,2,1,'DateTimePicker field type with Symfony2 and jQuery','In this third post, we’ll explain how to create a great custom field type that uses jQuery DatePicker to handle date input, and then, how to extend it to create a datetime field type. And the best? The datepicker is localized according to the user’s local',1,43.296482,5.369779999999992,'Marseille, France','2017-10-17 15:19:58',2,NULL,0,1,1),(14,1,2,1,'Currency Change rates update on Symfony2 using openexchangerates.org API','In this post, we’ll explain how to create and maintain a database with currencies and change rates.            In order to update our changes rates, we will user openexchangerates.org solution. (Exists as free, premium and pro)',1,44.837789,-0.5791799999999512,'Bordeaux, France','2017-10-17 15:19:58',2,NULL,0,1,1),(15,1,2,1,'Create a breadcrumb menu with KnpMenuBundle','In this first post, I’ll explain how to make a breadcrumb menu with the great KnpMenuBundle. The documentation explains the basics and how to make a common menu, but a breadcrumb menu has a particular behaviour.',1,43.604652,1.4442090000000007,'Toulouse, France','2017-10-17 15:19:58',2,NULL,0,1,1),(16,2,2,1,'Create new log file/channel for a Symfony2 Service (With monolog)','In this article about WSSE and Rest, we describe how to create a new log file/channel with monolog in Symfony2',1,47.218371,-1.553621000000021,'Nantes, France','2017-10-17 15:19:58',2,NULL,0,1,1),(17,2,2,1,'Create a custom form theme block with Twig','I wanted to use the following block. As you see, in addition to the specific p element, the div and their specific classes, the big difference with the native Twig form_row method is that the radio labels are not in a label tag (but there is a label tag f',1,48.57340529999999,7.752111300000024,'Strasbourg, France','2017-10-17 15:19:58',2,NULL,0,1,1),(18,2,2,1,'Export datas to a csv file with Symfony2','I recently had to export a huge set of data to a csv file. This is easy and fast to do if you don’t care about memory and User Experience. I wanted the memory consumption does not increase with the volume of data.            I got inspiration from this',1,43.7101728,7.261953199999994,'Nice, France','2017-10-17 15:19:58',2,NULL,0,1,1),(19,2,2,1,'Install Rest in Symfony2 existing application','As we needed a connection between a Symfony2 web application and an Android application, we had to learn and understand how to make this in a simple and secured way, based on our existing entities.            We chose WSSE for security access, FOSRestBu',1,50.62924999999999,3.057256000000052,'Lille, France','2017-10-17 15:19:58',2,NULL,0,1,1),(20,2,2,1,'How to use WSSE in Android app','How to use WSSE in Android app',1,43.610769,3.8767159999999876,'Montpellier, France','2017-10-17 15:19:58',2,'2017-09-30 17:35:57',0,1,1),(22,1,2,1,'Fanampiny','Ajout simple',1,48.84430380000001,2.374377299999992,'Paris Gare de Lyon, ','2017-10-17 15:19:58',2,NULL,0,NULL,1),(28,1,2,1,'U','U',1,98798798798798,98798798798798,'LKJLKJLKJLKJ','2017-10-17 15:19:58',1,'2017-09-30 18:18:38',1,1,1),(29,1,2,1,'Offre lyon','essai',1,45.764043,4.835658999999964,'Lyon, France','2017-10-17 15:19:58',1,'2017-10-09 03:00:18',0,1,1),(30,1,2,1,'Essai','Alerte mail',1,44.562918,-0.8655079999999771,'Paris, Salles, Franc','2017-10-18 03:25:30',1,'2017-10-18 03:26:50',0,1,1),(31,1,2,1,'Essai','sdfsfsdfsdfsd mail',1,43.4941437,5.893280900000036,'Paris, Seillons-Sour','2017-10-18 03:33:00',2,'2017-10-18 03:48:38',0,1,1),(32,1,2,1,'Test ajout','tttt',0,45.764043,4.835658999999964,'Lyon, France','2017-10-25 17:55:10',1,NULL,0,1,1),(33,1,2,1,'Délai','test',1,45.764043,4.835658999999964,'Lyon, France','2017-10-25 22:00:06',1,'2017-10-25 22:01:07',0,2,1);
/*!40000 ALTER TABLE `offre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `param_candidat`
--

DROP TABLE IF EXISTS `param_candidat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_candidat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidat_id` int(11) NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_37FFF5B58D0EB82` (`candidat_id`),
  KEY `IDX_37FFF5B5BCF5E72D` (`categorie_id`),
  CONSTRAINT `FK_37FFF5B58D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_37FFF5B5BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `contrat_categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param_candidat`
--

LOCK TABLES `param_candidat` WRITE;
/*!40000 ALTER TABLE `param_candidat` DISABLE KEYS */;
INSERT INTO `param_candidat` VALUES (1,1,2);
/*!40000 ALTER TABLE `param_candidat` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('03hjp65to1fg3opjc8e688git3','_sf2_attributes|a:6:{s:18:\"_csrf/authenticate\";s:43:\"4VCAKTBx5nmvzysgUoKcyHuWqO7aklrCUtfZJ9dwDVM\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:8:\"newUsers\";i:0;s:5:\"users\";s:1:\"4\";s:6:\"offres\";s:2:\"19\";s:7:\"expired\";i:5;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1508963014;s:1:\"c\";i:1508963012;s:1:\"l\";s:1:\"0\";}',1508963014,1440),('1c63cde0kdm6laf4badrpcsbb6','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:109:\"http://work:8082/eco_final/web/app_dev.php/admin/offre/suspendre?key=69e1868d7be44b3770cf8fa0f379bd32186665f1\";s:18:\"_csrf/authenticate\";s:43:\"KeWb7RX-7DdEV0LAotOov7JQb2h5z9j1FcsVF-bSIpU\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509379494;s:1:\"c\";i:1509379298;s:1:\"l\";s:1:\"0\";}',1509379495,1440),('285qglh8dv6j1cd1obbr2cm7r3','_sf2_attributes|a:0:{}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517715608;s:1:\"c\";i:1517715608;s:1:\"l\";s:1:\"0\";}',1517715611,1440),('2vj1beuer4ib9m5skiiiuokf23','_sf2_attributes|a:3:{s:18:\"_csrf/authenticate\";s:43:\"J76_Qn6s1dRmhR3sx9Pwv1LD4g9bY0L8xsf8hSD_auA\";s:26:\"_security.main.target_path\";s:68:\"http://work:8082/zala/bojoce/web/app_dev.php/recruteur/offre/show/28\";s:41:\"_csrf/ecojob_candidatbundle_paramcandidat\";s:43:\"KvefUDNdyjodqtlMJ_jU-5Ang9XJirwr7eMj4Ha992Q\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517719147;s:1:\"c\";i:1517718663;s:1:\"l\";s:1:\"0\";}',1517719148,1440),('3j6ffeiog5q84gk5il6hjdejn1','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:51:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/\";s:18:\"_csrf/authenticate\";s:43:\"cxVeyr9VQxbL_OGxNNaKw8NfiVIsR3RerOiePnbOxgg\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543783838;s:1:\"c\";i:1543779845;s:1:\"l\";s:1:\"0\";}',1543783840,1440),('402a5853vom0svh7uq5odda7n4','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:63:\"http://work:8082/eco_final/web/app_dev.php/admin/offre/exprired\";s:18:\"_csrf/authenticate\";s:43:\"SXO2JVyEH8h8pJhDCkgnlDubjkxIb95Kz-5bYLZ0efg\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517511351;s:1:\"c\";i:1517510986;s:1:\"l\";s:1:\"0\";}',1517511353,1440),('7sg94ogr9hlp31n1bqbcpru7h4','_sf2_attributes|a:1:{s:18:\"_csrf/authenticate\";s:43:\"T_zpRmglyFT7AVxT2f7fSDzU_mMlfv9zottxoMxgXag\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509629044;s:1:\"c\";i:1509629044;s:1:\"l\";s:1:\"0\";}',1509629045,1440),('83du1rdc1it322fsv6lcsrofn0','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:65:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/offre/exprired\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517715463;s:1:\"c\";i:1517715463;s:1:\"l\";s:1:\"0\";}',1517715464,1440),('8c4h9s04ju5ch6kg7jhqulsdp0','_sf2_attributes|a:2:{s:18:\"_csrf/authenticate\";s:43:\"Et5ASx7Drqwgc3GOpTA5rKwlx4gkKwRtoY-QOzvm9t4\";s:14:\"_security_main\";s:885:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":797:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:757:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":285:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:26:\"adnanmohammed769@yahoo.com\";i:7;s:26:\"adnanmohammed769@yahoo.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509567861;s:1:\"c\";i:1509566197;s:1:\"l\";s:1:\"0\";}',1509567868,1440),('95qdhtfqc76n5u0difjsfhsqe3','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:68:\"http://work:8082/zala/bojoce/web/app_dev.php/recruteur/offre/show/29\";s:18:\"_csrf/authenticate\";s:43:\"aVwXeHD2aTeNQ9tybipc47u63bHN9IZ5VUuyoRCp7FI\";s:14:\"_security_main\";s:752:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":664:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:624:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":281:{a:8:{i:0;s:88:\"erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==\";i:1;s:43:\"jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ\";i:2;s:6:\"nomena\";i:3;s:6:\"Nomena\";i:4;b:1;i:5;i:2;i:6;s:23:\"fidiarilantov@yahoo.com\";i:7;s:23:\"fidiarilantov@yahoo.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543684481;s:1:\"c\";i:1543683914;s:1:\"l\";s:1:\"0\";}',1543684483,1440),('a8gfqput8i9s7bbqrclv0vei75','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:63:\"http://work:8082/eco_final/web/app_dev.php/recruteur/offre/list\";s:18:\"_csrf/authenticate\";s:43:\"4lmVqZpsHTWbtqD4JX8uwAMSQvd8PVyp5QG4oG86mXc\";s:14:\"_security_main\";s:752:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":664:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:624:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":281:{a:8:{i:0;s:88:\"erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==\";i:1;s:43:\"jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ\";i:2;s:6:\"nomena\";i:3;s:6:\"Nomena\";i:4;b:1;i:5;i:2;i:6;s:23:\"fidiarilantov@yahoo.com\";i:7;s:23:\"fidiarilantov@yahoo.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509568057;s:1:\"c\";i:1509566990;s:1:\"l\";s:1:\"0\";}',1509568064,1440),('f492siovprc5t4eqsqik1o4053','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:67:\"http://work:8082/zala/bojoce/web/app_dev.php/candidat/offre/29/save\";s:18:\"_csrf/authenticate\";s:43:\"NNJ4nC4AK56OozamZmDrn8jM8WwxVubU_qOBUDpmBL8\";s:14:\"_security_main\";s:897:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":809:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:769:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":297:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:32:\"andriatsiferana.nomena@gmail.com\";i:7;s:32:\"andriatsiferana.nomena@gmail.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543684317;s:1:\"c\";i:1543683845;s:1:\"l\";s:1:\"0\";}',1543684318,1440),('gbbl656ck8cvteemd2j67oo9b6','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:63:\"http://work:8082/eco_final/web/app_dev.php/admin/users/offre/20\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509629040;s:1:\"c\";i:1509629040;s:1:\"l\";s:1:\"0\";}',1509629040,1440),('hb05ag6mie3bv1ng20h20q7493','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:64:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/users/offre/3\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509630040;s:1:\"c\";i:1509630040;s:1:\"l\";s:1:\"0\";}',1509630041,1440),('jeab13p1hk06q3jht47ej0tg84','_sf2_attributes|a:6:{s:18:\"_csrf/authenticate\";s:43:\"ydxXzOiJgSYjL6kZj5oYSu6GcbWMNVyE1Tues19gYrA\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:8:\"newUsers\";i:2;s:5:\"users\";s:1:\"4\";s:6:\"offres\";s:2:\"19\";s:7:\"expired\";i:6;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509178269;s:1:\"c\";i:1509177304;s:1:\"l\";s:1:\"0\";}',1509178269,1440),('kdlbn2q9klt2aq17j8hg4o8i87','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:64:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/users/offre/3\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509630051;s:1:\"c\";i:1509630051;s:1:\"l\";s:1:\"0\";}',1509630053,1440),('l1ogmhaqhsvod4b3pqha2nlhq4','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:66:\"http://work:8082/eco_final/web/app_dev.php/recruteur/offre/show/23\";s:18:\"_csrf/authenticate\";s:43:\"avb1rmGNx0yrgbBBJBcuYY_0OtAn-jnBb1Zx82GfjRE\";s:14:\"_security_main\";s:752:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":664:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:624:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":281:{a:8:{i:0;s:88:\"erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==\";i:1;s:43:\"jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ\";i:2;s:6:\"nomena\";i:3;s:6:\"Nomena\";i:4;b:1;i:5;i:2;i:6;s:23:\"fidiarilantov@yahoo.com\";i:7;s:23:\"fidiarilantov@yahoo.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517511532;s:1:\"c\";i:1517511203;s:1:\"l\";s:1:\"0\";}',1517511534,1440),('qoervspsaq4iadtip17olqlpd7','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:72:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/users/offre/3/valider\";s:18:\"_csrf/authenticate\";s:43:\"pVB-Spx_yAfsJuLW6qUaZ7OnewUwmbNMl5jN7H7xIvg\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543702207;s:1:\"c\";i:1543702168;s:1:\"l\";s:1:\"0\";}',1543702208,1440),('u7na9kg1n7q2uhf2acnh7e2c80','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:61:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/users/list\";s:18:\"_csrf/authenticate\";s:43:\"C2RrC_fynCjnHMhlAYxgzfneQshS3912VjcmQcRiMeA\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543684377;s:1:\"c\";i:1543684182;s:1:\"l\";s:1:\"0\";}',1543684378,1440),('uj4iviippncb5ommo8hd70akj3','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:63:\"http://work:8082/eco_final/web/app_dev.php/admin/users/offre/28\";s:18:\"_csrf/authenticate\";s:43:\"gfwj02yUOMUjtYcndXuWnERCHzv1-Vlz-gJYbofBTPE\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509567703;s:1:\"c\";i:1509567692;s:1:\"l\";s:1:\"0\";}',1509567709,1440);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_message`
--

DROP TABLE IF EXISTS `sub_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `isRead` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C9656C8B537A1329` (`message_id`),
  KEY `IDX_C9656C8BF624B39D` (`sender_id`),
  KEY `IDX_C9656C8BCD53EDB6` (`receiver_id`),
  CONSTRAINT `FK_C9656C8B537A1329` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C9656C8BCD53EDB6` FOREIGN KEY (`receiver_id`) REFERENCES `utilisateur` (`id`),
  CONSTRAINT `FK_C9656C8BF624B39D` FOREIGN KEY (`sender_id`) REFERENCES `utilisateur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_message`
--

LOCK TABLES `sub_message` WRITE;
/*!40000 ALTER TABLE `sub_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `is_spam` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_31204C83B03A8386` (`created_by_id`),
  CONSTRAINT `FK_31204C83B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
INSERT INTO `thread` VALUES (1,2,'Dev java senior','2017-10-06 06:13:39',0),(2,4,'sdf','2017-10-12 05:14:55',0);
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread_metadata`
--

DROP TABLE IF EXISTS `thread_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thread_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `last_participant_message_date` datetime DEFAULT NULL,
  `last_message_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_40A577C8E2904019` (`thread_id`),
  KEY `IDX_40A577C89D1C3019` (`participant_id`),
  CONSTRAINT `FK_40A577C89D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_40A577C8E2904019` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread_metadata`
--

LOCK TABLES `thread_metadata` WRITE;
/*!40000 ALTER TABLE `thread_metadata` DISABLE KEYS */;
INSERT INTO `thread_metadata` VALUES (1,1,1,0,NULL,'2017-10-06 06:13:39'),(2,1,2,0,'2017-10-06 06:13:39',NULL),(3,2,2,0,NULL,'2017-10-12 05:14:55'),(4,2,4,0,'2017-10-12 05:14:55',NULL);
/*!40000 ALTER TABLE `thread_metadata` ENABLE KEYS */;
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
INSERT INTO `user_offre` VALUES (1,3),(1,28),(1,29);
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
  `cv_file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D1C63B392FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1D1C63B3A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_1D1C63B3C05FB297` (`confirmation_token`),
  UNIQUE KEY `UNIQ_1D1C63B35AEA4428` (`curriculum_id`),
  UNIQUE KEY `UNIQ_1D1C63B3D8422A22` (`cv_file_id`),
  KEY `IDX_1D1C63B3C54C8C93` (`type_id`),
  CONSTRAINT `FK_1D1C63B35AEA4428` FOREIGN KEY (`curriculum_id`) REFERENCES `cu_vi` (`id`),
  CONSTRAINT `FK_1D1C63B3C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `FK_1D1C63B3D8422A22` FOREIGN KEY (`cv_file_id`) REFERENCES `c_v_file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,1,1,'Adnan','adnan','norazafindrakoto@gmail.com','norazafindrakoto@gmail.com',1,'ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w','TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==','2017-10-28 09:37:37',NULL,NULL,'a:2:{i:0;s:13:\"ROLE_CANDIDAT\";i:1;s:10:\"ROLE_ADMIN\";}','2017-10-28 11:09:13',1),(2,2,NULL,'Nomena','nomena','fidiarilantov@yahoo.com','fidiarilantov@yahoo.com',1,'jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ','erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==','2017-10-28 09:40:37',NULL,NULL,'a:1:{i:0;s:14:\"ROLE_RECRUTEUR\";}','2017-10-28 11:09:17',NULL),(3,1,NULL,'Administrateur','administrateur','infermedica@gmail.com','infermedica@gmail.com',1,'SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4','+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==','2017-10-28 09:55:04',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}','2017-09-15 04:06:42',NULL),(4,1,2,'mohammed','mohammed','adnanmohammed769@yahoo.com','adnanmohammed769@yahoo.com',1,'Uxg4x8Cpe57YgEn55cSjbRWS9xqP0q.6i.WNhYMeQkk','NGAumjnpdG8vwVd8VQB1Kj6ys2CDCwx0IsCA+Nu5kr2NQcfeZfR3mCSk7BSBYuXAF8k50bfJvuV1cR4riP8A6g==','2017-10-12 05:55:21',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}','2017-10-12 04:46:49',NULL);
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

-- Dump completed on 2017-10-28 11:11:19
