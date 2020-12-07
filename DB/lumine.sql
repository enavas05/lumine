-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: lumine_app
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblCategory`
--

DROP TABLE IF EXISTS `tblCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCategory`
--

LOCK TABLES `tblCategory` WRITE;
/*!40000 ALTER TABLE `tblCategory` DISABLE KEYS */;
INSERT INTO `tblCategory` VALUES (1,'Ciencias Médicas','Categoría para almacenar objetos para la facultad de ciencias médicas',1,NULL),(2,'Humanidades','Facultad de Humanidades y Artes',0,NULL),(3,'Ciencias Jurídicas','Facultad de ciencias jurídicas',1,NULL),(4,'Marcela',NULL,NULL,NULL),(5,'Marcela2',NULL,NULL,NULL),(6,'Marcela2$%\"#',NULL,NULL,NULL),(7,'Marcela2$%\"#%&',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tblCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblComments`
--

DROP TABLE IF EXISTS `tblComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblComments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `idOva` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_comentario` (`userId`),
  KEY `fk_ova_comentario` (`idOva`),
  CONSTRAINT `fk_ova_comentario` FOREIGN KEY (`idOva`) REFERENCES `tblOvas` (`id`),
  CONSTRAINT `fk_usuario_comentario` FOREIGN KEY (`userId`) REFERENCES `tblUsers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblComments`
--

LOCK TABLES `tblComments` WRITE;
/*!40000 ALTER TABLE `tblComments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblComments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblFile`
--

DROP TABLE IF EXISTS `tblFile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblFile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `editable` tinyint(1) DEFAULT 1,
  `visible` tinyint(1) DEFAULT 1,
  `url` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `tblFile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `tblUsers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblFile`
--

LOCK TABLES `tblFile` WRITE;
/*!40000 ALTER TABLE `tblFile` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblFile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblGroups`
--

DROP TABLE IF EXISTS `tblGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblGroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `creado_por` varchar(15) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `modificado_por` varchar(15) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblGroups`
--

LOCK TABLES `tblGroups` WRITE;
/*!40000 ALTER TABLE `tblGroups` DISABLE KEYS */;
INSERT INTO `tblGroups` VALUES (1,'Administrador','Administradores de sitio','admin',NULL,NULL,NULL),(2,'Gestores','Gestores del sitio','admin',NULL,NULL,NULL),(3,'Docentes','Personal docente','admin',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tblGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblOvaState`
--

DROP TABLE IF EXISTS `tblOvaState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblOvaState` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` enum('enviado','en revisión','publicado','rechazado') NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblOvaState`
--

LOCK TABLES `tblOvaState` WRITE;
/*!40000 ALTER TABLE `tblOvaState` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblOvaState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblOvaType`
--

DROP TABLE IF EXISTS `tblOvaType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblOvaType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `type` enum('scorm','html5','h5p','others') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblOvaType`
--

LOCK TABLES `tblOvaType` WRITE;
/*!40000 ALTER TABLE `tblOvaType` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblOvaType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblOvas`
--

DROP TABLE IF EXISTS `tblOvas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblOvas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `idCategory` int(11) DEFAULT NULL,
  `idFile` int(11) DEFAULT NULL,
  `idState` int(11) DEFAULT NULL,
  `idType` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `autor` varchar(60) NOT NULL,
  `editor` varchar(60) NOT NULL,
  `ilustrador` varchar(60) NOT NULL,
  `publicador` varchar(60) NOT NULL,
  `iso` varchar(12) NOT NULL,
  `otros` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategory` (`idCategory`),
  KEY `idFile` (`idFile`),
  KEY `idState` (`idState`),
  KEY `idType` (`idType`),
  KEY `idUser` (`idUser`),
  CONSTRAINT `tblOvas_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `tblCategory` (`id`),
  CONSTRAINT `tblOvas_ibfk_2` FOREIGN KEY (`idFile`) REFERENCES `tblFile` (`id`),
  CONSTRAINT `tblOvas_ibfk_3` FOREIGN KEY (`idState`) REFERENCES `tblOvaState` (`id`),
  CONSTRAINT `tblOvas_ibfk_4` FOREIGN KEY (`idType`) REFERENCES `tblOvaType` (`id`),
  CONSTRAINT `tblOvas_ibfk_5` FOREIGN KEY (`idUser`) REFERENCES `tblUsers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblOvas`
--

LOCK TABLES `tblOvas` WRITE;
/*!40000 ALTER TABLE `tblOvas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblOvas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblParams`
--

DROP TABLE IF EXISTS `tblParams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblParams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parametro` varchar(50) DEFAULT NULL,
  `valor` varchar(100) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idUsuario_p` (`idUsuario`),
  CONSTRAINT `fk_idUsuario_p` FOREIGN KEY (`idUsuario`) REFERENCES `tblUsers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblParams`
--

LOCK TABLES `tblParams` WRITE;
/*!40000 ALTER TABLE `tblParams` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblParams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPoints`
--

DROP TABLE IF EXISTS `tblPoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `idOva` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_puntuacion` (`userId`),
  KEY `fk_ova_puntuacion` (`idOva`),
  CONSTRAINT `fk_ova_puntuacion` FOREIGN KEY (`idOva`) REFERENCES `tblOvas` (`id`),
  CONSTRAINT `fk_usuario_puntuacion` FOREIGN KEY (`userId`) REFERENCES `tblUsers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPoints`
--

LOCK TABLES `tblPoints` WRITE;
/*!40000 ALTER TABLE `tblPoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblPoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblQuestions`
--

DROP TABLE IF EXISTS `tblQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblQuestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` text DEFAULT NULL,
  `creado_por` varchar(15) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `modificado_por` varchar(15) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `respuesta` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idUsuario` (`idUsuario`),
  CONSTRAINT `fk_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `tblUsers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblQuestions`
--

LOCK TABLES `tblQuestions` WRITE;
/*!40000 ALTER TABLE `tblQuestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblQuestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblRoles`
--

DROP TABLE IF EXISTS `tblRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblRoles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `archetype` varchar(60) NOT NULL,
  `description` text DEFAULT NULL,
  `creado_por` varchar(15) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `modificado_por` varchar(15) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblRoles`
--

LOCK TABLES `tblRoles` WRITE;
/*!40000 ALTER TABLE `tblRoles` DISABLE KEYS */;
INSERT INTO `tblRoles` VALUES (1,'administradores','admin','demo',NULL,NULL,NULL,NULL),(2,'Estudiantes','Estudiantes','demo2',NULL,NULL,NULL,NULL),(3,'Docentes','Docentes','demo3',NULL,NULL,NULL,NULL),(4,'Demo','demo','Categoria demo',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tblRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUsers`
--

DROP TABLE IF EXISTS `tblUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(250) NOT NULL,
  `idRol` int(11) NOT NULL,
  `idGroup` int(11) NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `primer_acceso` datetime DEFAULT NULL,
  `ultimo_acceso` datetime DEFAULT NULL,
  `creado_por` varchar(15) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `modificado_por` varchar(15) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_User_Rol` (`idRol`),
  KEY `FK_User_Groups` (`idGroup`),
  CONSTRAINT `FK_User_Groups` FOREIGN KEY (`idGroup`) REFERENCES `tblGroups` (`id`),
  CONSTRAINT `FK_User_Rol` FOREIGN KEY (`idRol`) REFERENCES `tblRoles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUsers`
--

LOCK TABLES `tblUsers` WRITE;
/*!40000 ALTER TABLE `tblUsers` DISABLE KEYS */;
INSERT INTO `tblUsers` VALUES (1,'eduardonavas@unah.hn','Eduardo Antonio','Navas Flores',2,'eduardonavas@unah.hn','admin123',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'marcelagiron@unah.hn','Marcela','Giron',1,'marcelagiron@unah.hn','$2b$10$phxXJyGNupGPmWoie7rgpuebqin18voskSI/CsJtPgpskUmpC/Q8u',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'eduardonavas@unah.hn','eduardo','navas',1,'eduardonavas@unah.hn','$2b$10$qKZqaFi7JbOb3xtbpzwqquvXkOdMkXRYti2n4vZZOipeb4uSna0CC',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tblUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lumine_app'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-06 13:11:54
