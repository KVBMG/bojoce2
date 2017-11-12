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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_v_file`
--

LOCK TABLES `c_v_file` WRITE;
/*!40000 ALTER TABLE `c_v_file` DISABLE KEYS */;
INSERT INTO `c_v_file` VALUES (1,'59e60e474db3b.pdf','2017-10-17 16:05:59');
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
-- Table structure for table `competence`
--

DROP TABLE IF EXISTS `competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `informatique` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `autres` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competence`
--

LOCK TABLES `competence` WRITE;
/*!40000 ALTER TABLE `competence` DISABLE KEYS */;
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
  `competence_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6EBAC42F191476EE` (`etat_civil_id`),
  UNIQUE KEY `UNIQ_6EBAC42FD8422A22` (`cv_file_id`),
  UNIQUE KEY `UNIQ_6EBAC42F3DA5256D` (`image_id`),
  UNIQUE KEY `UNIQ_6EBAC42F15761DAB` (`competence_id`),
  CONSTRAINT `FK_6EBAC42F15761DAB` FOREIGN KEY (`competence_id`) REFERENCES `competence` (`id`),
  CONSTRAINT `FK_6EBAC42F191476EE` FOREIGN KEY (`etat_civil_id`) REFERENCES `etat_civil` (`id`),
  CONSTRAINT `FK_6EBAC42F3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  CONSTRAINT `FK_6EBAC42FD8422A22` FOREIGN KEY (`cv_file_id`) REFERENCES `c_v_file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cu_vi`
--

LOCK TABLES `cu_vi` WRITE;
/*!40000 ALTER TABLE `cu_vi` DISABLE KEYS */;
INSERT INTO `cu_vi` VALUES (2,1,NULL,NULL,NULL,NULL),(17,0,2,NULL,NULL,NULL);
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
  `email` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `telephoneFixe` int(11) DEFAULT NULL,
  `adresse` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etat_civil`
--

LOCK TABLES `etat_civil` WRITE;
/*!40000 ALTER TABLE `etat_civil` DISABLE KEYS */;
INSERT INTO `etat_civil` VALUES (2,NULL,NULL,'2017-11-11',NULL,NULL,NULL,NULL,'dd-MM-yyyy',NULL,NULL,NULL);
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
  `dateDebut` datetime NOT NULL,
  `dateFin` datetime NOT NULL,
  `poste` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `localisation` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `zoneProspection` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `detailsMission` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `type_clientele_id` int(11) NOT NULL,
  `remuneration_id` int(11) NOT NULL,
  `secteur_activite_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_590C103D561A4B0` (`cuvi_id`),
  KEY `IDX_590C1038ED7743B` (`type_clientele_id`),
  KEY `IDX_590C1031D7E2A02` (`remuneration_id`),
  KEY `IDX_590C1035233A7FC` (`secteur_activite_id`),
  CONSTRAINT `FK_590C1031D7E2A02` FOREIGN KEY (`remuneration_id`) REFERENCES `type_remuneration` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_590C1035233A7FC` FOREIGN KEY (`secteur_activite_id`) REFERENCES `contrat_categorie` (`id`) ON DELETE CASCADE,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
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
-- Table structure for table `niveau_formation`
--

DROP TABLE IF EXISTS `niveau_formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveau_formation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
INSERT INTO `param_candidat` VALUES (1,1,NULL);
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
INSERT INTO `sessions` VALUES ('1c63cde0kdm6laf4badrpcsbb6','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:109:\"http://work:8082/eco_final/web/app_dev.php/admin/offre/suspendre?key=69e1868d7be44b3770cf8fa0f379bd32186665f1\";s:18:\"_csrf/authenticate\";s:43:\"KeWb7RX-7DdEV0LAotOov7JQb2h5z9j1FcsVF-bSIpU\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509379494;s:1:\"c\";i:1509379298;s:1:\"l\";s:1:\"0\";}',1509379495,1440),('1ul84h7v3m543lem7si0p0f8b2','_sf2_attributes|a:4:{s:18:\"_csrf/authenticate\";s:43:\"MnedbcYcevL4eX-CGoCx_qMqPM-OU5vWjBC2qovun3s\";s:14:\"_security_main\";s:752:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":664:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:624:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":281:{a:8:{i:0;s:88:\"erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==\";i:1;s:43:\"jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ\";i:2;s:6:\"nomena\";i:3;s:6:\"Nomena\";i:4;b:1;i:5;i:2;i:6;s:23:\"fidiarilantov@yahoo.com\";i:7;s:23:\"fidiarilantov@yahoo.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"offres\";i:19;s:12:\"candidatures\";s:1:\"0\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509562343;s:1:\"c\";i:1509562275;s:1:\"l\";s:1:\"0\";}',1509562343,1440),('285qglh8dv6j1cd1obbr2cm7r3','_sf2_attributes|a:0:{}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517715608;s:1:\"c\";i:1517715608;s:1:\"l\";s:1:\"0\";}',1517715611,1440),('2blctt14db81h77ud9q5rud4a7','_sf2_attributes|a:11:{s:18:\"_csrf/authenticate\";s:43:\"_TlwSzknc5s8DG1FrmXVP2P0LeQq2GUeoc1UJ566jdo\";s:14:\"_security_main\";s:885:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":797:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:757:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":285:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:5:\"saved\";i:0;s:8:\"postuled\";i:0;s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"h6YywNB2Ga45xZnvlnBiRLntqERgXo6YOLmwURcRw3Q\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"e4S_arxTBnerlx67RguzwgFB_0a8K_eVV3P1Z6lTYwo\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"j0N02R17s_LQlHFKMPaidymJD9PlgpmimlQL2lPqE9g\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"U4sgGlzVveLcOWf89mTe6eMXXhR0En5zhc8q_bNebaY\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"UoE865ObQgnEhf8b--JJilI7XvAjDeDW2GgbstEM0rA\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"xXy7XaePprYxN6lZSX4ppRaf9n3HtDtKrU6GpoWN8iM\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"ByclL9tjy7K39lgJpC0S3XncOeh_uM6VnP5CNf7A4ZQ\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1510467433;s:1:\"c\";i:1510464364;s:1:\"l\";s:1:\"0\";}',1510467433,1440),('2vj1beuer4ib9m5skiiiuokf23','_sf2_attributes|a:3:{s:18:\"_csrf/authenticate\";s:43:\"J76_Qn6s1dRmhR3sx9Pwv1LD4g9bY0L8xsf8hSD_auA\";s:26:\"_security.main.target_path\";s:68:\"http://work:8082/zala/bojoce/web/app_dev.php/recruteur/offre/show/28\";s:41:\"_csrf/ecojob_candidatbundle_paramcandidat\";s:43:\"KvefUDNdyjodqtlMJ_jU-5Ang9XJirwr7eMj4Ha992Q\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517719147;s:1:\"c\";i:1517718663;s:1:\"l\";s:1:\"0\";}',1517719148,1440),('3j6ffeiog5q84gk5il6hjdejn1','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:51:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/\";s:18:\"_csrf/authenticate\";s:43:\"cxVeyr9VQxbL_OGxNNaKw8NfiVIsR3RerOiePnbOxgg\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543783838;s:1:\"c\";i:1543779845;s:1:\"l\";s:1:\"0\";}',1543783840,1440),('402a5853vom0svh7uq5odda7n4','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:63:\"http://work:8082/eco_final/web/app_dev.php/admin/offre/exprired\";s:18:\"_csrf/authenticate\";s:43:\"SXO2JVyEH8h8pJhDCkgnlDubjkxIb95Kz-5bYLZ0efg\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517511351;s:1:\"c\";i:1517510986;s:1:\"l\";s:1:\"0\";}',1517511353,1440),('59q470o3gb0vcgm1bpr12afkk4','_sf2_attributes|a:6:{s:18:\"_csrf/authenticate\";s:43:\"osfMdRcmKWEZD4c4Kur2z8-_9Nm_iXzwBr40_ubsjjc\";s:18:\"_csrf/registration\";s:43:\"okED4ZLixngRQSzwuOB58V_0GJJGSpVceX1gTZC8bF4\";s:34:\"BDC_CodeCollection_registercaptcha\";s:416:\"O:18:\"BDC_CodeCollection\":1:{s:37:\"\0BDC_CodeCollection\0_ow45y2pibxbhcs32\";a:1:{s:32:\"d88d3fc525ed4e4d7121f4a23cdc7d1f\";O:8:\"BDC_Code\":6:{s:37:\"\0BDC_Code\0_Ol7hsa2e5tt56dggd3heygvyy3\";s:4:\"YSNB\";s:37:\"\0BDC_Code\0_1s5oibui5vw6prv0krvf6ux6iz\";i:1509526105;s:37:\"\0BDC_Code\0_19z8h3rhcd1hqjwz7ifx69v7u1\";N;s:27:\"\0BDC_Code\0_oghxkggvc7oqwbsf\";b:1;s:27:\"\0BDC_Code\0_Ot6x6dc7cv6ocn9v\";N;s:27:\"\0BDC_Code\0_O17uu0pk3wr7rjd4\";i:0;}}}\";s:14:\"_security_main\";s:885:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":797:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:757:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":285:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:5:\"saved\";i:5;s:8:\"postuled\";i:0;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509527417;s:1:\"c\";i:1509526110;s:1:\"l\";s:1:\"0\";}',1509527417,1440),('69624tni61vpcqjhcij88cdm33','_sf2_attributes|a:1:{s:18:\"_csrf/authenticate\";s:43:\"M_sLwlmTo3OSKXTippuVlK2z-QjEmeSD49F47zHGGbg\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509734355;s:1:\"c\";i:1509733949;s:1:\"l\";s:1:\"0\";}',1509734355,1440),('6lfddjhdk3u3bk5050stnsead2','_sf2_attributes|a:6:{s:18:\"_csrf/authenticate\";s:43:\"-YWnOx0jEW6MoKUT3HTa-b75vPK1f3sgwC42KKxBbXk\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:8:\"newUsers\";i:2;s:5:\"users\";s:1:\"4\";s:6:\"offres\";s:2:\"19\";s:7:\"expired\";i:6;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509515079;s:1:\"c\";i:1509515058;s:1:\"l\";s:1:\"0\";}',1509515079,1440),('7sg94ogr9hlp31n1bqbcpru7h4','_sf2_attributes|a:1:{s:18:\"_csrf/authenticate\";s:43:\"T_zpRmglyFT7AVxT2f7fSDzU_mMlfv9zottxoMxgXag\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509629044;s:1:\"c\";i:1509629044;s:1:\"l\";s:1:\"0\";}',1509629045,1440),('83du1rdc1it322fsv6lcsrofn0','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:65:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/offre/exprired\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517715463;s:1:\"c\";i:1517715463;s:1:\"l\";s:1:\"0\";}',1517715464,1440),('8c4h9s04ju5ch6kg7jhqulsdp0','_sf2_attributes|a:2:{s:18:\"_csrf/authenticate\";s:43:\"Et5ASx7Drqwgc3GOpTA5rKwlx4gkKwRtoY-QOzvm9t4\";s:14:\"_security_main\";s:885:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":797:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:757:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":285:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:26:\"adnanmohammed769@yahoo.com\";i:7;s:26:\"adnanmohammed769@yahoo.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509567861;s:1:\"c\";i:1509566197;s:1:\"l\";s:1:\"0\";}',1509567868,1440),('8rg6ih5gm2tp1j1dpap1tt1bi2','_sf2_attributes|a:9:{s:18:\"_csrf/authenticate\";s:43:\"rzfGPeFdawOMUoBsiN7T8InFx2KRmkgG92bdzXzRCU4\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:8:\"newUsers\";i:2;s:5:\"users\";s:1:\"4\";s:6:\"offres\";s:2:\"19\";s:7:\"expired\";i:5;s:8:\"modified\";i:0;s:10:\"notvalided\";i:1;s:8:\"suspendu\";i:3;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509618449;s:1:\"c\";i:1509618441;s:1:\"l\";s:1:\"0\";}',1509618449,1440),('95qdhtfqc76n5u0difjsfhsqe3','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:68:\"http://work:8082/zala/bojoce/web/app_dev.php/recruteur/offre/show/29\";s:18:\"_csrf/authenticate\";s:43:\"aVwXeHD2aTeNQ9tybipc47u63bHN9IZ5VUuyoRCp7FI\";s:14:\"_security_main\";s:752:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":664:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:624:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":281:{a:8:{i:0;s:88:\"erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==\";i:1;s:43:\"jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ\";i:2;s:6:\"nomena\";i:3;s:6:\"Nomena\";i:4;b:1;i:5;i:2;i:6;s:23:\"fidiarilantov@yahoo.com\";i:7;s:23:\"fidiarilantov@yahoo.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543684481;s:1:\"c\";i:1543683914;s:1:\"l\";s:1:\"0\";}',1543684483,1440),('a8gfqput8i9s7bbqrclv0vei75','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:63:\"http://work:8082/eco_final/web/app_dev.php/recruteur/offre/list\";s:18:\"_csrf/authenticate\";s:43:\"4lmVqZpsHTWbtqD4JX8uwAMSQvd8PVyp5QG4oG86mXc\";s:14:\"_security_main\";s:752:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":664:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:624:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":281:{a:8:{i:0;s:88:\"erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==\";i:1;s:43:\"jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ\";i:2;s:6:\"nomena\";i:3;s:6:\"Nomena\";i:4;b:1;i:5;i:2;i:6;s:23:\"fidiarilantov@yahoo.com\";i:7;s:23:\"fidiarilantov@yahoo.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509568057;s:1:\"c\";i:1509566990;s:1:\"l\";s:1:\"0\";}',1509568064,1440),('c0o7c517maivs4d9fpp1d34g74','_sf2_attributes|a:5:{s:18:\"_csrf/authenticate\";s:43:\"fJFg74R0ULBt5RU7TJwYZH2hfvim61K8sW63Cy-KyaI\";s:14:\"_security_main\";s:885:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":797:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:757:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":285:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:5:\"saved\";i:1;s:8:\"postuled\";i:0;s:32:\"_csrf/ecojob_candidatbundle_cuvi\";s:43:\"Ll-XknGxZe0EqXHg-ds3gtRAzDNkiTqyv5QtXrbvzPs\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509179069;s:1:\"c\";i:1509179036;s:1:\"l\";s:1:\"0\";}',1509179069,1440),('f492siovprc5t4eqsqik1o4053','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:67:\"http://work:8082/zala/bojoce/web/app_dev.php/candidat/offre/29/save\";s:18:\"_csrf/authenticate\";s:43:\"NNJ4nC4AK56OozamZmDrn8jM8WwxVubU_qOBUDpmBL8\";s:14:\"_security_main\";s:897:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":809:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:769:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":297:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:32:\"andriatsiferana.nomena@gmail.com\";i:7;s:32:\"andriatsiferana.nomena@gmail.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543684317;s:1:\"c\";i:1543683845;s:1:\"l\";s:1:\"0\";}',1543684318,1440),('g1qknk5p3qb2r5m89g35encke4','_sf2_attributes|a:0:{}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509596055;s:1:\"c\";i:1509595875;s:1:\"l\";s:1:\"0\";}',1509596055,1440),('gbbl656ck8cvteemd2j67oo9b6','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:63:\"http://work:8082/eco_final/web/app_dev.php/admin/users/offre/20\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509629040;s:1:\"c\";i:1509629040;s:1:\"l\";s:1:\"0\";}',1509629040,1440),('go2unkhr86e94rgpf46gjjnf16','_sf2_attributes|a:5:{s:18:\"_csrf/authenticate\";s:43:\"1fpWRRmyD6c0cD1jORIBIlnbGOVK9ypp2YwOJW-_Mvg\";s:14:\"_security_main\";s:885:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":797:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:757:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":285:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:5:\"saved\";i:7;s:8:\"postuled\";i:0;s:13:\"_csrf/profile\";s:43:\"cTydm04D_EMUvbH64t6Y2o-kg2I88U9oP-b7paLuGCo\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509562369;s:1:\"c\";i:1509561274;s:1:\"l\";s:1:\"0\";}',1509562369,1440),('hb05ag6mie3bv1ng20h20q7493','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:64:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/users/offre/3\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509630040;s:1:\"c\";i:1509630040;s:1:\"l\";s:1:\"0\";}',1509630041,1440),('k1nms0a0vp3dm3le9opi8l8dv4','_sf2_attributes|a:6:{s:18:\"_csrf/registration\";s:43:\"qk4Q3bXkNlSlsSrmtKr-uuOTTDUeimyND8d82K9x4N0\";s:34:\"BDC_CodeCollection_registercaptcha\";s:417:\"O:18:\"BDC_CodeCollection\":1:{s:37:\"\0BDC_CodeCollection\0_ow45y2pibxbhcs32\";a:1:{s:32:\"8516af0f9b3b73ef2a73583fc5f725b6\";O:8:\"BDC_Code\":6:{s:37:\"\0BDC_Code\0_Ol7hsa2e5tt56dggd3heygvyy3\";s:5:\"OUSWT\";s:37:\"\0BDC_Code\0_1s5oibui5vw6prv0krvf6ux6iz\";i:1509516975;s:37:\"\0BDC_Code\0_19z8h3rhcd1hqjwz7ifx69v7u1\";N;s:27:\"\0BDC_Code\0_oghxkggvc7oqwbsf\";b:1;s:27:\"\0BDC_Code\0_Ot6x6dc7cv6ocn9v\";N;s:27:\"\0BDC_Code\0_O17uu0pk3wr7rjd4\";i:0;}}}\";s:18:\"_csrf/authenticate\";s:43:\"cMdG55ny1VLr2cq7C4IpAwJd7PjMhpb7E15AFiz2Dck\";s:14:\"_security_main\";s:885:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":797:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:757:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":285:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:5:\"saved\";i:2;s:8:\"postuled\";i:0;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509520285;s:1:\"c\";i:1509518912;s:1:\"l\";s:1:\"0\";}',1509520285,1440),('kdlbn2q9klt2aq17j8hg4o8i87','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:64:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/users/offre/3\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509630051;s:1:\"c\";i:1509630051;s:1:\"l\";s:1:\"0\";}',1509630053,1440),('kv5h082n153nkpivbqh9fddqe4','_sf2_attributes|a:9:{s:18:\"_csrf/authenticate\";s:43:\"-3DowYJdaZ6LjNZf8_4j1SsrRhc9GkPugy0nkd6bc8A\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:8:\"newUsers\";i:0;s:5:\"users\";s:1:\"4\";s:6:\"offres\";s:2:\"19\";s:7:\"expired\";i:0;s:8:\"modified\";i:1;s:10:\"notvalided\";i:1;s:8:\"suspendu\";i:3;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1510279489;s:1:\"c\";i:1510279478;s:1:\"l\";s:1:\"0\";}',1510279489,1440),('l1ogmhaqhsvod4b3pqha2nlhq4','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:66:\"http://work:8082/eco_final/web/app_dev.php/recruteur/offre/show/23\";s:18:\"_csrf/authenticate\";s:43:\"avb1rmGNx0yrgbBBJBcuYY_0OtAn-jnBb1Zx82GfjRE\";s:14:\"_security_main\";s:752:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":664:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:624:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":281:{a:8:{i:0;s:88:\"erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==\";i:1;s:43:\"jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ\";i:2;s:6:\"nomena\";i:3;s:6:\"Nomena\";i:4;b:1;i:5;i:2;i:6;s:23:\"fidiarilantov@yahoo.com\";i:7;s:23:\"fidiarilantov@yahoo.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1517511532;s:1:\"c\";i:1517511203;s:1:\"l\";s:1:\"0\";}',1517511534,1440),('mlibpo2c9ktgkoouc9k5kajdb3','_sf2_attributes|a:5:{s:26:\"_security.main.target_path\";s:58:\"http://127.0.0.1/ecojob/web/app_dev.php/recruteur/banquecv\";s:18:\"_csrf/authenticate\";s:43:\"vFY9WMmLn0lOdLhkGCKn5FYDw_F54_8zR48TY_fFYKY\";s:14:\"_security_main\";s:752:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":664:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:624:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":281:{a:8:{i:0;s:88:\"erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==\";i:1;s:43:\"jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ\";i:2;s:6:\"nomena\";i:3;s:6:\"Nomena\";i:4;b:1;i:5;i:2;i:6;s:23:\"fidiarilantov@yahoo.com\";i:7;s:23:\"fidiarilantov@yahoo.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"offres\";i:19;s:12:\"candidatures\";s:1:\"0\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509275797;s:1:\"c\";i:1509275222;s:1:\"l\";s:1:\"0\";}',1509275797,1440),('o2h0kjtc22q0d1ma70tidr5p26','_sf2_attributes|a:4:{s:18:\"_csrf/authenticate\";s:43:\"Z_XGTlVQYzHHOfYfOHiYXq8rtf9V1kRfHjeAcPNpwYI\";s:14:\"_security_main\";s:885:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":797:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:757:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":285:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:5:\"saved\";i:6;s:8:\"postuled\";i:0;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1510386308;s:1:\"c\";i:1510386158;s:1:\"l\";s:1:\"0\";}',1510386308,1440),('qecu09qfbaskmgd61lotsdthk6','_sf2_attributes|a:6:{s:18:\"_csrf/authenticate\";s:43:\"SpAE9mBfflOQJnMvtbVUljy8RLlabouZ6cTkJkWxnTk\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:8:\"newUsers\";i:2;s:5:\"users\";s:1:\"4\";s:6:\"offres\";s:2:\"19\";s:7:\"expired\";i:6;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509463404;s:1:\"c\";i:1509461949;s:1:\"l\";s:1:\"0\";}',1509463404,1440),('qoervspsaq4iadtip17olqlpd7','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:72:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/users/offre/3/valider\";s:18:\"_csrf/authenticate\";s:43:\"pVB-Spx_yAfsJuLW6qUaZ7OnewUwmbNMl5jN7H7xIvg\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543702207;s:1:\"c\";i:1543702168;s:1:\"l\";s:1:\"0\";}',1543702208,1440),('r47gsdmvq4vi2ah3me21cd19e6','_sf2_attributes|a:9:{s:18:\"_csrf/authenticate\";s:43:\"D8ocEuEnJdIRKv8ouzF9NCDitFEb3pNvVdJaMAPMhYo\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:8:\"newUsers\";i:0;s:5:\"users\";s:1:\"4\";s:6:\"offres\";s:2:\"19\";s:7:\"expired\";i:0;s:8:\"modified\";i:0;s:10:\"notvalided\";i:1;s:8:\"suspendu\";i:3;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1510282358;s:1:\"c\";i:1510281929;s:1:\"l\";s:1:\"0\";}',1510282358,1440),('sou6c8937alck5hu6tp4sbrkr4','_sf2_attributes|a:5:{s:18:\"_csrf/authenticate\";s:43:\"WR5IAvqPuWXOCkSlpX2xF1qLP3FD07OwYh-6P9o_czs\";s:14:\"_security_main\";s:885:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":797:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:757:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":285:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:5:\"saved\";i:6;s:8:\"postuled\";i:0;s:32:\"_csrf/ecojob_candidatbundle_cuvi\";s:43:\"IFlvELjrKJ76CdPWmzUfRz7N8vy1sjjyfHuEgr0MyX8\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1510030073;s:1:\"c\";i:1510029445;s:1:\"l\";s:1:\"0\";}',1510030073,1440),('tpnsuognfu7c15o6lachfjhif6','_sf2_attributes|a:12:{s:26:\"_security.main.target_path\";s:56:\"http://127.0.0.1/ecojob/web/app_dev.php/candidat/cv/fill\";s:18:\"_csrf/authenticate\";s:43:\"STLdonl9ZN9SPxM1QBzEXUoGLXhUU5jcTTyyRksEMXM\";s:14:\"_security_main\";s:885:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":797:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:757:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":285:{a:8:{i:0;s:88:\"TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==\";i:1;s:43:\"ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w\";i:2;s:5:\"adnan\";i:3;s:5:\"Adnan\";i:4;b:1;i:5;i:1;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:3:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:10:\"ROLE_ADMIN\";}i:2;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:5:\"saved\";i:6;s:8:\"postuled\";i:0;s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"5QGA8k99Hzbh3dsHOTeKYKTeFdrhW601fG3BCTtvwi4\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"qhvRMele7lm34i8x11oSIihwBORzkAjJoU9HRxqgaxo\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"HjoYJ-oyXmK36CNMdnCiajdxmjf9w12yoNLZJTt0gqk\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"_o-H3uVKgaMAWY4zJPmJjhA42awZD_QXK7UAPBVLzw4\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"0kWhX817u1LS1ynG9uDf_uEok-P6Y_tYRsH1iYmFUc0\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"Ix2hvmqH2uYhgZJUxYz_TjXzqXX4TY7F2xCgPnYGHws\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"h41l--2VkauoX1rYMjNXVhTAILb3tDfQ8ORL-uDi8aA\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1510423665;s:1:\"c\";i:1510422575;s:1:\"l\";s:1:\"0\";}',1510423665,1440),('u7na9kg1n7q2uhf2acnh7e2c80','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:61:\"http://work:8082/zala/bojoce/web/app_dev.php/admin/users/list\";s:18:\"_csrf/authenticate\";s:43:\"C2RrC_fynCjnHMhlAYxgzfneQshS3912VjcmQcRiMeA\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1543684377;s:1:\"c\";i:1543684182;s:1:\"l\";s:1:\"0\";}',1543684378,1440),('uj4iviippncb5ommo8hd70akj3','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:63:\"http://work:8082/eco_final/web/app_dev.php/admin/users/offre/28\";s:18:\"_csrf/authenticate\";s:43:\"gfwj02yUOMUjtYcndXuWnERCHzv1-Vlz-gJYbofBTPE\";s:14:\"_security_main\";s:768:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":680:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:640:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":295:{a:8:{i:0;s:88:\"+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==\";i:1;s:43:\"SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:3;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1509567703;s:1:\"c\";i:1509567692;s:1:\"l\";s:1:\"0\";}',1509567709,1440);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,1,17,'Adnan','adnan','norazafindrakoto@gmail.com','norazafindrakoto@gmail.com',1,'ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w','TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==','2017-11-12 06:26:04',NULL,NULL,'a:2:{i:0;s:13:\"ROLE_CANDIDAT\";i:1;s:10:\"ROLE_ADMIN\";}','2017-10-28 11:09:13',1),(2,2,NULL,'Nomena','nomena','fidiarilantov@yahoo.com','fidiarilantov@yahoo.com',1,'jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ','erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==','2017-11-10 02:44:48',NULL,NULL,'a:1:{i:0;s:14:\"ROLE_RECRUTEUR\";}','2017-10-28 11:09:17',NULL),(3,1,NULL,'Administrateur','administrateur','infermedica@gmail.com','infermedica@gmail.com',1,'SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4','+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==','2017-11-10 03:45:29',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}','2017-09-15 04:06:42',NULL),(4,1,2,'mohammed','mohammed','adnanmohammed769@yahoo.com','adnanmohammed769@yahoo.com',1,'Uxg4x8Cpe57YgEn55cSjbRWS9xqP0q.6i.WNhYMeQkk','NGAumjnpdG8vwVd8VQB1Kj6ys2CDCwx0IsCA+Nu5kr2NQcfeZfR3mCSk7BSBYuXAF8k50bfJvuV1cR4riP8A6g==','2017-10-12 05:55:21',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}','2017-10-12 04:46:49',NULL);
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

-- Dump completed on 2017-11-12  9:18:52
