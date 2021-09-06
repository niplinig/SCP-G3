CREATE DATABASE  IF NOT EXISTS `G3P1_contador_personas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `G3P1_contador_personas`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: G3P1_contador_personas
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `Asiste`
--

DROP TABLE IF EXISTS `Asiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Asiste` (
  `id_usuario_A` varchar(10) NOT NULL,
  `codigo_area_A` varchar(6) NOT NULL,
  KEY `id_usuario_idx` (`id_usuario_A`),
  KEY `codigo_area_A_idx` (`codigo_area_A`),
  CONSTRAINT `codigo_area_A` FOREIGN KEY (`codigo_area_A`) REFERENCES `Lugar` (`codigo_area`),
  CONSTRAINT `id_usuario_A` FOREIGN KEY (`id_usuario_A`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asiste`
--

LOCK TABLES `Asiste` WRITE;
/*!40000 ALTER TABLE `Asiste` DISABLE KEYS */;
INSERT INTO `Asiste` VALUES ('0865672738','AAA100'),('0943654673','ABB200'),('0967622311','ACC300'),('0934567236','ADD400'),('0917772459','BAB500'),('0917572231','BAC600'),('0945672337','BAD700'),('0987672335','BCC800'),('0945656654','CCA900'),('0923432430','CAD200'),('0942343232','COP300'),('0978787881','CUT400'),('0912373435','CTH200'),('0912323232','DTO300'),('0948786788','DJG500'),('0942343243','DEJ100'),('0976563454','DKD600'),('0942343432','DUE300'),('0656456546','EQI330'),('0945111233','EIT560');
/*!40000 ALTER TABLE `Asiste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Asistencias`
--

DROP TABLE IF EXISTS `Asistencias`;
/*!50001 DROP VIEW IF EXISTS `Asistencias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Asistencias` AS SELECT
 1 AS `id_usuario_A`,
 1 AS `codigo_area_A`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Chip_Wireless`
--

DROP TABLE IF EXISTS `Chip_Wireless`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chip_Wireless` (
  `mac_address_disp` varchar(48) NOT NULL,
  `Cedula` varchar(10) NOT NULL,
  PRIMARY KEY (`mac_address_disp`),
  UNIQUE KEY `mac_address_disp_UNIQUE` (`mac_address_disp`),
  KEY `Cedula_idx` (`Cedula`),
  CONSTRAINT `Cedula` FOREIGN KEY (`Cedula`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chip_Wireless`
--

LOCK TABLES `Chip_Wireless` WRITE;
/*!40000 ALTER TABLE `Chip_Wireless` DISABLE KEYS */;
INSERT INTO `Chip_Wireless` VALUES ('73-97-C2-7D-E3-E8','0656456546'),('70-E2-84-70-E2-84','0865672738'),('53-9B-36-93-2C-C8','0912323232'),('10-08-79-EA-CF-9A','0912373435'),('52-29-56-BA-45-50','0917572231'),('F2-8C-FB-02-40-46','0917772459'),('CF-E9-3F-44-01-23','0923432430'),('90-DB-55-F8-19-11','0934567236'),('47-9E-BC-FA-98-D7','0942343232'),('45-0F-3B-79-37-4C','0942343243'),('F9-AF-72-AE-BE-C4','0942343432'),('20-F7-45-4F-0E-31','0943654673'),('D1-83-70-6C-CE-02','0945111233'),('9D-54-F6-39-81-10','0945656654'),('9C-19-EF-EF-5A-DB','0945672337'),('8F-6A-67-B5-5A-73','0948786788'),('0B-DF-55-49-A8-DF','0967622311'),('0B-EF-86-1A-6E-88','0976563454'),('FB-C5-1B-9D-A0-54','0978787881'),('43-9A-5E-38-9C-79','0987672335');
/*!40000 ALTER TABLE `Chip_Wireless` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ciudad`
--

DROP TABLE IF EXISTS `Ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ciudad` (
  `Nombre` varchar(45) NOT NULL,
  `Sectores` varchar(45) NOT NULL,
  `Poblacion` int NOT NULL,
  PRIMARY KEY (`Nombre`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ciudad`
--

LOCK TABLES `Ciudad` WRITE;
/*!40000 ALTER TABLE `Ciudad` DISABLE KEYS */;
INSERT INTO `Ciudad` VALUES ('Ambato','Norte',165185),('Babahoyo','Sur',90191),('Cuenca','Este',329928),('Daule','Este',65145),('Durán','Norte',230839),('Esmeraldas','Sur',154035),('Guayaquil','Norte',2278691),('Ibarra','Oeste',131856),('La libertad','Oeste',95942),('Latacunga','Sur',63842),('Loja','Este',170280),('Machala','Sur',231260),('Manta','Este',217553),('Milagro','Este',133508),('Napo','Oeste',45933),('Portoviejo','Oeste',206682),('Quevedo','Norte',150827),('Quito','Sur',1607734),('Riobamba','Sur',146324),('Sangolquí','Norte',75080),('Santo Domingo','Oeste',270875);
/*!40000 ALTER TABLE `Ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `RUC` varchar(13) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`RUC`),
  UNIQUE KEY `RUC_UNIQUE` (`RUC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES ('1711109093001','Felicidad Cardenas'),('1711232212001','Consuelo Pacheco'),('1712323323001','Amina Vives'),('1712382353001','Ona Arce'),('1720940394001','Ernesto Chacon'),('1723432423001','Rita Climent'),('1723434323001','Biel Giraldo'),('1727382738001','Adolfo Bosch'),('1734534545001','Rogelio Diez'),('1734594854001','Iñigo Palomo'),('1745095045001','Ramiro Oliva'),('1745453452001','Sandra Huertas'),('1765464565001','Juan Gonzalez'),('1765645645001','Ester Ibañez'),('1767464565001','Anna Maya'),('1776576766001','Loreto Montilla'),('1777690454001','Jose-Manuel Luque'),('1779238284567','Juan Pueblo'),('1787686049001','Isabel Miguez'),('1790293029001','Maria-Emilia Cifuentes'),('1793943043001','Noemi Rincon'),('1799238284001','Jon Lozano');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Definir_area`
--

DROP TABLE IF EXISTS `Definir_area`;
/*!50001 DROP VIEW IF EXISTS `Definir_area`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Definir_area` AS SELECT
 1 AS `codigo_area`,
 1 AS `ubicacion`,
 1 AS `latitud`,
 1 AS `longitud`,
 1 AS `radio`,
 1 AS `sector`,
 1 AS `codigo_postal`,
 1 AS `cantidad_personas`,
 1 AS `ciudad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Digitalizar_datos`
--

DROP TABLE IF EXISTS `Digitalizar_datos`;
/*!50001 DROP VIEW IF EXISTS `Digitalizar_datos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Digitalizar_datos` AS SELECT
 1 AS `Usuario`,
 1 AS `Telefono`,
 1 AS `MAC_ADDRESS_Dispositivo`,
 1 AS `Fecha`,
 1 AS `Hora`,
 1 AS `Area`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Establecer_monitoreo`
--

DROP TABLE IF EXISTS `Establecer_monitoreo`;
/*!50001 DROP VIEW IF EXISTS `Establecer_monitoreo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Establecer_monitoreo` AS SELECT
 1 AS `mac_address_bcn`,
 1 AS `fecha_registro`,
 1 AS `hora_registro`,
 1 AS `operativo`,
 1 AS `rango`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Grupos_Puntos_Comunicacion`
--

DROP TABLE IF EXISTS `Grupos_Puntos_Comunicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grupos_Puntos_Comunicacion` (
  `id_grupo` int NOT NULL,
  `g_operativo` tinyint(1) DEFAULT NULL,
  `cantidad` int NOT NULL,
  `rango_cubierto` double(5,2) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grupos_Puntos_Comunicacion`
--

LOCK TABLES `Grupos_Puntos_Comunicacion` WRITE;
/*!40000 ALTER TABLE `Grupos_Puntos_Comunicacion` DISABLE KEYS */;
INSERT INTO `Grupos_Puntos_Comunicacion` VALUES (10594,1,586,919.91),(40114,1,295,461.03),(40120,1,978,608.13),(44736,1,988,728.20),(51491,0,393,153.50),(53951,0,987,466.81),(54283,1,405,933.77),(58802,0,703,285.23),(60421,1,894,430.13),(62708,1,279,647.52),(64287,1,467,157.67),(72854,1,401,148.25),(73606,1,579,640.78),(75248,1,690,822.83),(78961,1,996,600.65),(80987,1,552,495.70),(82795,1,545,116.23),(83714,0,542,636.99),(84860,1,347,253.88),(85096,0,992,496.89),(93931,1,744,700.68);
/*!40000 ALTER TABLE `Grupos_Puntos_Comunicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lugar`
--

DROP TABLE IF EXISTS `Lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lugar` (
  `codigo_area` varchar(6) NOT NULL,
  `ubicacion` varchar(30) NOT NULL DEFAULT 'desconocido',
  `latitud` varchar(20) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  `radio` float(5,2) NOT NULL,
  `sector` varchar(30) DEFAULT 'desconocido',
  `codigo_postal` varchar(6) NOT NULL,
  `cantidad_personas` int NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo_area`,`ubicacion`),
  UNIQUE KEY `codigo_area_UNIQUE` (`codigo_area`),
  UNIQUE KEY `ubicacion_UNIQUE` (`ubicacion`),
  KEY `ciudad _idx` (`ciudad`),
  CONSTRAINT `ciudad` FOREIGN KEY (`ciudad`) REFERENCES `Ciudad` (`Nombre`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lugar`
--

LOCK TABLES `Lugar` WRITE;
/*!40000 ALTER TABLE `Lugar` DISABLE KEYS */;
INSERT INTO `Lugar` VALUES ('AAA100','Av.9Octubre','-79.3223','89.1919',200.12,'centro','090101',20,'Guayaquil'),('ABB200','Av.LeonFC.','-64.1902','-73.8219',300.12,'norte','090102',30,'Guayaquil'),('ACC300','Av.JuanTancaM','-65.0996','-121.3442',400.12,'norte','090103',40,'Guayaquil'),('ADD400','Av.Colon','-86.9268','137.3438',500.12,'norte','090104',10,'Guayaquil'),('BAB500','Av.Cristobal','11.4021','46.4785',600.12,'centro','090105',15,'Guayaquil'),('BAC600','Av.Fernandez','24.0210','102.1295',200.12,'sur','090106',19,'Guayaquil'),('BAD700','Av.ElEjercito','-53.1092','176.1538',100.12,'sur','090107',30,'Guayaquil'),('BCC800','Av.ElBombero','54.9589','-133.3480',200.12,'norte','090108',20,'Guayaquil'),('CAD200','Av.Boyaca','80.4871','-119.9449',200.12,'centro','090200',50,'Guayaquil'),('CCA900','Av.Daule','43.3155','-64.0480',200.12,'norte','090109',34,'Guayaquil'),('COP300','Miraflores','-23.8738','147.5909',200.12,'norte','090201',20,'Guayaquil'),('CTH200','Ceibos','-33.4023','-32.0751',200.12,'norte','090331',49,'Guayaquil'),('CUT400','Prosperina','-21.6032','-159.4199',300.12,'norte','090221',25,'Guayaquil'),('DEJ100','MuchoLote2','-66.6181','97.1271',400.12,'norte','090349',88,'Guayaquil'),('DJG500','MuchoLote','69.1715','135.8642',800.12,'norte','090171',90,'Guayaquil'),('DKD600','SanMarino','62.2650','-80.0556',700.12,'centronorte','090501',500,'Guayaquil'),('DTO300','Urdesa','-40.0642','-166.5245',500.12,'norte','090601',80,'Guayaquil'),('DUE300','MallDelSol','11.4389','-168.3510',500.12,'norte','090751',660,'Guayaquil'),('EIT560','MallDelRio','16.9310','29.1762',400.12,'norte','090165',700,'Guayaquil'),('EQI330','MallDelSur','-86.7048','-155.6245',600.12,'sur','090101',550,'Guayaquil'),('EQI389','Rotonda','-84.7648','-165.6275',630.12,'norte','090106',420,'Guayaquil');
/*!40000 ALTER TABLE `Lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Puntos_Comunicacion`
--

DROP TABLE IF EXISTS `Puntos_Comunicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Puntos_Comunicacion` (
  `mac_address_bcn` varchar(48) NOT NULL,
  `latitud` varchar(20) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  `mensaje` varchar(100) NOT NULL,
  `operativo` varchar(20) NOT NULL,
  `rango` float(5,2) NOT NULL,
  PRIMARY KEY (`mac_address_bcn`),
  UNIQUE KEY `mac_address_bcn_UNIQUE` (`mac_address_bcn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Puntos_Comunicacion`
--

LOCK TABLES `Puntos_Comunicacion` WRITE;
/*!40000 ALTER TABLE `Puntos_Comunicacion` DISABLE KEYS */;
INSERT INTO `Puntos_Comunicacion` VALUES ('0B-72-39-F2-D9-E0','49.4394','-83.8382','We know','1',573.48),('23-06-26-FC-37-7A','51.0041','-125.6636','We dedicate ourselves to excellence','1',168.75),('3F-4E-6B-F0-3F-0F','-9.6375','3.3359','No one does like us','0',245.71),('42-D1-3A-70-21-DE','-73.1692','165.4254','Skillful technicians','1',165.63),('4E-03-FB-D1-A8-B3','-84.0400','-160.4390','The authority','1',117.60),('50-B4-1A-B7-6C-51','45.4411','123.0543','Slick','0',202.10),('60-68-3D-5D-90-5E','-50.7029','167.0082','We pledge ourselves to impeccable','1',707.31),('6C-5C-47-EF-96-65','79.9848','-20.6164','We take pride in excellent','1',165.71),('77-00-72-15-B6-0D','62.6581','-142.5479','The devoted virtuosos','0',643.20),('8E-59-F8-6B-95-B6','-33.3871','-24.2467','The notebooks for school','1',592.74),('94-33-E5-4F-92-CE','16.6438','-36.2025','The consummate purveyors','1',566.00),('98-77-62-DF-E8-98','-15.1013','78.6177','Raising the bar for excellence','1',753.42),('A1-FA-31-3C-AA-FF','-44.3368','-102.1248','The first-rate mavens','0',200.00),('A7-25-EA-38-76-EC','8.6270','-83.1814','The people','0',536.92),('A9-E4-CB-89-64-94','-56.3507','-83.1854','We take pride in our','1',677.82),('D0-94-3D-BB-0B-6E','-1.7777','-160.9671','The trusted source for everything','1',336.60),('D4-30-30-66-ED-B1','69.4804','-128.2399','Devoted to marvelous','0',997.47),('D4-35-18-77-EC-BC','-9.6525','93.1983','Masters of','0',617.85),('E5-3F-96-9B-2D-05','73.8418','5.1878','The top-notch technicians','1',824.27),('F2-0C-5B-E8-4A-0C','55.3839','177.3963','The authority on','1',398.65),('F2-65-52-46-B7-A6','-32.3971','-26.2587','Its the of your dreams','0',582.76);
/*!40000 ALTER TABLE `Puntos_Comunicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registra`
--

DROP TABLE IF EXISTS `Registra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Registra` (
  `id_usuario` varchar(10) NOT NULL,
  `mac_address_bcn` varchar(48) NOT NULL,
  PRIMARY KEY (`id_usuario`,`mac_address_bcn`),
  KEY `id_usuario_idx` (`id_usuario`),
  KEY `mac_address_bcn_idx` (`mac_address_bcn`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `mac_address_bcn` FOREIGN KEY (`mac_address_bcn`) REFERENCES `Puntos_Comunicacion` (`mac_address_bcn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registra`
--

LOCK TABLES `Registra` WRITE;
/*!40000 ALTER TABLE `Registra` DISABLE KEYS */;
INSERT INTO `Registra` VALUES ('0656456546','A9-E4-CB-89-64-94'),('0865672738','6C-5C-47-EF-96-65'),('0912323232','E5-3F-96-9B-2D-05'),('0912373435','D0-94-3D-BB-0B-6E'),('0917572231','23-06-26-FC-37-7A'),('0917772459','4E-03-FB-D1-A8-B3'),('0923432430','98-77-62-DF-E8-98'),('0934567236','D4-35-18-77-EC-BC'),('0942343232','3F-4E-6B-F0-3F-0F'),('0942343243','50-B4-1A-B7-6C-51'),('0942343432','D4-30-30-66-ED-B1'),('0943654673','A7-25-EA-38-76-EC'),('0945111233','6C-5C-47-EF-96-65'),('0945111233','F2-0C-5B-E8-4A-0C'),('0945656654','42-D1-3A-70-21-DE'),('0945672337','77-00-72-15-B6-0D'),('0948786788','F2-65-52-46-B7-A6'),('0967622311','60-68-3D-5D-90-5E'),('0976563454','94-33-E5-4F-92-CE'),('0978787881','0B-72-39-F2-D9-E0'),('0987672335','A1-FA-31-3C-AA-FF');
/*!40000 ALTER TABLE `Registra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registra_Observacion`
--

DROP TABLE IF EXISTS `Registra_Observacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Registra_Observacion` (
  `id_observacion` int NOT NULL,
  `fecha_registro` date NOT NULL,
  `hora_registro` time NOT NULL,
  `ubicacion_observador` varchar(30) NOT NULL,
  `mac_address_punto` varchar(48) NOT NULL,
  PRIMARY KEY (`id_observacion`),
  UNIQUE KEY `id_observacion_UNIQUE` (`id_observacion`),
  KEY `mac_address_punto_idx` (`mac_address_punto`),
  KEY `ubicacion_observador_idx` (`ubicacion_observador`),
  CONSTRAINT `mac_address_punto` FOREIGN KEY (`mac_address_punto`) REFERENCES `Puntos_Comunicacion` (`mac_address_bcn`),
  CONSTRAINT `ubicacion_observador` FOREIGN KEY (`ubicacion_observador`) REFERENCES `Lugar` (`ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registra_Observacion`
--

LOCK TABLES `Registra_Observacion` WRITE;
/*!40000 ALTER TABLE `Registra_Observacion` DISABLE KEYS */;
INSERT INTO `Registra_Observacion` VALUES (1111,'2021-12-09','12:33:33','MallDelRio','F2-0C-5B-E8-4A-0C'),(2222,'2021-10-07','15:20:43','MallDelSur','A9-E4-CB-89-64-94'),(2344,'2021-05-03','15:33:23','MuchoLote','F2-65-52-46-B7-A6'),(2499,'2021-02-14','16:35:04','MallDelSol','D4-30-30-66-ED-B1'),(2922,'2021-10-03','12:20:01','Av.9Octubre','6C-5C-47-EF-96-65'),(3262,'2021-02-01','10:20:02','Av.JuanTancaM','60-68-3D-5D-90-5E'),(3322,'2021-01-01','11:30:01','Av.LeonFC.','A7-25-EA-38-76-EC'),(4219,'2021-06-13','13:20:44','Av.ElEjercito','77-00-72-15-B6-0D'),(4943,'2021-08-17','19:42:05','Urdesa','E5-3F-96-9B-2D-05'),(5372,'2021-03-29','08:20:01','Av.Colon','D4-35-18-77-EC-BC'),(5432,'2021-04-28','09:30:22','Av.Cristobal','4E-03-FB-D1-A8-B3'),(5992,'2021-10-18','19:35:01','Ceibos','D0-94-3D-BB-0B-6E'),(6284,'2021-11-21','18:30:44','Prosperina','0B-72-39-F2-D9-E0'),(6654,'2021-04-16','13:20:48','MuchoLote2','50-B4-1A-B7-6C-51'),(8821,'2021-10-22','17:45:22','Miraflores','3F-4E-6B-F0-3F-0F'),(8887,'2021-05-12','10:50:01','Av.Fernandez','23-06-26-FC-37-7A'),(9543,'2021-07-14','14:30:22','Av.ElBombero','A1-FA-31-3C-AA-FF'),(9555,'2021-09-28','16:20:22','Av.Boyaca','98-77-62-DF-E8-98'),(9659,'2021-08-15','15:40:01','Av.Daule','42-D1-3A-70-21-DE'),(9942,'2021-06-15','17:20:55','SanMarino','94-33-E5-4F-92-CE');
/*!40000 ALTER TABLE `Registra_Observacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Registrar_observacion`
--

DROP TABLE IF EXISTS `Registrar_observacion`;
/*!50001 DROP VIEW IF EXISTS `Registrar_observacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Registrar_observacion` AS SELECT
 1 AS `usuario`,
 1 AS `Fecha`,
 1 AS `Hora`,
 1 AS `Observador`,
 1 AS `Area`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `id_usuario` varchar(10) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `Cedula_UNIQUE` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES ('0656456546','0987878666'),('0706389510','0992361009'),('0865672738','0957675676'),('0912323232','0912365465'),('0912373435','0986456565'),('0917572231','0928536563'),('0917772459','0985272556'),('0923432430','0912231232'),('0934567236','0976573554'),('0942343232','0998979866'),('0942343243','0912323222'),('0942343432','0912322266'),('0943654673','0923423434'),('0945111233','0911232312'),('0945656654','0909576324'),('0945672337','0998644523'),('0948786788','0996786423'),('0967622311','0912323233'),('0976563454','0946767655'),('0978787881','0912323231'),('0987672335','0912367454');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`grupo3P1`@`%`*/ /*!50003 TRIGGER `insertar_Asiste` BEFORE INSERT ON `Usuario` FOR EACH ROW BEGIN
    DECLARE id_usuario_en_tabla_asiste VARCHAR(10);
    SELECT id_usuario INTO id_usuario_en_tabla_asiste FROM Asiste WHERE id_usuario LIKE NEW.id_usuario;

	IF id_usuario_en_tabla_asiste IS NULL THEN
		INSERT INTO Asiste(id_usuario, codigo_area) VALUES (NEW.id_usuario, (SELECT codigo_area FROM Lugar WHERE ciudad LIKE "Guayaquil" LIMIT 1));
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`grupo3P1`@`%`*/ /*!50003 TRIGGER `auto_insertar_Asiste` BEFORE INSERT ON `Usuario` FOR EACH ROW BEGIN
    DECLARE id_usuario_en_tabla_asiste VARCHAR(10);
    SELECT id_usuario INTO id_usuario_en_tabla_asiste FROM Asiste WHERE id_usuario LIKE NEW.id_usuario;

	IF id_usuario_en_tabla_asiste IS NULL THEN
		INSERT INTO Asiste(id_usuario, codigo_area) VALUES (NEW.id_usuario, (SELECT codigo_area FROM Lugar WHERE ciudad LIKE "Guayaquil" LIMIT 1));
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`grupo3P1`@`%`*/ /*!50003 TRIGGER `auto_insertar_Registra` BEFORE INSERT ON `Usuario` FOR EACH ROW BEGIN
	DECLARE _mac_adrress_bcn VARCHAR(48);
    SELECT mac_adrress_bcn INTO _mac_adrress_bcn FROM Puntos_Comunicacion WHERE mac_adrress_bcn LIKE (SELECT mac_address_disp FROM Chip_Wireless WHERE id_usuario LIKE NEW.id_usuario LIMIT 1);

    IF _mac_adrress_bcn IS NULL THEN
		INSERT INTO Registra(id_usuario, mac_address_bcn) VALUES (NEW.id_usuario, (SELECT mac_address_disp FROM Chip_Wireless WHERE id_usuario LIKE NEW.id_usuario LIMIT 1));
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'G3P1_contador_personas'
--

--
-- Dumping routines for database 'G3P1_contador_personas'
--
/*!50003 DROP PROCEDURE IF EXISTS `aforo_actual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `aforo_actual`(IN in_ubicacion VARCHAR(30))
BEGIN
    SELECT L.ciudad AS ciudad, RO.ubicacion_observador AS ubicacion, RO.fecha_registro AS fecha_consultada, L.cantidad_personas AS cantidad_personas
    FROM Lugar AS L, Registra_Observacion AS RO
    WHERE L.ubicacion = RO.ubicacion_observador
    AND RO.ubicacion_observador LIKE in_ubicacion
    AND RO.fecha_registro = CURRENT_DATE();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cant_personas_por_lugar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `cant_personas_por_lugar`(IN lugar VARCHAR(40))
BEGIN
	SELECT Lugar.cantidad_personas, Lugar.ubicacion
	FROM Lugar
	WHERE Lugar.ubicacion = lugar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_Asiste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `delete_Asiste`(IN id_tabla VARCHAR(10))
BEGIN

	DECLARE id_usuario_A_resultante VARCHAR(10);
	SET id_usuario_A_resultante = (SELECT id_usuario FROM Asiste WHERE id_usuario LIKE id_tabla);

	IF (id_usuario_A_resultante IS NOT NULL) THEN

		DELETE FROM Asiste
	    WHERE id_usuario_A = id_tabla;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Borrado exitoso';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al borrar, el valor de id_usuario_A no existe en la tabla Asiste';

	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_Chip_Wireless` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `delete_Chip_Wireless`(IN id_tabla VARCHAR(48))
BEGIN

	DECLARE mac_address_disp_resultante VARCHAR(48);
	SET mac_address_disp_resultante = (SELECT mac_address_disp FROM Chip_Wireless WHERE mac_address_disp LIKE id_tabla);

	IF (mac_address_resultante IS NOT NULL) THEN

		DELETE FROM Chip_Wireless
	    WHERE mac_address_disp = mac_address_disp_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Borrado exitoso';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al borrar, el valor de id_usuario_A no existe en la tabla Asiste';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_Ciudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `delete_Ciudad`(IN id_tabla VARCHAR(45))
BEGIN

	DECLARE Nombre_resultante VARCHAR(45);
	SET Nombre_resultante = (SELECT Nombre FROM Ciudad WHERE Nombre LIKE id_tabla);

	IF (Nombre_resultante IS NOT NULL) THEN

		DELETE FROM Ciudad
	    WHERE Nombre = Nombre_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Borrado exitoso';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al borrar, el valor de id_usuario_A no existe en la tabla Asiste';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `delete_Cliente`(IN id_tabla VARCHAR(13))
BEGIN

	DECLARE RUC_resultante VARCHAR(13);
	SET RUC_resultante = (SELECT RUC FROM Cliente WHERE RUC LIKE id_tabla);

	IF (Nombre_resultante IS NOT NULL) THEN

		DELETE FROM Cliente
	    WHERE RUC = RUC_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Borrado exitoso';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al borrar, el valor de id_usuario_A no existe en la tabla Asiste';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_Grupos_Puntos_Comunicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `delete_Grupos_Puntos_Comunicacion`(IN id_tabla INT)
BEGIN

	DECLARE id_grupo_resultante INT;
	SET id_grupo_resultante = (SELECT id_grupo FROM Grupos_Puntos_Comunicacion WHERE id_grupo LIKE id_tabla);

	IF (id_grupo_resultante IS NOT NULL) THEN

		DELETE FROM Grupos_Puntos_Comunicacion
	    WHERE id_grupo = id_grupo_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Borrado exitoso';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al borrar, el valor de id_usuario_A no existe en la tabla Asiste';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_Lugar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `delete_Lugar`(IN id_tabla VARCHAR(6))
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);
	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area LIKE id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		DELETE FROM Lugar
	    WHERE codigo_area = codigo_area_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Borrado exitoso';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al borrar, el valor de id_usuario_A no existe en la tabla Asiste';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_Puntos_Comunicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `delete_Puntos_Comunicacion`(IN where_argument VARCHAR(10))
BEGIN
	DELETE FROM Puntos_Comunicacion
    WHERE mac_adrress_bcn = where_argument;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_Registra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `delete_Registra`(IN id_tabla VARCHAR(10))
BEGIN

	DECLARE id_usuario_resultante VARCHAR(10);
	SET id_usuario_resultante = (SELECT id_usuario FROM Registra WHERE id_usuario LIKE id_tabla);

	IF (id_usuario_resultante IS NOT NULL) THEN

		DELETE FROM Registra
	    WHERE id_usuario = id_usuario_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Borrado exitoso';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al borrar, el valor de id_usuario_A no existe en la tabla Asiste';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_Registra_Observacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `delete_Registra_Observacion`(IN id_tabla INT)
BEGIN

	DECLARE id_observacion_resultante INT;
	SET id_observacion_resultante = (SELECT id_observacion FROM Registra_Observacion WHERE id_observacion = id_tabla);

	IF (id_observacion_resultante IS NOT NULL) THEN

		DELETE FROM Registra_Observacion
	    WHERE id_observacion = id_observacion_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Borrado exitoso';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al borrar, el valor de id_usuario_A no existe en la tabla Asiste';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `delete_Usuario`(IN id_tabla VARCHAR(10))
BEGIN

	DECLARE id_usuario_resultante VARCHAR(10);
	SET id_usuario_resultante = (SELECT id_usuario FROM Usuario WHERE id_usuario = id_tabla);

	IF (id_usuario_resultante IS NOT NULL) THEN

		DELETE FROM Usuario
	    WHERE id_usuario LIKE id_usuario_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Borrado exitoso';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al borrar, el valor de id_usuario_A no existe en la tabla Asiste';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingresar_chip_wireless` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `ingresar_chip_wireless`(IN C_mac_address varchar(48), IN C_cedula varchar(10))
BEGIN
declare variable_cedula varchar(10);
	SELECT id_usuario INTO variable_cedula FROM Usuario
    WHERE Usuario.id_usuario = C_cedula;

    if variable_cedula is not null then
		INSERT INTO Chip_Wireless (mac_address_disp, Cedula)
		VALUES (C_mac_address, C_cedula);
		COMMIT;
	else
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET message_text = 'Error cedula inexistente';
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingresar_ciudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `ingresar_ciudad`(IN nombre varchar(45), IN sector varchar(45), IN poblacion INT)
BEGIN
	INSERT INTO Ciudad (Nombre, Sectores, Poblacion) VALUES (nombre, sector, poblacion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingresar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `ingresar_cliente`(IN ruc varchar(13), IN nombreclie varchar(45))
BEGIN
	INSERT INTO Cliente (RUC, Nombre) VALUES (ruc, nombreclie);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingresar_grupos_puntoscomunicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `ingresar_grupos_puntoscomunicacion`(IN idgrupo INT,
IN operatividad TINYINT(1), IN cantidad INT, IN rango double(5,2))
BEGIN
	INSERT INTO Grupos_Puntos_Comunicacion (id_grupo, g_operativo, cantidad, rango_cubierto)
    VALUES (idgrupo, operatividad, cantidad, rango);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingresar_lugar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `ingresar_lugar`(IN L_codigoarea varchar(6), IN L_ubicacion varchar(30), IN L_latitud varchar(20),
IN L_longitud varchar(20), IN L_radio float(5,2), IN L_sector varchar(30), IN L_codpostal varchar(6), IN L_cant_personas INT,
IN L_ciudad varchar(10))
BEGIN
declare variable_ciudad varchar(10);
	SELECT Nombre INTO variable_ciudad FROM Ciudad WHERE Ciudad.Nombre = L_ciudad;

    if variable_ciudad is not null then
		INSERT INTO Lugar (codigo_area, ubicacion, latitud, longitud, radio, sector, codigo_postal, cantidad_personas, ciudad)
		VALUES (L_codigoarea, L_ubicacion, L_latitud, L_longitud, L_radio, L_sector, L_codpostal, L_cant_personas, L_ciudad);
		COMMIT;
	else
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET message_text = 'Error de ciudad';
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingresar_puntos_comunicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `ingresar_puntos_comunicacion`(IN mac varchar(48), IN p_latitud varchar(20), IN p_longitud varchar(20),
IN p_mensaje varchar(100), IN p_operativo varchar(20), IN p_rango float(5,2))
BEGIN
	INSERT INTO Puntos_Comunicacion (mac_address_bcn, latitud, longitud, mensaje, operativo, rango)
    VALUES (mac, p_latitud, p_longitud, p_mensaje, p_operativo, p_rango);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingresar_registrode_observacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `ingresar_registrode_observacion`(IN R_idobservacion INT, IN R_fecharegistro DATE, IN R_horaregistro TIME,
IN R_ubiobservador varchar(30), IN R_macaddress varchar(48))
BEGIN
declare variable_mac_address varchar(48);
	SELECT mac_address_bcn INTO variable_mac_address FROM Puntos_Comunicacion
    WHERE Puntos_Comunicacion.mac_address_bcn = R_macaddress;

    if variable_mac_address is not null then
		INSERT INTO Registra_Observacion (id_observacion, fecha_registro, hora_registro, ubicacion_observador, mac_address_punto)
		VALUES (R_idobservacion, R_fecharegistro, R_horaregistro, R_ubiobservador, R_macaddress);
		COMMIT;
	else
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET message_text = 'Error de MAC ADDRESS';
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingresar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `ingresar_usuario`(IN idusuario varchar(10), IN telefono varchar(10))
BEGIN
	INSERT INTO Usuario (id_usuario, Telefono) VALUES (idusuario, telefono);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lugares_por_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `lugares_por_usuario`(IN cedula VARCHAR(10))
BEGIN
	SELECT Lugar.ubicacion , Asiste.id_usuario_A
	FROM Lugar,Asiste
	WHERE Asiste.codigo_area_A = Lugar.codigo_area AND Asiste.id_usuario_A = cedula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mayor_a_rango` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `mayor_a_rango`(IN rango double(5,2))
BEGIN
	SELECT * FROM Grupos_Puntos_Comunicacion WHERE rango_cubierto > rango;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `monitoreo_por_fechas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `monitoreo_por_fechas`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
BEGIN
    IF FECHA_INICIO < FECHA_FIN THEN
        SELECT RO.mac_address_punto AS mac_address, RO.fecha_registro AS fecha, RO.hora_registro AS hora, PC.Operativo AS operativo, PC.Rango AS rango_cubierto
        FROM Puntos_Comunicacion AS PC, Registra_Observacion AS RO
        WHERE mac_address_punto = mac_address_bcn
        AND RO.fecha_registro > FECHA_INICIO
        AND RO.fecha_registro < FECHA_FIN;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_datos_por_ciudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `mostrar_datos_por_ciudad`(IN nomCiudad VARCHAR(40))
BEGIN
	SELECT * FROM Ciudad WHERE Nombre LIKE nomCiudad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_lugares_por_ciudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `mostrar_lugares_por_ciudad`(IN nomCiudad VARCHAR(45))
BEGIN
	SELECT Lugar.ubicacion
	FROM Lugar,Ciudad
	WHERE Ciudad.Nombre = Lugar.ciudad AND Lugar.ciudad = nomCiudad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `observaciones_por_fecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `observaciones_por_fecha`(IN fecha DATE)
BEGIN
	SELECT * FROM Registra_Observacion WHERE fecha_registro = fecha;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `top_5_mayor_aforo_mes_actual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `top_5_mayor_aforo_mes_actual`()
BEGIN
	DECLARE mes_actual VARCHAR(10);
    SET mes_actual = MONTH(CURRENT_DATE());

    SELECT L.ciudad AS ciudad, RO.ubicacion_observador AS ubicacion, RO.fecha_registro AS fecha_consultada, COUNT(L.cantidad_personas) AS cantidad_personas
    FROM Lugar AS L
    JOIN Registra_Observacion AS RO
    ON L.ubicacion = RO.ubicacion_observador
    WHERE RO.fecha_registro LIKE '%mes_actual%'
    GROUP BY L.ciudad
    ORDER BY COUNT(L.cantidad_personas) ASC
    LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Chip_Wireless_Cedula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Chip_Wireless_Cedula`(IN id_tabla VARCHAR(48), IN nuevo_valor VARCHAR(10))
BEGIN

	DECLARE mac_address_disp_resultante VARCHAR(48);
	DECLARE cedula_nueva VARCHAR(10);

	SET mac_address_disp_resultante = (SELECT mac_address_disp FROM Chip_Wireless WHERE mac_address_disp LIKE id_tabla);
	SET cedula_nueva = (SELECT id_usuario FROM Usuario WHERE id_usuario LIKE nuevo_valor);

	IF (mac_address_disp_resultante IS NOT NULL) THEN

		IF (cedula_nueva IS NOT NULL) THEN

			UPDATE Chip_Wireless
		    SET Cedula = cedula_nueva
		    WHERE mac_address_disp = mac_address_disp_resultante;
			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al acualizar, valor de id_usuario(Cedula) no existe en la talba Usuario';

		END IF;

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_disp no existe en la tabla Chip_Wireless';

	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Ciudad_Poblacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Ciudad_Poblacion`(IN id_tabla VARCHAR(45), IN nuevo_valor INT)
BEGIN

	DECLARE nombre_resultante VARCHAR(45);

	SET nombre_resultante  = (SELECT Nombre FROM Ciudad WHERE Nombre LIKE id_tabla);

	IF (nombre_resultante IS NOT NULL) THEN

		IF (nuevo_valor > 0) THEN
			UPDATE Ciudad
		    SET Poblacion = nuevo_valor
		    WHERE Nombre = nombre_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al acualizar, valor de poblacion debe ser mayor que cero';

		END IF;
	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al acualizar, valor de Nombre no existe en la tabla Ciudad';

	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Ciudad_Sectores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Ciudad_Sectores`(IN id_tabla VARCHAR(45), IN nuevo_valor VARCHAR(45))
BEGIN

	DECLARE nombre_resultante VARCHAR(45);

	SET nombre_resultante  = (SELECT Nombre FROM Ciudad WHERE Nombre LIKE id_tabla);

	IF (nombre_resultante IS NOT NULL) THEN

		IF (nuevo_valor IN ('Norte', 'Sur', 'Este', 'Oeste', 'Noreste', 'Sureste', 'Suroeste', 'Noroeste')) THEN
			UPDATE Ciudad
		    SET Sectores = nuevo_valor
		    WHERE Nombre = nombre_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al acualizar, el Sector debe ser un punto cardinal';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al acualizar, valor de Nombre no existe en la tabla Ciudad';

	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Cliente_Nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Cliente_Nombre`(IN id_tabla VARCHAR(13), IN nuevo_valor VARCHAR(45))
BEGIN

	DECLARE RUC_resultante VARCHAR(13);

	SET RUC_resultante = (SELECT RUC FROM Cliente WHERE RUC LIKE id_tabla);

	IF (RUC_resultante IS NOT NULL) THEN

		UPDATE Cliente
	    SET Nombre = nuevo_valor
	    WHERE RUC LIKE RUC_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de RUC no existe en la tabla Cliente';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_GPC_cantidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_GPC_cantidad`(IN id_tabla INT, IN nuevo_valor INT)
BEGIN

	DECLARE id_grupo_resultante INT;

	SET id_grupo_resultante = (SELECT id_grupo FROM Grupos_Puntos_Comunicacion WHERE id_grupo = id_tabla);

	IF (id_grupo_resultante IS NOT NULL) THEN

		UPDATE Grupos_Puntos_Comunicacion
		SET cantidad = nuevo_valor
		WHERE id_grupo = id_grupo_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_grupo no existe en la tabla Grupos_Puntos_Comunicacion';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_GPC_g_operativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_GPC_g_operativo`(IN id_tabla INT)
BEGIN

	DECLARE id_grupo_resultante INT;
	DECLARE g_operativo_anterior TINYINT;

	SET g_operativo_anterior = (SELECT g_operativo FROM Grupos_Puntos_Comunicacion WHERE id_grupo = id_tabla);
	SET id_grupo_resultante = (SELECT id_grupo FROM Grupos_Puntos_Comunicacion WHERE id_grupo = id_tabla);

	IF (id_grupo_resultante IS NOT NULL) THEN
		IF (g_operativo_anterior = 0) THEN

			UPDATE Grupos_Puntos_Comunicacion
			SET g_operativo = 1
			WHERE id_grupo = id_tabla;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			UPDATE Grupos_Puntos_Comunicacion
			SET g_operativo = 0
			WHERE id_grupo = id_tabla;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_grupo no existe en la tabla Grupos_Puntos_Comunicacion';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_GPC_rango_cubierto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_GPC_rango_cubierto`(IN id_tabla INT, IN nuevo_valor DOUBLE)
BEGIN

	DECLARE id_grupo_resultante INT;

	SET id_grupo_resultante = (SELECT id_grupo FROM Grupos_Puntos_Comunicacion WHERE id_grupo = id_tabla);

	IF (id_grupo_resultante IS NOT NULL) THEN

		UPDATE Grupos_Puntos_Comunicacion
		SET rango_cubierto = nuevo_valor
		WHERE id_grupo = id_grupo_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_grupo no existe en la tabla Grupos_Puntos_Comunicacion';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Lugar_cantidad_personas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Lugar_cantidad_personas`(IN id_tabla VARCHAR(6), IN nuevo_valor INT)
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area LIKE id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET cantidad_personas = nuevo_valor
	    WHERE codigo_area LIKE codigo_area_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Lugar_ciudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Lugar_ciudad`(IN id_tabla VARCHAR(6), IN nuevo_valor VARCHAR(45))
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);
	DECLARE ciudad_resultante VARCHAR(45);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area LIKE id_tabla);
	SET ciudad_resultante = (SELECT Nombre FROM Ciudad WHERE Nombre LIKE nuevo_valor);

	IF (codigo_area_resultante IS NOT NULL) THEN

		IF (ciudad_resultante IS NOT NULL) THEN

			UPDATE Lugar
		    SET ciudad = nuevo_valor
		    WHERE codigo_area LIKE codigo_area_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ciudad(Nombre) no existe en la tabla Ciudad';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Lugar_codigo_postal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Lugar_codigo_postal`(IN id_tabla VARCHAR(6), IN nuevo_valor VARCHAR(6))
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area LIKE id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET codigo_postal = nuevo_valor
	    WHERE codigo_area LIKE codigo_area_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Lugar_latitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Lugar_latitud`(IN id_tabla VARCHAR(6), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area = id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET latitud = nuevo_valor
	    WHERE codigo_area LIKE codigo_area_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Lugar_longitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Lugar_longitud`(IN id_tabla VARCHAR(6), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area = id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET longitud = nuevo_valor
	    WHERE codigo_area LIKE codigo_area_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Lugar_radio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Lugar_radio`(IN id_tabla VARCHAR(6), IN nuevo_valor FLOAT)
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area = id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET radio = nuevo_valor
	    WHERE codigo_area LIKE codigo_area_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Lugar_sector` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Lugar_sector`(IN id_tabla VARCHAR(6), IN nuevo_valor VARCHAR(30))
BEGIN

	DECLARE codigo_area_resultante VARCHAR(6);

	SET codigo_area_resultante = (SELECT codigo_area FROM Lugar WHERE codigo_area LIKE id_tabla);

	IF (codigo_area_resultante IS NOT NULL) THEN

		IF (nuevo_valor IN ('norte', 'centro', 'sur', 'este', 'oeste', 'centronorte')) THEN

			UPDATE Lugar
		    SET sector = nuevo_valor
		    WHERE codigo_area LIKE codigo_area_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de sector no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de codigo_area no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_PC_latitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_PC_latitud`(IN id_tabla VARCHAR(48), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE mac_address_bcn_resultante VARCHAR(48);

	SET mac_address_bcn_resultante = (SELECT mac_address_bcn FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE id_tabla);

	IF (mac_address_bcn_resultante IS NOT NULL) THEN

		UPDATE Puntos_Comunicacion
	    SET latitud = nuevo_valor
	    WHERE mac_address_bcn = mac_address_bcn_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_bcn no existe en la tabla Puntos_Comunicacion';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_PC_longitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_PC_longitud`(IN id_tabla VARCHAR(48), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE mac_address_bcn_resultante VARCHAR(48);

	SET mac_address_bcn_resultante = (SELECT mac_address_bcn FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE id_tabla);

	IF (mac_address_bcn_resultante IS NOT NULL) THEN

		UPDATE Puntos_Comunicacion
	    SET longitud = nuevo_valor
	    WHERE mac_address_bcn = mac_address_bcn_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_bcn no existe en la tabla Puntos_Comunicacion';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_PC_mensaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_PC_mensaje`(IN id_tabla VARCHAR(48), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE mac_address_bcn_resultante VARCHAR(48);

	SET mac_address_bcn_resultante = (SELECT mac_address_bcn FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE id_tabla);

	IF (mac_address_bcn_resultante IS NOT NULL) THEN

		UPDATE Puntos_Comunicacion
	    SET mensaje = nuevo_valor
	    WHERE mac_address_bcn = mac_address_bcn_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_bcn no existe en la tabla Puntos_Comunicacion';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_PC_operativo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_PC_operativo`(IN id_tabla VARCHAR(48), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE mac_address_bcn_resultante VARCHAR(48);

	SET mac_address_bcn_resultante = (SELECT mac_address_bcn FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE id_tabla);

	IF (mac_address_bcn_resultante IS NOT NULL) THEN

		IF (nuevo_valor IN ('1', '0')) THEN

			UPDATE Puntos_Comunicacion
		    SET operativo = nuevo_valor
		    WHERE mac_address_bcn = mac_address_bcn_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de opreativo no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_bcn no existe en la tabla Puntos_Comunicacion';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_PC_rango` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_PC_rango`(IN id_tabla VARCHAR(48), IN nuevo_valor FLOAT)
BEGIN

	DECLARE mac_address_bcn_resultante VARCHAR(48);

	SET mac_address_bcn_resultante = (SELECT mac_address_bcn FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE id_tabla);

	IF (mac_address_bcn_resultante IS NOT NULL) THEN

		UPDATE Puntos_Comunicacion
	    SET rango = nuevo_valor
	    WHERE mac_address_bcn = mac_address_bcn_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_bcn no existe en la tabla Puntos_Comunicacion';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Puntos_Comunicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Puntos_Comunicacion`(IN set_condition VARCHAR(10), IN set_argument VARCHAR(10), IN where_argument VARCHAR(10))
BEGIN
	UPDATE Puntos_Comunicacion
    SET set_condition = _set_argument
    WHERE mac_adrress_bcn = where_argument;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Registra_Observacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Registra_Observacion`(IN set_condition VARCHAR(10), IN set_argument VARCHAR(10), IN where_argument VARCHAR(10))
BEGIN
	UPDATE Registra_Observacion
    SET set_condition = _set_argument
    WHERE id_observacion = where_argument;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_RO_fecha_registro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_RO_fecha_registro`(IN id_tabla INT, IN nuevo_valor VARCHAR(10))
BEGIN

	DECLARE id_observacion_resultante INT;
	DECLARE fecha_registro_resultante DATE;

	SET id_observacion_resultante = (SELECT id_observacion FROM Registra_Observacion WHERE id_observacion = id_tabla);
	SET fecha_registro_resultante = (SELECT DATE(nuevo_valor));

	IF (id_observacion_resultante IS NOT NULL) THEN

		IF (fecha_registro_resultante IS NOT NULL) THEN

			UPDATE Registra_Observacion
		    SET fecha_registro = fecha_registro_resultante
		    WHERE id_observacion = id_observacion_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de fecha_registro no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_observacion no existe en la tabla Registra_Observacion';

	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_RO_hora_registro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_RO_hora_registro`(IN id_tabla INT, IN nuevo_valor VARCHAR(10))
BEGIN

	DECLARE id_observacion_resultante INT;
	DECLARE hora_registro_resultante TIME;

	SET id_observacion_resultante = (SELECT id_observacion FROM Registra_Observacion WHERE id_observacion = id_tabla);
	SET hora_registro_resultante = (SELECT TIME(nuevo_valor));

	IF (id_observacion_resultante IS NOT NULL) THEN

		IF (hora_registro_resultante IS NOT NULL) THEN

			UPDATE Registra_Observacion
		    SET hora_registro = hora_registro_resultante
		    WHERE id_observacion = id_observacion_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de hora_registro no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_observacion no existe en la tabla Registra_Observacion';

	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_RO_mac_address_punto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_RO_mac_address_punto`(IN id_tabla INT, IN nuevo_valor VARCHAR(48))
BEGIN

	DECLARE id_observacion_resultante INT;
	DECLARE mac_address_punto_resultante VARCHAR(48);

	SET id_observacion_resultante = (SELECT id_observacion FROM Registra_Observacion WHERE id_observacion = id_tabla);
	SET mac_address_punto_resultante = (SELECT mac_address_bcn FROM Puntos_Comunicacion WHERE mac_address_bcn LIKE nuevo_valor);

	IF (id_observacion_resultante IS NOT NULL) THEN

		IF (mac_address_punto_resultante IS NOT NULL) THEN

			UPDATE Registra_Observacion
		    SET mac_address_punto = mac_address_punto_resultante
		    WHERE id_observacion = id_observacion_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de mac_address_punto no existe en tabla Puntos_Comunicacion';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_observacion no existe en la tabla Registra_Observacion';

	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_RO_ubicacion_observador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_RO_ubicacion_observador`(IN id_tabla INT, IN nuevo_valor VARCHAR(30))
BEGIN

	DECLARE id_observacion_resultante INT;
	DECLARE ubicacion_observador_resultante VARCHAR(30);

	SET id_observacion_resultante = (SELECT id_observacion FROM Registra_Observacion WHERE id_observacion = id_tabla);
	SET ubicacion_observador_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE nuevo_valor LIMIT 1);

	IF (id_observacion_resultante IS NOT NULL) THEN

		IF (ubicacion_observador_resultante IS NOT NULL) THEN

			UPDATE Registra_Observacion
		    SET ubicacion_observador = ubicacion_observador_resultante
		    WHERE id_observacion = id_observacion_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion_observador no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de id_observacion no existe en la tabla Registra_Observacion';

	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_Usuario_Telefono` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `update_Usuario_Telefono`(IN id_tabla VARCHAR(10), IN nuevo_valor VARCHAR(10))
BEGIN

	DECLARE id_usuario_resultante VARCHAR(10);
	DECLARE Telefono_nuevo VARCHAR(10);

	SET id_usuario_resultante = (SELECT id_usuario FROM Usuario WHERE id_usuario LIKE id_tabla);
	SET Telefono_nuevo = nuevo_valor;

	IF (id_usuario_resultante IS NOT NULL) THEN

		UPDATE Usuario
	    SET Telefono = Telefono_nuevo
	    WHERE id_usuario LIKE id_usuario_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, id_usuario no existe en la tabla Usuario';

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `_2update_Lugar_cantidad_personas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `_2update_Lugar_cantidad_personas`(IN id_tabla VARCHAR(30), IN nuevo_valor INT)
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);

	IF (ubicacion_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET cantidad_personas = nuevo_valor
	    WHERE ubicacion LIKE ubicacion_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `_2update_Lugar_ciudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `_2update_Lugar_ciudad`(IN id_tabla VARCHAR(30), IN nuevo_valor VARCHAR(45))
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);
	DECLARE ciudad_resultante VARCHAR(45);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);
	SET ciudad_resultante = (SELECT Nombre FROM Ciudad WHERE Nombre LIKE nuevo_valor);

	IF (ubicacion_resultante IS NOT NULL) THEN

		IF (ciudad_resultante IS NOT NULL) THEN

			UPDATE Lugar
		    SET ciudad = nuevo_valor
		    WHERE ubicacion LIKE ubicacion_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ciudad(Nombre) no existe en la tabla Ciudad';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `_2update_Lugar_codigo_postal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `_2update_Lugar_codigo_postal`(IN id_tabla VARCHAR(30), IN nuevo_valor VARCHAR(30))
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);

	IF (ubicacion_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET codigo_postal = nuevo_valor
	    WHERE ubicacion LIKE ubicacion_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `_2update_Lugar_latitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `_2update_Lugar_latitud`(IN id_tabla VARCHAR(30), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);

	IF (ubicacion_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET latitud = nuevo_valor
	    WHERE ubicacion LIKE ubicacion_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `_2update_Lugar_longitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `_2update_Lugar_longitud`(IN id_tabla VARCHAR(30), IN nuevo_valor VARCHAR(20))
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);

	IF (ubicacion_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET longitud = nuevo_valor
	    WHERE ubicacion LIKE ubicacion_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `_2update_Lugar_radio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `_2update_Lugar_radio`(IN id_tabla VARCHAR(30), IN nuevo_valor FLOAT)
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);

	IF (ubicacion_resultante IS NOT NULL) THEN

		UPDATE Lugar
	    SET radio = nuevo_valor
	    WHERE ubicacion LIKE ubicacion_resultante;

		SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `_2update_Lugar_sector` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`grupo3P1`@`%` PROCEDURE `_2update_Lugar_sector`(IN id_tabla VARCHAR(30), IN nuevo_valor VARCHAR(30))
BEGIN

	DECLARE ubicacion_resultante VARCHAR(30);

	SET ubicacion_resultante = (SELECT ubicacion FROM Lugar WHERE ubicacion LIKE id_tabla);

	IF (ubicacion_resultante IS NOT NULL) THEN

		IF (nuevo_valor IN ('norte', 'centro', 'sur', 'este', 'oeste', 'centronorte')) THEN

			UPDATE Lugar
		    SET sector = nuevo_valor
		    WHERE ubicacion LIKE ubicacion_resultante;

			SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Actualizazición exitosa';

		ELSE

			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de sector no permitido';

		END IF;

	ELSE

		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fallo al actualizar, valor de ubicacion no existe en la tabla Lugar';

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `Asistencias`
--

/*!50001 DROP VIEW IF EXISTS `Asistencias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`grupo3P1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Asistencias` AS select `Asiste`.`id_usuario_A` AS `id_usuario_A`,`Asiste`.`codigo_area_A` AS `codigo_area_A` from `Asiste` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Definir_area`
--

/*!50001 DROP VIEW IF EXISTS `Definir_area`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`grupo3P1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Definir_area` AS select `Lugar`.`codigo_area` AS `codigo_area`,`Lugar`.`ubicacion` AS `ubicacion`,`Lugar`.`latitud` AS `latitud`,`Lugar`.`longitud` AS `longitud`,`Lugar`.`radio` AS `radio`,`Lugar`.`sector` AS `sector`,`Lugar`.`codigo_postal` AS `codigo_postal`,`Lugar`.`cantidad_personas` AS `cantidad_personas`,`Lugar`.`ciudad` AS `ciudad` from `Lugar` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Digitalizar_datos`
--

/*!50001 DROP VIEW IF EXISTS `Digitalizar_datos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`grupo3P1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Digitalizar_datos` AS select `Usuario`.`id_usuario` AS `Usuario`,`Usuario`.`Telefono` AS `Telefono`,`Chip_Wireless`.`mac_address_disp` AS `MAC_ADDRESS_Dispositivo`,`Registra_Observacion`.`fecha_registro` AS `Fecha`,`Registra_Observacion`.`hora_registro` AS `Hora`,`Lugar`.`codigo_area` AS `Area` from ((((`Usuario` join `Asiste`) join `Lugar`) join `Registra_Observacion`) join `Chip_Wireless`) where ((`Usuario`.`id_usuario` = `Asiste`.`id_usuario_A`) and (`Chip_Wireless`.`Cedula` = `Usuario`.`id_usuario`) and (`Asiste`.`codigo_area_A` = `Lugar`.`codigo_area`) and (`Lugar`.`ubicacion` = `Registra_Observacion`.`ubicacion_observador`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Establecer_monitoreo`
--

/*!50001 DROP VIEW IF EXISTS `Establecer_monitoreo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`grupo3P1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Establecer_monitoreo` AS select `Puntos_Comunicacion`.`mac_address_bcn` AS `mac_address_bcn`,`Registra_Observacion`.`fecha_registro` AS `fecha_registro`,`Registra_Observacion`.`hora_registro` AS `hora_registro`,`Puntos_Comunicacion`.`operativo` AS `operativo`,`Puntos_Comunicacion`.`rango` AS `rango` from (`Registra_Observacion` join `Puntos_Comunicacion` on((`Registra_Observacion`.`mac_address_punto` = `Puntos_Comunicacion`.`mac_address_bcn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Registrar_observacion`
--

/*!50001 DROP VIEW IF EXISTS `Registrar_observacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`grupo3P1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Registrar_observacion` AS select `Asiste`.`id_usuario_A` AS `usuario`,`Registra_Observacion`.`fecha_registro` AS `Fecha`,`Registra_Observacion`.`hora_registro` AS `Hora`,`Registra_Observacion`.`mac_address_punto` AS `Observador`,`Lugar`.`codigo_area` AS `Area` from ((`Lugar` join `Asiste`) join `Registra_Observacion`) where ((`Lugar`.`ubicacion` = `Registra_Observacion`.`ubicacion_observador`) and (`Lugar`.`codigo_area` = `Asiste`.`codigo_area_A`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-05 19:47:15
