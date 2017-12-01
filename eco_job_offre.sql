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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-31 17:01:33
