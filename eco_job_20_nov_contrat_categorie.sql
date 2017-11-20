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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrat_categorie`
--

LOCK TABLES `contrat_categorie` WRITE;
/*!40000 ALTER TABLE `contrat_categorie` DISABLE KEYS */;
INSERT INTO `contrat_categorie` VALUES (8,'Aéronautique'),(9,'Agriculture'),(10,'Agroalimentaire'),(11,'Amélioration de l’Habitat'),(12,'Artisanat'),(13,'Assurances'),(14,'Automobile'),(58,'Autre …'),(15,'Banque - Assurances'),(16,'Banque / Finance'),(17,'Bâtiment Travaux Publics'),(18,'Bien être'),(19,'Commerce'),(20,'Commerce de gros'),(21,'Communication'),(22,'Conseil Ingénierie'),(23,'Développement Durable'),(24,'Distribution'),(25,'Distribution Spécialisée'),(26,'E-commerce'),(27,'Edition'),(28,'Education'),(29,'Electroménager'),(30,'Electronique'),(31,'Energie'),(32,'Energies Renouvelables'),(33,'Environnement'),(34,'Equipement de Bureaux'),(35,'Evénementiel'),(36,'Hôtellerie Restauration'),(37,'Immobilier'),(38,'Imprimerie'),(39,'Industrie'),(40,'Informatique'),(41,'Internet'),(42,'Loisir'),(43,'Luxe'),(44,'Non défini'),(45,'Outillage Professionnel'),(46,'Retail'),(47,'Santé'),(48,'Sécurité'),(49,'Services aux Entreprises'),(50,'Services aux Particuliers'),(51,'Services Publics'),(52,'Télécom'),(53,'TERTIAIRE ET SERVICES'),(54,'Tourisme'),(55,'Transports Logistique'),(56,'Travail Temporaire'),(57,'Viticulture');
/*!40000 ALTER TABLE `contrat_categorie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-20  6:41:23
