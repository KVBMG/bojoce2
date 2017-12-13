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
-- Table structure for table `c_v_fichier`
--

DROP TABLE IF EXISTS `c_v_fichier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_v_fichier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidat_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E30B4D448D0EB82` (`candidat_id`),
  CONSTRAINT `FK_E30B4D448D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_v_fichier`
--

LOCK TABLES `c_v_fichier` WRITE;
/*!40000 ALTER TABLE `c_v_fichier` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_v_fichier` ENABLE KEYS */;
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
  `cvfichier_id` int(11) NOT NULL,
  `lettre_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_candidature` datetime NOT NULL,
  `joinMyCv` tinyint(1) DEFAULT NULL,
  `enablecv_pj` tinyint(1) DEFAULT NULL,
  `enablelm_pj` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E33BD3B84CC8505A` (`offre_id`),
  KEY `IDX_E33BD3B88D0EB82` (`candidat_id`),
  KEY `IDX_E33BD3B8BB0859F1` (`recruteur_id`),
  KEY `IDX_E33BD3B8DE95D4AF` (`cvfichier_id`),
  KEY `IDX_E33BD3B85A2BDB92` (`lettre_id`),
  CONSTRAINT `FK_E33BD3B84CC8505A` FOREIGN KEY (`offre_id`) REFERENCES `offre` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E33BD3B85A2BDB92` FOREIGN KEY (`lettre_id`) REFERENCES `lettre` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E33BD3B88D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E33BD3B8BB0859F1` FOREIGN KEY (`recruteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E33BD3B8DE95D4AF` FOREIGN KEY (`cvfichier_id`) REFERENCES `c_v_fichier` (`id`) ON DELETE CASCADE
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
-- Table structure for table `candidaturet`
--

DROP TABLE IF EXISTS `candidaturet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidaturet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lettre_id` int(11) NOT NULL,
  `cvfichier_id` int(11) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `recruteur_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_candidature` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_40335AC55A2BDB92` (`lettre_id`),
  KEY `IDX_40335AC5DE95D4AF` (`cvfichier_id`),
  KEY `IDX_40335AC58D0EB82` (`candidat_id`),
  KEY `IDX_40335AC5BB0859F1` (`recruteur_id`),
  CONSTRAINT `FK_40335AC55A2BDB92` FOREIGN KEY (`lettre_id`) REFERENCES `lettre` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_40335AC58D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_40335AC5BB0859F1` FOREIGN KEY (`recruteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_40335AC5DE95D4AF` FOREIGN KEY (`cvfichier_id`) REFERENCES `c_v_fichier` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidaturet`
--

LOCK TABLES `candidaturet` WRITE;
/*!40000 ALTER TABLE `candidaturet` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidaturet` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie_fonction`
--

LOCK TABLES `categorie_fonction` WRITE;
/*!40000 ALTER TABLE `categorie_fonction` DISABLE KEYS */;
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
  `competence` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrat_categorie`
--

LOCK TABLES `contrat_categorie` WRITE;
/*!40000 ALTER TABLE `contrat_categorie` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrat_type`
--

LOCK TABLES `contrat_type` WRITE;
/*!40000 ALTER TABLE `contrat_type` DISABLE KEYS */;
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
  `image_id` int(11) DEFAULT NULL,
  `showable` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6EBAC42F191476EE` (`etat_civil_id`),
  UNIQUE KEY `UNIQ_6EBAC42F3DA5256D` (`image_id`),
  CONSTRAINT `FK_6EBAC42F191476EE` FOREIGN KEY (`etat_civil_id`) REFERENCES `etat_civil` (`id`),
  CONSTRAINT `FK_6EBAC42F3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cu_vi`
--

LOCK TABLES `cu_vi` WRITE;
/*!40000 ALTER TABLE `cu_vi` DISABLE KEYS */;
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
  `annee_exp_id` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `IDX_B84E87CF3D6815C6` (`annee_exp_id`),
  CONSTRAINT `FK_B84E87CF3D6815C6` FOREIGN KEY (`annee_exp_id`) REFERENCES `experienceOffre` (`id`) ON DELETE CASCADE
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
  `secteur_activite_id` int(11) NOT NULL,
  `fonction_id` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `poste` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `localisation` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `detailsMission` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_590C103D561A4B0` (`cuvi_id`),
  KEY `IDX_590C1035233A7FC` (`secteur_activite_id`),
  KEY `IDX_590C10357889920` (`fonction_id`),
  CONSTRAINT `FK_590C1035233A7FC` FOREIGN KEY (`secteur_activite_id`) REFERENCES `contrat_categorie` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_590C10357889920` FOREIGN KEY (`fonction_id`) REFERENCES `fonction` (`id`) ON DELETE CASCADE,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experienceOffre`
--

LOCK TABLES `experienceOffre` WRITE;
/*!40000 ALTER TABLE `experienceOffre` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fonction`
--

LOCK TABLES `fonction` WRITE;
/*!40000 ALTER TABLE `fonction` DISABLE KEYS */;
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
  `detailsFormation` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
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
-- Table structure for table `lettre`
--

DROP TABLE IF EXISTS `lettre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lettre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidat_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_852EF5B8D0EB82` (`candidat_id`),
  CONSTRAINT `FK_852EF5B8D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettre`
--

LOCK TABLES `lettre` WRITE;
/*!40000 ALTER TABLE `lettre` DISABLE KEYS */;
/*!40000 ALTER TABLE `lettre` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveau_formation`
--

LOCK TABLES `niveau_formation` WRITE;
/*!40000 ALTER TABLE `niveau_formation` DISABLE KEYS */;
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
  `categorie_id` int(11) NOT NULL,
  `titre` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `prerequis` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `descSociete` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '0',
  `suspendu` tinyint(1) NOT NULL DEFAULT '0',
  `modification_valided` tinyint(1) NOT NULL DEFAULT '1',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `localisation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `expire_at` int(11) DEFAULT '90',
  `valid_at` datetime DEFAULT NULL,
  `suspendu_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AF86866F1823061F` (`contrat_id`),
  KEY `IDX_AF86866FBB0859F1` (`recruteur_id`),
  KEY `IDX_AF86866F46E90E27` (`experience_id`),
  KEY `IDX_AF86866FBCF5E72D` (`categorie_id`),
  KEY `titre_idx` (`titre`(255)),
  KEY `description_idx` (`description`(255)),
  KEY `prerequis_idx` (`prerequis`(255)),
  KEY `societe_idx` (`societe`),
  KEY `descsociete_idx` (`descSociete`(255)),
  CONSTRAINT `FK_AF86866F1823061F` FOREIGN KEY (`contrat_id`) REFERENCES `contrat_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AF86866F46E90E27` FOREIGN KEY (`experience_id`) REFERENCES `experienceOffre` (`id`) ON DELETE CASCADE,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_clientele`
--

LOCK TABLES `type_clientele` WRITE;
/*!40000 ALTER TABLE `type_clientele` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_remuneration`
--

LOCK TABLES `type_remuneration` WRITE;
/*!40000 ALTER TABLE `type_remuneration` DISABLE KEYS */;
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
  `can_consult_cv` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D1C63B392FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1D1C63B3A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_1D1C63B3C05FB297` (`confirmation_token`),
  UNIQUE KEY `UNIQ_1D1C63B35AEA4428` (`curriculum_id`),
  KEY `IDX_1D1C63B3C54C8C93` (`type_id`),
  CONSTRAINT `FK_1D1C63B35AEA4428` FOREIGN KEY (`curriculum_id`) REFERENCES `cu_vi` (`id`),
  CONSTRAINT `FK_1D1C63B3C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
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

-- Dump completed on 2017-12-12 23:35:02
