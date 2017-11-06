-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 16, 2017 at 08:45 
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eco_job_fr`
--

-- --------------------------------------------------------

--
-- Table structure for table `contrat_type`
--

CREATE TABLE `contrat_type` (
  `id` int(11) NOT NULL,
  `libelle` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contrat_type`
--

INSERT INTO `contrat_type` (`id`, `libelle`) VALUES
(1, 'CDD'),
(2, 'CDI');

-- --------------------------------------------------------

--
-- Table structure for table `cu_vi`
--

CREATE TABLE `cu_vi` (
  `id` int(11) NOT NULL,
  `nom` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` int(11) NOT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offre`
--

CREATE TABLE `offre` (
  `id` int(11) NOT NULL,
  `contrat_id` int(11) NOT NULL,
  `recruteur_id` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `offre`
--

INSERT INTO `offre` (`id`, `contrat_id`, `recruteur_id`, `experience`, `titre`, `contenu`) VALUES
(3, 1, 2, 1, 'Java', 'What is Java ?'),
(4, 2, 2, 1, 'How to keep your translations well organized in Symfony2', 'We are working at the moment on a big internationalized project, and we have consequently many translations in our application. These translations are dispatched in many bundles (7 for now) and are used throughout the application. At the begining of the development, we hadn’t any specific organisation for the translations and we put the translation in a random bundle (the one on which we were working, most of the time).'),
(5, 1, 2, 1, 'Efficient Elasticsearch indexing configuration', 'This post is about elasticsearch which is a great search engine.\r\n            The biggest difficulty we meet is that we do not know how to configure it to have relevant search results. Another difficulty is (sorry to say that), the documentation is not very well done. Ok, it’s my opinion and I can’t denied we found usefull information in it, but information are sometimes difficult to find.\r\n        '),
(12, 1, 2, 1, 'Configure WSSE on Symfony2 with FOSRestBundle', 'The client–server communication is further constrained by no client context being stored on the server between requests. Each request from any client contains all of the information necessary to service the request, and any session state is held in the client.\r\n        '),
(13, 2, 2, 1, 'DateTimePicker field type with Symfony2 and jQuery', 'In this third post, we’ll explain how to create a great custom field type that uses jQuery DatePicker to handle date input, and then, how to extend it to create a datetime field type. And the best? The datepicker is localized according to the user’s locale.\r\n        '),
(14, 1, 2, 1, 'Currency Change rates update on Symfony2 using openexchangerates.org API', 'In this post, we’ll explain how to create and maintain a database with currencies and change rates.\r\n            In order to update our changes rates, we will user openexchangerates.org solution. (Exists as free, premium and pro)\r\n        '),
(15, 1, 2, 2, 'Create a breadcrumb menu with KnpMenuBundle', 'In this first post, I’ll explain how to make a breadcrumb menu with the great KnpMenuBundle. The documentation explains the basics and how to make a common menu, but a breadcrumb menu has a particular behaviour.\r\n        '),
(16, 2, 2, 2, 'Create new log file/channel for a Symfony2 Service (With monolog)', 'In this article about WSSE and Rest, we describe how to create a new log file/channel with monolog in Symfony2\r\n        '),
(17, 2, 2, 2, 'Create a custom form theme block with Twig', 'I wanted to use the following block. As you see, in addition to the specific p element, the div and their specific classes, the big difference with the native Twig form_row method is that the radio labels are not in a label tag (but there is a label tag for the parent form field).\r\n        '),
(18, 2, 2, 2, 'Export datas to a csv file with Symfony2', 'I recently had to export a huge set of data to a csv file. This is easy and fast to do if you don’t care about memory and User Experience. I wanted the memory consumption does not increase with the volume of data.\r\n            I got inspiration from this post (in French) but, in spite of what is written in the post, some tests with the memory_get_usage function proved that the memory consumption increased quickly with the number of datas.\r\n        '),
(19, 2, 2, 2, 'Install Rest in Symfony2 existing application', 'As we needed a connection between a Symfony2 web application and an Android application, we had to learn and understand how to make this in a simple and secured way, based on our existing entities.\r\n            We chose WSSE for security access, FOSRestBundle for datas restitution and JMSSerializerBundle for serialization. \r\n        '),
(20, 2, 2, 2, 'How to use WSSE in Android app', 'How to use WSSE in Android app');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sess_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `sess_data` blob NOT NULL,
  `sess_time` int(10) UNSIGNED NOT NULL,
  `sess_lifetime` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sess_id`, `sess_data`, `sess_time`, `sess_lifetime`) VALUES
('35g5u6no4d80tvohjlst4qac70', 0x5f7366325f617474726962757465737c613a333a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a36313a22687474703a2f2f3132372e302e302e312f65636f6a6f622f7765622f6170705f6465762e7068702f63616e64696461742f6f666672652f736561726368223b733a31383a225f637372662f61757468656e746963617465223b733a34333a224653355f7348422d4c546e5742476c4a73324a6358694b516f635f66565536614e384a6e5a677235506234223b733a31343a225f73656375726974795f6d61696e223b733a3838353a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3739373a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3735373a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3238353a7b613a383a7b693a303b733a38383a22544a5057446e374c7a42574843544b6d6d744b6869456b573347745664757256514776646b6b6b4d476a5067353976774758564e43343163727246312f4b41646131344872496d546741434d526c4b444b4b736336513d3d223b693a313b733a34333a2275692e73716e4b7838424553466c677a466f4a6647553958717863475354664e37415574546f7135523077223b693a323b733a353a2261646e616e223b693a333b733a353a2241646e616e223b693a343b623a313b693a353b693a313b693a363b733a32363a2261646e616e6d6f68616d6d6564373639407961686f6f2e636f6d223b693a373b733a32363a2261646e616e6d6f68616d6d6564373639407961686f6f2e636f6d223b7d7d693a313b623a313b693a323b613a333a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31303a22524f4c455f41444d494e223b7d693a323b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313530303232323136323b733a313a2263223b693a313530303231393636373b733a313a226c223b733a313a2230223b7d, 1500222164, 1440),
('ipfuk8uhqvsn0g2v0m8mgrq7i0', 0x5f7366325f617474726962757465737c613a353a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a35303a22687474703a2f2f3132372e302e302e312f65636f6a6f622f7765622f6170705f6465762e7068702f7265637275746575722f223b733a31383a225f637372662f61757468656e746963617465223b733a34333a2245774e5a64486e493177303831344b6d326e4c67536e4d392d46434d446b7445463137574d4e7339616a34223b733a31383a225f637372662f726567697374726174696f6e223b733a34333a22796c54594a6b33467a76644a6655786d6d63553666304e724331303563766e7846436b742d4b314e717059223b733a33343a224244435f436f6465436f6c6c656374696f6e5f726567697374657263617074636861223b733a3431363a224f3a31383a224244435f436f6465436f6c6c656374696f6e223a313a7b733a33373a22004244435f436f6465436f6c6c656374696f6e005f6f773435793270696278626863733332223b613a313a7b733a33323a223465353463386566623937363939343661323332613431303163646465643536223b4f3a383a224244435f436f6465223a363a7b733a33373a22004244435f436f6465005f4f6c376873613265357474353664676764336865796776797933223b733a343a22565a485a223b733a33373a22004244435f436f6465005f3173356f6962756935767736707276306b72766636757836697a223b693a313439393934333130333b733a33373a22004244435f436f6465005f31397a386833726863643168716a777a37696678363976377531223b4e3b733a32373a22004244435f436f6465005f6f6768786b67677663376f7177627366223b623a313b733a32373a22004244435f436f6465005f4f743678366463376376366f636e3976223b4e3b733a32373a22004244435f436f6465005f4f3137757530706b33777237726a6434223b693a303b7d7d7d223b733a31343a225f73656375726974795f6d61696e223b733a3838353a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3739373a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3735373a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3238353a7b613a383a7b693a303b733a38383a22544a5057446e374c7a42574843544b6d6d744b6869456b573347745664757256514776646b6b6b4d476a5067353976774758564e43343163727246312f4b41646131344872496d546741434d526c4b444b4b736336513d3d223b693a313b733a34333a2275692e73716e4b7838424553466c677a466f4a6647553958717863475354664e37415574546f7135523077223b693a323b733a353a2261646e616e223b693a333b733a353a2241646e616e223b693a343b623a313b693a353b693a313b693a363b733a32363a2261646e616e6d6f68616d6d6564373639407961686f6f2e636f6d223b693a373b733a32363a2261646e616e6d6f68616d6d6564373639407961686f6f2e636f6d223b7d7d693a313b623a313b693a323b613a333a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31303a22524f4c455f41444d494e223b7d693a323b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313439393934343833343b733a313a2263223b693a313439393934333433393b733a313a226c223b733a313a2230223b7d, 1499944834, 1440),
('juebvv39qgc5ra2q8o1nh22j84', 0x5f7366325f617474726962757465737c613a343a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a2263374c413965726b4f46334742366454673855367264465a6461506d614c557932724d70694e3348427655223b733a31383a225f637372662f726567697374726174696f6e223b733a34333a224d702d2d55336c734c4746664a446833686c616b44426770736f4a6736546c6361676b41586b36764e3963223b733a32383a224244435f4973536f6c7665645f726567697374657263617074636861223b733a343a22623a313b223b733a31343a225f73656375726974795f6d61696e223b733a3735323a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3636343a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3632343a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3238313a7b613a383a7b693a303b733a38383a22657248626665695675437936396836626c35525942624b304e78344b51596c62697976724148444f556730584b44305869506666747059754d5147645a2f4965326a626c31576277614a4535694e516f714e673072673d3d223b693a313b733a34333a226a56642f784133545868366b456c3948726d6e6a4f446146705438492e427463486149756f354430447551223b693a323b733a363a226e6f6d656e61223b693a333b733a363a224e6f6d656e61223b693a343b623a313b693a353b693a323b693a363b733a32333a22666964696172696c616e746f76407961686f6f2e636f6d223b693a373b733a32333a22666964696172696c616e746f76407961686f6f2e636f6d223b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31343a22524f4c455f524543525554455552223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b7d5f7366325f666c61736865737c613a313a7b733a373a2273756363657373223b613a313a7b693a303b733a34323a224c277574696c69736174657572206120c3a974c3a9206372c3a9c3a920617665632073756363c3a8732e223b7d7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313439393933343632303b733a313a2263223b693a313439393933343437343b733a313a226c223b733a313a2230223b7d, 1499934621, 1440),
('n6jiq02e6toh0nj00oho7g17o5', 0x5f7366325f617474726962757465737c613a333a7b733a32363a225f73656375726974792e6d61696e2e7461726765745f70617468223b733a36313a22687474703a2f2f3132372e302e302e312f65636f6a6f622f7765622f6170705f6465762e7068702f63616e64696461742f6f666672652f736561726368223b733a31383a225f637372662f61757468656e746963617465223b733a34333a22706c59617639335a39526551464151654c696f6b70694e396c50684d6c46544e644e492d5f5873436a7363223b733a31343a225f73656375726974795f6d61696e223b733a3838353a22433a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a3739373a7b613a333a7b693a303b4e3b693a313b733a343a226d61696e223b693a323b733a3735373a22613a343a7b693a303b433a32393a2245636f4a6f625c5573657242756e646c655c456e746974795c55736572223a3238353a7b613a383a7b693a303b733a38383a22544a5057446e374c7a42574843544b6d6d744b6869456b573347745664757256514776646b6b6b4d476a5067353976774758564e43343163727246312f4b41646131344872496d546741434d526c4b444b4b736336513d3d223b693a313b733a34333a2275692e73716e4b7838424553466c677a466f4a6647553958717863475354664e37415574546f7135523077223b693a323b733a353a2261646e616e223b693a333b733a353a2241646e616e223b693a343b623a313b693a353b693a313b693a363b733a32363a2261646e616e6d6f68616d6d6564373639407961686f6f2e636f6d223b693a373b733a32363a2261646e616e6d6f68616d6d6564373639407961686f6f2e636f6d223b7d7d693a313b623a313b693a323b613a333a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f43414e4449444154223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31303a22524f4c455f41444d494e223b7d693a323b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313530303232393736363b733a313a2263223b693a313530303232373134343b733a313a226c223b733a313a2230223b7d, 1500229766, 1440);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `libelle` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `libelle`) VALUES
(1, 'Candidat'),
(2, 'Recruteur');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
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
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `type_id`, `curriculum_id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `created_at`) VALUES
(1, 1, NULL, 'Adnan', 'adnan', 'adnanmohammed769@yahoo.com', 'adnanmohammed769@yahoo.com', 1, 'ui.sqnKx8BESFlgzFoJfGU9XqxcGSTfN7AUtToq5R0w', 'TJPWDn7LzBWHCTKmmtKhiEkW3GtVdurVQGvdkkkMGjPg59vwGXVNC41crrF1/KAda14HrImTgACMRlKDKKsc6Q==', '2017-07-16 19:45:45', NULL, NULL, 'a:2:{i:0;s:13:"ROLE_CANDIDAT";i:1;s:10:"ROLE_ADMIN";}', '2017-07-13 07:49:12'),
(2, 2, NULL, 'Nomena', 'nomena', 'fidiarilantov@yahoo.com', 'fidiarilantov@yahoo.com', 1, 'jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ', 'erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==', '2017-07-13 10:27:54', NULL, NULL, 'a:1:{i:0;s:14:"ROLE_RECRUTEUR";}', '2017-07-13 10:27:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contrat_type`
--
ALTER TABLE `contrat_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C18AF237A4D60759` (`libelle`);

--
-- Indexes for table `cu_vi`
--
ALTER TABLE `cu_vi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offre`
--
ALTER TABLE `offre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AF86866F1823061F` (`contrat_id`),
  ADD KEY `IDX_AF86866FBB0859F1` (`recruteur_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sess_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8CDE5729A4D60759` (`libelle`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B392FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3C05FB297` (`confirmation_token`),
  ADD UNIQUE KEY `UNIQ_1D1C63B35AEA4428` (`curriculum_id`),
  ADD KEY `IDX_1D1C63B3C54C8C93` (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contrat_type`
--
ALTER TABLE `contrat_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cu_vi`
--
ALTER TABLE `cu_vi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offre`
--
ALTER TABLE `offre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `FK_AF86866F1823061F` FOREIGN KEY (`contrat_id`) REFERENCES `contrat_type` (`id`),
  ADD CONSTRAINT `FK_AF86866FBB0859F1` FOREIGN KEY (`recruteur_id`) REFERENCES `utilisateur` (`id`);

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_1D1C63B35AEA4428` FOREIGN KEY (`curriculum_id`) REFERENCES `cu_vi` (`id`),
  ADD CONSTRAINT `FK_1D1C63B3C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
