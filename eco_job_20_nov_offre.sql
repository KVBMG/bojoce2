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
  `experience_id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duree` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `localisation` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `categorie_id` int(11) NOT NULL,
  `valid_at` datetime DEFAULT NULL,
  `suspendu` tinyint(1) NOT NULL DEFAULT '0',
  `expire_at` int(11) DEFAULT '90',
  `modification_valided` tinyint(1) NOT NULL DEFAULT '1',
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `prerequis` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `descSociete` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `suspendu_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AF86866F1823061F` (`contrat_id`),
  KEY `IDX_AF86866FBB0859F1` (`recruteur_id`),
  KEY `IDX_AF86866FBCF5E72D` (`categorie_id`),
  KEY `IDX_AF86866F46E90E27` (`experience_id`),
  CONSTRAINT `FK_AF86866F1823061F` FOREIGN KEY (`contrat_id`) REFERENCES `contrat_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AF86866F46E90E27` FOREIGN KEY (`experience_id`) REFERENCES `experienceOffre` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AF86866FBB0859F1` FOREIGN KEY (`recruteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AF86866FBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `contrat_categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre`
--

LOCK TABLES `offre` WRITE;
/*!40000 ALTER TABLE `offre` DISABLE KEYS */;
INSERT INTO `offre` VALUES (34,6,2,1,'Développeur fullstack','6 mois',0,45.764043,4.835658999999964,'Lyon, France','2017-11-21 05:00:22',40,NULL,0,7,1,NULL,'développeur back-end et front-end','Angular 2 & PHP','RH Manao','SSII Malagasy',NULL),(35,7,2,1,'Ingénieur en aviation','2 ans',0,43.7101728,7.261953199999994,'Nice, France','2017-11-21 05:03:31',8,NULL,0,30,1,NULL,'Responsable d\'une tour','BAC+5','Air madagascar','aviation',NULL),(36,9,2,4,'Infirmier','5 mois',0,48.85661400000001,2.3522219000000177,'Paris, France','2017-11-21 05:05:27',47,NULL,0,2,1,NULL,'Infirmier(e) requis(e)','bac+3','HJRA','Hopital',NULL),(37,9,2,3,'Ingénieur en mine','5 ans',0,43.296482,5.369779999999992,'Marseille, France','2017-11-21 05:07:45',39,NULL,0,2,1,NULL,'Ambatovy','bac+5','Ambatovy','Secteur minier',NULL),(38,10,2,1,'Stagiaire en développement informatique','6 mois',0,43.7101728,7.261953199999994,'Nice, France','2017-11-21 05:09:21',40,NULL,0,30,1,NULL,'Chargez de développement','BAC+3','GROUPE STAR','Boission alimentaire',NULL),(39,7,2,2,'Responsable RH','3 mois',0,43.604652,1.4442090000000007,'Toulouse, France','2017-11-21 05:11:28',37,NULL,0,2,1,NULL,'Chargé d\'entretien','BAC +2','ELiba','Fournisseur de produits et services informatiques',NULL),(40,8,2,2,'TECH 2018 - Technicien d\'Inspection - France H/F','7 mois',0,48.2020471,-2.93264350000004,'Bretagne, France','2017-11-21 05:13:42',12,NULL,0,2,1,NULL,'Technicien supérieur','BAC +3','QHSE','Services informatiques',NULL),(41,9,2,2,'Responsable Exploitation H/F','1 an',0,48.84991979999999,2.637041100000033,'Île-de-France, Franc','2017-11-21 05:15:19',32,NULL,0,2,1,NULL,'Test','bac +3','QHSE','Test',NULL),(42,7,2,2,'Conducteur de matériel de collecte polyvalent équipier de collecte','8 mois',0,47.7632836,-0.3299686999999949,'Pays de la Loire, Fr','2017-11-21 05:16:34',33,NULL,0,2,1,NULL,'Test','bac+3','QHSE','TEST',NULL),(43,8,2,2,'Chef de Projets Éoliens H/F','8 mois',0,47.081012,2.398781999999983,'Bourges, France','2017-11-21 05:17:38',58,NULL,0,2,1,NULL,'Test','Test','QHSE','Test',NULL),(44,6,2,1,'Technicien SAV Hydraulique H/F','1 an',0,48.828508,2.2188068000000385,'Hauts-de-Seine, Fran','2017-11-21 05:18:28',19,NULL,0,2,1,NULL,'TestT','BAC +5','QHSE','Test',NULL);
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

-- Dump completed on 2017-11-21  7:18:53
