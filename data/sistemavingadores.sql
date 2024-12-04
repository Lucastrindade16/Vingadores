-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemavingadores
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chipgps`
--

DROP TABLE IF EXISTS `chipgps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chipgps` (
  `id_chip` int NOT NULL AUTO_INCREMENT,
  `localizacao_atual` varchar(255) DEFAULT NULL,
  `ultima_localizacao` varchar(255) DEFAULT NULL,
  `id_tornozeleira` int DEFAULT NULL,
  PRIMARY KEY (`id_chip`),
  KEY `id_tornozeleira` (`id_tornozeleira`),
  CONSTRAINT `chipgps_ibfk_1` FOREIGN KEY (`id_tornozeleira`) REFERENCES `tornozeleira` (`id_tornozeleira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chipgps`
--

LOCK TABLES `chipgps` WRITE;
/*!40000 ALTER TABLE `chipgps` DISABLE KEYS */;
/*!40000 ALTER TABLE `chipgps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convocacao`
--

DROP TABLE IF EXISTS `convocacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convocacao` (
  `num_registro` int NOT NULL AUTO_INCREMENT,
  `motivo` text NOT NULL,
  `data_convocacao` datetime DEFAULT NULL,
  `data_comparecimento` datetime DEFAULT NULL,
  `status` enum('pendente','comparecido','ausente') DEFAULT NULL,
  PRIMARY KEY (`num_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convocacao`
--

LOCK TABLES `convocacao` WRITE;
/*!40000 ALTER TABLE `convocacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `convocacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe` (
  `id_equipe` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_equipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fraqueza`
--

DROP TABLE IF EXISTS `fraqueza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fraqueza` (
  `id_fraqueza` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id_fraqueza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fraqueza`
--

LOCK TABLES `fraqueza` WRITE;
/*!40000 ALTER TABLE `fraqueza` DISABLE KEYS */;
/*!40000 ALTER TABLE `fraqueza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidade`
--

DROP TABLE IF EXISTS `habilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilidade` (
  `id_habilidade` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id_habilidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidade`
--

LOCK TABLES `habilidade` WRITE;
/*!40000 ALTER TABLE `habilidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `habilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroi`
--

DROP TABLE IF EXISTS `heroi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroi` (
  `id_heroi` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `idade` int DEFAULT NULL,
  `identidade_secreta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_heroi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroi`
--

LOCK TABLES `heroi` WRITE;
/*!40000 ALTER TABLE `heroi` DISABLE KEYS */;
/*!40000 ALTER TABLE `heroi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroi_equipe`
--

DROP TABLE IF EXISTS `heroi_equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroi_equipe` (
  `id_heroi` int NOT NULL,
  `id_equipe` int NOT NULL,
  PRIMARY KEY (`id_heroi`,`id_equipe`),
  KEY `id_equipe` (`id_equipe`),
  CONSTRAINT `heroi_equipe_ibfk_1` FOREIGN KEY (`id_heroi`) REFERENCES `heroi` (`id_heroi`),
  CONSTRAINT `heroi_equipe_ibfk_2` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroi_equipe`
--

LOCK TABLES `heroi_equipe` WRITE;
/*!40000 ALTER TABLE `heroi_equipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `heroi_equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroi_fraqueza`
--

DROP TABLE IF EXISTS `heroi_fraqueza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroi_fraqueza` (
  `id_heroi` int NOT NULL,
  `id_fraqueza` int NOT NULL,
  PRIMARY KEY (`id_heroi`,`id_fraqueza`),
  KEY `id_fraqueza` (`id_fraqueza`),
  CONSTRAINT `heroi_fraqueza_ibfk_1` FOREIGN KEY (`id_heroi`) REFERENCES `heroi` (`id_heroi`),
  CONSTRAINT `heroi_fraqueza_ibfk_2` FOREIGN KEY (`id_fraqueza`) REFERENCES `fraqueza` (`id_fraqueza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroi_fraqueza`
--

LOCK TABLES `heroi_fraqueza` WRITE;
/*!40000 ALTER TABLE `heroi_fraqueza` DISABLE KEYS */;
/*!40000 ALTER TABLE `heroi_fraqueza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroi_habilidade`
--

DROP TABLE IF EXISTS `heroi_habilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroi_habilidade` (
  `id_heroi` int NOT NULL,
  `id_habilidade` int NOT NULL,
  PRIMARY KEY (`id_heroi`,`id_habilidade`),
  KEY `id_habilidade` (`id_habilidade`),
  CONSTRAINT `heroi_habilidade_ibfk_1` FOREIGN KEY (`id_heroi`) REFERENCES `heroi` (`id_heroi`),
  CONSTRAINT `heroi_habilidade_ibfk_2` FOREIGN KEY (`id_habilidade`) REFERENCES `habilidade` (`id_habilidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroi_habilidade`
--

LOCK TABLES `heroi_habilidade` WRITE;
/*!40000 ALTER TABLE `heroi_habilidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `heroi_habilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mandadoprisao`
--

DROP TABLE IF EXISTS `mandadoprisao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mandadoprisao` (
  `num_registro` int NOT NULL AUTO_INCREMENT,
  `motivo` text NOT NULL,
  `data_emissao` datetime DEFAULT NULL,
  `status` enum('ativo','cumprido','cancelado') DEFAULT NULL,
  PRIMARY KEY (`num_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mandadoprisao`
--

LOCK TABLES `mandadoprisao` WRITE;
/*!40000 ALTER TABLE `mandadoprisao` DISABLE KEYS */;
/*!40000 ALTER TABLE `mandadoprisao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registroacao`
--

DROP TABLE IF EXISTS `registroacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registroacao` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_heroi` int DEFAULT NULL,
  `descricao` text NOT NULL,
  `data_hora` datetime NOT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `id_heroi` (`id_heroi`),
  CONSTRAINT `registroacao_ibfk_1` FOREIGN KEY (`id_heroi`) REFERENCES `heroi` (`id_heroi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registroacao`
--

LOCK TABLES `registroacao` WRITE;
/*!40000 ALTER TABLE `registroacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `registroacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tornozeleira`
--

DROP TABLE IF EXISTS `tornozeleira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tornozeleira` (
  `id_tornozeleira` int NOT NULL AUTO_INCREMENT,
  `status` enum('ativa','inativa') NOT NULL,
  `data_ativacao` datetime DEFAULT NULL,
  `data_desativacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tornozeleira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tornozeleira`
--

LOCK TABLES `tornozeleira` WRITE;
/*!40000 ALTER TABLE `tornozeleira` DISABLE KEYS */;
/*!40000 ALTER TABLE `tornozeleira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sistemavingadores'
--

--
-- Dumping routines for database 'sistemavingadores'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-29 11:01:40
