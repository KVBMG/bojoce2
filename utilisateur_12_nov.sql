-- MySQL dump 10.15  Distrib 10.0.31-MariaDB, for Linux (x86_64)
--
-- Host: sql5-2.aquaray.com    Database: eco_job_fr
-- ------------------------------------------------------
-- Server version	5.6.38-1~dotdeb+7.1-log

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
INSERT INTO `utilisateur` VALUES (2,2,NULL,'Nomena','nomena','fidiarilantov@yahoo.com','fidiarilantov@yahoo.com',1,'jVd/xA3TXh6kEl9HrmnjODaFpT8I.BtcHaIuo5D0DuQ','erHbfeiVuCy69h6bl5RYBbK0Nx4KQYlbiyvrAHDOUg0XKD0XiPfftpYuMQGdZ/Ie2jbl1WbwaJE5iNQoqNg0rg==','2017-11-02 11:23:12',NULL,NULL,'a:1:{i:0;s:14:\"ROLE_RECRUTEUR\";}','2017-10-28 11:09:17',NULL),(3,1,NULL,'Administrateur','administrateur','infermedica@gmail.com','infermedica@gmail.com',1,'SF7zZF7xDy08DYppAafw.0ZqWM4Ru3Eu5n4zsAcwds4','+d+azJGiwgUKjxBCMC9L6u9TZBh5D0NAsAGbvidDgpSpqMq6OOraeGfoWhKAZKJalCcz9hpqXI63VplmjMmQsQ==','2017-11-09 16:26:31',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}','2017-09-15 04:06:42',NULL),(4,1,2,'mohammed','mohammed','adnanmohammed769@yahoo.com','adnanmohammed769@yahoo.com',1,'Uxg4x8Cpe57YgEn55cSjbRWS9xqP0q.6i.WNhYMeQkk','NGAumjnpdG8vwVd8VQB1Kj6ys2CDCwx0IsCA+Nu5kr2NQcfeZfR3mCSk7BSBYuXAF8k50bfJvuV1cR4riP8A6g==','2017-10-12 05:55:21',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}','2017-10-12 04:46:49',NULL),(7,1,NULL,'med','med','medeis@hotmail.fr','medeis@hotmail.fr',1,'RpXHOe7OkyWIBdJWZWOiDBFIxIFK1NJ66sbSwErNbyw','G+JG2JcBWYw+fIIZRTf+puEh0sis1g0Wr28MsVj3vdpZ9cFWj4DFSKmvGFpZyWLE8qAHELcU6M3KFUw+o9RSCA==','2017-11-06 23:38:39',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}','2017-11-06 19:34:26',NULL),(10,1,10,'Test candidat','test candidat','norazafindrakoto@gmail.com','norazafindrakoto@gmail.com',1,'TD3sjy6a8IZKJEqgiHApRXBHzfKnhR6YuedxEB4brJY','Fq+/LcQiw0avBUjCU+PGsmakRuQCwmkIcyFOsvY695Kr8GoRqZ3IkyStzll9KRQilctnX9kbkokz+uWLI1lqjg==','2017-11-10 06:59:07',NULL,NULL,'a:1:{i:0;s:13:\"ROLE_CANDIDAT\";}','2017-11-09 16:12:52',NULL),(11,2,NULL,'Test recruteur','test recruteur','ecojobfr@gmail.com','ecojobfr@gmail.com',1,'akN.wAK.1L.MsWhFTp4SkRXcXLChqo50NUynNhDA.2I','3mIh/9RNW0wQ5bGJ26LHxpPzNoINGKxcXkhrYo8Z7ITTWO7OFBrg2ZKLcdXDTVnlweBIm2SAZDF+boUr/oy/ZQ==','2017-11-10 07:01:15',NULL,NULL,'a:1:{i:0;s:14:\"ROLE_RECRUTEUR\";}','2017-11-09 16:18:52',NULL);
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

-- Dump completed on 2017-11-12 11:06:07
