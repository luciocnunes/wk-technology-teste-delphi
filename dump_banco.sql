-- MySQL dump 10.13  Distrib 5.7.42, for Win64 (x86_64)
--
-- Host: localhost    Database: wkdelphi112
-- ------------------------------------------------------
-- Server version	5.7.42-log

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Guilherme','Florianópolis','SC'),(2,'Andressa','Florianópolis','SC'),(3,'Aline','Florianópolis','SC'),(4,'Enoque','Florianópolis','SC'),(5,'Lucianna','Governador Valadares','MG'),(6,'Luiz','Governador Valadares','MG'),(7,'Lúcio Nunes','Governador Valadares','MG'),(8,'Marcos','Governador Valadares','MG'),(9,'Vitor','Governador Valadares','MG'),(10,'Caique','Florianópolis','SC'),(11,'Rafael','Florianópolis','SC'),(12,'Caio','Florianópolis','SC'),(13,'Matheus','Florianópolis','SC'),(14,'Italo','Florianópolis','SC'),(15,'João','Florianópolis','SC'),(16,'Priscila','Florianópolis','SC'),(17,'Wender','Florianópolis','SC'),(18,'Samara','Florianópolis','SC'),(19,'Jean','Florianópolis','SC'),(20,'Caroline','Florianópolis','SC'),(21,'Thyago','Florianópolis','SC');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `dt_emissao` date DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `vlr_total` double(15,3) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `id_pedido` (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `dt_emissao` (`dt_emissao`),
  KEY `dt_emissao_cliente` (`dt_emissao`,`id_cliente`),
  CONSTRAINT `pedidos_fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`codigo`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_produtos`
--

DROP TABLE IF EXISTS `pedidos_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos_produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_pedido` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `vlr_unitario` double(15,3) DEFAULT NULL,
  `vlr_total` double(15,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `num_pedido` (`num_pedido`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `pedidos_produtos_fk` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pedidos_produtos_tbprodutos` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_produtos`
--

LOCK TABLES `pedidos_produtos` WRITE;
/*!40000 ALTER TABLE `pedidos_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `preco` double(15,3) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `descricao` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'sopa agnolini',39.000),(2,'lasanha',43.900),(3,'batata com pão',19.990),(4,'bijajica',29.000),(5,'maionese e salame',25.000),(6,'tortéi',32.000),(7,'polenta',43.990),(8,'radici',20.000),(9,'pão caseiro',15.000),(10,'salame',10.000),(11,'queijo colonial',50.000),(12,'frango a passarinho',60.000),(13,'galinha caipira ao molho',70.000),(14,'codornas',65.000),(15,'sagu',54.000),(16,'chucrute com salsicha',30.000),(17,'kassler',40.000),(18,'eisbein',42.000),(19,'marreco com repolho roxo',36.000),(20,'bockwurst',34.000),(21,'apfelstrudel',35.900);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-27  8:21:59
