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
-- Table structure for table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fonction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_fonction_id` int(11) NOT NULL,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_900D5BD8876BF29` (`categorie_fonction_id`),
  CONSTRAINT `FK_900D5BD8876BF29` FOREIGN KEY (`categorie_fonction_id`) REFERENCES `categorie_fonction` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fonction`
--

LOCK TABLES `fonction` WRITE;
/*!40000 ALTER TABLE `fonction` DISABLE KEYS */;
INSERT INTO `fonction` VALUES (2,1,'Animateur commercial'),(3,1,'Assistant commercial'),(4,1,'Attaché commercial'),(5,1,'Business développeur'),(6,1,'Chargé Administration des vent'),(7,1,'Chargé de clientèle'),(8,1,'Chargé SAV'),(9,1,'Chef de publicité'),(10,1,'Commercial'),(11,1,'Commercial export'),(12,1,'Commercial indépendant'),(13,1,'Commercial itinérant'),(14,1,'Commercial sédentaire'),(15,1,'Conseiller clientèle'),(16,1,'Conseiller en assurance'),(17,1,'Conseiller gestion patrimoine'),(18,1,'Ingénieur après vente'),(19,1,'Ingénieur avant vente'),(20,1,'Ingénieur commercial'),(21,1,'Ingénieur d’affaires'),(22,1,'Ingénieur grands comptes'),(23,1,'Négociateur commercial'),(24,1,'Responsable d\'agence'),(25,1,'Sales manager'),(26,1,'Secrétaire commerciale'),(27,1,'Support commercial'),(28,1,'Technicien conseil'),(29,1,'Technico commercial'),(30,1,'Télévendeur / téléconseiller'),(31,1,'VDI'),(32,1,'Vendeur à domicile'),(33,1,'Vendeur magasin'),(34,1,'Vendeur sédentaire'),(35,1,'Visiteur médical'),(36,1,'VRP'),(37,1,'Autre …'),(38,2,'Animateur commercial'),(39,1,'Agent commercial'),(40,2,'Caissière - Hôtesse de caisse'),(41,2,'Category manager'),(42,2,'Chef de caisse'),(43,2,'Chef de département'),(44,2,'Chef de produit'),(45,2,'Chef de rayon'),(46,2,'Chef de secteur'),(47,2,'Commerçant franchisé'),(48,2,'Commerçant indépendant'),(49,2,'Démonstrateur'),(50,2,'Développeur d\'enseigne'),(51,2,'Directeur adjoint de magasin'),(52,2,'Directeur de magasin'),(53,2,'Directeur de réseau'),(54,2,'Directeur développement'),(55,2,'Hôtesse commerciale'),(56,2,'Merchandiser'),(57,2,'Responsable de département'),(58,2,'Vendeur grande distribution'),(59,2,'Autre …'),(60,3,'Animateur des ventes'),(61,3,'Chef des ventes'),(62,3,'Consultants'),(63,3,'Directeur business développeme'),(64,3,'Directeur commercial'),(65,3,'Directeur d\'agence'),(66,3,'Directeur de réseau'),(67,3,'Directeur des ventes'),(68,3,'Directeur développement'),(69,3,'Directeur export'),(70,3,'Directeur Général Délégué - DG'),(71,3,'Directeur régional'),(72,3,'Responsable ADV'),(73,3,'Responsable Business Développe'),(74,3,'Responsable commercial'),(75,3,'Responsable comptes clés'),(76,3,'Responsable développement'),(77,3,'Responsable export'),(78,3,'Responsable grands comptes'),(79,3,'Responsable promotion des vent'),(80,3,'Responsable SAV'),(81,3,'Superviseur Télévente'),(82,3,'Autre …'),(83,4,'Assistant chef de produit'),(84,4,'Assistant chef de produit'),(85,4,'Assistant marketing'),(86,4,'Chargé d\'études marketing'),(87,4,'Chargé de marketing'),(88,4,'Chef de marché marketing'),(89,4,'Chef de produit marketing'),(90,4,'Community Manager'),(91,4,'Directeur de clientèle'),(92,4,'Directeur marketing'),(93,4,'Marketing manager'),(94,4,'Responsable marketing'),(95,4,'Webmarketeur'),(96,4,'Autre …');
/*!40000 ALTER TABLE `fonction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-20  6:42:31
