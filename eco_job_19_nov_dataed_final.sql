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
-- Current Database: `eco_job_fr`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `eco_job_fr` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `eco_job_fr`;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_v_file`
--

LOCK TABLES `c_v_file` WRITE;
/*!40000 ALTER TABLE `c_v_file` DISABLE KEYS */;
INSERT INTO `c_v_file` VALUES (2,'5a080bd4a1158.docx','2017-11-12 09:52:36'),(3,'5a080c4e47a4d.docx','2017-11-12 09:54:38'),(4,'5a080c99aa83e.docx','2017-11-12 09:55:53'),(5,'5a080cb1a125f.docx','2017-11-12 09:56:17'),(6,'5a080cb1d63f9.docx','2017-11-12 09:56:17'),(7,'5a0853ea4d9db.docx','2017-11-12 15:00:10');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidature`
--

LOCK TABLES `candidature` WRITE;
/*!40000 ALTER TABLE `candidature` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie_fonction`
--

DROP TABLE IF EXISTS `categorie_fonction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie_fonction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie_fonction`
--

LOCK TABLES `categorie_fonction` WRITE;
/*!40000 ALTER TABLE `categorie_fonction` DISABLE KEYS */;
INSERT INTO `categorie_fonction` VALUES (1,'COMMERCIAL  VENTE'),(2,'DISTRIBUTION'),(3,'MANAGEMENT COMMERCIAL'),(4,'MARKETING'),(5,'Non défini');
/*!40000 ALTER TABLE `categorie_fonction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competence`
--

DROP TABLE IF EXISTS `competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `informatique` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `autres` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuvi_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_94D4687FD561A4B0` (`cuvi_id`),
  CONSTRAINT `FK_94D4687FD561A4B0` FOREIGN KEY (`cuvi_id`) REFERENCES `cu_vi` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competence`
--

LOCK TABLES `competence` WRITE;
/*!40000 ALTER TABLE `competence` DISABLE KEYS */;
INSERT INTO `competence` VALUES (5,'d','d',3);
/*!40000 ALTER TABLE `competence` ENABLE KEYS */;
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
  `showable` tinyint(1) DEFAULT '1',
  `etat_civil_id` int(11) DEFAULT NULL,
  `cv_file_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6EBAC42F191476EE` (`etat_civil_id`),
  UNIQUE KEY `UNIQ_6EBAC42FD8422A22` (`cv_file_id`),
  UNIQUE KEY `UNIQ_6EBAC42F3DA5256D` (`image_id`),
  CONSTRAINT `FK_6EBAC42F191476EE` FOREIGN KEY (`etat_civil_id`) REFERENCES `etat_civil` (`id`),
  CONSTRAINT `FK_6EBAC42F3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  CONSTRAINT `FK_6EBAC42FD8422A22` FOREIGN KEY (`cv_file_id`) REFERENCES `c_v_file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cu_vi`
--

LOCK TABLES `cu_vi` WRITE;
/*!40000 ALTER TABLE `cu_vi` DISABLE KEYS */;
INSERT INTO `cu_vi` VALUES (3,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cu_vi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cu_vi_contrat_categorie`
--

DROP TABLE IF EXISTS `cu_vi_contrat_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cu_vi_contrat_categorie` (
  `cu_vi_id` int(11) NOT NULL,
  `contrat_categorie_id` int(11) NOT NULL,
  PRIMARY KEY (`cu_vi_id`,`contrat_categorie_id`),
  KEY `IDX_C73FCD02D1728C5B` (`cu_vi_id`),
  KEY `IDX_C73FCD02F72BEEE4` (`contrat_categorie_id`),
  CONSTRAINT `FK_C73FCD02D1728C5B` FOREIGN KEY (`cu_vi_id`) REFERENCES `cu_vi` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C73FCD02F72BEEE4` FOREIGN KEY (`contrat_categorie_id`) REFERENCES `contrat_categorie` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cu_vi_contrat_categorie`
--

LOCK TABLES `cu_vi_contrat_categorie` WRITE;
/*!40000 ALTER TABLE `cu_vi_contrat_categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `cu_vi_contrat_categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etat_civil`
--

DROP TABLE IF EXISTS `etat_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etat_civil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `nationalite` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `telephoneFixe` int(11) DEFAULT NULL,
  `adresse` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etat_civil`
--

LOCK TABLES `etat_civil` WRITE;
/*!40000 ALTER TABLE `etat_civil` DISABLE KEYS */;
/*!40000 ALTER TABLE `etat_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuvi_id` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `poste` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `localisation` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `zoneProspection` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `detailsMission` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `type_clientele_id` int(11) NOT NULL,
  `remuneration_id` int(11) NOT NULL,
  `secteur_activite_id` int(11) NOT NULL,
  `fonction_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_590C103D561A4B0` (`cuvi_id`),
  KEY `IDX_590C1038ED7743B` (`type_clientele_id`),
  KEY `IDX_590C1031D7E2A02` (`remuneration_id`),
  KEY `IDX_590C1035233A7FC` (`secteur_activite_id`),
  KEY `IDX_590C10357889920` (`fonction_id`),
  CONSTRAINT `FK_590C1031D7E2A02` FOREIGN KEY (`remuneration_id`) REFERENCES `type_remuneration` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_590C1035233A7FC` FOREIGN KEY (`secteur_activite_id`) REFERENCES `contrat_categorie` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_590C10357889920` FOREIGN KEY (`fonction_id`) REFERENCES `fonction` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_590C1038ED7743B` FOREIGN KEY (`type_clientele_id`) REFERENCES `type_clientele` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_590C103D561A4B0` FOREIGN KEY (`cuvi_id`) REFERENCES `cu_vi` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `formation`
--

DROP TABLE IF EXISTS `formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuvi_id` int(11) NOT NULL,
  `anneeObtention` int(11) NOT NULL,
  `intituleDiplome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `specialisation` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lieu` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `etablissement` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `formationEtranger` tinyint(1) NOT NULL,
  `niveau_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_404021BFD561A4B0` (`cuvi_id`),
  KEY `IDX_404021BFB3E9C81` (`niveau_id`),
  CONSTRAINT `FK_404021BFB3E9C81` FOREIGN KEY (`niveau_id`) REFERENCES `niveau_formation` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_404021BFD561A4B0` FOREIGN KEY (`cuvi_id`) REFERENCES `cu_vi` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formation`
--

LOCK TABLES `formation` WRITE;
/*!40000 ALTER TABLE `formation` DISABLE KEYS */;
/*!40000 ALTER TABLE `formation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'5a080337f1a2a.png','2017-11-12 09:15:51');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langue`
--

DROP TABLE IF EXISTS `langue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuvi_id` int(11) NOT NULL,
  `langue` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `niveau` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9357758ED561A4B0` (`cuvi_id`),
  CONSTRAINT `FK_9357758ED561A4B0` FOREIGN KEY (`cuvi_id`) REFERENCES `cu_vi` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langue`
--

LOCK TABLES `langue` WRITE;
/*!40000 ALTER TABLE `langue` DISABLE KEYS */;
/*!40000 ALTER TABLE `langue` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_metadata`
--

LOCK TABLES `message_metadata` WRITE;
/*!40000 ALTER TABLE `message_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveau_formation`
--

DROP TABLE IF EXISTS `niveau_formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveau_formation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveau_formation`
--

LOCK TABLES `niveau_formation` WRITE;
/*!40000 ALTER TABLE `niveau_formation` DISABLE KEYS */;
INSERT INTO `niveau_formation` VALUES (2,'Formation non diplômante'),(3,'CAP / BEP'),(4,'BAC PRO'),(5,'BAC'),(6,'BTS'),(7,'DUT'),(8,'Université Licence'),(9,'Université Master'),(10,'Université Doctorat'),(11,'Ecole de Commerce Top 5'),(12,'Ecole de Commerce'),(13,'Ecole d’ingénieurs'),(14,'Ecole d’ingénieurs'),(15,'MBA'),(31,'Autre');
/*!40000 ALTER TABLE `niveau_formation` ENABLE KEYS */;
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
  `valid_at` datetime DEFAULT NULL,
  `suspendu` tinyint(1) NOT NULL DEFAULT '0',
  `expire_at` int(11) DEFAULT '90',
  `modification_valided` tinyint(1) NOT NULL DEFAULT '1',
  `suspendu_at` datetime DEFAULT NULL,
  `categorie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AF86866F1823061F` (`contrat_id`),
  KEY `IDX_AF86866FBB0859F1` (`recruteur_id`),
  KEY `IDX_AF86866FBCF5E72D` (`categorie_id`),
  CONSTRAINT `FK_AF86866F1823061F` FOREIGN KEY (`contrat_id`) REFERENCES `contrat_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AF86866FBB0859F1` FOREIGN KEY (`recruteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AF86866FBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `contrat_categorie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre`
--

LOCK TABLES `offre` WRITE;
/*!40000 ALTER TABLE `offre` DISABLE KEYS */;
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
INSERT INTO `param_candidat` VALUES (1,10,51);
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
INSERT INTO `sessions` VALUES ('02c2ua401q4e2gm3ejiteu6840','_sf2_attributes|a:11:{s:18:\"_csrf/authenticate\";s:43:\"AwBm2JHeEM6jfpP8iMCRhNI2oDf3o0rEqT7WdDD7Mfc\";s:14:\"_security_main\";s:774:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":686:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:646:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":304:{a:8:{i:0;s:88:\"3SkQgCjQBu3ilXkHEv9w0VfwiInJ9vdeX+1ZJEDOGgtyJg2oA5caZ0H5uq0JEFEkXKsPz5U6Fcg8dn3tzbdoCA==\";i:1;s:43:\"R.vmbpFNO0t/58Lu2rizi1yhTQCE0X9BvLHY5TqBFmg\";i:2;s:13:\"test candidat\";i:3;s:13:\"Test candidat\";i:4;b:1;i:5;i:10;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:5:\"saved\";i:0;s:8:\"postuled\";i:0;s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"gzCyLQEUgu8t_ZljzyENLWowNlrEgsbRCsDb6BTCd1s\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"1ej89UvmKF3WxRjwJ_wcuEKhWsHh8Q1YTrEfdXDFjSk\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"7fTk0JOvQGV64a70GFUEs5kQNG-PETz-CPXJ7iK_f-Q\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"c0n5bxHjjelJbWi0jozj7uKNF-1lm6I3unRYmFun82Q\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"G-waby7-qpkEsF048TYXvnjA7eQQfL6qTkSObFpIBmQ\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"79O8OXwDjpPVXVzlCbuSy2FJq1PaDA8gEgj7b3lcPy4\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"4ezQsoHuQxnxzjI1ZDarJ0aWDKVCVIKe3IrC3rkiXl8\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1510674784;s:1:\"c\";i:1510671258;s:1:\"l\";s:1:\"0\";}',1510674785,1440),('285qglh8dv6j1cd1obbr2cm7r3','_sf2_attributes|a:0:{}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517715608;s:1:\"c\";i:1517715608;s:1:\"l\";s:1:\"0\";}',1517715611,1440),('2s84f8u812jmjlspfk6eof52o2','_sf2_attributes|a:4:{s:18:\"_csrf/authenticate\";s:43:\"Nku37_DHy5Nbo5Acq_R5Auysbli6zIpIOOEmpz99RrE\";s:14:\"_security_main\";s:774:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":686:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:646:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":304:{a:8:{i:0;s:88:\"3SkQgCjQBu3ilXkHEv9w0VfwiInJ9vdeX+1ZJEDOGgtyJg2oA5caZ0H5uq0JEFEkXKsPz5U6Fcg8dn3tzbdoCA==\";i:1;s:43:\"R.vmbpFNO0t/58Lu2rizi1yhTQCE0X9BvLHY5TqBFmg\";i:2;s:13:\"test candidat\";i:3;s:13:\"Test candidat\";i:4;b:1;i:5;i:10;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:5:\"saved\";i:0;s:8:\"postuled\";i:0;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1510544358;s:1:\"c\";i:1510544353;s:1:\"l\";s:1:\"0\";}',1510544358,1440),('2vj1beuer4ib9m5skiiiuokf23','_sf2_attributes|a:3:{s:18:\"_csrf/authenticate\";s:43:\"J76_Qn6s1dRmhR3sx9Pwv1LD4g9bY0L8xsf8hSD_auA\";s:26:\"_security.main.target_path\";s:68:\"http://work:8082/zala/bojoce/web/app_dev.php/recruteur/offre/show/28\";s:41:\"_csrf/ecojob_candidatbundle_paramcandidat\";s:43:\"KvefUDNdyjodqtlMJ_jU-5Ang9XJirwr7eMj4Ha992Q\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517719147;s:1:\"c\";i:1517718663;s:1:\"l\";s:1:\"0\";}',1517719148,1440),('3j6ffeiog5q84gk5il6hjdejn1','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:51:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/\";s:18:\"_csrf/authenticate\";s:43:\"cxVeyr9VQxbL_OGxNNaKw8NfiVIsR3RerOiePnbOxgg\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543783838;s:1:\"c\";i:1543779845;s:1:\"l\";s:1:\"0\";}',1543783840,1440),('402a5853vom0svh7uq5odda7n4','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:63:\"http://work:8082/eco_final/web/app_dev.php/admin/offre/exprired\";s:18:\"_csrf/authenticate\";s:43:\"SXO2JVyEH8h8pJhDCkgnlDubjkxIb95Kz-5bYLZ0efg\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517511351;s:1:\"c\";i:1517510986;s:1:\"l\";s:1:\"0\";}',1517511353,1440),('83du1rdc1it322fsv6lcsrofn0','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:65:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/offre/exprired\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517715463;s:1:\"c\";i:1517715463;s:1:\"l\";s:1:\"0\";}',1517715464,1440),('95qdhtfqc76n5u0difjsfhsqe3','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:68:\"http://work:8082/zala/bojoce/web/app_dev.php/recruteur/offre/show/29\";s:18:\"_csrf/authenticate\";s:43:\"aVwXeHD2aTeNQ9tybipc47u63bHN9IZ5VUuyoRCp7FI\";s:14:\"_security_main\";s:752:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":664:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:624:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":281:{a:8:{i:0;s:88:\"erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==\";i:1;s:43:\"jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ\";i:2;s:6:\"nomena\";i:3;s:6:\"Nomena\";i:4;b:1;i:5;i:2;i:6;s:23:\"fidiarilantov@yahoo.com\";i:7;s:23:\"fidiarilantov@yahoo.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543684481;s:1:\"c\";i:1543683914;s:1:\"l\";s:1:\"0\";}',1543684483,1440),('f492siovprc5t4eqsqik1o4053','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:67:\"http://work:8082/zala/bojoce/web/app_dev.php/candidat/offre/29/save\";s:18:\"_csrf/authenticate\";s:43:\"NNJ4nC4AK56OozamZmDrn8jM8WwxVubU_qOBUDpmBL8\";s:14:\"_security_main\";s:897:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":809:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:769:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":297:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:32:\"andriatsiferana.nomena@gmail.com\";i:7;s:32:\"andriatsiferana.nomena@gmail.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543684317;s:1:\"c\";i:1543683845;s:1:\"l\";s:1:\"0\";}',1543684318,1440),('glkm84tbgd2r555724da0ok4c6','_sf2_attributes|a:14:{s:26:\"_security.main.target_path\";s:56:\"http://127.0.0.1/ecojob/web/app_dev.php/candidat/cv/fill\";s:18:\"_csrf/authenticate\";s:43:\"IZxXbvF4o2M8bh_Gjv3qdbCXdaBH2WrGmifwhPIJiWg\";s:14:\"_security_main\";s:774:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":686:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:646:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":304:{a:8:{i:0;s:88:\"z6aLQNh+Uu5XGm/cOBGV+yunCr3q3cG99OAzeQ5O3/RVDZ2bUhUMR8lBaR8drLTsRhBPZexjw9p53a2dArLgJQ==\";i:1;s:43:\"6fzaoC4kucnD8WO0L04B9ybf1llZgL1XA21DbNQdz0k\";i:2;s:13:\"test candidat\";i:3;s:13:\"Test candidat\";i:4;b:1;i:5;i:10;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:5:\"saved\";i:0;s:8:\"postuled\";i:0;s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"1VJr_Y2z79_5t88ZMEqP3WB-ITSZkmFonB3qz4L3GPQ\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"6eKBKHdNU4NmETsOKPt1cF3Q-16FbTVrHWH5E9dTMmk\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"r887F-xPtyTM5R-lolIE9oBS_MENQKBS4BbOOc0hOLc\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"V93bfPKCsIcWbq96l4jJnCzBbdSaYHSpcv9M9s4hReE\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"dx_lztuaYr15MYnDOJvWDjqvCqxqxPoCH1M2zJOjpwg\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"7hq3sZvBkWEuuLI8TBhtr2BiSSQ88xJzaknci4cDJxg\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"D3FT0DljHcaRiJPCCG7dhTWvKjSVfBi0SyJMCdEP1gY\";s:21:\"_csrf/change_password\";s:43:\"NoJy1JahjEWvjglBAkcZWQJdyReSAc7bkJMU2pgJQ_k\";s:13:\"_csrf/profile\";s:43:\"VL2LXgz59LYfFi-73K0Lr46X3R4seYbJjNEhnFThZ5o\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1510516817;s:1:\"c\";i:1510512078;s:1:\"l\";s:1:\"0\";}',1510516817,1440),('l1ogmhaqhsvod4b3pqha2nlhq4','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:66:\"http://work:8082/eco_final/web/app_dev.php/recruteur/offre/show/23\";s:18:\"_csrf/authenticate\";s:43:\"avb1rmGNx0yrgbBBJBcuYY_0OtAn-jnBb1Zx82GfjRE\";s:14:\"_security_main\";s:752:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":664:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:624:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":281:{a:8:{i:0;s:88:\"erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==\";i:1;s:43:\"jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ\";i:2;s:6:\"nomena\";i:3;s:6:\"Nomena\";i:4;b:1;i:5;i:2;i:6;s:23:\"fidiarilantov@yahoo.com\";i:7;s:23:\"fidiarilantov@yahoo.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517511532;s:1:\"c\";i:1517511203;s:1:\"l\";s:1:\"0\";}',1517511534,1440),('pctifgj0lpm661bvlsvihemd50','_sf2_attributes|a:12:{s:26:\"_security.main.target_path\";s:56:\"http://127.0.0.1/ecojob/web/app_dev.php/candidat/cv/fill\";s:18:\"_csrf/authenticate\";s:43:\"LfvofpWhJ06ddghjUxXWHCsDiNhavM_g0K7L-xPqtk0\";s:14:\"_security_main\";s:774:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":686:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:646:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":304:{a:8:{i:0;s:88:\"z6aLQNh+Uu5XGm/cOBGV+yunCr3q3cG99OAzeQ5O3/RVDZ2bUhUMR8lBaR8drLTsRhBPZexjw9p53a2dArLgJQ==\";i:1;s:43:\"6fzaoC4kucnD8WO0L04B9ybf1llZgL1XA21DbNQdz0k\";i:2;s:13:\"test candidat\";i:3;s:13:\"Test candidat\";i:4;b:1;i:5;i:10;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:5:\"saved\";i:0;s:8:\"postuled\";i:0;s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"3wXcJkS5dJv9QUcTJbUGUBJRoBLUQN9hdOlRn1NSe6c\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"1Ul9jdwTxIoeZb7R-l4mbRkQv0AonxWWQ7iIH8cXfsk\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"oQaODaOl7sO4bjPvOTQtxwRzes6a13xe-OeesjJ5boM\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"k3dPsh_xXPwA-YVuq84lgsy7m4LACFw6ma3YNImlvps\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"ZI5cNpyhLGozL4CNFIUfYetXu_mizRocKQt-UxLv2AU\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"UQFfuYGD6EXsOPj8gw1LshtrMngA1wh5rAAmq0dt0-s\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"8DqGrbMHkK5WH3X0iXCWvX3A2c2U9i1KcaFO4c6-iEA\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1510541133;s:1:\"c\";i:1510539785;s:1:\"l\";s:1:\"0\";}',1510541134,1440),('qoervspsaq4iadtip17olqlpd7','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:72:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/users/offre/3/valider\";s:18:\"_csrf/authenticate\";s:43:\"pVB-Spx_yAfsJuLW6qUaZ7OnewUwmbNMl5jN7H7xIvg\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543702207;s:1:\"c\";i:1543702168;s:1:\"l\";s:1:\"0\";}',1543702208,1440),('u7na9kg1n7q2uhf2acnh7e2c80','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:61:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/users/list\";s:18:\"_csrf/authenticate\";s:43:\"C2RrC_fynCjnHMhlAYxgzfneQshS3912VjcmQcRiMeA\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543684377;s:1:\"c\";i:1543684182;s:1:\"l\";s:1:\"0\";}',1543684378,1440);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread_metadata`
--

LOCK TABLES `thread_metadata` WRITE;
/*!40000 ALTER TABLE `thread_metadata` DISABLE KEYS */;
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
-- Table structure for table `type_clientele`
--

DROP TABLE IF EXISTS `type_clientele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_clientele` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_clientele`
--

LOCK TABLES `type_clientele` WRITE;
/*!40000 ALTER TABLE `type_clientele` DISABLE KEYS */;
INSERT INTO `type_clientele` VALUES (1,'B to B'),(2,'B to C'),(3,'B to B + B to C'),(4,'Non défini');
/*!40000 ALTER TABLE `type_clientele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_remuneration`
--

DROP TABLE IF EXISTS `type_remuneration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_remuneration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_remuneration`
--

LOCK TABLES `type_remuneration` WRITE;
/*!40000 ALTER TABLE `type_remuneration` DISABLE KEYS */;
INSERT INTO `type_remuneration` VALUES (1,'≤ 20 K€'),(2,'de 20 à 25 K€'),(3,'de 25 à 30 K€'),(4,'de 30 à 35 K€'),(5,'de 35 à 40 K€'),(6,'de 40 à 50 K€'),(7,'de 50 à 60 K€'),(8,'de 60 à 80 K€'),(9,'de 80 à 100 K€'),(10,'de 100 à 150 K€'),(11,'> 150 K€'),(12,'Selon profil'),(13,'Fixe + Commissi'),(14,'Commissions'),(15,'Indemnité de st');
/*!40000 ALTER TABLE `type_remuneration` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (2,2,NULL,'Nomena','nomena','fidiarilantov@yahoo.com','fidiarilantov@yahoo.com',1,'jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ','erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==','2017-11-02 11:23:12',NULL,NULL,'a:1:{i:0;s:14:\"ROLE_RECRUTEUR\";}','2017-10-28 11:09:17',NULL),(3,1,NULL,'Administrateur','administrateur','infermedica@gmail.com','infermedica@gmail.com',1,'SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4','+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==','2017-11-09 16:26:31',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}','2017-09-15 04:06:42',NULL),(4,1,NULL,'mohammed','mohammed','adnanmohammed769@yahoo.com','adnanmohammed769@yahoo.com',1,'Uxg4x8Cpe57YgEn55cSjbRWS9xqP0q.6i.WNhYMeQkk','NGAumjnpdG8vwVd8VQB1Kj6ys2CDCwx0IsCA+Nu5kr2NQcfeZfR3mCSk7BSBYuXAF8k50bfJvuV1cR4riP8A6g==','2017-10-12 05:55:21',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}','2017-10-12 04:46:49',NULL),(7,1,NULL,'med','med','medeis@hotmail.fr','medeis@hotmail.fr',1,'RpXHOe7OkyWIBdJWZWOiDBFIxIFK1NJ66sbSwErNbyw','G+JG2JcBWYw+fIIZRTf+puEh0sis1g0Wr28MsVj3vdpZ9cFWj4DFSKmvGFpZyWLE8qAHELcU6M3KFUw+o9RSCA==','2017-11-06 23:38:39',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}','2017-11-06 19:34:26',NULL),(10,1,3,'Test candidat','test candidat','norazafindrakoto@gmail.com','norazafindrakoto@gmail.com',1,'R.vmbpFNO0t/58Lu2rizi1yhTQCE0X9BvLHY5TqBFmg','3SkQgCjQBu3ilXkHEv9w0VfwiInJ9vdeX+1ZJEDOGgtyJg2oA5caZ0H5uq0JEFEkXKsPz5U6Fcg8dn3tzbdoCA==','2017-11-14 15:54:18',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}','2017-11-09 16:12:52',NULL),(11,2,NULL,'Test recruteur','test recruteur','ecojobfr@gmail.com','ecojobfr@gmail.com',1,'.bI6x/uEL.bRMON6kyY6StjORUUCogca8zwyK8tpiXg','sy5nQREO/Yo2WPfag4UlMyZUXJZOgjkrnf0mZ4MI4dZ5qKni58QlHNbfbfbtdHKwdhKVWhkeuXs2Jb0TlQVwpg==','2017-11-13 04:27:09',NULL,NULL,'a:1:{i:0;s:14:\"ROLE_RECRUTEUR\";}','2017-11-09 16:18:52',NULL);
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

-- Dump completed on 2017-11-19 21:38:22
