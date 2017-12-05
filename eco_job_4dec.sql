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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_v_file`
--

LOCK TABLES `c_v_file` WRITE;
/*!40000 ALTER TABLE `c_v_file` DISABLE KEYS */;
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
  `recruteur_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_candidature` datetime NOT NULL,
  `cv_file_id` int(11) DEFAULT NULL,
  `joinMyCv` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E33BD3B8D8422A22` (`cv_file_id`),
  KEY `IDX_E33BD3B84CC8505A` (`offre_id`),
  KEY `IDX_E33BD3B88D0EB82` (`candidat_id`),
  KEY `IDX_E33BD3B8BB0859F1` (`recruteur_id`),
  CONSTRAINT `FK_E33BD3B84CC8505A` FOREIGN KEY (`offre_id`) REFERENCES `offre` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E33BD3B88D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E33BD3B8BB0859F1` FOREIGN KEY (`recruteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E33BD3B8D8422A22` FOREIGN KEY (`cv_file_id`) REFERENCES `c_v_file` (`id`)
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
  `cuvi_id` int(11) NOT NULL,
  `informatique` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `autres` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_94D4687FD561A4B0` (`cuvi_id`),
  CONSTRAINT `FK_94D4687FD561A4B0` FOREIGN KEY (`cuvi_id`) REFERENCES `cu_vi` (`id`) ON DELETE CASCADE
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
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C18AF237A4D60759` (`libelle`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrat_type`
--

LOCK TABLES `contrat_type` WRITE;
/*!40000 ALTER TABLE `contrat_type` DISABLE KEYS */;
INSERT INTO `contrat_type` VALUES (6,'Alternance'),(7,'CDD/Mission'),(8,'CDI'),(9,'Fonctinnaire'),(10,'Stage');
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
  `etat_civil_id` int(11) DEFAULT NULL,
  `cv_file_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `showable` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6EBAC42F191476EE` (`etat_civil_id`),
  UNIQUE KEY `UNIQ_6EBAC42FD8422A22` (`cv_file_id`),
  UNIQUE KEY `UNIQ_6EBAC42F3DA5256D` (`image_id`),
  CONSTRAINT `FK_6EBAC42F191476EE` FOREIGN KEY (`etat_civil_id`) REFERENCES `etat_civil` (`id`),
  CONSTRAINT `FK_6EBAC42F3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  CONSTRAINT `FK_6EBAC42FD8422A22` FOREIGN KEY (`cv_file_id`) REFERENCES `c_v_file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cu_vi`
--

LOCK TABLES `cu_vi` WRITE;
/*!40000 ALTER TABLE `cu_vi` DISABLE KEYS */;
INSERT INTO `cu_vi` VALUES (6,NULL,NULL,NULL,0,'2017-12-01 16:33:21','0000-00-00 00:00:00'),(7,2,NULL,NULL,0,'2017-12-04 16:56:57','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `cu_vi` ENABLE KEYS */;
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
  `annee_exp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B84E87CF3D6815C6` (`annee_exp_id`),
  CONSTRAINT `FK_B84E87CF3D6815C6` FOREIGN KEY (`annee_exp_id`) REFERENCES `experienceOffre` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etat_civil`
--

LOCK TABLES `etat_civil` WRITE;
/*!40000 ALTER TABLE `etat_civil` DISABLE KEYS */;
INSERT INTO `etat_civil` VALUES (2,'Teste',NULL,'1967-01-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
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
  `remuneration_id` int(11) NOT NULL,
  `cuvi_id` int(11) NOT NULL,
  `type_clientele_id` int(11) NOT NULL,
  `secteur_activite_id` int(11) NOT NULL,
  `fonction_id` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `poste` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `localisation` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `zoneProspection` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `detailsMission` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_590C1031D7E2A02` (`remuneration_id`),
  KEY `IDX_590C103D561A4B0` (`cuvi_id`),
  KEY `IDX_590C1038ED7743B` (`type_clientele_id`),
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
-- Table structure for table `experienceOffre`
--

DROP TABLE IF EXISTS `experienceOffre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experienceOffre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experienceOffre`
--

LOCK TABLES `experienceOffre` WRITE;
/*!40000 ALTER TABLE `experienceOffre` DISABLE KEYS */;
INSERT INTO `experienceOffre` VALUES (1,'Jeune diplômé/Moins de 1 an'),(2,'1 à 3 ans'),(3,'3 à 5 ans'),(4,'5 à 10 ans'),(5,'Plus de 10 ans');
/*!40000 ALTER TABLE `experienceOffre` ENABLE KEYS */;
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
  `niveau_id` int(11) NOT NULL,
  `anneeObtention` int(11) NOT NULL,
  `intituleDiplome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `specialisation` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lieu` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `etablissement` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `formationEtranger` tinyint(1) NOT NULL,
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
  `experience_id` int(11) NOT NULL,
  `titre` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `duree` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `localisation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `categorie_id` int(11) NOT NULL,
  `valid_at` datetime DEFAULT NULL,
  `suspendu` tinyint(1) NOT NULL DEFAULT '0',
  `expire_at` int(11) DEFAULT '90',
  `modification_valided` tinyint(1) NOT NULL DEFAULT '1',
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `prerequis` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `descSociete` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `suspendu_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AF86866F1823061F` (`contrat_id`),
  KEY `IDX_AF86866FBB0859F1` (`recruteur_id`),
  KEY `IDX_AF86866FBCF5E72D` (`categorie_id`),
  KEY `IDX_AF86866F46E90E27` (`experience_id`),
  KEY `titre_idx` (`titre`(255)),
  KEY `description_idx` (`description`(255)),
  KEY `prerequis_idx` (`prerequis`(255)),
  KEY `societe_idx` (`societe`),
  KEY `descsociete_idx` (`descSociete`(255)),
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
INSERT INTO `offre` VALUES (34,6,2,1,'Développeur fullstack','6 mois',1,45.764043,4.835658999999964,'Lyon, France','2017-11-18 05:00:22',40,'2017-11-27 16:37:26',0,14,1,NULL,'développeur back-end et front-end','Angular 2 & PHP','RH Manao','SSII Malagasy',NULL),(35,7,2,1,'Ingénieur en aviation','2 ans',1,43.7101728,7.261953199999994,'Nice, France','2017-11-11 05:00:22',8,'2017-11-12 05:00:22',0,30,1,NULL,'Responsable d\'une tour','BAC+5','Air madagascar','aviation',NULL),(36,9,2,4,'Infirmier','5 mois',1,48.85661400000001,2.3522219000000177,'Paris, France','2017-11-20 05:00:22',47,'2017-11-21 05:00:22',0,2,1,NULL,'Infirmier(e) requis(e)','bac+3','HJRA','Hopital',NULL),(37,9,2,3,'Ingénieur en mine','5 ans',1,43.296482,5.369779999999992,'Marseille, France','2017-11-20 05:00:22',39,'2017-11-21 05:00:22',0,2,1,NULL,'Ambatovy','bac+5','Ambatovy','Secteur minier',NULL),(38,10,2,1,'Stagiaire en développement informatique','6 mois',1,43.7101728,7.261953199999994,'Nice, France','2017-11-05 05:00:22',40,'2017-11-15 05:00:22',0,30,1,NULL,'Chargez de développement','BAC+3','GROUPE STAR','Boission alimentaire',NULL),(39,7,2,2,'Responsable RH','3 mois',1,43.604652,1.4442090000000007,'Toulouse, France','2017-11-20 05:00:22',37,'2017-11-21 05:00:22',0,2,1,NULL,'Chargé d\'entretien','BAC +2','ELiba','Fournisseur de produits et services informatiques',NULL),(40,8,2,2,'TECH 2018 - Technicien d\'Inspection - France H/F','7 mois',1,48.2020471,-2.93264350000004,'Bretagne, France','2017-11-20 05:00:22',12,'2017-11-21 05:00:22',0,2,1,NULL,'Technicien supérieur','BAC +3','QHSE','Services informatiques',NULL),(41,9,2,2,'Responsable Exploitation H/F','1 an',1,48.84991979999999,2.637041100000033,'Île-de-France, Franc','2017-11-20 05:00:22',32,'2017-11-21 05:00:22',0,2,1,NULL,'Test','bac +3','QHSE','Test',NULL),(42,7,2,2,'Conducteur de matériel de collecte polyvalent équipier de collecte','8 mois',1,47.7632836,-0.3299686999999949,'Pays de la Loire, Fr','2017-11-20 05:00:22',33,'2017-11-21 05:00:22',0,2,1,NULL,'Test','bac+3','QHSE','TEST',NULL),(43,8,2,2,'Chef de Projets Éoliens H/F','8 mois',1,47.081012,2.398781999999983,'Bourges, France','2017-11-20 05:00:22',58,'2017-11-21 05:00:22',0,2,1,NULL,'Test','Test','QHSE','Test',NULL),(44,6,2,1,'Technicien SAV Hydraulique H/F','1 an',1,48.828508,2.2188068000000385,'Hauts-de-Seine, Fran','2017-11-20 05:00:22',19,'2017-11-21 05:00:22',0,2,1,NULL,'TestT','BAC +5','QHSE','Test',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param_candidat`
--

LOCK TABLES `param_candidat` WRITE;
/*!40000 ALTER TABLE `param_candidat` DISABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('5bppav5v2a1nulsnbtg9u7kp17','_sf2_attributes|a:14:{s:26:\"_security.main.target_path\";s:64:\"http://127.0.0.1/ecojob/web/app_dev.php/candidat/parametre-email\";s:18:\"_csrf/authenticate\";s:43:\"4fx5-xxcF2yNW0xkNRni1oOvz49c21_kKo-lyRF_Oc0\";s:14:\"_security_main\";s:735:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":647:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:607:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":265:{a:8:{i:0;s:49:\"tttt{/koBwVyRBWiTxBXucLHb9bHaCunaRhf8l6ZO6swSr2A}\";i:1;s:43:\"/koBwVyRBWiTxBXucLHb9bHaCunaRhf8l6ZO6swSr2A\";i:2;s:13:\"test candidat\";i:3;s:13:\"Test candidat\";i:4;b:1;i:5;i:15;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:0;s:8:\"postuled\";i:0;s:15:\"_csrf/parametre\";s:43:\"hpsTU-V6XVcrObZmJjMeS8z6Gd4GQZYXDE9Wmy9rnQo\";s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"93m6xSLR7J80C6XEU3BXYi1y5CBvVQnIAAJTySAnO7c\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"jV0963923-PXv2ZVoTxYi4xmUJH00YRy3WLw5IYTiUw\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"rXmYaz5i0ZO6PU1qQ8vPKcor8F46uxcswLv0Zk_e9Us\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"qBREYUenczoLnKC36CHO1pD4TnB7qnQSuGJ88rJ_XhU\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"oA0H5ljm-8J6tvhRwjTyn1gmogxO2EUjKwliRbSFaJs\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"h2FbEhN6BKu5zW8YpNEE6zM4NW3FfYWDYcUyYsrXmGQ\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"FDEWrEWvAM8R9jPQyzsitnrAnf1tqnK-dFqv6SDUsxo\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512404207;s:1:\"c\";i:1512402393;s:1:\"l\";s:5:\"86400\";}',1512404208,1800);
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
  `can_consult_cv` tinyint(1) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (2,2,NULL,'Nomena','nomena','fidiarilantov@yahoo.com','fidiarilantov@yahoo.com',1,'jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ','erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==','2017-12-01 16:51:39',NULL,NULL,'a:1:{i:0;s:14:\"ROLE_RECRUTEUR\";}','2017-10-28 11:09:17',NULL,1),(4,1,NULL,'mohammed','mohammed','adnanmohammed769@yahoo.com','adnanmohammed769@yahoo.com',1,'Uxg4x8Cpe57YgEn55cSjbRWS9xqP0q.6i.WNhYMeQkk','NGAumjnpdG8vwVd8VQB1Kj6ys2CDCwx0IsCA+Nu5kr2NQcfeZfR3mCSk7BSBYuXAF8k50bfJvuV1cR4riP8A6g==','2017-10-12 05:55:21',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}','2017-10-12 04:46:49',NULL,0),(7,1,NULL,'med','med','medeis@hotmail.fr','medeis@hotmail.fr',1,'RpXHOe7OkyWIBdJWZWOiDBFIxIFK1NJ66sbSwErNbyw','G+JG2JcBWYw+fIIZRTf+puEh0sis1g0Wr28MsVj3vdpZ9cFWj4DFSKmvGFpZyWLE8qAHELcU6M3KFUw+o9RSCA==','2017-11-06 23:38:39',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}','2017-11-06 19:34:26',NULL,0),(11,2,NULL,'Test recruteur','test recruteur','ecojobfr@gmail.com','ecojobfr@gmail.com',1,'.bI6x/uEL.bRMON6kyY6StjORUUCogca8zwyK8tpiXg','sy5nQREO/Yo2WPfag4UlMyZUXJZOgjkrnf0mZ4MI4dZ5qKni58QlHNbfbfbtdHKwdhKVWhkeuXs2Jb0TlQVwpg==','2017-11-26 07:42:17',NULL,NULL,'a:1:{i:0;s:14:\"ROLE_RECRUTEUR\";}','2017-11-09 16:18:52',NULL,1),(14,1,NULL,'Administrateur','administrateur','infermedica@gmail.com','infermedica@gmail.com',1,'WBSDCf8uGQOZh15ixVRuth4X2uwIfvfpX7kF1jAdqr4','tttt{WBSDCf8uGQOZh15ixVRuth4X2uwIfvfpX7kF1jAdqr4}','2017-12-03 19:53:34',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}','2017-12-03 19:40:13',NULL,NULL),(15,1,7,'Test candidat','test candidat','norazafindrakoto@gmail.com','norazafindrakoto@gmail.com',1,'/koBwVyRBWiTxBXucLHb9bHaCunaRhf8l6ZO6swSr2A','tttt{/koBwVyRBWiTxBXucLHb9bHaCunaRhf8l6ZO6swSr2A}','2017-12-04 16:46:33',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}','2017-12-03 19:54:13',NULL,NULL);
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

-- Dump completed on 2017-12-04 19:36:30
