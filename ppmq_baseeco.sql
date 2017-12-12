-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Client :  h2mysql27
-- Généré le :  Dim 10 Décembre 2017 à 19:49
-- Version du serveur :  5.7.20-log
-- Version de PHP :  7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ppmq_baseeco`
--
use eco_job_fr;
-- --------------------------------------------------------

--
-- Structure de la table `alert_mail`
--

CREATE TABLE `alert_mail` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `criter` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `candidature`
--

CREATE TABLE `candidature` (
  `id` int(11) NOT NULL,
  `offre_id` int(11) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `recruteur_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_candidature` datetime NOT NULL,
  `cv_file_id` int(11) DEFAULT NULL,
  `joinMyCv` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `candidature`
--

INSERT INTO `candidature` (`id`, `offre_id`, `candidat_id`, `recruteur_id`, `description`, `date_candidature`, `cv_file_id`, `joinMyCv`) VALUES
(8, 34, 16, 2, '<div>Test<br></div>', '2017-12-09 16:47:14', NULL, 0),
(9, 36, 16, 2, '<div>sddsfs<br></div>', '2017-12-09 16:58:56', NULL, 0),
(10, 37, 16, 2, '<div>sdfsdf<br></div>', '2017-12-09 16:59:41', NULL, 0),
(14, 35, 16, 2, 'dsqdqsdq', '2017-12-09 20:21:37', NULL, NULL),
(15, 38, 16, 2, 'sdfdsfsd', '2017-12-09 20:25:19', NULL, NULL),
(16, 39, 16, 2, 'sdfdsfsd', '2017-12-09 20:32:37', NULL, NULL),
(20, 40, 16, 2, 'mlk', '2017-12-09 20:41:46', NULL, NULL),
(21, 42, 16, 2, '<div><br></div>', '2017-12-09 20:59:52', NULL, 0),
(23, 41, 16, 2, 'Bonjour,je postule à votre offre', '2017-12-09 21:14:39', NULL, NULL),
(24, 45, 16, 17, 'Bonjour,je postule à votre offre', '2017-12-09 21:17:08', NULL, NULL),
(25, 48, 18, 17, 'Test', '2017-12-10 15:33:07', NULL, NULL),
(26, 47, 18, 17, 'TEst 2', '2017-12-10 19:41:08', NULL, NULL),
(27, 46, 18, 17, 'Test 3', '2017-12-10 19:46:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `candidaturet`
--

CREATE TABLE `candidaturet` (
  `id` int(11) NOT NULL,
  `lettre_id` int(11) NOT NULL,
  `cvfichier_id` int(11) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `recruteur_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_candidature` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie_fonction`
--

CREATE TABLE `categorie_fonction` (
  `id` int(11) NOT NULL,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `categorie_fonction`
--

INSERT INTO `categorie_fonction` (`id`, `libelle`) VALUES
(1, 'COMMERCIAL  VENTE'),
(2, 'DISTRIBUTION'),
(3, 'MANAGEMENT COMMERCIAL'),
(4, 'MARKETING'),
(5, 'Non défini');

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

CREATE TABLE `competence` (
  `id` int(11) NOT NULL,
  `cuvi_id` int(11) NOT NULL,
  `informatique` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `autres` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `competence`
--

INSERT INTO `competence` (`id`, `cuvi_id`, `informatique`, `autres`) VALUES
(4, 21, 'sdf', 'sdf');

-- --------------------------------------------------------

--
-- Structure de la table `contrat_categorie`
--

CREATE TABLE `contrat_categorie` (
  `id` int(11) NOT NULL,
  `designation` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `contrat_categorie`
--

INSERT INTO `contrat_categorie` (`id`, `designation`) VALUES
(8, 'Aéronautique'),
(9, 'Agriculture'),
(10, 'Agroalimentaire'),
(11, 'Amélioration de l’Habitat'),
(12, 'Artisanat'),
(13, 'Assurances'),
(14, 'Automobile'),
(58, 'Autre …'),
(15, 'Banque - Assurances'),
(16, 'Banque / Finance'),
(17, 'Bâtiment Travaux Publics'),
(18, 'Bien être'),
(19, 'Commerce'),
(20, 'Commerce de gros'),
(21, 'Communication'),
(22, 'Conseil Ingénierie'),
(23, 'Développement Durable'),
(24, 'Distribution'),
(25, 'Distribution Spécialisée'),
(26, 'E-commerce'),
(27, 'Edition'),
(28, 'Education'),
(29, 'Electroménager'),
(30, 'Electronique'),
(31, 'Energie'),
(32, 'Energies Renouvelables'),
(33, 'Environnement'),
(34, 'Equipement de Bureaux'),
(35, 'Evénementiel'),
(36, 'Hôtellerie Restauration'),
(37, 'Immobilier'),
(38, 'Imprimerie'),
(39, 'Industrie'),
(40, 'Informatique'),
(41, 'Internet'),
(42, 'Loisir'),
(43, 'Luxe'),
(44, 'Non défini'),
(45, 'Outillage Professionnel'),
(46, 'Retail'),
(47, 'Santé'),
(48, 'Sécurité'),
(49, 'Services aux Entreprises'),
(50, 'Services aux Particuliers'),
(51, 'Services Publics'),
(52, 'Télécom'),
(53, 'TERTIAIRE ET SERVICES'),
(54, 'Tourisme'),
(55, 'Transports Logistique'),
(56, 'Travail Temporaire'),
(57, 'Viticulture');

-- --------------------------------------------------------

--
-- Structure de la table `contrat_type`
--

CREATE TABLE `contrat_type` (
  `id` int(11) NOT NULL,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `contrat_type`
--

INSERT INTO `contrat_type` (`id`, `libelle`) VALUES
(6, 'Alternance'),
(7, 'CDD/Mission'),
(8, 'CDI'),
(9, 'Fonctionnaire'),
(10, 'Stage');

-- --------------------------------------------------------

--
-- Structure de la table `cu_vi`
--

CREATE TABLE `cu_vi` (
  `id` int(11) NOT NULL,
  `etat_civil_id` int(11) DEFAULT NULL,
  `cv_file_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `showable` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `cu_vi`
--

INSERT INTO `cu_vi` (`id`, `etat_civil_id`, `cv_file_id`, `image_id`, `showable`, `created_at`, `updated_at`) VALUES
(18, NULL, 5, 6, 0, '2017-11-30 20:15:27', '0000-00-00 00:00:00'),
(21, 11, 6, 7, 0, '2017-12-10 15:24:26', '2017-12-10 15:24:26');

-- --------------------------------------------------------

--
-- Structure de la table `c_v_fichier`
--

CREATE TABLE `c_v_fichier` (
  `id` int(11) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `remuneration_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `poste` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `c_v_fichier`
--

INSERT INTO `c_v_fichier` (`id`, `candidat_id`, `remuneration_id`, `nom`, `titre`, `poste`, `updated_at`) VALUES
(1, 16, 1, '5a2c08ef70f7d.pdf', 'Test', 'sdfsd', '2017-12-09 21:17:08'),
(2, 18, 11, '5a2d45677da53.pdf', 'Test cv', 'Chef de projet', '2017-12-10 19:46:26');

-- --------------------------------------------------------

--
-- Structure de la table `c_v_file`
--

CREATE TABLE `c_v_file` (
  `id` int(11) NOT NULL,
  `cv_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `c_v_file`
--

INSERT INTO `c_v_file` (`id`, `cv_name`, `updated_at`) VALUES
(5, '5a1e6d2f937de.docx', '2017-11-29 09:17:51'),
(6, '5a2996e55b48e.pdf', '2017-12-07 20:30:45');

-- --------------------------------------------------------

--
-- Structure de la table `etat_civil`
--

CREATE TABLE `etat_civil` (
  `id` int(11) NOT NULL,
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
  `annee_exp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `etat_civil`
--

INSERT INTO `etat_civil` (`id`, `nom`, `prenom`, `date_naissance`, `nationalite`, `email`, `telephone`, `telephoneFixe`, `adresse`, `adresse2`, `cp`, `ville`, `annee_exp_id`) VALUES
(11, 'LI', 'NUX', '1967-01-01', 'WIN', 'medeis@hotmail.fr', NULL, NULL, 'rue des champs', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `experience`
--

CREATE TABLE `experience` (
  `id` int(11) NOT NULL,
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
  `detailsMission` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `experience`
--

INSERT INTO `experience` (`id`, `remuneration_id`, `cuvi_id`, `type_clientele_id`, `secteur_activite_id`, `fonction_id`, `dateDebut`, `dateFin`, `poste`, `societe`, `localisation`, `zoneProspection`, `detailsMission`) VALUES
(4, 1, 21, 1, 8, 2, '1967-01-01', '1969-01-01', 'sdf', 'sdf', 'sdf', 'sdf', 'sdfsdf');

-- --------------------------------------------------------

--
-- Structure de la table `experienceOffre`
--

CREATE TABLE `experienceOffre` (
  `id` int(11) NOT NULL,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `experienceOffre`
--

INSERT INTO `experienceOffre` (`id`, `libelle`) VALUES
(1, 'Jeune diplômé/Moins de 1 an'),
(2, '1 à 3 ans'),
(3, '3 à 5 ans'),
(4, '5 à 10 ans'),
(5, 'Plus de 10 ans');

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

CREATE TABLE `fonction` (
  `id` int(11) NOT NULL,
  `categorie_fonction_id` int(11) NOT NULL,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fonction`
--

INSERT INTO `fonction` (`id`, `categorie_fonction_id`, `libelle`) VALUES
(2, 1, 'Animateur commercial'),
(3, 1, 'Assistant commercial'),
(4, 1, 'Attaché commercial'),
(5, 1, 'Business développeur'),
(6, 1, 'Chargé Administration des vent'),
(7, 1, 'Chargé de clientèle'),
(8, 1, 'Chargé SAV'),
(9, 1, 'Chef de publicité'),
(10, 1, 'Commercial'),
(11, 1, 'Commercial export'),
(12, 1, 'Commercial indépendant'),
(13, 1, 'Commercial itinérant'),
(14, 1, 'Commercial sédentaire'),
(15, 1, 'Conseiller clientèle'),
(16, 1, 'Conseiller en assurance'),
(17, 1, 'Conseiller gestion patrimoine'),
(18, 1, 'Ingénieur après vente'),
(19, 1, 'Ingénieur avant vente'),
(20, 1, 'Ingénieur commercial'),
(21, 1, 'Ingénieur d’affaires'),
(22, 1, 'Ingénieur grands comptes'),
(23, 1, 'Négociateur commercial'),
(24, 1, 'Responsable d\'agence'),
(25, 1, 'Sales manager'),
(26, 1, 'Secrétaire commerciale'),
(27, 1, 'Support commercial'),
(28, 1, 'Technicien conseil'),
(29, 1, 'Technico commercial'),
(30, 1, 'Télévendeur / téléconseiller'),
(31, 1, 'VDI'),
(32, 1, 'Vendeur à domicile'),
(33, 1, 'Vendeur magasin'),
(34, 1, 'Vendeur sédentaire'),
(35, 1, 'Visiteur médical'),
(36, 1, 'VRP'),
(37, 1, 'Autre …'),
(38, 2, 'Animateur commercial'),
(39, 1, 'Agent commercial'),
(40, 2, 'Caissière - Hôtesse de caisse'),
(41, 2, 'Category manager'),
(42, 2, 'Chef de caisse'),
(43, 2, 'Chef de département'),
(44, 2, 'Chef de produit'),
(45, 2, 'Chef de rayon'),
(46, 2, 'Chef de secteur'),
(47, 2, 'Commerçant franchisé'),
(48, 2, 'Commerçant indépendant'),
(49, 2, 'Démonstrateur'),
(50, 2, 'Développeur d\'enseigne'),
(51, 2, 'Directeur adjoint de magasin'),
(52, 2, 'Directeur de magasin'),
(53, 2, 'Directeur de réseau'),
(54, 2, 'Directeur développement'),
(55, 2, 'Hôtesse commerciale'),
(56, 2, 'Merchandiser'),
(57, 2, 'Responsable de département'),
(58, 2, 'Vendeur grande distribution'),
(59, 2, 'Autre …'),
(60, 3, 'Animateur des ventes'),
(61, 3, 'Chef des ventes'),
(62, 3, 'Consultants'),
(63, 3, 'Directeur business développeme'),
(64, 3, 'Directeur commercial'),
(65, 3, 'Directeur d\'agence'),
(66, 3, 'Directeur de réseau'),
(67, 3, 'Directeur des ventes'),
(68, 3, 'Directeur développement'),
(69, 3, 'Directeur export'),
(70, 3, 'Directeur Général Délégué - DG'),
(71, 3, 'Directeur régional'),
(72, 3, 'Responsable ADV'),
(73, 3, 'Responsable Business Développe'),
(74, 3, 'Responsable commercial'),
(75, 3, 'Responsable comptes clés'),
(76, 3, 'Responsable développement'),
(77, 3, 'Responsable export'),
(78, 3, 'Responsable grands comptes'),
(79, 3, 'Responsable promotion des vent'),
(80, 3, 'Responsable SAV'),
(81, 3, 'Superviseur Télévente'),
(82, 3, 'Autre …'),
(83, 4, 'Assistant chef de produit'),
(84, 4, 'Assistant chef de produit'),
(85, 4, 'Assistant marketing'),
(86, 4, 'Chargé d\'études marketing'),
(87, 4, 'Chargé de marketing'),
(88, 4, 'Chef de marché marketing'),
(89, 4, 'Chef de produit marketing'),
(90, 4, 'Community Manager'),
(91, 4, 'Directeur de clientèle'),
(92, 4, 'Directeur marketing'),
(93, 4, 'Marketing manager'),
(94, 4, 'Responsable marketing'),
(95, 4, 'Webmarketeur'),
(96, 4, 'Autre …');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `id` int(11) NOT NULL,
  `cuvi_id` int(11) NOT NULL,
  `niveau_id` int(11) NOT NULL,
  `anneeObtention` int(11) NOT NULL,
  `intituleDiplome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `specialisation` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lieu` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `etablissement` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `formationEtranger` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `formation`
--

INSERT INTO `formation` (`id`, `cuvi_id`, `niveau_id`, `anneeObtention`, `intituleDiplome`, `specialisation`, `lieu`, `etablissement`, `formationEtranger`) VALUES
(4, 21, 2, 2014, 'sf', 'sdf', 'sdf', 'sdf', 1);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `image`
--

INSERT INTO `image` (`id`, `image_name`, `updated_at`) VALUES
(6, '5a1e6d1e07551.png', '2017-11-29 09:17:34'),
(7, '5a26cfd2b3192.jpg', '2017-12-05 17:56:50');

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

CREATE TABLE `langue` (
  `id` int(11) NOT NULL,
  `cuvi_id` int(11) NOT NULL,
  `langue` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `niveau` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `langue`
--

INSERT INTO `langue` (`id`, `cuvi_id`, `langue`, `niveau`) VALUES
(5, 21, 'sdf', 'Debutant');

-- --------------------------------------------------------

--
-- Structure de la table `lettre`
--

CREATE TABLE `lettre` (
  `id` int(11) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `lettre`
--

INSERT INTO `lettre` (`id`, `candidat_id`, `nom`, `titre`, `updated_at`) VALUES
(1, 16, '5a2c2a7318070.pdf', 'test', '2017-12-09 21:17:08'),
(2, 18, '5a2d4581ee014.pdf', 'Test Lettre', '2017-12-10 19:46:26');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`id`, `thread_id`, `sender_id`, `body`, `created_at`) VALUES
(2, 2, 16, 'sfsdfsdfsd', '2017-12-08 20:57:39');

-- --------------------------------------------------------

--
-- Structure de la table `message_metadata`
--

CREATE TABLE `message_metadata` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `message_metadata`
--

INSERT INTO `message_metadata` (`id`, `message_id`, `participant_id`, `is_read`) VALUES
(3, 2, 17, 0),
(4, 2, 16, 1);

-- --------------------------------------------------------

--
-- Structure de la table `niveau_formation`
--

CREATE TABLE `niveau_formation` (
  `id` int(11) NOT NULL,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `niveau_formation`
--

INSERT INTO `niveau_formation` (`id`, `libelle`) VALUES
(2, 'Formation non diplômante'),
(3, 'CAP / BEP'),
(4, 'BAC PRO'),
(5, 'BAC'),
(6, 'BTS'),
(7, 'DUT'),
(8, 'Université Licence'),
(9, 'Université Master'),
(10, 'Université Doctorat'),
(11, 'Ecole de Commerce Top 5'),
(12, 'Ecole de Commerce'),
(13, 'Ecole d’ingénieurs'),
(14, 'Ecole d’ingénieurs'),
(15, 'MBA'),
(31, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `offre`
--

CREATE TABLE `offre` (
  `id` int(11) NOT NULL,
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
  `suspendu_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `offre`
--

INSERT INTO `offre` (`id`, `contrat_id`, `recruteur_id`, `experience_id`, `titre`, `duree`, `valid`, `latitude`, `longitude`, `localisation`, `created_at`, `categorie_id`, `valid_at`, `suspendu`, `expire_at`, `modification_valided`, `reference`, `description`, `prerequis`, `societe`, `descSociete`, `suspendu_at`) VALUES
(34, 6, 2, 1, 'Développeur fullstack', '6 mois', 1, 45.764043, 4.835658999999964, 'Lyon, France', '2017-12-10 19:48:58', 40, '2017-12-10 19:48:58', 0, 7, 1, NULL, 'développeur back-end et front-end', 'Angular 2 & PHP', 'RH Manao', 'SSII Malagasy', NULL),
(35, 7, 2, 1, 'Ingénieur en aviation', '2 ans', 1, 43.7101728, 7.261953199999994, 'Nice, France', '2017-12-10 19:48:58', 8, '2017-12-10 19:48:58', 0, 30, 1, NULL, 'Responsable d\'une tour', 'BAC+5', 'Air madagascar', 'aviation', NULL),
(36, 9, 2, 4, 'Infirmier', '5 mois', 1, 48.85661400000001, 2.3522219000000177, 'Paris, France', '2017-12-10 19:48:58', 47, '2017-12-10 19:48:58', 0, 2, 1, NULL, 'Infirmier(e) requis(e)', 'bac+3', 'HJRA', 'Hopital', NULL),
(37, 9, 2, 3, 'Ingénieur en mine', '5 ans', 1, 43.296482, 5.369779999999992, 'Marseille, France', '2017-12-10 19:48:58', 39, '2017-12-10 19:48:58', 0, 2, 1, NULL, 'Ambatovy', 'bac+5', 'Ambatovy', 'Secteur minier', NULL),
(38, 10, 2, 1, 'Stagiaire en développement informatique', '6 mois', 1, 43.7101728, 7.261953199999994, 'Nice, France', '2017-12-10 19:48:58', 40, '2017-12-10 19:48:58', 0, 30, 1, NULL, 'Chargez de développement', 'BAC+3', 'GROUPE STAR', 'Boission alimentaire', NULL),
(39, 7, 2, 2, 'Responsable RH', '3 mois', 1, 43.604652, 1.4442090000000007, 'Toulouse, France', '2017-12-10 19:48:58', 37, '2017-12-10 19:48:58', 0, 2, 1, NULL, 'Chargé d\'entretien', 'BAC +2', 'ELiba', 'Fournisseur de produits et services informatiques', NULL),
(40, 8, 2, 2, 'TECH 2018 - Technicien d\'Inspection - France H/F', '7 mois', 1, 48.2020471, -2.93264350000004, 'Bretagne, France', '2017-12-10 19:48:58', 12, '2017-12-10 19:48:58', 0, 2, 1, NULL, 'Technicien supérieur', 'BAC +3', 'QHSE', 'Services informatiques', NULL),
(41, 9, 2, 2, 'Responsable Exploitation H/F', '1 an', 1, 48.84991979999999, 2.637041100000033, 'Île-de-France, Franc', '2017-12-10 19:48:58', 32, '2017-12-10 19:48:58', 0, 2, 1, NULL, 'Test', 'bac +3', 'QHSE', 'Test', NULL),
(42, 7, 2, 2, 'Conducteur de matériel de collecte polyvalent équipier de collecte', '8 mois', 1, 47.7632836, -0.3299686999999949, 'Pays de la Loire, Fr', '2017-12-10 19:48:58', 33, '2017-12-10 19:48:58', 0, 2, 1, NULL, 'Test', 'bac+3', 'QHSE', 'TEST', NULL),
(43, 8, 2, 2, 'Chef de Projets Éoliens H/F', '8 mois', 1, 47.081012, 2.398781999999983, 'Bourges, France', '2017-12-10 19:48:58', 58, '2017-12-10 19:48:58', 0, 2, 1, NULL, 'Test', 'Test', 'QHSE', 'Test', NULL),
(44, 6, 2, 1, 'Technicien SAV Hydraulique H/F', '1 an', 1, 48.828508, 2.2188068000000385, 'Hauts-de-Seine, Fran', '2017-12-10 19:48:58', 19, '2017-12-10 19:48:58', 0, 2, 1, NULL, 'TestT', 'BAC +5', 'QHSE', 'Test', NULL),
(45, 10, 17, 1, 'test', 's', 1, 45.764043, 4.835658999999964, 'Lyon, France', '2017-12-10 19:48:58', 8, '2017-12-10 19:48:58', 0, 2, 1, NULL, 'sdf', 'sdf', 'sdf', 'dsf', NULL),
(46, 8, 17, 2, 'Test 2', '3 ans', 1, 44.853672, 1.819831000000022, 'Autoire, France', '2017-12-10 19:48:58', 20, '2017-12-10 19:48:58', 0, 30, 1, NULL, 'Test', 'Test sdlfkj', 'ET', 'Test', NULL),
(47, 7, 17, 1, 'Test 3', '5 mois', 1, 43.72979099999999, 6.57288589999996, 'Bargème, France', '2017-12-10 19:48:58', 18, '2017-12-10 19:48:58', 0, 60, 1, NULL, 'Test', 'test', 'test', 'test', NULL),
(48, 9, 17, 1, 'Test 4', '8 mois', 1, 44.07004299999999, 0.9001660000000129, 'Auvillar, France', '2017-12-10 19:48:58', 58, '2017-12-10 19:48:58', 0, 30, 1, NULL, 'test', 'test', 'test', 'test', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `param_candidat`
--

CREATE TABLE `param_candidat` (
  `id` int(11) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `categorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `sess_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `sess_data` blob NOT NULL,
  `sess_time` int(10) UNSIGNED NOT NULL,
  `sess_lifetime` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `sessions`
--

INSERT INTO `sessions` (`sess_id`, `sess_data`, `sess_time`, `sess_lifetime`) VALUES
('1c3aad3762be72e4bf4930bee8eb86c3', 0x5f7366325f617474726962757465737c613a373a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a2232796f63774150786d68785f326d34755551586635515175394a484a3755557676757a684f4e493967324d223b733a31343a225f73656375726974795f6d61696e223b733a3733353a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3634373a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3630373a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3236353a7b613a383a7b693a303b733a34393a22747474747b614746454f37716a6451717444645743544d514e51345077766546687a45596e39706465734d6e4e544f517d223b693a313b733a34333a22614746454f37716a6451717444645743544d514e51345077766546687a45596e39706465734d6e4e544f51223b693a323b733a31333a22746573742063616e6469646174223b693a333b733a31333a22546573742063616e6469646174223b693a343b623a313b693a353b693a31383b693a363b733a32363a226e6f72617a6166696e6472616b6f746f40676d61696c2e636f6d223b693a373b733a32363a226e6f72617a6166696e6472616b6f746f40676d61696c2e636f6d223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a313b733a383a22706f7374756c6564223b693a323b733a34303a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e646964617475726574223b733a34333a226953572d695f41355f517a36776f474552343131376e32686277444d53564b7978692d6b4e54614f363338223b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a223332436571434130536c323876726c38765f734e4930576f44655a754f50734b656e2d386d4157736c4367223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323933313638343b733a313a2263223b693a313531323933313232393b733a313a226c223b733a313a2230223b7d, 1512931684, 1440),
('201c620619bcc3030ed9eaecc803f136', 0x5f7366325f617474726962757465737c613a31373a7b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a225064684c644836754a556f506b7a6c4d68345146646469556436744d71757068626f654f38763169364b30223b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a33333a22687474703a2f2f7777772e7761646167652e66722f63616e64696461742e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a2272746c654f5951646b54415066733341517443373753497363443562716a4538636f785649775a737a6c67223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a373b733a383a22706f7374756c6564223b693a303b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f637666696c65223b733a34333a224b345266334e37794e537a4679687177674259473130624167487975696c706430396b4455544963336a59223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f636f6d706574656e6365223b733a34333a22634d6e425979336b6369624e44416c32704f4338374f6352633673646874465a516c6d525836797a6c5541223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f65746174636976696c223b733a34333a2233484558396852577a577559446e6e56553846316f79566e395668686b4e2d4e506f526754584654473477223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f657870657269656e6365223b733a34333a224e474f416d7749564f5a356a6668686b73734e5677525665435f594b50302d4a4c475170456f4365386f77223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f666f726d6174696f6e223b733a34333a223448423665316d4374565447376131374f7034734a744158434e78342d58695f312d374938664a6c53494d223b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f6c616e677565223b733a34333a2269414475355669546e4f6e333758367573424559584571383974787732754c783241336d4734686e62726f223b733a32393a225f637372662f65636f6a6f625f7573657262756e646c655f696d616765223b733a34333a2241636d5047787938694f66325a565770366a6f74534b6b76454f564f646c496951756f42744f624f643938223b733a31353a225f637372662f706172616d65747265223b733a34333a2230344d717955677872396e544a4762433136556745714b306b6f6f6d2d464c427a45786c4a6b5730715055223b733a31333a225f637372662f70726f66696c65223b733a34333a223551532d78534959456a525a4a66346f6e46305f4b626353343274495148522d5a6d494446326a7854646f223b733a32313a225f637372662f6368616e67655f70617373776f7264223b733a34333a2233566279317464464a2d775034523147577a465571704e734f6950766f47617876536e664e4b3076786a51223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323536383037393b733a313a2263223b693a313531323536383033323b733a313a226c223b733a313a2230223b7d, 1512568079, 1440),
('24c200e81a199855aa5ac1e650ced2da', 0x5f7366325f617474726962757465737c613a31353a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a33333a22687474703a2f2f7777772e7761646167652e66722f63616e64696461742e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a2266304b3350367645626f48664d37493264723670585f6e46594656574d616d5f475153357a493548344155223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a373b733a383a22706f7374756c6564223b693a303b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f637666696c65223b733a34333a222d4150626b723579615238426843506972514a7a74746a30533376364c5a6c6e75713175696369694b4873223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f636f6d706574656e6365223b733a34333a2272546369697879344b52516458496a4d6d415262537069516e70585f426936335737626c53644b6c2d7959223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f65746174636976696c223b733a34333a227550394d4e3333355a6c5f5f42532d45785435375f6563345269454c5275584351705a4e41694667473149223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f657870657269656e6365223b733a34333a2237475776362d6d57667666356f3576487a5243794a4c6931556e457752646e30506e52326a684774686d49223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f666f726d6174696f6e223b733a34333a225435667530514c4768464e70624c41466f7656447478524b47634c382d7757706f5a6a5a73615a6d693177223b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f6c616e677565223b733a34333a22515661354b76746a436e7a3568477568332d733531506f78586d776b727551317172674b577a72776f3545223b733a32393a225f637372662f65636f6a6f625f7573657262756e646c655f696d616765223b733a34333a226c5a396d68522d617955336177766a63634271557269636430765934577469487a564e59416a437672396b223b733a31353a225f637372662f706172616d65747265223b733a34333a227534375f6c4d37446341374565657854726d794557522d614e6f715056514634536877634265384f686c34223b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a22544a66384853654b4352636a48316c585f66787750385568304e664866305f7979384b5176506663515877223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323531353730323b733a313a2263223b693a313531323531353136323b733a313a226c223b733a313a2230223b7d, 1512515702, 1440),
('26cb8094635e73955f70122419cf50c4', 0x5f7366325f617474726962757465737c613a343a7b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a2237544655753078544b52786d63504e565f62726c574d50426d4153486334506d6338525363554e70577455223b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a33303a22687474703a2f2f7761646167652e66722f7265637275746575722e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a22342d564c463674513841514e53336969413675784f306c357a7770306a7975577147353753455f73567549223b733a31383a225f637372662f726567697374726174696f6e223b733a34333a22695f524132702d6f6f4935385a706b4c7a4b6e746b316432434a69666d5a7559324b484479754966573577223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323738373638373b733a313a2263223b693a313531323738373635373b733a313a226c223b733a313a2230223b7d4244435f53657373696f6e53616c747c733a33323a223836656265333861383339663863393834633865373566353064313633663064223b, 1512787687, 1440),
('348bb4e62830afc00626765e04ca3368', 0x5f7366325f617474726962757465737c613a393a7b733a34303a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e646964617475726574223b733a34333a22763133737376656337685663466d32676c744e50372d636354616972322d4f315363416d354a666d515638223b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a2252674f534f6d68774836635368527a582d53776831306c364269526468555931517836727062796c736241223b733a31383a225f637372662f61757468656e746963617465223b733a34333a22556f556e3479576a6744513176725164597949563746397833566f7234785568626d6b6b317a69684b4355223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a373b733a383a22706f7374756c6564223b693a383b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f637666696368696572223b733a34333a2254334f635375394a654638685f33587a6366565572647843555a53786149436a315f32637469674f5a6155223b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f6c6574747265223b733a34333a226c71794e33625047544c744d3576484a3633634b4f4e736a30627344564341367a4a32345674496f4b2d4d223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323835303739393b733a313a2263223b693a313531323834363639303b733a313a226c223b733a313a2230223b7d, 1512850799, 1440),
('42b26cc7c2feb2a1c558877c133eaa89', 0x5f7366325f617474726962757465737c613a333a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a2248744442664f47544e2d554477696d7043586430707949645f466659394d664f34626b735f4374464b7767223b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a2253337971746f4d4a2d714b564b37456b4f6b43324575496264585f345a416a55566e537a4a4d30326f3955223b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a32393a22687474703a2f2f7761646167652e66722f63616e64696461742e706870223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323431353331373b733a313a2263223b693a313531323431353035303b733a313a226c223b733a313a2230223b7d, 1512415317, 1440),
('63de3b673d6bec4076e957fc1524cd3d', 0x5f7366325f617474726962757465737c613a353a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a22477a795f535f79636e3369414678586a6f724d413039695954664354373766475a366d374358425534356b223b733a31343a225f73656375726974795f6d61696e223b733a3730343a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3631363a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3537363a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3233333a7b613a383a7b693a303b733a34393a22747474747b77427645347a7876426678624b5052524e6f4b5648674a646b704c7055674f414a664a49506b515a6e4e777d223b693a313b733a34333a2277427645347a7876426678624b5052524e6f4b5648674a646b704c7055674f414a664a49506b515a6e4e77223b693a323b733a363a22746573742072223b693a333b733a363a22746573742072223b693a343b623a313b693a353b693a31373b693a363b733a31383a2265636f6a6f62667240676d61696c2e636f6d223b693a373b733a31383a2265636f6a6f62667240676d61696c2e636f6d223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31343a22524f4c455f524543525554455552223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a363a226f6666726573223b693a313b733a31323a2263616e646964617475726573223b733a313a2230223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323637363035313b733a313a2263223b693a313531323637353939363b733a313a226c223b733a313a2230223b7d, 1512676051, 1440),
('6b12bdd6346a789393d2f547424d65d8', 0x5f7366325f617474726962757465737c613a323a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a2273546634613650464974735f67782d4637374a663330445a4b734159425f7a6766697866486f716b797830223b733a32333a225f73656375726974792e6c6173745f757365726e616d65223b733a363a224e6f6d656e61223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323435313731373b733a313a2263223b693a313531323435313731303b733a313a226c223b733a313a2230223b7d, 1512451717, 1440),
('6bb7e88ddeec1a3168ecf3ec6f04dc58', 0x5f7366325f617474726962757465737c613a31353a7b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a2258623450306a6441645162366e6756535673477a4a7a2d4654755768463366704a51535667665f7874386f223b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a33333a22687474703a2f2f7777772e7761646167652e66722f63616e64696461742e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a22366d586f694b79564a5a4b4f355255514855305233796c45765244654836682d4f5f5a4a69444b6d6a7267223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a373b733a383a22706f7374756c6564223b693a303b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f637666696c65223b733a34333a2267654e52346d676c5154656a786976346c4f447550356f65436434755a38346668656a4c4e4169537a4d63223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f636f6d706574656e6365223b733a34333a226e43306270484a51662d4736317569597568745862674b3043624b383754717577417442775f5f73756a51223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f65746174636976696c223b733a34333a22517a594a3635793750434d43745847317763596636386b546e386466785a613549665332426d2d78537859223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f657870657269656e6365223b733a34333a22436f4a5179556b7543356c42703077657a325178387763735741666a72384d64437a314465436847716741223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f666f726d6174696f6e223b733a34333a22496c695750675039434d63704a724d7252495549695a585056495549647a414b39746f6264757a54486951223b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f6c616e677565223b733a34333a224c6753316a3670532d626f5864714852733534452d65645f6e4367686377636e6f6f3579495a45336f6677223b733a32393a225f637372662f65636f6a6f625f7573657262756e646c655f696d616765223b733a34333a2232524d326c37305a5357456b62446175432d7375515a502d73316b6a2d306e4f6f6e614f596d7043593873223b733a31353a225f637372662f706172616d65747265223b733a34333a226e4a444858475735566864724e5a4a4a7970776734346e7a6c3171555475676e6e784d4b6f57574e796673223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323438343535303b733a313a2263223b693a313531323438343438363b733a313a226c223b733a313a2230223b7d, 1512484550, 1440),
('7415e202cd644b75fcae9573ebf53315', 0x5f7366325f617474726962757465737c613a363a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a33333a22687474703a2f2f7777772e7761646167652e66722f63616e64696461742e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a2267656c6f546d674c4177324e5345577a53624e326f6f4a335646536a68377278596259356c563059355159223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a373b733a383a22706f7374756c6564223b693a303b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323536313532353b733a313a2263223b693a313531323536313531393b733a313a226c223b733a313a2230223b7d, 1512561525, 1440),
('745cacad3f5974b22845111477a47dd7', 0x5f7366325f617474726962757465737c613a363a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a226d4f59774a4c696b364b485a6d373532705946614d665f47584b5a50686c62554a6a41496c79372d684241223b733a31343a225f73656375726974795f6d61696e223b733a3730343a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3631363a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3537363a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3233333a7b613a383a7b693a303b733a34393a22747474747b77427645347a7876426678624b5052524e6f4b5648674a646b704c7055674f414a664a49506b515a6e4e777d223b693a313b733a34333a2277427645347a7876426678624b5052524e6f4b5648674a646b704c7055674f414a664a49506b515a6e4e77223b693a323b733a363a22746573742072223b693a333b733a363a22746573742072223b693a343b623a313b693a353b693a31373b693a363b733a31383a2265636f6a6f62667240676d61696c2e636f6d223b693a373b733a31383a2265636f6a6f62667240676d61696c2e636f6d223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31343a22524f4c455f524543525554455552223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a363a226f6666726573223b693a313b733a31323a2263616e646964617475726573223b733a313a2231223b733a31333a225f637372662f70726f66696c65223b733a34333a224a336354573736445f376779504f3747716e2d577656536a6b5a385f3850506f3261506838344a30554867223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323637353734333b733a313a2263223b693a313531323637353538323b733a313a226c223b733a313a2230223b7d, 1512675743, 1440),
('79a3e4627bdd991133faca9b6fdc7945', 0x5f7366325f617474726962757465737c613a313a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a34313a22687474703a2f2f7761646167652e66722f63616e64696461742f6d6f6469666965722d63762e706870223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323638333832313b733a313a2263223b693a313531323638333830313b733a313a226c223b733a313a2230223b7d, 1512683821, 1440),
('7aae8aa4ed2d4e1e0a3c6c95ea204fcc', 0x5f7366325f617474726962757465737c613a363a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a226d7149436967356a61317a5a6650576c4b42447139304a444144696144514465444e4a5736326b5f663849223b733a31383a225f637372662f726567697374726174696f6e223b733a34333a22313438724f796b6d3832626f505069524b71336d7343596f597a5f334e50436d517a745a546b5566534849223b733a32383a224244435f4973536f6c7665645f726567697374657263617074636861223b733a343a22623a313b223b733a33343a224244435f436f6465436f6c6c656374696f6e5f726567697374657263617074636861223b733a3431383a224f3a31383a224244435f436f6465436f6c6c656374696f6e223a313a7b733a33373a22004244435f436f6465436f6c6c656374696f6e005f6f773435793270696278626863733332223b613a313a7b733a33323a223562623366346630336233366336613164393062393434626665373336373265223b4f3a383a224244435f436f6465223a363a7b733a33373a22004244435f436f6465005f4f6c376873613265357474353664676764336865796776797933223b733a363a225a4548585759223b733a33373a22004244435f436f6465005f3173356f6962756935767736707276306b72766636757836697a223b693a313531323636343438363b733a33373a22004244435f436f6465005f31397a386833726863643168716a777a37696678363976377531223b4e3b733a32373a22004244435f436f6465005f6f6768786b67677663376f7177627366223b623a313b733a32373a22004244435f436f6465005f4f743678366463376376366f636e3976223b4e3b733a32373a22004244435f436f6465005f4f3137757530706b33777237726a6434223b693a303b7d7d7d223b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a22687a456c4861546a5473445f76514c664f53784a6a55727336346259684563365244715f50545842334351223b733a32333a225f73656375726974792e6c6173745f757365726e616d65223b733a31343a225465737420726563727574657572223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323636393034363b733a313a2263223b693a313531323636343435373b733a313a226c223b733a313a2230223b7d4244435f53657373696f6e53616c747c733a33323a226534643036636631343730346137356537373238353366396636663639663234223b, 1512669046, 1440),
('834f5ec979cade00e1468eb19ff7e829', 0x5f7366325f617474726962757465737c613a303a7b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323734383630343b733a313a2263223b693a313531323734383537393b733a313a226c223b733a313a2230223b7d, 1512748604, 1440),
('866fd93688bcbed818c02994644f6102', 0x5f7366325f617474726962757465737c613a31393a7b733a34303a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e646964617475726574223b733a34333a22724e796b2d6546456d417546674139395a79397835325a5832514b4f79666c744d4e616f31526336503049223b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a22474359524459653477794c4261367a6e4d683431664a41657130495948796b4d5643796f706a6b35634441223b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a33333a22687474703a2f2f7777772e7761646167652e66722f63616e64696461742e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a224c6e617445693565724939574575323547775031536e784c6269516a4f4e774d4b383378454c456c704777223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a373b733a383a22706f7374756c6564223b693a31303b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f637666696c65223b733a34333a227773486b414c54684b4e7272506c575448456e35744242417a32376b4f37525a7651444264434f6c4d4934223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f636f6d706574656e6365223b733a34333a2267563356766250364d2d48473836546e38534b666746346c56513469643766666458676734575a6a545955223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f65746174636976696c223b733a34333a2237704c53665f395f6c494376714a48616a6a6b4e337556354856395549726e694c737a7476764e545f4c34223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f657870657269656e6365223b733a34333a2261436f444630385533755a6e4c72647342534164536f687264506172376831756b6c4a74703543526e5634223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f666f726d6174696f6e223b733a34333a22305042664f6354664c786f55795333525645314d705a7842737752536f54326d527a466365574f56366b4d223b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f6c616e677565223b733a34333a225a544f784758635879537367657961756c6c5a41676473376e77536f766463454d63635f4862305a714955223b733a32393a225f637372662f65636f6a6f625f7573657262756e646c655f696d616765223b733a34333a22305f6741436962643358303150557751387234354749706b65316f5739376a4e536e7a5974746f6f49486f223b733a31353a225f637372662f706172616d65747265223b733a34333a2244643034456e705a6f776a6e527276662d674c356436473774676f582d3569473579547675397256436273223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f637666696368696572223b733a34333a22576e7332384e7377794f71326c70697a6a6149423952444b75325463733644574437704d474e7733344e63223b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f6c6574747265223b733a34333a22485f4a4a2d765f586d533047714e51637477336d4b4748794e5838654f77702d6251434c3857356a39434d223b733a31333a225f637372662f70726f66696c65223b733a34333a22487a576565745061516943794969326b6552676e4553763443754a71306c67477a613341483439675a5f77223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323835393337323b733a313a2263223b693a313531323835393239363b733a313a226c223b733a313a2230223b7d, 1512859372, 1440),
('891813cf44ae4a1f791bb94cf05f9bed', 0x5f7366325f617474726962757465737c613a313a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a34313a22687474703a2f2f7761646167652e66722f63616e64696461742f706172616d657472652d656d61696c223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323634303739303b733a313a2263223b693a313531323634303739303b733a313a226c223b733a313a2230223b7d, 1512640790, 1440),
('94e69f8ce7ba6ebfba9b3078f6485ed9', 0x5f7366325f617474726962757465737c613a383a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a22586558673742706a6e376965327569586c696c64333644706f4b344a57594144625262416761446d694b73223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a373b733a383a22706f7374756c6564223b693a303b733a31333a225f637372662f70726f66696c65223b733a34333a222d675344684735655f325345445346436a6a43547251334852506f775f61724d765154543462384a467155223b733a32313a225f637372662f6368616e67655f70617373776f7264223b733a34333a22584e4e46334b337838725752324e6f534b5f4c346a44672d524d34736b6a694d6648314b76674d33363051223b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a2253653672736a595f55626c383059363636483675335576784f4b655a4a6c43305044733877637a70454c59223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323439353035333b733a313a2263223b693a313531323439343939323b733a313a226c223b733a313a2230223b7d, 1512495053, 1440),
('968f941b478df926b882a812d867f365', 0x5f7366325f617474726962757465737c613a32303a7b733a34303a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e646964617475726574223b733a34333a2233416e5f686a33734a6671555952674b6e4f6c4539676f5f4f6853744474745054755f5649577069534951223b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a22695659435358486c4b4e4179566a5349414b51634e307a773162422d3476454679653632714959454f7563223b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a33333a22687474703a2f2f7777772e7761646167652e66722f63616e64696461742e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a224d736f64473368716349696c4472534555436750694144354a70614e6a46656a736b4d3677726753485751223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a383b733a383a22706f7374756c6564223b693a31303b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f637666696c65223b733a34333a226d3768444965314f56773242743247397a5574616a4f556756315679665a3555735f497246334538536d45223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f636f6d706574656e6365223b733a34333a227136594169664c7532347a77326b675a41754c70497273586e5441787a6a5a653233586d755462665a5651223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f65746174636976696c223b733a34333a2234596e43522d327667527261333434625a7858496b7767646357496761433535396c68456d727179736f30223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f657870657269656e6365223b733a34333a2237527a376f2d4b354774644b364b387352536a5537716f32436b30685a3867445a536c6763776b574a5a30223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f666f726d6174696f6e223b733a34333a227666756f4a495846367677317a51575865687a73454b4747396564654d37776e66436478744d7936446f6b223b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f6c616e677565223b733a34333a2252353343644f517961423063614976322d562d712d76344e314b796532495158424f334d49524850726238223b733a32393a225f637372662f65636f6a6f625f7573657262756e646c655f696d616765223b733a34333a226830763238584534356d754f3242696f5661486c4e7573316e422d4e6c5a6335724f626a3146524c776277223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f637666696368696572223b733a34333a22705f686f76585847686849636b74466649355472726277714c582d6443783752323052525779494f47696f223b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f6c6574747265223b733a34333a224a45665f4e41665348305748676a50664c775a344e4a674b5a4a627075394b747a6e3262576c484e534c55223b733a31353a225f637372662f706172616d65747265223b733a34333a22575377534546774e554c4868376c37364d2d55395757695f4573367263614a5a7a6f475637712d3474336b223b733a31333a225f637372662f70726f66696c65223b733a34333a226d49587047726847617653513738754d7753536c4f704251465633417037553762575a5a41424d685f6f55223b733a32313a225f637372662f6368616e67655f70617373776f7264223b733a34333a22635a5948564563346d636e4831586b4e4b543731773450736c33736f596b6665616972486c73776b646159223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323931353938323b733a313a2263223b693a313531323931353836303b733a313a226c223b733a313a2230223b7d, 1512915982, 1440),
('97e838882d21dcd184b055e2cdf58ac3', 0x5f7366325f617474726962757465737c613a323a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a32393a22687474703a2f2f7761646167652e66722f63616e64696461742e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a2255635642366a425077367934594f61586c39516379735865314d493252787250357a45437272516e774b41223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323634303338303b733a313a2263223b693a313531323634303335373b733a313a226c223b733a313a2230223b7d, 1512640380, 1440),
('9c83f6d03bb211b99d633bc569032c5e', 0x5f7366325f617474726962757465737c613a393a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a226a4e377979742d4b45526f417657787a6568452d79363972466871516f756c7779506f645a43675f366963223b733a31343a225f73656375726974795f6d61696e223b733a3733303a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3634323a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3630323a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3235373a7b613a383a7b693a303b733a34393a22747474747b574253444366387547514f5a683135697856527574683458327577496676667058376b46316a41647172347d223b693a313b733a34333a22574253444366387547514f5a683135697856527574683458327577496676667058376b46316a4164717234223b693a323b733a31343a2261646d696e697374726174657572223b693a333b733a31343a2241646d696e697374726174657572223b693a343b623a313b693a353b693a31343b693a363b733a32313a22696e6665726d656469636140676d61696c2e636f6d223b693a373b733a32313a22696e6665726d656469636140676d61696c2e636f6d223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31363a22524f4c455f53555045525f41444d494e223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a383a226e65775573657273223b693a333b733a353a227573657273223b733a313a2236223b733a363a226f6666726573223b733a323a223132223b733a373a2265787069726564223b693a303b733a383a226d6f646966696564223b693a303b733a31303a226e6f7476616c69646564223b693a303b733a383a2273757370656e6475223b693a303b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323733323033383b733a313a2263223b693a313531323733313930323b733a313a226c223b733a313a2230223b7d, 1512732038, 1440),
('9d13fe031115f3f0069489a1f7bc9a4b', 0x5f7366325f617474726962757465737c613a313a7b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a22396659566b52457a465a684e7733725f5f74775a583339642d475a666f337773744e612d53767169577034223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323538303632393b733a313a2263223b693a313531323538303630323b733a313a226c223b733a313a2230223b7d, 1512580629, 1440),
('9ef6ed5b3ea7b73fc1da4a320667f135', 0x5f7366325f617474726962757465737c613a373a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a33333a22687474703a2f2f7777772e7761646167652e66722f63616e64696461742e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a22457755676753684a4854726e57667541505079464a6d6c7a76744450346245573565467338625a55747945223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a373b733a383a22706f7374756c6564223b693a303b733a31333a225f637372662f70726f66696c65223b733a34333a226a5651415f454d6c703952373944586c34624361515470504e776b6c3044752d5a7032425a64473573396b223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323535373734393b733a313a2263223b693a313531323535373733343b733a313a226c223b733a313a2230223b7d, 1512557749, 1440),
('a09c3209409c4b9b5aaaee524e9c6e99', 0x5f7366325f617474726962757465737c613a313a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a33393a22687474703a2f2f7761646167652e66722f7265637275746575722f62616e71756563762e706870223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323931343238383b733a313a2263223b693a313531323931343231343b733a313a226c223b733a313a2230223b7d, 1512914288, 1440),
('a1f21656d3a031e04311c6fa03226766', 0x5f7366325f617474726962757465737c613a363a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a227456646e5453433875655070493147652d326735524458685a6572326734495434594c6b43344334735949223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a373b733a383a22706f7374756c6564223b693a303b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a225433554f2d6645344d38554269494e7032533830453257474a584671494955465478787447543241643841223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323634353137323b733a313a2263223b693a313531323634353136323b733a313a226c223b733a313a2230223b7d, 1512645172, 1440),
('a8eb0600bb7867b6d5e07d8e13e4fcdf', 0x5f7366325f617474726962757465737c613a313a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a33333a22687474703a2f2f7761646167652e66722f6d6573736167657269652f696e626f78223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323836303234373b733a313a2263223b693a313531323836303138323b733a313a226c223b733a313a2230223b7d, 1512860247, 1440);
INSERT INTO `sessions` (`sess_id`, `sess_data`, `sess_time`, `sess_lifetime`) VALUES
('b61a8a22e931d3686b67faf1be5e4bba', 0x5f7366325f617474726962757465737c613a31363a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a32393a22687474703a2f2f7761646167652e66722f63616e64696461742e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a2278534c5276356456776938616c776e375a3243656353765f3138413647467176513270435930733438656f223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a373b733a383a22706f7374756c6564223b693a303b733a31353a225f637372662f706172616d65747265223b733a34333a225663436c7978664459732d317151395972663271516a7438775f364c593468594577586f696d53344a4177223b733a31333a225f637372662f70726f66696c65223b733a34333a224c6e51556c4841686b673339376b774e4f35484f44475555357968536a683541495a7a4d397731376b5834223b733a32313a225f637372662f6368616e67655f70617373776f7264223b733a34333a2266376f695174416f63477076465a7871594572703275712d63445655524436356463354c6748704a736f73223b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f637666696c65223b733a34333a224f3949314937663344334e5f6e37506143495a48346b78595a306a36584554673473654c46625932507345223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f636f6d706574656e6365223b733a34333a226e4732496c776757776f43596f515f673155387030764a576d4f4653616f375f4d314842532d7930647067223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f65746174636976696c223b733a34333a226e54787575376d5f496e7642475a557479515a344a50365f4a53584a38564a673071394751583530457967223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f657870657269656e6365223b733a34333a2252764168324f34697775643162564d43757575547961457866553561346538772d596e643238327748794d223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f666f726d6174696f6e223b733a34333a22566261584f6c6753756e64512d6368566b5841524d583631495134425f78303953596d7653565167555541223b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f6c616e677565223b733a34333a22346a6b72436e694866782d4b4a5a356d5f66424766397134776b4871666e6c317a6744795449534d767341223b733a32393a225f637372662f65636f6a6f625f7573657262756e646c655f696d616765223b733a34333a2265786147556c51374873716f586c36485430786c79534376486d72566d4b497a355736645a436a354b5345223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323433383332363b733a313a2263223b693a313531323433383237393b733a313a226c223b733a313a2230223b7d, 1512438326, 1440),
('bc2dd37788b08e682bde34cc6348e161', 0x5f7366325f617474726962757465737c613a363a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a22554866476f6458634d52516151764f515846535a2d3637375f63763243307136624c412d78442d37683330223b733a31343a225f73656375726974795f6d61696e223b733a3730343a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3631363a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3537363a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3233333a7b613a383a7b693a303b733a34393a22747474747b77427645347a7876426678624b5052524e6f4b5648674a646b704c7055674f414a664a49506b515a6e4e777d223b693a313b733a34333a2277427645347a7876426678624b5052524e6f4b5648674a646b704c7055674f414a664a49506b515a6e4e77223b693a323b733a363a22746573742072223b693a333b733a363a22746573742072223b693a343b623a313b693a353b693a31373b693a363b733a31383a2265636f6a6f62667240676d61696c2e636f6d223b693a373b733a31383a2265636f6a6f62667240676d61696c2e636f6d223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31343a22524f4c455f524543525554455552223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a313b733a363a226f6666726573223b693a313b733a31323a2263616e646964617475726573223b733a313a2231223b733a33343a225f637372662f65636f6a6f625f72656372757465757262756e646c655f6f66667265223b733a34333a2239445157614230693156373379677a626a5548645f4d3437516341696a566a33305046694c486543723751223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323736333931323b733a313a2263223b693a313531323736333837353b733a313a226c223b733a313a2230223b7d, 1512763912, 1440),
('c4b47ad3160bb2d7e70b63e6e9fb8765', 0x5f7366325f617474726962757465737c613a323a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a35303a22687474703a2f2f7761646167652e66722f6170705f6465762e7068702f63616e64696461742f67657265722d63762e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a224c544d6d4b5346335565714762386730443156444449706d786e74646639536e49426c476d546c7752786b223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323638323938363b733a313a2263223b693a313531323638323936303b733a313a226c223b733a313a2230223b7d, 1512682986, 1440),
('d1e5354f429e9362e54c32e1f027af3f', 0x5f7366325f617474726962757465737c613a393a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a2261764b61336376415a4377686d52394745546875663979736e386d4e72655a345f67364b4c594e486a7951223b733a31343a225f73656375726974795f6d61696e223b733a3733303a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3634323a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3630323a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3235373a7b613a383a7b693a303b733a34393a22747474747b574253444366387547514f5a683135697856527574683458327577496676667058376b46316a41647172347d223b693a313b733a34333a22574253444366387547514f5a683135697856527574683458327577496676667058376b46316a4164717234223b693a323b733a31343a2261646d696e697374726174657572223b693a333b733a31343a2241646d696e697374726174657572223b693a343b623a313b693a353b693a31343b693a363b733a32313a22696e6665726d656469636140676d61696c2e636f6d223b693a373b733a32313a22696e6665726d656469636140676d61696c2e636f6d223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31363a22524f4c455f53555045525f41444d494e223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a383a226e65775573657273223b693a333b733a353a227573657273223b733a313a2237223b733a363a226f6666726573223b733a323a223135223b733a373a2265787069726564223b693a303b733a383a226d6f646966696564223b693a303b733a31303a226e6f7476616c69646564223b693a303b733a383a2273757370656e6475223b693a303b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323933313636313b733a313a2263223b693a313531323933313633333b733a313a226c223b733a313a2230223b7d, 1512931661, 1440),
('d328998b00fb013e1c00c5cfa47b7472', 0x5f7366325f617474726962757465737c613a373a7b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a22693374503051326e6632597a33734635596c71536a2d51376b34726d71453541535a302d4b582d52383745223b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a33333a22687474703a2f2f7777772e7761646167652e66722f63616e64696461742e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a222d6e2d4d76564a6a6f41515f6437323856627137365242745168374a4c6a317a4678553852707674503455223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a373b733a383a22706f7374756c6564223b693a303b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323539383231313b733a313a2263223b693a313531323539383230343b733a313a226c223b733a313a2230223b7d, 1512598211, 1440),
('d404aee35040d74f82e6fd79a9e534bc', 0x5f7366325f617474726962757465737c613a323a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a32393a22687474703a2f2f7761646167652e66722f63616e64696461742e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a22484e6b5437377a50503853422d706f684c734877702d636a4c644964336d7832506256455936646b506a59223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323733323536333b733a313a2263223b693a313531323733323535333b733a313a226c223b733a313a2230223b7d, 1512732563, 1440),
('da0f36654b2cadb62f491ed684056641', 0x5f7366325f617474726962757465737c613a323a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a22717a5a336e6631736d4f48753245575939515873715a455a546e6132455559664d516a7075776e4c5f5649223b733a32333a225f73656375726974792e6c6173745f757365726e616d65223b733a31343a225465737420726563727574657572223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323636353736343b733a313a2263223b693a313531323636353631303b733a313a226c223b733a313a2230223b7d, 1512665764, 1440),
('e04c0d6ce3f3bf30915d16129f39ba84', 0x5f7366325f617474726962757465737c613a353a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a22365f6a736864723134666c434b46775254644c6b4c4874704751766342764b2d5868666677344a666a7151223b733a31343a225f73656375726974795f6d61696e223b733a3730343a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3631363a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3537363a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3233333a7b613a383a7b693a303b733a34393a22747474747b77427645347a7876426678624b5052524e6f4b5648674a646b704c7055674f414a664a49506b515a6e4e777d223b693a313b733a34333a2277427645347a7876426678624b5052524e6f4b5648674a646b704c7055674f414a664a49506b515a6e4e77223b693a323b733a363a22746573742072223b693a333b733a363a22746573742072223b693a343b623a313b693a353b693a31373b693a363b733a31383a2265636f6a6f62667240676d61696c2e636f6d223b693a373b733a31383a2265636f6a6f62667240676d61696c2e636f6d223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31343a22524f4c455f524543525554455552223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a313b733a363a226f6666726573223b693a343b733a31323a2263616e646964617475726573223b733a313a2231223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323931363235383b733a313a2263223b693a313531323931363235363b733a313a226c223b733a313a2230223b7d, 1512916258, 1440),
('e2181cacfd1d3f68f2500c9b1f6ce245', 0x5f7366325f617474726962757465737c613a31373a7b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a22423133525763364f3568624a795032353567454a7657366467646b6e706f4e347047622d337051464f4755223b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a32393a22687474703a2f2f7761646167652e66722f63616e64696461742e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a222d324a58645a385450724a786c416f2d686c744b77383831706a6d35373458304e6f655556474443355538223b733a31343a225f73656375726974795f6d61696e223b733a3639373a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3630393a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3536393a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3232373a7b613a383a7b693a303b733a34393a22747474747b756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e7475517d223b693a313b733a34333a22756e72724f6f756c5a3564345836784369584639394f4a594a75317669495864324f71574e6b794e747551223b693a323b733a343a2274657374223b693a333b733a343a2254657374223b693a343b623a313b693a353b693a31363b693a363b733a31373a226d6564656973406f75746c6f6f6b2e6672223b693a373b733a31373a226d6564656973406f75746c6f6f6b2e6672223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b733a363a22756e72656164223b693a303b733a353a227361766564223b693a373b733a383a22706f7374756c6564223b693a303b733a31353a225f637372662f706172616d65747265223b733a34333a2250633156583338635a504f48506a71524a68782d4f664547584f4d38685777375863532d375763315f6538223b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f637666696c65223b733a34333a224d474877576a3064575a654a5031623078753469594c6c4a6270705a5a493251666e5f345a41636357774d223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f636f6d706574656e6365223b733a34333a2275744d674872554f3849552d6a77446e33744f30426e584a5236464634785a52733259773130316c516551223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f65746174636976696c223b733a34333a2237384d30746f46795855776d3539492d37423065686130675252626538597a754c7678347a304b6677754d223b733a33383a225f637372662f65636f6a6f625f63616e646964617462756e646c655f657870657269656e6365223b733a34333a226a69673264465574344f654e37433872434d48643046397668714847334a6178463357565f4332526f3230223b733a33373a225f637372662f65636f6a6f625f63616e646964617462756e646c655f666f726d6174696f6e223b733a34333a2275546833384a4b46746237424a495f7552442d30544e5a77524648304f4e4b76626152556b50745f786e6b223b733a33343a225f637372662f65636f6a6f625f63616e646964617462756e646c655f6c616e677565223b733a34333a223258343330394e4b3558326561334b70504d48716658574535416a59436267686b626f35485f4c686e4e55223b733a32393a225f637372662f65636f6a6f625f7573657262756e646c655f696d616765223b733a34333a22657a79554b756c5075646f4d784874385a43354b4c4d7658456e5436776c39794c7070304f32374b46564d223b733a31333a225f637372662f70726f66696c65223b733a34333a224c6f61782d76396d656362636e6b345038696a3337457a75706d4c48684d3667786e5a696d62414e4b3738223b733a32313a225f637372662f6368616e67655f70617373776f7264223b733a34333a226a666936735743526969443367555930576c42796378766d6452374d5a664e7a786c6a524e646b67506130223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323436393134363b733a313a2263223b693a313531323436393032373b733a313a226c223b733a313a2230223b7d, 1512469147, 1440),
('eb6cd3ec5005a5d0fa8b651be55427ca', 0x5f7366325f617474726962757465737c613a333a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a34333a22687474703a2f2f7761646167652e66722f7265637275746575722f63616e6469646174757265732e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a224f5731752d6a494434734a326d583368564551553057386f445368442d476f6474794f7376624f68625f6b223b733a33393a225f637372662f65636f6a6f625f63616e646964617462756e646c655f63616e6469646174757265223b733a34333a226c6778567868616c4849384c50792d6f68685f626a586b494450446f72397a462d56654e51584969597638223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323736323238373b733a313a2263223b693a313531323735393237393b733a313a226c223b733a313a2230223b7d, 1512762287, 1440),
('f50b6bdb12ffdfcdf680fbe382052622', 0x5f7366325f617474726962757465737c613a323a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a33303a22687474703a2f2f7761646167652e66722f7265637275746575722e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a2246635852543145762d7039557556476a4550425153536b6c5a667175614735756e42355947496e65337430223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323732393537303b733a313a2263223b693a313531323732393439363b733a313a226c223b733a313a2230223b7d, 1512729570, 1440),
('f70ec14b8f81d0cb3abd3691f30d57e5', 0x5f7366325f617474726962757465737c613a323a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a35333a22687474703a2f2f7761646167652e66722f6170705f6465762e7068702f63616e64696461742f6d6f6469666965722d63762e706870223b733a31383a225f637372662f61757468656e746963617465223b733a34333a2269584830364d357342587442704f6766434d594b4d414663454b3944634552714a526e7930714e50785649223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323835393636333b733a313a2263223b693a313531323835383538363b733a313a226c223b733a313a2230223b7d, 1512859663, 1440),
('fd374b64e935f00ccbd2f82b3d087109', 0x5f7366325f617474726962757465737c613a313a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a32393a22687474703a2f2f7761646167652e66722f70726f66696c652f65646974223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313531323638363630393b733a313a2263223b693a313531323638363538373b733a313a226c223b733a313a2230223b7d, 1512686609, 1440);

-- --------------------------------------------------------

--
-- Structure de la table `sub_message`
--

CREATE TABLE `sub_message` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `isRead` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `thread`
--

CREATE TABLE `thread` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `is_spam` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `thread`
--

INSERT INTO `thread` (`id`, `created_by_id`, `subject`, `created_at`, `is_spam`) VALUES
(2, 16, 'Test', '2017-12-08 20:57:39', 0);

-- --------------------------------------------------------

--
-- Structure de la table `thread_metadata`
--

CREATE TABLE `thread_metadata` (
  `id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `last_participant_message_date` datetime DEFAULT NULL,
  `last_message_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `thread_metadata`
--

INSERT INTO `thread_metadata` (`id`, `thread_id`, `participant_id`, `is_deleted`, `last_participant_message_date`, `last_message_date`) VALUES
(3, 2, 17, 0, NULL, '2017-12-08 20:57:39'),
(4, 2, 16, 0, '2017-12-08 20:57:39', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `libelle` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `type`
--

INSERT INTO `type` (`id`, `libelle`) VALUES
(1, 'Candidat'),
(2, 'Recruteur');

-- --------------------------------------------------------

--
-- Structure de la table `type_clientele`
--

CREATE TABLE `type_clientele` (
  `id` int(11) NOT NULL,
  `libelle` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `type_clientele`
--

INSERT INTO `type_clientele` (`id`, `libelle`) VALUES
(1, 'B to B'),
(2, 'B to C'),
(3, 'B to B + B to C'),
(4, 'Non défini');

-- --------------------------------------------------------

--
-- Structure de la table `type_remuneration`
--

CREATE TABLE `type_remuneration` (
  `id` int(11) NOT NULL,
  `libelle` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `type_remuneration`
--

INSERT INTO `type_remuneration` (`id`, `libelle`) VALUES
(1, '≤ 20 K€'),
(2, 'de 20 à 25 K€'),
(3, 'de 25 à 30 K€'),
(4, 'de 30 à 35 K€'),
(5, 'de 35 à 40 K€'),
(6, 'de 40 à 50 K€'),
(7, 'de 50 à 60 K€'),
(8, 'de 60 à 80 K€'),
(9, 'de 80 à 100 K€'),
(10, 'de 100 à 150 K€'),
(11, '> 150 K€'),
(12, 'Selon profil'),
(13, 'Fixe + Commissi'),
(14, 'Commissions'),
(15, 'Indemnité de st');

-- --------------------------------------------------------

--
-- Structure de la table `user_offre`
--

CREATE TABLE `user_offre` (
  `user_id` int(11) NOT NULL,
  `offre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user_offre`
--

INSERT INTO `user_offre` (`user_id`, `offre_id`) VALUES
(7, 41),
(7, 42),
(7, 43),
(7, 44),
(16, 34),
(16, 35),
(16, 36),
(16, 37),
(16, 38),
(16, 39),
(16, 40),
(16, 42),
(18, 46);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
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
  `can_consult_cv` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `type_id`, `curriculum_id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `created_at`, `cv_file_id`, `can_consult_cv`) VALUES
(2, 2, NULL, 'Nomena', 'nomena', 'fidiarilantov@yahoo.com', 'fidiarilantov@yahoo.com', 1, 'jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ', 'erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==', '2017-12-01 16:51:39', NULL, NULL, 'a:1:{i:0;s:14:\"ROLE_RECRUTEUR\";}', '2017-10-28 11:09:17', NULL, 1),
(4, 1, NULL, 'mohammed', 'mohammed', 'adnanmohammed769@yahoo.com', 'adnanmohammed769@yahoo.com', 1, 'Uxg4x8Cpe57YgEn55cSjbRWS9xqP0q.6i.WNhYMeQkk', 'NGAumjnpdG8vwVd8VQB1Kj6ys2CDCwx0IsCA+Nu5kr2NQcfeZfR3mCSk7BSBYuXAF8k50bfJvuV1cR4riP8A6g==', '2017-10-12 05:55:21', NULL, NULL, 'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}', '2017-10-12 04:46:49', NULL, 0),
(7, 1, NULL, 'med', 'med', 'medeis@hotmail.fr', 'medeis@hotmail.fr', 1, 'RpXHOe7OkyWIBdJWZWOiDBFIxIFK1NJ66sbSwErNbyw', 'G+JG2JcBWYw+fIIZRTf+puEh0sis1g0Wr28MsVj3vdpZ9cFWj4DFSKmvGFpZyWLE8qAHELcU6M3KFUw+o9RSCA==', '2017-11-06 23:38:39', NULL, NULL, 'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}', '2017-11-06 19:34:26', NULL, 0),
(14, 1, NULL, 'Administrateur', 'administrateur', 'infermedica@gmail.com', 'infermedica@gmail.com', 1, 'WBSDCf8uGQOZh15ixVRuth4X2uwIfvfpX7kF1jAdqr4', 'tttt{WBSDCf8uGQOZh15ixVRuth4X2uwIfvfpX7kF1jAdqr4}', '2017-12-10 19:47:13', NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', '2017-12-03 19:40:13', NULL, NULL),
(16, 1, 21, 'Test', 'test', 'medeis@outlook.fr', 'medeis@outlook.fr', 1, 'unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ', 'tttt{unrrOoulZ5d4X6xCiXF99OJYJu1viIXd2OqWNkyNtuQ}', '2017-12-10 15:24:20', NULL, NULL, 'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}', '2017-12-04 19:21:09', NULL, NULL),
(17, 2, NULL, 'test r', 'test r', 'ecojobfr@gmail.com', 'ecojobfr@gmail.com', 1, 'wBvE4zxvBfxbKPRRNoKVHgJdkpLpUgOAJfJIPkQZnNw', 'tttt{wBvE4zxvBfxbKPRRNoKVHgJdkpLpUgOAJfJIPkQZnNw}', '2017-12-10 19:32:32', NULL, NULL, 'a:1:{i:0;s:14:\"ROLE_RECRUTEUR\";}', '2017-12-07 20:13:05', NULL, 1),
(18, 1, NULL, 'Test candidat', 'test candidat', 'norazafindrakoto@gmail.com', 'norazafindrakoto@gmail.com', 1, 'aGFEO7qjdQqtDdWCTMQNQ4PwveFhzEYn9pdesMnNTOQ', 'tttt{aGFEO7qjdQqtDdWCTMQNQ4PwveFhzEYn9pdesMnNTOQ}', '2017-12-10 19:40:29', NULL, NULL, 'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}', '2017-12-10 15:19:07', NULL, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `alert_mail`
--
ALTER TABLE `alert_mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DE967ECCA76ED395` (`user_id`);

--
-- Index pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E33BD3B8D8422A22` (`cv_file_id`),
  ADD KEY `IDX_E33BD3B84CC8505A` (`offre_id`),
  ADD KEY `IDX_E33BD3B88D0EB82` (`candidat_id`),
  ADD KEY `IDX_E33BD3B8BB0859F1` (`recruteur_id`);

--
-- Index pour la table `candidaturet`
--
ALTER TABLE `candidaturet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_40335AC55A2BDB92` (`lettre_id`),
  ADD KEY `IDX_40335AC5DE95D4AF` (`cvfichier_id`),
  ADD KEY `IDX_40335AC58D0EB82` (`candidat_id`),
  ADD KEY `IDX_40335AC5BB0859F1` (`recruteur_id`);

--
-- Index pour la table `categorie_fonction`
--
ALTER TABLE `categorie_fonction`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `competence`
--
ALTER TABLE `competence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_94D4687FD561A4B0` (`cuvi_id`);

--
-- Index pour la table `contrat_categorie`
--
ALTER TABLE `contrat_categorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C27AA1C48947610D` (`designation`);

--
-- Index pour la table `contrat_type`
--
ALTER TABLE `contrat_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C18AF237A4D60759` (`libelle`);

--
-- Index pour la table `cu_vi`
--
ALTER TABLE `cu_vi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6EBAC42F191476EE` (`etat_civil_id`),
  ADD UNIQUE KEY `UNIQ_6EBAC42FD8422A22` (`cv_file_id`),
  ADD UNIQUE KEY `UNIQ_6EBAC42F3DA5256D` (`image_id`);

--
-- Index pour la table `c_v_fichier`
--
ALTER TABLE `c_v_fichier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E30B4D448D0EB82` (`candidat_id`),
  ADD KEY `IDX_E30B4D441D7E2A02` (`remuneration_id`);

--
-- Index pour la table `c_v_file`
--
ALTER TABLE `c_v_file`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat_civil`
--
ALTER TABLE `etat_civil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B84E87CF3D6815C6` (`annee_exp_id`);

--
-- Index pour la table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_590C1031D7E2A02` (`remuneration_id`),
  ADD KEY `IDX_590C103D561A4B0` (`cuvi_id`),
  ADD KEY `IDX_590C1038ED7743B` (`type_clientele_id`),
  ADD KEY `IDX_590C1035233A7FC` (`secteur_activite_id`),
  ADD KEY `IDX_590C10357889920` (`fonction_id`);

--
-- Index pour la table `experienceOffre`
--
ALTER TABLE `experienceOffre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fonction`
--
ALTER TABLE `fonction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_900D5BD8876BF29` (`categorie_fonction_id`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_404021BFD561A4B0` (`cuvi_id`),
  ADD KEY `IDX_404021BFB3E9C81` (`niveau_id`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `langue`
--
ALTER TABLE `langue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9357758ED561A4B0` (`cuvi_id`);

--
-- Index pour la table `lettre`
--
ALTER TABLE `lettre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_852EF5B8D0EB82` (`candidat_id`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B6BD307FE2904019` (`thread_id`),
  ADD KEY `IDX_B6BD307FF624B39D` (`sender_id`);

--
-- Index pour la table `message_metadata`
--
ALTER TABLE `message_metadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4632F005537A1329` (`message_id`),
  ADD KEY `IDX_4632F0059D1C3019` (`participant_id`);

--
-- Index pour la table `niveau_formation`
--
ALTER TABLE `niveau_formation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `offre`
--
ALTER TABLE `offre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AF86866F1823061F` (`contrat_id`),
  ADD KEY `IDX_AF86866FBB0859F1` (`recruteur_id`),
  ADD KEY `IDX_AF86866FBCF5E72D` (`categorie_id`),
  ADD KEY `IDX_AF86866F46E90E27` (`experience_id`),
  ADD KEY `titre_idx` (`titre`),
  ADD KEY `description_idx` (`description`(255)),
  ADD KEY `prerequis_idx` (`prerequis`(255)),
  ADD KEY `societe_idx` (`societe`),
  ADD KEY `descsociete_idx` (`descSociete`);

--
-- Index pour la table `param_candidat`
--
ALTER TABLE `param_candidat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_37FFF5B58D0EB82` (`candidat_id`),
  ADD KEY `IDX_37FFF5B5BCF5E72D` (`categorie_id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sess_id`);

--
-- Index pour la table `sub_message`
--
ALTER TABLE `sub_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C9656C8B537A1329` (`message_id`),
  ADD KEY `IDX_C9656C8BF624B39D` (`sender_id`),
  ADD KEY `IDX_C9656C8BCD53EDB6` (`receiver_id`);

--
-- Index pour la table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_31204C83B03A8386` (`created_by_id`);

--
-- Index pour la table `thread_metadata`
--
ALTER TABLE `thread_metadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_40A577C8E2904019` (`thread_id`),
  ADD KEY `IDX_40A577C89D1C3019` (`participant_id`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8CDE5729A4D60759` (`libelle`);

--
-- Index pour la table `type_clientele`
--
ALTER TABLE `type_clientele`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_remuneration`
--
ALTER TABLE `type_remuneration`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_offre`
--
ALTER TABLE `user_offre`
  ADD PRIMARY KEY (`user_id`,`offre_id`),
  ADD KEY `IDX_4D447D37A76ED395` (`user_id`),
  ADD KEY `IDX_4D447D374CC8505A` (`offre_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B392FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3C05FB297` (`confirmation_token`),
  ADD UNIQUE KEY `UNIQ_1D1C63B35AEA4428` (`curriculum_id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3D8422A22` (`cv_file_id`),
  ADD KEY `IDX_1D1C63B3C54C8C93` (`type_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `alert_mail`
--
ALTER TABLE `alert_mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `candidature`
--
ALTER TABLE `candidature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `candidaturet`
--
ALTER TABLE `candidaturet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `categorie_fonction`
--
ALTER TABLE `categorie_fonction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `competence`
--
ALTER TABLE `competence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `contrat_categorie`
--
ALTER TABLE `contrat_categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT pour la table `contrat_type`
--
ALTER TABLE `contrat_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `cu_vi`
--
ALTER TABLE `cu_vi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `c_v_fichier`
--
ALTER TABLE `c_v_fichier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `c_v_file`
--
ALTER TABLE `c_v_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `etat_civil`
--
ALTER TABLE `etat_civil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `experience`
--
ALTER TABLE `experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `experienceOffre`
--
ALTER TABLE `experienceOffre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `fonction`
--
ALTER TABLE `fonction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `langue`
--
ALTER TABLE `langue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `lettre`
--
ALTER TABLE `lettre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `message_metadata`
--
ALTER TABLE `message_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `niveau_formation`
--
ALTER TABLE `niveau_formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT pour la table `offre`
--
ALTER TABLE `offre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT pour la table `param_candidat`
--
ALTER TABLE `param_candidat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `sub_message`
--
ALTER TABLE `sub_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `thread`
--
ALTER TABLE `thread`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `thread_metadata`
--
ALTER TABLE `thread_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `type_clientele`
--
ALTER TABLE `type_clientele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `type_remuneration`
--
ALTER TABLE `type_remuneration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `alert_mail`
--
ALTER TABLE `alert_mail`
  ADD CONSTRAINT `FK_DE967ECCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD CONSTRAINT `FK_E33BD3B84CC8505A` FOREIGN KEY (`offre_id`) REFERENCES `offre` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E33BD3B88D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E33BD3B8BB0859F1` FOREIGN KEY (`recruteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E33BD3B8D8422A22` FOREIGN KEY (`cv_file_id`) REFERENCES `c_v_file` (`id`);

--
-- Contraintes pour la table `candidaturet`
--
ALTER TABLE `candidaturet`
  ADD CONSTRAINT `FK_40335AC55A2BDB92` FOREIGN KEY (`lettre_id`) REFERENCES `lettre` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_40335AC58D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_40335AC5BB0859F1` FOREIGN KEY (`recruteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_40335AC5DE95D4AF` FOREIGN KEY (`cvfichier_id`) REFERENCES `c_v_fichier` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `competence`
--
ALTER TABLE `competence`
  ADD CONSTRAINT `FK_94D4687FD561A4B0` FOREIGN KEY (`cuvi_id`) REFERENCES `cu_vi` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `cu_vi`
--
ALTER TABLE `cu_vi`
  ADD CONSTRAINT `FK_6EBAC42F191476EE` FOREIGN KEY (`etat_civil_id`) REFERENCES `etat_civil` (`id`),
  ADD CONSTRAINT `FK_6EBAC42F3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_6EBAC42FD8422A22` FOREIGN KEY (`cv_file_id`) REFERENCES `c_v_file` (`id`);

--
-- Contraintes pour la table `c_v_fichier`
--
ALTER TABLE `c_v_fichier`
  ADD CONSTRAINT `FK_E30B4D441D7E2A02` FOREIGN KEY (`remuneration_id`) REFERENCES `type_remuneration` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E30B4D448D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `etat_civil`
--
ALTER TABLE `etat_civil`
  ADD CONSTRAINT `FK_B84E87CF3D6815C6` FOREIGN KEY (`annee_exp_id`) REFERENCES `experienceOffre` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `FK_590C1031D7E2A02` FOREIGN KEY (`remuneration_id`) REFERENCES `type_remuneration` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_590C1035233A7FC` FOREIGN KEY (`secteur_activite_id`) REFERENCES `contrat_categorie` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_590C10357889920` FOREIGN KEY (`fonction_id`) REFERENCES `fonction` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_590C1038ED7743B` FOREIGN KEY (`type_clientele_id`) REFERENCES `type_clientele` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_590C103D561A4B0` FOREIGN KEY (`cuvi_id`) REFERENCES `cu_vi` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `fonction`
--
ALTER TABLE `fonction`
  ADD CONSTRAINT `FK_900D5BD8876BF29` FOREIGN KEY (`categorie_fonction_id`) REFERENCES `categorie_fonction` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_404021BFB3E9C81` FOREIGN KEY (`niveau_id`) REFERENCES `niveau_formation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_404021BFD561A4B0` FOREIGN KEY (`cuvi_id`) REFERENCES `cu_vi` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `langue`
--
ALTER TABLE `langue`
  ADD CONSTRAINT `FK_9357758ED561A4B0` FOREIGN KEY (`cuvi_id`) REFERENCES `cu_vi` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `lettre`
--
ALTER TABLE `lettre`
  ADD CONSTRAINT `FK_852EF5B8D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_B6BD307FE2904019` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B6BD307FF624B39D` FOREIGN KEY (`sender_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `message_metadata`
--
ALTER TABLE `message_metadata`
  ADD CONSTRAINT `FK_4632F005537A1329` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4632F0059D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `FK_AF86866F1823061F` FOREIGN KEY (`contrat_id`) REFERENCES `contrat_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AF86866F46E90E27` FOREIGN KEY (`experience_id`) REFERENCES `experienceOffre` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AF86866FBB0859F1` FOREIGN KEY (`recruteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AF86866FBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `contrat_categorie` (`id`);

--
-- Contraintes pour la table `param_candidat`
--
ALTER TABLE `param_candidat`
  ADD CONSTRAINT `FK_37FFF5B58D0EB82` FOREIGN KEY (`candidat_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_37FFF5B5BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `contrat_categorie` (`id`);

--
-- Contraintes pour la table `sub_message`
--
ALTER TABLE `sub_message`
  ADD CONSTRAINT `FK_C9656C8B537A1329` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C9656C8BCD53EDB6` FOREIGN KEY (`receiver_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FK_C9656C8BF624B39D` FOREIGN KEY (`sender_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `FK_31204C83B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `thread_metadata`
--
ALTER TABLE `thread_metadata`
  ADD CONSTRAINT `FK_40A577C89D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_40A577C8E2904019` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_offre`
--
ALTER TABLE `user_offre`
  ADD CONSTRAINT `FK_4D447D374CC8505A` FOREIGN KEY (`offre_id`) REFERENCES `offre` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4D447D37A76ED395` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_1D1C63B35AEA4428` FOREIGN KEY (`curriculum_id`) REFERENCES `cu_vi` (`id`),
  ADD CONSTRAINT `FK_1D1C63B3C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `FK_1D1C63B3D8422A22` FOREIGN KEY (`cv_file_id`) REFERENCES `c_v_file` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
