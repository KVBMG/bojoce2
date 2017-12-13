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



USE ppmq_baseeco;

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
INSERT INTO `contrat_type` VALUES (6,'Alternance'),(7,'CDD/Mission'),(8,'CDI'),(9,'Fonctionnaire'),(10,'Stage');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
INSERT INTO `sessions` VALUES ('0ed3c828b091af736c016fbd275c3d27','_sf2_attributes|a:2:{s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"JWVQVkvc8TaEApH0N7bCrufKlVcXqHv05NRPbA8GKJQ\";s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"yDQutUScitVo2ed5VA4peR0WdvDj8pJgBEjMt5kF2GI\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513071295;s:1:\"c\";i:1513071229;s:1:\"l\";s:1:\"0\";}',1513071295,1440),('11d94d192b92a6c8692371dd8c9f4bda','_sf2_attributes|a:8:{s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"92fTeSqZKqi4iqPvvyUhG6vEWQu9cQzenOlKhWi0s0M\";s:14:\"_security_main\";s:694:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":606:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:566:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":224:{a:8:{i:0;s:48:\"123{f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc}\";i:1;s:43:\"f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc\";i:2;s:3:\"med\";i:3;s:3:\"med\";i:4;b:1;i:5;i:19;i:6;s:17:\"medeis@hotmail.fr\";i:7;s:17:\"medeis@hotmail.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:1;s:8:\"postuled\";i:0;s:37:\"_csrf/ecojob_candidatbundle_cvfichier\";s:43:\"yPrDtQLdUFbQPiGlGxUNFxXRJMe3nqf8kfLbsgQeCeQ\";s:34:\"_csrf/ecojob_candidatbundle_lettre\";s:43:\"er_IVM1GCbTam39MySbGQIfFR0f-iowUpi3G229KkKI\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513077356;s:1:\"c\";i:1513077353;s:1:\"l\";s:1:\"0\";}',1513077356,1440),('1adec9f7f4b0d97198cab3f24cf46387','_sf2_attributes|a:12:{s:18:\"_csrf/authenticate\";s:43:\"cXLjmX8rr54fFBwiC1t3WCFcSyabeL03DPnOYipjA2c\";s:14:\"_security_main\";s:735:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":647:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:607:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":265:{a:8:{i:0;s:49:\"tttt{aGFEO7qjdQqtDdWCTMQNQ4PwveFhzEYn9pdesMnNTOQ}\";i:1;s:43:\"aGFEO7qjdQqtDdWCTMQNQ4PwveFhzEYn9pdesMnNTOQ\";i:2;s:13:\"test candidat\";i:3;s:13:\"Test candidat\";i:4;b:1;i:5;i:18;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:2;s:8:\"postuled\";i:3;s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"icrHEd2BoXABmRbCGungqU9dA70rcr8WNQe0AwCucrg\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"rm0vejLZUhmlTFQRiI3GQ0DQq22iBq-2LDmwiBct024\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"a5hFiTbAiOa7qc464rRRwcwLwSzRVcasJOcgwWMFZio\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"J8X_zUm8j19qjYh8WPPwcbDtFYNAxVxFzGTqO7cnnFM\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"EOaA3jsUfIgYufawZBpT-WdmKdnrHXKW3vBIyCTwnCU\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"bXjgeum26yc-qWwhqeYizsuXhbA3eqCzYEwTQMMjisM\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"lnI-5101o-N-BO-jnO7ho54_Z7mZuCKJXcxnSP3RcYE\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513002084;s:1:\"c\";i:1513001216;s:1:\"l\";s:1:\"0\";}',1513002085,1440),('1c3aad3762be72e4bf4930bee8eb86c3','_sf2_attributes|a:7:{s:18:\"_csrf/authenticate\";s:43:\"2yocwAPxmhx_2m4uUQXf5QQu9JHJ7UUvvuzhONI9g2M\";s:14:\"_security_main\";s:735:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":647:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:607:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":265:{a:8:{i:0;s:49:\"tttt{aGFEO7qjdQqtDdWCTMQNQ4PwveFhzEYn9pdesMnNTOQ}\";i:1;s:43:\"aGFEO7qjdQqtDdWCTMQNQ4PwveFhzEYn9pdesMnNTOQ\";i:2;s:13:\"test candidat\";i:3;s:13:\"Test candidat\";i:4;b:1;i:5;i:18;i:6;s:26:\"norazafindrakoto@gmail.com\";i:7;s:26:\"norazafindrakoto@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:2;s:8:\"postuled\";i:3;s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"iSW-i_A5_Qz6woGER4117n2hbwDMSVKyxi-kNTaO638\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"32CeqCA0Sl28vrl8v_sNI0WoDeZuOPsKen-8mAWslCg\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512932023;s:1:\"c\";i:1512931229;s:1:\"l\";s:1:\"0\";}',1512932023,1440),('201c620619bcc3030ed9eaecc803f136','_sf2_attributes|a:17:{s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"PdhLdH6uJUoPkzlMh4QFddiUd6tMquphboeO8v1i6K0\";s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"rtleOYQdkTAPfs3AQtC77SIscD5bqjE8coxVIwZszlg\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:7;s:8:\"postuled\";i:0;s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"K4Rf3N7yNSzFyhqwgBYG10bAgHyuilpd09kDUTIc3jY\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"cMnBYy3kcibNDAl2pOC87OcRc6sdhtFZQlmRX6yzlUA\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"3HEX9hRWzWuYDnnVU8F1oyVn9VhhkN-NPoRgTXFTG4w\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"NGOAmwIVOZ5jfhhkssNVwRVeC_YKP0-JLGQpEoCe8ow\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"4HB6e1mCtVTG7a17Op4sJtAXCNx4-Xi_1-7I8fJlSIM\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"iADu5ViTnOn37X6usBEYXEq89txw2uLx2A3mG4hnbro\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"AcmPGxy8iOf2ZVWp6jotSKkvEOVOdlIiQuoBtObOd98\";s:15:\"_csrf/parametre\";s:43:\"04MqyUgxr9nTJGbC16UgEqK0koom-FLBzExlJkW0qPU\";s:13:\"_csrf/profile\";s:43:\"5QS-xSIYEjRZJf4onF0_KbcS42tIQHR-ZmIDF2jxTdo\";s:21:\"_csrf/change_password\";s:43:\"3Vby1tdFJ-wP4R1GWzFUqpNsOiPvoGaxvSnfNK0vxjQ\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512568079;s:1:\"c\";i:1512568032;s:1:\"l\";s:1:\"0\";}',1512568079,1440),('24c200e81a199855aa5ac1e650ced2da','_sf2_attributes|a:15:{s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"f0K3P6vEboHfM7I2dr6pX_nFYFVWMam_GQS5zI5H4AU\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:7;s:8:\"postuled\";i:0;s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"-APbkr5yaR8BhCPirQJzttj0S3v6LZlnuq1uiciiKHs\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"rTciixy4KRQdXIjMmARbSpiQnpX_Bi63W7blSdKl-yY\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"uP9MN335Zl__BS-ExT57_ec4RiELRuXCQpZNAiFgG1I\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"7GWv6-mWfvf5o5vHzRCyJLi1UnEwRdn0PnR2jhGthmI\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"T5fu0QLGhFNpbLAFovVDtxRKGcL8-wWpoZjZsaZmi1w\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"QVa5KvtjCnz5hGuh3-s51PoxXmwkruQ1qrgKWzrwo5E\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"lZ9mhR-ayU3awvjccBqUricd0vY4WtiHzVNYAjCvr9k\";s:15:\"_csrf/parametre\";s:43:\"u47_lM7DcA7EeexTrmyEWR-aNoqPVQF4ShwcBe8Ohl4\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"TJf8HSeKCRcjH1lX_fxwP8Uh0NfHf0_yy8KQvPfcQXw\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512515702;s:1:\"c\";i:1512515162;s:1:\"l\";s:1:\"0\";}',1512515702,1440),('26cb8094635e73955f70122419cf50c4','_sf2_attributes|a:4:{s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"7TFUu0xTKRxmcPNV_brlWMPBmASHc4Pmc8RScUNpWtU\";s:26:\"_security.main.target_path\";s:30:\"http://wadage.fr/recruteur.php\";s:18:\"_csrf/authenticate\";s:43:\"4-VLF6tQ8AQNS3iiA6uxO0l5zwp0jyuWqG57SE_sVuI\";s:18:\"_csrf/registration\";s:43:\"i_RA2p-ooI58ZpkLzKntk1d2CJifmZuY2KHDyuIfW5w\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512787687;s:1:\"c\";i:1512787657;s:1:\"l\";s:1:\"0\";}BDC_SessionSalt|s:32:\"86ebe38a839f8c984c8e75f50d163f0d\";',1512787687,1440),('2cdc280dead86c831c6fcae14c8f5b8d','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:59:\"http://wadage.fr/app_dev.php/candidat/postuler.php/45/offre\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"sAa2eEr0PA4aT8JsuKSMEz1GB4xDAhhvplQeuerdMKE\";s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"N0g5MPEXnhbOhQ5L8wNT1wiszJFtWB31YHEIq_0hyoU\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513075068;s:1:\"c\";i:1513074893;s:1:\"l\";s:1:\"0\";}',1513075068,1440),('2f50e3bcf0f884c678f9f440103f3abd','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:59:\"http://wadage.fr/app_dev.php/candidat/postuler.php/42/offre\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513040980;s:1:\"c\";i:1513040964;s:1:\"l\";s:1:\"0\";}',1513040980,1440),('30835de1778a35f13a7e031f9289801f','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:47:\"http://wadage.fr/candidat/postuler.php/42/offre\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513044277;s:1:\"c\";i:1513044273;s:1:\"l\";s:1:\"0\";}',1513044277,1440),('348bb4e62830afc00626765e04ca3368','_sf2_attributes|a:9:{s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"v13ssvec7hVcFm2gltNP7-ccTair2-O1ScAm5JfmQV8\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"RgOSOmhwH6cShRzX-Swh10l6BiRdhUY1Qx6rpbylsbA\";s:18:\"_csrf/authenticate\";s:43:\"UoUn4yWjgDQ1vrQdYyIV7F9x3Vor4xUhbmkk1zihKCU\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:7;s:8:\"postuled\";i:8;s:37:\"_csrf/ecojob_candidatbundle_cvfichier\";s:43:\"T3OcSu9JeF8h_3XzcfVUrdxCUZSxaICj1_2ctigOZaU\";s:34:\"_csrf/ecojob_candidatbundle_lettre\";s:43:\"lqyN3bPGTLtM5vHJ63cKONsj0bsDVCA6zJ24VtIoK-M\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512850799;s:1:\"c\";i:1512846690;s:1:\"l\";s:1:\"0\";}',1512850799,1440),('37755ebe6feaaeb8024fdad73347605c','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:51:\"http://wadage.fr/admin/offres/all-without-exception\";s:18:\"_csrf/authenticate\";s:43:\"AkAWEPoXBcENk_fF-oiVNkTMVbLpBnu0oSpnv-QHkAA\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512996797;s:1:\"c\";i:1512996797;s:1:\"l\";s:1:\"0\";}',1512996797,1440),('3bcd63b6777cb885bf8fea23c6353569','_sf2_attributes|a:4:{s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"_bGAkgioPspBMDml6tX07jSiDr4Nc3V_9g2p8AE4J_o\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"_5h6_fRkkIhoCOKr35ACCxXCmmeNf48WloudE2fhOtQ\";s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"bbpfHOgPNGtwgLWamgfUVj2ABdj90ye72jpVBIgZzv8\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512943396;s:1:\"c\";i:1512943356;s:1:\"l\";s:1:\"0\";}',1512943396,1440),('3cff93f09ef74ae361b713a0c4216ead','_sf2_attributes|a:1:{s:14:\"_security_main\";s:694:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":606:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:566:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":224:{a:8:{i:0;s:48:\"123{f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc}\";i:1;s:43:\"f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc\";i:2;s:3:\"med\";i:3;s:3:\"med\";i:4;b:1;i:5;i:19;i:6;s:17:\"medeis@hotmail.fr\";i:7;s:17:\"medeis@hotmail.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512988918;s:1:\"c\";i:1512988918;s:1:\"l\";s:1:\"0\";}',1512988918,1440),('3f6de49bd17060c6bf4c119c95248955','_sf2_attributes|a:1:{s:18:\"_csrf/authenticate\";s:43:\"VoOzdcCf5itxU3qDAYomaC-G27u56eeUEtaAZbH7F5Y\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513000544;s:1:\"c\";i:1513000496;s:1:\"l\";s:1:\"0\";}',1513000544,1440),('42b26cc7c2feb2a1c558877c133eaa89','_sf2_attributes|a:3:{s:18:\"_csrf/authenticate\";s:43:\"HtDBfOGTN-UDwimpCXd0pyId_FfY9MfO4bks_CtFKwg\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"S3yqtoMJ-qKVK7EkOkC2EuIbdX_4ZAjUVnSzJM02o9U\";s:26:\"_security.main.target_path\";s:29:\"http://wadage.fr/candidat.php\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512415317;s:1:\"c\";i:1512415050;s:1:\"l\";s:1:\"0\";}',1512415317,1440),('5a3aa0c9beea51eba82dec57b5e8cc22','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:55:\"http://wadage.fr/app_dev.php/recruteur/candidatures.php\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512941148;s:1:\"c\";i:1512941132;s:1:\"l\";s:1:\"0\";}',1512941148,1440),('5ea94a8249630d422f7c6b8023acd278','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:42:\"http://wadage.fr/candidat/sauvegardees.php\";s:18:\"_csrf/authenticate\";s:43:\"g0K0P52hA2Ney89iUEDV-onfWXNwbD-_o8GORFmnJm4\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513023681;s:1:\"c\";i:1513023679;s:1:\"l\";s:1:\"0\";}',1513023681,1440),('5f517d28fd68e105b8d148c1558a7a66','_sf2_attributes|a:2:{s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"aXjRs83P2QZAhvuhDEVkwrQWNfKuP7ie3w_LQmgAiMM\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"h6or0pQZjacZo72rFM-41tnBJyHGxLoFmmztyghIfb0\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513004539;s:1:\"c\";i:1513004539;s:1:\"l\";s:1:\"0\";}',1513004539,1440),('63de3b673d6bec4076e957fc1524cd3d','_sf2_attributes|a:5:{s:18:\"_csrf/authenticate\";s:43:\"Gzy_S_ycn3iAFxXjorMA09iYTfCT77fGZ6m7CXBU45k\";s:14:\"_security_main\";s:704:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":616:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:576:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":233:{a:8:{i:0;s:49:\"tttt{wBvE4zxvBfxbKPRRNoKVHgJdkpLpUgOAJfJIPkQZnNw}\";i:1;s:43:\"wBvE4zxvBfxbKPRRNoKVHgJdkpLpUgOAJfJIPkQZnNw\";i:2;s:6:\"test r\";i:3;s:6:\"test r\";i:4;b:1;i:5;i:17;i:6;s:18:\"ecojobfr@gmail.com\";i:7;s:18:\"ecojobfr@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:6:\"offres\";i:1;s:12:\"candidatures\";s:1:\"0\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512676051;s:1:\"c\";i:1512675996;s:1:\"l\";s:1:\"0\";}',1512676051,1440),('6b12bdd6346a789393d2f547424d65d8','_sf2_attributes|a:2:{s:18:\"_csrf/authenticate\";s:43:\"sTf4a6PFIts_gx-F77Jf30DZKsAYB_zgfixfHoqkyx0\";s:23:\"_security.last_username\";s:6:\"Nomena\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512451717;s:1:\"c\";i:1512451710;s:1:\"l\";s:1:\"0\";}',1512451717,1440),('6bb7e88ddeec1a3168ecf3ec6f04dc58','_sf2_attributes|a:15:{s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"Xb4P0jdAdQb6ngVSVsGzJz-FTuWhF3fpJQSVgf_xt8o\";s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"6mXoiKyVJZKO5RUQHU0R3ylEvRDeH6h-O_ZJiDKmjrg\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:7;s:8:\"postuled\";i:0;s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"geNR4mglQTejxiv4lODuP5oeCd4uZ84fhejLNAiSzMc\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"nC0bpHJQf-G61uiYuhtXbgK0CbK87TquwAtBw__sujQ\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"QzYJ65y7PCMCtXG1wcYf68kTn8dfxZa5IfS2Bm-xSxY\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"CoJQyUkuC5lBp0wez2Qx8wcsWAfjr8MdCz1DeChGqgA\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"IliWPgP9CMcpJrMrRIUIiZXPVIUIdzAK9tobduzTHiQ\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"LgS1j6pS-boXdqHRs54E-ed_nCghcwcnoo5yIZE3ofw\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"2RM2l70ZSWEkbDauC-suQZP-s1kj-0nOonaOYmpCY8s\";s:15:\"_csrf/parametre\";s:43:\"nJDHXGW5VhdrNZJJypwg44nzl1qUTugnnxMKoWWNyfs\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512484550;s:1:\"c\";i:1512484486;s:1:\"l\";s:1:\"0\";}',1512484550,1440),('7415e202cd644b75fcae9573ebf53315','_sf2_attributes|a:6:{s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"geloTmgLAw2NSEWzSbN2ooJ3VFSjh7rxYbY5lV0Y5QY\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:7;s:8:\"postuled\";i:0;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512561525;s:1:\"c\";i:1512561519;s:1:\"l\";s:1:\"0\";}',1512561525,1440),('745cacad3f5974b22845111477a47dd7','_sf2_attributes|a:6:{s:18:\"_csrf/authenticate\";s:43:\"mOYwJLik6KHZm752pYFaMf_GXKZPhlbUJjAIly7-hBA\";s:14:\"_security_main\";s:704:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":616:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:576:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":233:{a:8:{i:0;s:49:\"tttt{wBvE4zxvBfxbKPRRNoKVHgJdkpLpUgOAJfJIPkQZnNw}\";i:1;s:43:\"wBvE4zxvBfxbKPRRNoKVHgJdkpLpUgOAJfJIPkQZnNw\";i:2;s:6:\"test r\";i:3;s:6:\"test r\";i:4;b:1;i:5;i:17;i:6;s:18:\"ecojobfr@gmail.com\";i:7;s:18:\"ecojobfr@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:6:\"offres\";i:1;s:12:\"candidatures\";s:1:\"1\";s:13:\"_csrf/profile\";s:43:\"J3cTW76D_7gyPO7Gqn-WvVSjkZ8_8PPo2aPh84J0UHg\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512675743;s:1:\"c\";i:1512675582;s:1:\"l\";s:1:\"0\";}',1512675743,1440),('79a3e4627bdd991133faca9b6fdc7945','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:41:\"http://wadage.fr/candidat/modifier-cv.php\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512683821;s:1:\"c\";i:1512683801;s:1:\"l\";s:1:\"0\";}',1512683821,1440),('7a3d21dba23fc80c15bf36be0a87efa8','_sf2_attributes|a:1:{s:18:\"_csrf/authenticate\";s:43:\"MIeb2QJQbbJSt_rLxvjFdrBU_KlFV0n3GvOdoiiunHI\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512988919;s:1:\"c\";i:1512988919;s:1:\"l\";s:1:\"0\";}',1512988919,1440),('7a806493170ac313b83aadb57dd9fccf','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:41:\"http://wadage.fr/app_dev.php/profile/edit\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512971238;s:1:\"c\";i:1512971146;s:1:\"l\";s:1:\"0\";}',1512971238,1440),('7aae8aa4ed2d4e1e0a3c6c95ea204fcc','_sf2_attributes|a:6:{s:18:\"_csrf/authenticate\";s:43:\"mqICig5ja1zZfPWlKBDq90JDADiaDQDeDNJW62k_f8I\";s:18:\"_csrf/registration\";s:43:\"148rOykm82boPPiRKq3msCYoYz_3NPCmQztZTkUfSHI\";s:28:\"BDC_IsSolved_registercaptcha\";s:4:\"b:1;\";s:34:\"BDC_CodeCollection_registercaptcha\";s:418:\"O:18:\"BDC_CodeCollection\":1:{s:37:\"\0BDC_CodeCollection\0_ow45y2pibxbhcs32\";a:1:{s:32:\"5bb3f4f03b36c6a1d90b944bfe73672e\";O:8:\"BDC_Code\":6:{s:37:\"\0BDC_Code\0_Ol7hsa2e5tt56dggd3heygvyy3\";s:6:\"ZEHXWY\";s:37:\"\0BDC_Code\0_1s5oibui5vw6prv0krvf6ux6iz\";i:1512664486;s:37:\"\0BDC_Code\0_19z8h3rhcd1hqjwz7ifx69v7u1\";N;s:27:\"\0BDC_Code\0_oghxkggvc7oqwbsf\";b:1;s:27:\"\0BDC_Code\0_Ot6x6dc7cv6ocn9v\";N;s:27:\"\0BDC_Code\0_O17uu0pk3wr7rjd4\";i:0;}}}\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"hzElHaTjTsD_vQLfOSxJjUrs64bYhEc6RDq_PTXB3CQ\";s:23:\"_security.last_username\";s:14:\"Test recruteur\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512669046;s:1:\"c\";i:1512664457;s:1:\"l\";s:1:\"0\";}BDC_SessionSalt|s:32:\"e4d06cf14704a75e772853f9f6f69f24\";',1512669046,1440),('7d560d6b24304d412ad3699c442f3faf','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:42:\"http://www.wadage.fr/candidat/gerer-cv.php\";s:18:\"_csrf/authenticate\";s:43:\"Wp5xbNssUPTZ0LDTRvW8QfESPjs3J27aJiZcI6fHdgQ\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512993333;s:1:\"c\";i:1512993332;s:1:\"l\";s:1:\"0\";}',1512993333,1440),('7ef017eb2cdd881c834363353b17486f','_sf2_attributes|a:11:{s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"Susrge5S_r8A6BwCPPY_Ns5N6rF_bnzc12yfHqpCknM\";s:14:\"_security_main\";s:694:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":606:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:566:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":224:{a:8:{i:0;s:48:\"123{f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc}\";i:1;s:43:\"f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc\";i:2;s:3:\"med\";i:3;s:3:\"med\";i:4;b:1;i:5;i:19;i:6;s:17:\"medeis@hotmail.fr\";i:7;s:17:\"medeis@hotmail.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:1;s:8:\"postuled\";i:0;s:37:\"_csrf/ecojob_candidatbundle_cvfichier\";s:43:\"OMbN_XAAS2uX2fsqeb8t3ZBciWLv20lqPCxJ-Z5XhWY\";s:34:\"_csrf/ecojob_candidatbundle_lettre\";s:43:\"wQstZKH8x46U8ZnKYagWs4vYVDS5Y6B9H5oDMODk4Ow\";s:15:\"_csrf/parametre\";s:43:\"8zHyggFsn5JUH14-SpEF3y2tsQ37Vq7iJuggB7cB65s\";s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"EkLG3KK6gCEbTiGkluQO1rmb_N4QRpd6tPKdlKPndjc\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"b9nWa9a7P2sGF3QfeLEc4wNyBS80tZdXIVTIYR81lBE\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513072743;s:1:\"c\";i:1513072105;s:1:\"l\";s:1:\"0\";}',1513072743,1440),('834f5ec979cade00e1468eb19ff7e829','_sf2_attributes|a:0:{}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512748604;s:1:\"c\";i:1512748579;s:1:\"l\";s:1:\"0\";}',1512748604,1440),('866fd93688bcbed818c02994644f6102','_sf2_attributes|a:19:{s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"rNyk-eFEmAuFgA99Zy9x52ZX2QKOyfltMNao1Rc6P0I\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"GCYRDYe4wyLBa6znMh41fJAeq0IYHykMVCyopjk5cDA\";s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"LnatEi5erI9WEu25GwP1SnxLbiQjONwMK83xELElpGw\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:7;s:8:\"postuled\";i:10;s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"wsHkALThKNrrPlWTHEn5tBBAz27kO7RZvQDBdCOlMI4\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"gV3VvbP6M-HG86Tn8SKfgF4lVQ4id7ffdXgg4WZjTYU\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"7pLSf_9_lICvqJHajjkN3uV5HV9UIrniLsztvvNT_L4\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"aCoDF08U3uZnLrdsBSAdSohrdPar7h1uklJtp5CRnV4\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"0PBfOcTfLxoUyS3RVE1MpZxBswRSoT2mRzFceWOV6kM\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"ZTOxGXcXySsgeyaullZAgds7nwSovdcEMcc_Hb0ZqIU\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"0_gACibd3X01PUwQ8r45GIpke1oW97jNSnzYttooIHo\";s:15:\"_csrf/parametre\";s:43:\"Dd04EnpZowjnRrvf-gL5d6G7tgoX-5iG5yTvu9rVCbs\";s:37:\"_csrf/ecojob_candidatbundle_cvfichier\";s:43:\"Wns28NswyOq2lpizjaIB9RDKu2Tcs6DWD7pMGNw34Nc\";s:34:\"_csrf/ecojob_candidatbundle_lettre\";s:43:\"H_JJ-v_XmS0GqNQctw3mKGHyNX8eOwp-bQCL8W5j9CM\";s:13:\"_csrf/profile\";s:43:\"HzWeetPaQiCyIi2keRgnESv4CuJq0lgGza3AH49gZ_w\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512859372;s:1:\"c\";i:1512859296;s:1:\"l\";s:1:\"0\";}',1512859372,1440),('891813cf44ae4a1f791bb94cf05f9bed','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:41:\"http://wadage.fr/candidat/parametre-email\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512640790;s:1:\"c\";i:1512640790;s:1:\"l\";s:1:\"0\";}',1512640790,1440),('8aa287805e4c75952e36bade573799ba','_sf2_attributes|a:4:{s:26:\"_security.main.target_path\";s:56:\"http://wadage.fr/app_dev.php/candidat/Paris,%20France/36\";s:18:\"_csrf/authenticate\";s:43:\"RG7tw9VRRKMDtimTYCUuPSKHQaDnCrlf7zenPHPTE1Q\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"xmSuqBk4c-KuW05PJ9d8mAaG_zplh6heYNRS_VxbgW8\";s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"Lp3WeFA_Lp5qrLt_Y-BmKmxZ5V2yFAuQv9KXBX0ajbI\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513073015;s:1:\"c\";i:1513073010;s:1:\"l\";s:1:\"0\";}',1513073016,1440),('8e1a8b756771c1e687b4e8ee84f793fa','_sf2_attributes|a:3:{s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"5glo65reWeXvkWfqI73HeL8vhdNfjMIHu90AUOUFATw\";s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"76r-i92w8Pu9Y9mw9YF5UMCfJPjmTOiOt6m7Hc22_HI\";s:18:\"_csrf/registration\";s:43:\"8FYvRu0L6rO8vDRj_DZeWjbDLbalExWFfEUfcl86-zU\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513071329;s:1:\"c\";i:1513071300;s:1:\"l\";s:1:\"0\";}BDC_SessionSalt|s:32:\"be4f1906577d1315a7bffeafc7f730bf\";',1513071329,1440),('8f871a4a9c34f54a7df29a3f372dadb9','_sf2_attributes|a:10:{s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"uGQ0iUVZUk15U9gZeWJD5pe5R10wpjfad3Pdtao4vVw\";s:14:\"_security_main\";s:694:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":606:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:566:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":224:{a:8:{i:0;s:48:\"123{f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc}\";i:1;s:43:\"f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc\";i:2;s:3:\"med\";i:3;s:3:\"med\";i:4;b:1;i:5;i:19;i:6;s:17:\"medeis@hotmail.fr\";i:7;s:17:\"medeis@hotmail.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:1;s:8:\"postuled\";i:0;s:37:\"_csrf/ecojob_candidatbundle_cvfichier\";s:43:\"_7LBIe2bmDDwF4tmGJ9J6KFljcEmgYsjd6DfXSSkO6g\";s:34:\"_csrf/ecojob_candidatbundle_lettre\";s:43:\"74WKkwhbHpRHpdkiqD6kIlwMZOPY1rxDB65BDnpImUc\";s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"POmfRKcWjJ2dxqG5CrA5huiPPtou19t2tSGMy4I76Tw\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"srnjuqIUYBt2PxqypOAOnuzJK7ys_s0C6a-DoLTQfTs\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513016253;s:1:\"c\";i:1513016127;s:1:\"l\";s:1:\"0\";}',1513016254,1440),('8f99eca6b933f881080c09c2235b5978','_sf2_attributes|a:8:{s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"rsdQjdQMGUK3417jbmWZrVmcPcFsXRxMjd_TKyMBOxQ\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"7PWWTsLBSWZwtz9C2oz6EWMUPUubm28sm_ajUlOs2go\";s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"ChpQhuuvawHIpGd0-OTevkC5us2ZSKw008wMOTOnhYI\";s:14:\"_security_main\";s:694:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":606:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:566:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":224:{a:8:{i:0;s:48:\"123{f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc}\";i:1;s:43:\"f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc\";i:2;s:3:\"med\";i:3;s:3:\"med\";i:4;b:1;i:5;i:19;i:6;s:17:\"medeis@hotmail.fr\";i:7;s:17:\"medeis@hotmail.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:1;s:8:\"postuled\";i:0;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513006149;s:1:\"c\";i:1513006132;s:1:\"l\";s:1:\"0\";}',1513006149,1440),('94e69f8ce7ba6ebfba9b3078f6485ed9','_sf2_attributes|a:8:{s:18:\"_csrf/authenticate\";s:43:\"XeXg7Bpjn7ie2uiXlild36DpoK4JWYADbRbAgaDmiKs\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:7;s:8:\"postuled\";i:0;s:13:\"_csrf/profile\";s:43:\"-gSDhG5e_2SEDSFCjjCTrQ3HRPow_arMvQTT4b8JFqU\";s:21:\"_csrf/change_password\";s:43:\"XNNF3K3x8rWR2NoSK_L4jDg-RM4skjiMfH1KvgM360Q\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"Se6rsjY_Ubl80Y666H6u3UvxOKeZJlC0PDs8wczpELY\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512495053;s:1:\"c\";i:1512494992;s:1:\"l\";s:1:\"0\";}',1512495053,1440),('968f941b478df926b882a812d867f365','_sf2_attributes|a:20:{s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"3An_hj3sJfqUYRgKnOlE9go_OhStDttPTu_VIWpiSIQ\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"iVYCSXHlKNAyVjSIAKQcN0zw1bB-4vEFye62qIYEOuc\";s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"MsodG3hqcIilDrSEUCgPiAD5JpaNjFejskM6wrgSHWQ\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:8;s:8:\"postuled\";i:10;s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"m7hDIe1OVw2Bt2G9zUtajOUgV1VyfZ5Us_IrF3E8SmE\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"q6YAifLu24zw2kgZAuLpIrsXnTAxzjZe23XmuTbfZVQ\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"4YnCR-2vgRra344bZxXIkwgdcWIgaC559lhEmrqyso0\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"7Rz7o-K5GtdK6K8sRSjU7qo2Ck0hZ8gDZSlgcwkWJZ0\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"vfuoJIXF6vw1zQWXehzsEKGG9edeM7wnfCdxtMy6Dok\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"R53CdOQyaB0caIv2-V-q-v4N1Kye2IQXBO3MIRHPrb8\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"h0v28XE45muO2BioVaHlNus1nB-NlZc5rObj1FRLwbw\";s:37:\"_csrf/ecojob_candidatbundle_cvfichier\";s:43:\"p_hovXXGhhIcktFfI5TrrbwqLX-dCx7R20RRWyIOGio\";s:34:\"_csrf/ecojob_candidatbundle_lettre\";s:43:\"JEf_NAfSH0WHgjPfLwZ4NJgKZJbpu9Ktzn2bWlHNSLU\";s:15:\"_csrf/parametre\";s:43:\"WSwSEFwNULHh7l76M-U9WWi_Es6rcaJZzoGV7q-4t3k\";s:13:\"_csrf/profile\";s:43:\"mIXpGrhGavSQ78uMwSSlOpBQFV3Ap7U7bWZZABMh_oU\";s:21:\"_csrf/change_password\";s:43:\"cZYHVEc4mcnH1XkNKT71w4Psl3soYkfeairHlswkdaY\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512915982;s:1:\"c\";i:1512915860;s:1:\"l\";s:1:\"0\";}',1512915982,1440),('97e838882d21dcd184b055e2cdf58ac3','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:29:\"http://wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"UcVB6jBPw6y4YOaXl9QcysXe1MI2RxrP5zECrrQnwKA\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512640380;s:1:\"c\";i:1512640357;s:1:\"l\";s:1:\"0\";}',1512640380,1440),('9a13000bd36693b54034a8091a640287','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:43:\"http://wadage.fr/recruteur/candidatures.php\";s:18:\"_csrf/authenticate\";s:43:\"FK8RXXB82Gw5JUmSmYxMh0b1JhO-zL9t200BewsnC3Y\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512970672;s:1:\"c\";i:1512970558;s:1:\"l\";s:1:\"0\";}',1512970672,1440),('9c83f6d03bb211b99d633bc569032c5e','_sf2_attributes|a:9:{s:18:\"_csrf/authenticate\";s:43:\"jN7yyt-KERoAvWxzehE-y69rFhqQoulwyPodZCg_6ic\";s:14:\"_security_main\";s:730:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":642:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:602:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":257:{a:8:{i:0;s:49:\"tttt{WBSDCf8uGQOZh15ixVRuth4X2uwIfvfpX7kF1jAdqr4}\";i:1;s:43:\"WBSDCf8uGQOZh15ixVRuth4X2uwIfvfpX7kF1jAdqr4\";i:2;s:14:\"administrateur\";i:3;s:14:\"Administrateur\";i:4;b:1;i:5;i:14;i:6;s:21:\"infermedica@gmail.com\";i:7;s:21:\"infermedica@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:16:\"ROLE_SUPER_ADMIN\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:8:\"newUsers\";i:3;s:5:\"users\";s:1:\"6\";s:6:\"offres\";s:2:\"12\";s:7:\"expired\";i:0;s:8:\"modified\";i:0;s:10:\"notvalided\";i:0;s:8:\"suspendu\";i:0;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512732038;s:1:\"c\";i:1512731902;s:1:\"l\";s:1:\"0\";}',1512732038,1440),('9d13fe031115f3f0069489a1f7bc9a4b','_sf2_attributes|a:1:{s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"9fYVkREzFZhNw3r__twZX39d-GZfo3wstNa-SvqiWp4\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512580629;s:1:\"c\";i:1512580602;s:1:\"l\";s:1:\"0\";}',1512580629,1440),('9ef6ed5b3ea7b73fc1da4a320667f135','_sf2_attributes|a:7:{s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"EwUggShJHTrnWfuAPPyFJmlzvtDP4bEW5eFs8bZUtyE\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:7;s:8:\"postuled\";i:0;s:13:\"_csrf/profile\";s:43:\"jVQA_EMlp9R79DXl4bCaQTpPNwkl0Du-Zp2BZdG5s9k\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512557749;s:1:\"c\";i:1512557734;s:1:\"l\";s:1:\"0\";}',1512557749,1440),('a09c3209409c4b9b5aaaee524e9c6e99','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:39:\"http://wadage.fr/recruteur/banquecv.php\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512914288;s:1:\"c\";i:1512914214;s:1:\"l\";s:1:\"0\";}',1512914288,1440),('a126c510d9268bb841d79576ad7c7a62','_sf2_attributes|a:11:{s:18:\"_csrf/authenticate\";s:43:\"uq5fIONIE5Dt9f6Gv2AGqMesoCkMUbl2PN6855sM8Sg\";s:14:\"_security_main\";s:694:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":606:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:566:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":224:{a:8:{i:0;s:48:\"123{f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc}\";i:1;s:43:\"f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc\";i:2;s:3:\"med\";i:3;s:3:\"med\";i:4;b:1;i:5;i:19;i:6;s:17:\"medeis@hotmail.fr\";i:7;s:17:\"medeis@hotmail.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:1;s:8:\"postuled\";i:0;s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"GmWh0Zffp-TGokIMU_XecvghoopK7enRhpFP59xZ9Vc\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"TWr7qWWyytAWRkwKqds2fXKGDVRdQHqK-oGcSxT8LaM\";s:13:\"_csrf/profile\";s:43:\"k9KgaIp1P7XoPUfJNMlN3mOR_blXyAMUZcmMBHe6C0s\";s:37:\"_csrf/ecojob_candidatbundle_cvfichier\";s:43:\"GUVRcNxivJdP_jR-EbeGFPRk30byNOk5K-fq7X3mmDU\";s:34:\"_csrf/ecojob_candidatbundle_lettre\";s:43:\"fcmlTl1SfoxwdlYd1aM2ROPfSxytYpUNEm2TUse2Sjk\";s:13:\"_csrf/message\";s:43:\"f4K_DWUwIArvFb0axXocR9LW2gvy9w8W0qQTtJnqWhI\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512996619;s:1:\"c\";i:1512994291;s:1:\"l\";s:1:\"0\";}',1512996619,1440),('a1f21656d3a031e04311c6fa03226766','_sf2_attributes|a:6:{s:18:\"_csrf/authenticate\";s:43:\"tVdnTSC8uePpI1Ge-2g5RDXhZer2g4IT4YLkC4C4sYI\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:7;s:8:\"postuled\";i:0;s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"T3UO-fE4M8UBiINp2S80E2WGJXFqIIUFTxxtGT2Ad8A\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512645172;s:1:\"c\";i:1512645162;s:1:\"l\";s:1:\"0\";}',1512645172,1440),('a2c488f3bc2d500a7d663658c3e9191b','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:54:\"http://wadage.fr/app_dev.php/recruteur/creer-offre.php\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512972673;s:1:\"c\";i:1512971375;s:1:\"l\";s:1:\"0\";}',1512972673,1440),('a71fa190f53b52c330d361a78142b661','_sf2_attributes|a:0:{}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512970867;s:1:\"c\";i:1512970867;s:1:\"l\";s:1:\"0\";}',1512970867,1440),('a8eb0600bb7867b6d5e07d8e13e4fcdf','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:33:\"http://wadage.fr/messagerie/inbox\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512860247;s:1:\"c\";i:1512860182;s:1:\"l\";s:1:\"0\";}',1512860247,1440),('b61a8a22e931d3686b67faf1be5e4bba','_sf2_attributes|a:16:{s:26:\"_security.main.target_path\";s:29:\"http://wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"xSLRv5dVwi8alwn7Z2CecSv_18A6GFqvQ2pCY0s48eo\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:7;s:8:\"postuled\";i:0;s:15:\"_csrf/parametre\";s:43:\"VcClyxfDYs-1qQ9Yrf2qQjt8w_6LY4hYEwXoimS4JAw\";s:13:\"_csrf/profile\";s:43:\"LnQUlHAhkg397kwNO5HODGUU5yhSjh5AIZzM9w17kX4\";s:21:\"_csrf/change_password\";s:43:\"f7oiQtAocGpvFZxqYErp2uq-cDVURD65dc5LgHpJsos\";s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"O9I1I7f3D3N_n7PaCIZH4kxYZ0j6XETg4seLFbY2PsE\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"nG2IlwgWwoCYoQ_g1U8p0vJWmOFSao7_M1HBS-y0dpg\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"nTxuu7m_InvBGZUtyQZ4JP6_JSXJ8VJg0q9GQX50Eyg\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"RvAh2O4iwud1bVMCuuuTyaExfU5a4e8w-Ynd282wHyM\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"VbaXOlgSundQ-chVkXARMX61IQ4B_x09SYmvSVQgUUA\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"4jkrCniHfx-KJZ5m_fBGf9q4wkHqfnl1zgDyTISMvsA\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"exaGUlQ7HsqoXl6HT0xlySCvHmrVmKIz5W6dZCj5KSE\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512438326;s:1:\"c\";i:1512438279;s:1:\"l\";s:1:\"0\";}',1512438326,1440),('bc2dd37788b08e682bde34cc6348e161','_sf2_attributes|a:6:{s:18:\"_csrf/authenticate\";s:43:\"UHfGodXcMRQaQvOQXFSZ-677_cv2C0q6bLA-xD-7h30\";s:14:\"_security_main\";s:704:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":616:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:576:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":233:{a:8:{i:0;s:49:\"tttt{wBvE4zxvBfxbKPRRNoKVHgJdkpLpUgOAJfJIPkQZnNw}\";i:1;s:43:\"wBvE4zxvBfxbKPRRNoKVHgJdkpLpUgOAJfJIPkQZnNw\";i:2;s:6:\"test r\";i:3;s:6:\"test r\";i:4;b:1;i:5;i:17;i:6;s:18:\"ecojobfr@gmail.com\";i:7;s:18:\"ecojobfr@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:1;s:6:\"offres\";i:1;s:12:\"candidatures\";s:1:\"1\";s:34:\"_csrf/ecojob_recruteurbundle_offre\";s:43:\"9DQWaB0i1V73ygzbjUHd_M47QcAijVj30PFiLHeCr7Q\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512763912;s:1:\"c\";i:1512763875;s:1:\"l\";s:1:\"0\";}',1512763912,1440),('bf4ee64226215dd119c0d4d83c520d4e','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:41:\"http://wadage.fr/recruteur/mes-offres.php\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512942271;s:1:\"c\";i:1512942255;s:1:\"l\";s:1:\"0\";}',1512942271,1440),('c4b47ad3160bb2d7e70b63e6e9fb8765','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:50:\"http://wadage.fr/app_dev.php/candidat/gerer-cv.php\";s:18:\"_csrf/authenticate\";s:43:\"LTMmKSF3UeqGb8g0D1VDDIpmxntdf9SnIBlGmTlwRxk\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512682986;s:1:\"c\";i:1512682960;s:1:\"l\";s:1:\"0\";}',1512682986,1440),('c7002a1988f58abe57f885379e5b81f2','_sf2_attributes|a:2:{s:18:\"_csrf/registration\";s:43:\"U9Ane6dw58gi7HkVdcEoIyjAYYtCbW7hJT5kTCTpTps\";s:26:\"_security.main.target_path\";s:60:\"http://wadage.fr/app_dev.php/change-password/change-password\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512971105;s:1:\"c\";i:1512970896;s:1:\"l\";s:1:\"0\";}BDC_SessionSalt|s:32:\"d7fd24007b39ac9e2887ffd4d4d9096d\";',1512971106,1440),('cee2ddc468614266c2590f351906fc2f','_sf2_attributes|a:8:{s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"eygdDskPSjb663BN8xVQQx2IUJQpqCK5ZgzcNWNp_4I\";s:14:\"_security_main\";s:694:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":606:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:566:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":224:{a:8:{i:0;s:48:\"123{f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc}\";i:1;s:43:\"f7J4pbB6LUdZFJ60NX1ab3W5GwELaSdn.lzGy99ysHc\";i:2;s:3:\"med\";i:3;s:3:\"med\";i:4;b:1;i:5;i:19;i:6;s:17:\"medeis@hotmail.fr\";i:7;s:17:\"medeis@hotmail.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:1;s:8:\"postuled\";i:0;s:37:\"_csrf/ecojob_candidatbundle_cvfichier\";s:43:\"J_EGbW6PFpGNKdvc8djhUw1OCAQdRins7-3keumu-K8\";s:34:\"_csrf/ecojob_candidatbundle_lettre\";s:43:\"32l3kqsiZJGEY1ZDIiUsNH9DO_DwJJhJne9rZRNA0KM\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513093734;s:1:\"c\";i:1513093730;s:1:\"l\";s:1:\"0\";}',1513093734,1440),('d27964c23b4b83393ad08330b31e55b1','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:42:\"http://wadage.fr/app_dev.php/recruteur.php\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512972793;s:1:\"c\";i:1512972770;s:1:\"l\";s:1:\"0\";}',1512972793,1440),('d328998b00fb013e1c00c5cfa47b7472','_sf2_attributes|a:7:{s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"i3tP0Q2nf2Yz3sF5YlqSj-Q7k4rmqE5ASZ0-KX-R87E\";s:26:\"_security.main.target_path\";s:33:\"http://www.wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"-n-MvVJjoAQ_d728Vbq76RBtQh7JLj1zFxU8RpvtP4U\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:7;s:8:\"postuled\";i:0;}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512598211;s:1:\"c\";i:1512598204;s:1:\"l\";s:1:\"0\";}',1512598211,1440),('d404aee35040d74f82e6fd79a9e534bc','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:29:\"http://wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"HNkT77zPP8SB-pohLsHwp-cjLdId3mx2PbVEY6dkPjY\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512732563;s:1:\"c\";i:1512732553;s:1:\"l\";s:1:\"0\";}',1512732563,1440),('da0f36654b2cadb62f491ed684056641','_sf2_attributes|a:2:{s:18:\"_csrf/authenticate\";s:43:\"qzZ3nf1smOHu2EWY9QXsqZEZTna2EUYfMQjpuwnL_VI\";s:23:\"_security.last_username\";s:14:\"Test recruteur\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512665764;s:1:\"c\";i:1512665610;s:1:\"l\";s:1:\"0\";}',1512665764,1440),('e04c0d6ce3f3bf30915d16129f39ba84','_sf2_attributes|a:5:{s:18:\"_csrf/authenticate\";s:43:\"6_jshdr14flCKFwRTdLkLHtpGQvcBvK-Xhffw4JfjqQ\";s:14:\"_security_main\";s:704:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":616:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:576:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":233:{a:8:{i:0;s:49:\"tttt{wBvE4zxvBfxbKPRRNoKVHgJdkpLpUgOAJfJIPkQZnNw}\";i:1;s:43:\"wBvE4zxvBfxbKPRRNoKVHgJdkpLpUgOAJfJIPkQZnNw\";i:2;s:6:\"test r\";i:3;s:6:\"test r\";i:4;b:1;i:5;i:17;i:6;s:18:\"ecojobfr@gmail.com\";i:7;s:18:\"ecojobfr@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:1;s:6:\"offres\";i:4;s:12:\"candidatures\";s:1:\"1\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512916258;s:1:\"c\";i:1512916256;s:1:\"l\";s:1:\"0\";}',1512916258,1440),('e2181cacfd1d3f68f2500c9b1f6ce245','_sf2_attributes|a:17:{s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"B13RWc6O5hbJyP255gEJvW6dgdknpoN4pGb-3pQFOGU\";s:26:\"_security.main.target_path\";s:29:\"http://wadage.fr/candidat.php\";s:18:\"_csrf/authenticate\";s:43:\"-2JXdZ8TPrJxlAo-hltKw881pjm574X0NoeUVGDC5U8\";s:14:\"_security_main\";s:697:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":609:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:569:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":227:{a:8:{i:0;s:49:\"tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}\";i:1;s:43:\"unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ\";i:2;s:4:\"test\";i:3;s:4:\"Test\";i:4;b:1;i:5;i:16;i:6;s:17:\"medeis@outlook.fr\";i:7;s:17:\"medeis@outlook.fr\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:13:\"ROLE_CANDIDAT\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:0;s:5:\"saved\";i:7;s:8:\"postuled\";i:0;s:15:\"_csrf/parametre\";s:43:\"Pc1VX38cZPOHPjqRJhx-OfEGXOM8hWw7XcS-7Wc1_e8\";s:34:\"_csrf/ecojob_candidatbundle_cvfile\";s:43:\"MGHwWj0dWZeJP1b0xu4iYLlJbppZZI2Qfn_4ZAccWwM\";s:38:\"_csrf/ecojob_candidatbundle_competence\";s:43:\"utMgHrUO8IU-jwDn3tO0BnXJR6FF4xZRs2Yw101lQeQ\";s:37:\"_csrf/ecojob_candidatbundle_etatcivil\";s:43:\"78M0toFyXUwm59I-7B0eha0gRRbe8YzuLvx4z0KfwuM\";s:38:\"_csrf/ecojob_candidatbundle_experience\";s:43:\"jig2dFUt4OeN7C8rCMHd0F9vhqHG3JaxF3WV_C2Ro20\";s:37:\"_csrf/ecojob_candidatbundle_formation\";s:43:\"uTh38JKFtb7BJI_uRD-0TNZwRFH0ONKvbaRUkPt_xnk\";s:34:\"_csrf/ecojob_candidatbundle_langue\";s:43:\"2X4309NK5X2ea3KpPMHqfXWE5AjYCbghkbo5H_LhnNU\";s:29:\"_csrf/ecojob_userbundle_image\";s:43:\"ezyUKulPudoMxHt8ZC5KLMvXEnT6wl9yLpp0O27KFVM\";s:13:\"_csrf/profile\";s:43:\"Loax-v9mecbcnk4P8ij37EzupmLHhM6gxnZimbANK78\";s:21:\"_csrf/change_password\";s:43:\"jfi6sWCRiiD3gUY0WlBycxvmdR7MZfNzxljRNdkgPa0\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512469146;s:1:\"c\";i:1512469027;s:1:\"l\";s:1:\"0\";}',1512469147,1440),('e38b58d1425c316ae07cf6a6d47dc041','_sf2_attributes|a:1:{s:18:\"_csrf/authenticate\";s:43:\"x3u6JnMxC0L0xQSYGbR17AfZXRK3NF_JS9M5WiJdLQU\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512994613;s:1:\"c\";i:1512994613;s:1:\"l\";s:1:\"0\";}',1512994613,1440),('e73a30268134e6d0f59de5ac179cdd14','_sf2_attributes|a:5:{s:18:\"_csrf/authenticate\";s:43:\"-FNku2wltliG3E6R4N09Agw7KN7Wjd7ANQvFepyvguI\";s:14:\"_security_main\";s:704:\"C:74:\"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken\":616:{a:3:{i:0;N;i:1;s:4:\"main\";i:2;s:576:\"a:4:{i:0;C:29:\"EcoJob\\UserBundle\\Entity\\User\":233:{a:8:{i:0;s:49:\"tttt{wBvE4zxvBfxbKPRRNoKVHgJdkpLpUgOAJfJIPkQZnNw}\";i:1;s:43:\"wBvE4zxvBfxbKPRRNoKVHgJdkpLpUgOAJfJIPkQZnNw\";i:2;s:6:\"test r\";i:3;s:6:\"test r\";i:4;b:1;i:5;i:17;i:6;s:18:\"ecojobfr@gmail.com\";i:7;s:18:\"ecojobfr@gmail.com\";}}i:1;b:1;i:2;a:2:{i:0;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:14:\"ROLE_RECRUTEUR\";}i:1;O:41:\"Symfony\\Component\\Security\\Core\\Role\\Role\":1:{s:47:\"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role\";s:9:\"ROLE_USER\";}}i:3;a:0:{}}\";}}\";s:6:\"unread\";i:1;s:6:\"offres\";i:4;s:12:\"candidatures\";s:1:\"4\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512932325;s:1:\"c\";i:1512931918;s:1:\"l\";s:1:\"0\";}',1512932325,1440),('ea7e06f372e045ab34280143ba0196c8','_sf2_attributes|a:1:{s:18:\"_csrf/authenticate\";s:43:\"Ba_z6tR75__IG9EmXYEKfMCOIvmwt38mgQ6JvFT_cX4\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512989685;s:1:\"c\";i:1512989684;s:1:\"l\";s:1:\"0\";}',1512989685,1440),('eb6cd3ec5005a5d0fa8b651be55427ca','_sf2_attributes|a:3:{s:26:\"_security.main.target_path\";s:43:\"http://wadage.fr/recruteur/candidatures.php\";s:18:\"_csrf/authenticate\";s:43:\"OW1u-jID4sJ2mX3hVEQU0W8oDShD-GodtyOsvbOhb_k\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"lgxVxhalHI8LPy-ohh_bjXkIDPDor9zF-VeNQXIiYv8\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512762287;s:1:\"c\";i:1512759279;s:1:\"l\";s:1:\"0\";}',1512762287,1440),('f50b6bdb12ffdfcdf680fbe382052622','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:30:\"http://wadage.fr/recruteur.php\";s:18:\"_csrf/authenticate\";s:43:\"FcXRT1Ev-p9UuVGjEPBQSSklZfquaG5unB5YGIne3t0\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512729570;s:1:\"c\";i:1512729496;s:1:\"l\";s:1:\"0\";}',1512729570,1440),('f70ec14b8f81d0cb3abd3691f30d57e5','_sf2_attributes|a:2:{s:26:\"_security.main.target_path\";s:53:\"http://wadage.fr/app_dev.php/candidat/modifier-cv.php\";s:18:\"_csrf/authenticate\";s:43:\"iXH06M5sBXtBpOgfCMYKMAFcEK9DcERqJRny0qNPxVI\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512859663;s:1:\"c\";i:1512858586;s:1:\"l\";s:1:\"0\";}',1512859663,1440),('fd374b64e935f00ccbd2f82b3d087109','_sf2_attributes|a:1:{s:26:\"_security.main.target_path\";s:29:\"http://wadage.fr/profile/edit\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1512686609;s:1:\"c\";i:1512686587;s:1:\"l\";s:1:\"0\";}',1512686609,1440),('fda894ada6c5c8961f787cff3d3999b7','_sf2_attributes|a:4:{s:26:\"_security.main.target_path\";s:43:\"http://wadage.fr/candidat/Nice,%20France/38\";s:18:\"_csrf/authenticate\";s:43:\"5tV3VTr3DS9gqVeMfHAs4suS95W2Ocm5Qhs5zIE-BqY\";s:39:\"_csrf/ecojob_candidatbundle_candidature\";s:43:\"jkMI6uhDVtJ_8Ck7-BYjbWRLnKBrg3uMJl_Caq8ecRU\";s:40:\"_csrf/ecojob_candidatbundle_candidaturet\";s:43:\"-BL_6Fcw7-wiAgIR34AU-z58Ty2TPOdh2kISFZRvbrQ\";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1513073329;s:1:\"c\";i:1513073181;s:1:\"l\";s:1:\"0\";}',1513073330,1440);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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

-- Dump completed on 2017-12-12 23:37:38
