-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: 10.123.0.211    Database: monemd_loja_virtual
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administradores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) /*!50100 TABLESPACE `monemd_loja_virtual` */ ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'admin','$2y$10$M/bu9eeju1TyHWJZujZ0l.iwA/VVE60VL6.FtXcZbnkJ5IhQoKlBK');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipn_logs`
--

DROP TABLE IF EXISTS `ipn_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipn_logs` (
  `txn_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payer_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mc_gross` double(10,2) DEFAULT NULL,
  `item_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payer_id` int DEFAULT NULL
) /*!50100 TABLESPACE `monemd_loja_virtual` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipn_logs`
--

LOCK TABLES `ipn_logs` WRITE;
/*!40000 ALTER TABLE `ipn_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipn_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedido`
--

DROP TABLE IF EXISTS `itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens_pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_id` (`pedido_id`),
  KEY `fk_produto_id` (`produto_id`),
  CONSTRAINT `fk_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `fk_produto_id` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `itens_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `itens_pedido_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) /*!50100 TABLESPACE `monemd_loja_virtual` */ ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido`
--

LOCK TABLES `itens_pedido` WRITE;
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` VALUES (86,80,21,2,50.00),(87,81,21,2,50.00),(88,82,21,1,50.00),(89,83,21,1,50.00),(90,84,21,1,50.00),(93,86,28,1,150.00),(94,87,28,1,150.00);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'Pendente',
  `data_pedido` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) /*!50100 TABLESPACE `monemd_loja_virtual` */ ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (13,1,10.00,'Pendente','2024-09-02 05:07:54'),(14,1,20.00,'Pendente','2024-09-02 11:38:13'),(15,1,1300.00,'Pendente','2024-09-02 11:38:26'),(19,1,10.00,'Pendente','2024-09-02 12:05:00'),(20,1,10.00,'Pendente','2024-09-02 13:08:36'),(21,1,10.00,'Pendente','2024-09-02 13:08:47'),(22,1,20.00,'Pendente','2024-09-02 13:16:55'),(23,1,20.00,'Pendente','2024-09-02 13:16:57'),(24,1,20.00,'Pendente','2024-09-02 13:17:36'),(25,1,10.00,'Pendente','2024-09-02 13:17:47'),(26,1,20.00,'Pendente','2024-09-02 13:20:07'),(27,1,10.00,'Pendente','2024-09-02 13:20:16'),(28,1,1350.00,'Pendente','2024-09-02 13:24:57'),(29,1,10.00,'Pendente','2024-09-02 13:25:25'),(30,1,70.00,'Pendente','2024-09-02 14:32:40'),(31,1,10.00,'Pendente','2024-09-02 14:32:49'),(32,1,1300.00,'Pendente','2024-09-02 14:33:28'),(33,1,0.00,'Pendente','2024-09-02 15:04:35'),(34,1,0.00,'Pendente','2024-09-02 15:04:39'),(35,1,0.00,'Pendente','2024-09-02 15:04:43'),(36,1,0.00,'Pendente','2024-09-02 15:05:31'),(37,1,0.00,'Pendente','2024-09-02 15:05:39'),(38,1,0.00,'Pendente','2024-09-02 15:10:25'),(39,1,0.00,'Pendente','2024-09-02 15:11:06'),(40,1,0.00,'Pendente','2024-09-02 15:11:26'),(41,1,0.00,'Pendente','2024-09-02 15:11:41'),(42,1,0.00,'Pendente','2024-09-02 15:18:05'),(43,1,0.00,'Pendente','2024-09-02 15:18:12'),(44,1,0.00,'Pendente','2024-09-02 15:18:16'),(45,1,0.00,'Pendente','2024-09-02 15:18:24'),(46,1,0.00,'Pendente','2024-09-02 15:20:00'),(47,1,0.00,'Pendente','2024-09-02 15:20:05'),(48,1,10.00,'Pendente','2024-09-02 15:24:54'),(49,1,10.00,'Pendente','2024-09-02 15:25:00'),(50,1,10.00,'Pendente','2024-09-02 15:27:40'),(51,1,1010.00,'Pendente','2024-09-02 15:27:55'),(52,1,1000.00,'Pendente','2024-09-02 15:28:30'),(53,1,10.00,'Pendente','2024-09-02 15:38:00'),(54,1,1010.00,'Pendente','2024-09-02 15:38:12'),(55,1,1010.00,'Pendente','2024-09-02 15:48:26'),(56,1,320.00,'Pendente','2024-09-02 16:12:56'),(57,5,10.00,'Pendente','2024-09-02 16:21:28'),(58,5,1010.00,'Pendente','2024-09-02 16:22:23'),(59,1,1000.00,'Pendente','2024-09-02 16:29:29'),(60,6,500.00,'Pendente','2024-09-02 16:30:27'),(61,1,500.00,'Pendente','2024-09-02 21:40:27'),(62,1,500.00,'Pendente','2024-09-02 21:42:53'),(63,1,400.00,'Pendente','2024-09-03 13:32:46'),(64,1,500.00,'Pendente','2024-09-03 16:45:02'),(65,9,500.00,'Pendente','2024-09-03 19:27:37'),(66,1,1000.00,'Pendente','2024-09-11 18:25:22'),(67,1,300.00,'Pendente','2024-09-11 18:25:31'),(68,1,500.00,'aguardando','2024-09-11 18:30:19'),(69,1,500.00,'aguardando','2024-09-11 18:33:31'),(70,1,1000.00,'aguardando','2024-09-11 18:33:45'),(71,1,1000.00,'aguardando','2024-09-11 18:36:06'),(72,1,1000.00,'aguardando','2024-09-11 18:37:19'),(73,1,1000.00,'aguardando','2024-09-11 18:41:24'),(74,1,1000.00,'aguardando','2024-09-11 18:42:10'),(75,1,1000.00,'aguardando','2024-09-11 18:42:22'),(76,1,1300.00,'aguardando','2024-09-11 18:52:20'),(77,1,1300.00,'aguardando','2024-09-11 18:52:36'),(78,27,100.00,'pago','2024-09-17 20:09:11'),(79,27,100.00,'pago','2024-09-17 20:12:29'),(80,27,100.00,'pago','2024-09-17 20:13:27'),(81,28,100.00,'pago','2024-09-17 22:50:29'),(82,28,50.00,'pago','2024-09-17 22:51:16'),(83,28,50.00,'pago','2024-09-17 22:52:38'),(84,29,150.00,'pago','2024-09-18 02:05:25'),(86,31,150.00,'pago','2024-09-18 10:47:46'),(87,32,150.00,'pago','2024-09-18 14:20:48');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_general_ci,
  `preco` decimal(10,2) DEFAULT NULL,
  `estoque` int DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `categoria` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) /*!50100 TABLESPACE `monemd_loja_virtual` */ ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (21,'Dieta proteica','E-book digital com várias receitas saudáveis e proteicas para hipertrofia muscular.',50.00,NULL,NULL,NULL,'frango_com_requeij_o_3.jpg'),(28,'Dieta cetogênica','Compre este pacote e receba as mais deliciosas receitas da famosa dieta cetogênica!',150.00,NULL,NULL,NULL,'images (7).jpg');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacoes`
--

DROP TABLE IF EXISTS `transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `codigo_transacao` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('Aprovado','Pendente','Cancelado') COLLATE utf8mb4_general_ci DEFAULT 'Pendente',
  `data_transacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  CONSTRAINT `transacoes_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`)
) /*!50100 TABLESPACE `monemd_loja_virtual` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacoes`
--

LOCK TABLES `transacoes` WRITE;
/*!40000 ALTER TABLE `transacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `senha` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) /*!50100 TABLESPACE `monemd_loja_virtual` */ ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Monique Emídio de oliveira','moniquemidio@gmail.com','$2y$10$uufoQEEnYNgJG/F/nClWCOkxwisa5Tty5dfSTk/dGfb2g1tF6g46G','2024-09-02 00:51:24'),(2,'Monique Emídio de oliveira','monique@gmail.com','$2y$10$0qhtcaPsgGlaGVgBCvufveLafx3J/nR7hYVOP7bDJFLFDyMyXo75G','2024-09-02 01:50:42'),(3,'Dica teste','teste@mail.com','$2y$10$EmDyTV3X1lYwEEgqjRsj4eOtLOdghuedylbUoBKh6/7r39scQxh.e','2024-09-02 02:05:23'),(4,'Testando','testando@mail.com','$2y$10$CPpW0dvm1DFxjmxxznhDju.DxuhSEL27CPUad/DGMcVBR0HlYwnR.','2024-09-02 03:30:12'),(5,'Moninha','mona@mail.com','$2y$10$i9M.L.5vmBcrMThUbLSMU.NxZVb9VUYSiP9zitWSdrjNF8TiD4q9u','2024-09-02 16:18:40'),(6,'Matheus','matheus@mail.com','$2y$10$e/KvoDnqx.v7ng103AQ2aOwBuEuL7KmhMMhp.jIYj2ZfUIvkwJFYy','2024-09-02 16:30:11'),(7,'Claudio','claudio@email.com','$2y$10$m71q9F8FG4dCsZnShsc14.z5IbcwbyBg6mqBUtY8B.E/CcPxUQfOi','2024-09-02 21:43:21'),(8,'Éder','eder@mail.com','$2y$10$kgx782sv.HHdjaoHI4Or3.Qyi8FlZAiGhAm5szFKpd5WMerkwdLJ6','2024-09-03 13:34:26'),(9,'Juscelino','juscelino@mail.com','$2y$10$iSP4yJy0LKlPwDSDRqDQeOkHtSa3Ian.NOJdJVbUIbamN6rQn3AmW','2024-09-03 19:26:48'),(10,'Claudio','emidio@mail.com','$2y$10$wvX4dyMsQe0hREsfDQW8peCstiZ6eOTVzZ10dNpm8RaE1OuYnD1Je','2024-09-12 01:38:24'),(11,'Felipe','fm751062@gmail.com','$2y$10$qmkdXJWN0.FEN9paep/1J..QPjxofC5MYpsdDOxcBe//vVH3.TX6.','2024-09-12 17:11:43'),(12,'Isabelli','isabellirica@hotmail.com','$2y$10$GfLL5bNPKReyL.whd7HjA.6/syNXZAf0JX2d2VD5FvFaduuXY4.Rq','2024-09-12 17:22:27'),(13,'gabriel','gabriel@gmail.com','$2y$10$MiMsQXYC6YTy.nqzpZgbXu.9FSkTEhXYzUjWcfE/M2fo8NLrckrra','2024-09-12 17:22:43'),(14,'Monique Teste','moniqueteste@mail.com','$2y$10$rjsLMmB2Sf5A/xCbTcIH..pd1wTHgbuMenADO1dkZB//g0yz190D2','2024-09-14 14:35:13'),(15,'Luis Felipe ','luisfelipe@mail.com','$2y$10$Ek.4FtIWwnw6i2mLCAiu0ekGjSUN1WGVrWjETiW1aZ3ZNRR/EFZIK','2024-09-14 17:43:57'),(16,'Guilherme','guilherme@mail.com','$2y$10$Z.WTadHMtB4GCY238MVQYeUD4g.fMuDXJdmbqiSQDNe/Edm21FaGm','2024-09-14 18:09:34'),(17,'Gabriel','gabriel@mail.com','$2y$10$29PoVD0uBTc8oru8heaOrOD75R5HaVa6O5Wquk5.mby7bYVv.14Hm','2024-09-17 02:27:03'),(18,'User Test','sb-iyvaf32714831@business.example.com','$2y$10$j5K2Z/1JRKPOZY6pOhOLmeJD70j8sKxNiaLE7kMnWCCJ4I.FZeioi','2024-09-17 02:31:35'),(19,'Gabriel Anjos','gabrielanjos@mail.com','$2y$10$b.MCP0KW1nmNsfkotyWN5OfZCvmmhPSGh71zF5CLKtba0qQ6zsq.6','2024-09-17 02:34:57'),(20,'Gabriel Anjos','gabriel123@mail.com','$2y$10$sLRVXuPFWynT7pDSC8.ns.lcdrT1k.WSD7Ar9bMu.N29ve2uc1FI.','2024-09-17 03:52:48'),(21,'Jhon Teste','jhon@mail.com','$2y$10$zJ6ieF08m.r1PCWhj2KY.en0tCerVkDQ/p3J6QZYMkyWr95mZLKs6','2024-09-17 17:43:54'),(22,'Jhon Teste','sb-2bjzd32685299@personal.example.com','$2y$10$ewxqxHtuitpFLelEJTDHt.5NQ/aQND0H/vPMjwJt5r8iR9J.CaPHG','2024-09-17 17:46:36'),(23,'Gabriel','gabriellanfgraf@mail.com','$2y$10$VFME4R5L99fNixPxmMFDyuz2Uni.X0CrLPoV2ge89hNSLgkm9DkKS','2024-09-17 18:03:24'),(24,'Felipe','felipe@mail.com','$2y$10$UUDYshZdB1OQABDDmN66w.Plp68e1ntgr5P0J7grtG6ZpMxMLxVKa','2024-09-17 18:28:23'),(25,'Giovani','giovani@mail.com','$2y$10$NFPhwpu4FhP80KfQDXg6We8ZGrDnscfdgqOkx8I0qeBzo7R/rl3y2','2024-09-17 18:40:20'),(26,'João','joao@mail.com','$2y$10$Gg2VXNdFedEPZf5Rc/H/6eLveZTDBXKy8NpmYZvW3GLPNFQZgKgWm','2024-09-17 19:08:05'),(27,'Watanabe','watanabe@mail.com','$2y$10$/gkSWzRgixlH2FwxTfRmM.58TIyTF3nPTeJ2SQawiibephUuc78eO','2024-09-17 20:01:30'),(28,'Luis Felipe Vicentini','lfelipevicentini@hotmail.com','$2y$10$WAhjqM4rpZoNdeEQ6p.VnuScevg5ubVmy3D8kZw3zFHh.RemIh2h.','2024-09-17 22:46:49'),(29,'Monique','monique@mail.com','$2y$10$1MR9Nb.j3anWxl04cQrCQuimXPhas3WdBkrZF9UjgPRKUBkpqKms2','2024-09-18 02:02:01'),(30,'Teste final','testefinal@mail.com','$2y$10$orgHV/JmxcWjpffPgkr5/eSYkBNkYD/dXM9iS1ndAQKf0uDL45TMK','2024-09-18 03:24:48'),(31,'Igor','igor@mail.com','$2y$10$waznI46Ptz/1bBTggjKGNuICVRcvpketZ3RX4GlwToWwbCS77RMXK','2024-09-18 10:44:14'),(32,'Teste Alunos','testealunos@mail.com','$2y$10$lVblU0gYjENBSkKjCKO86.0dN3KD1G15bpFMcNFI9aWE24lMFlZP.','2024-09-18 14:15:03');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-18 16:28:06
