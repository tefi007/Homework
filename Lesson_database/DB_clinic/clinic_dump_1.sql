-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: clinic
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `MKB_10`
--

DROP TABLE IF EXISTS `MKB_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MKB_10` (
  `code` varchar(15) NOT NULL,
  `illness` varchar(1000) NOT NULL,
  `bloc` varchar(10) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code` (`code`),
  KEY `MKB_10_bloc_idx` (`bloc`),
  KEY `MKB_10_class_idx` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MKB_10`
--

LOCK TABLES `MKB_10` WRITE;
/*!40000 ALTER TABLE `MKB_10` DISABLE KEYS */;
INSERT INTO `MKB_10` VALUES ('G35','Рассеянный склероз','VI','G35-G37'),('I10','Эссенциальная [первичная] гипертензия','IX','I10-I15'),('I11','Гипертензивная болезнь сердца [гипертоническая болезнь сердца с преимущественным поражением сердца]','IX','I10-I15'),('I12','Гипертензивная [гипертоническая] болезнь с преимущественным поражением почек','IX','I10-I15'),('I13','Гипертензивная [гипертоническая] болезнь с преимущественным поражением сердца и почек','IX','I10-I15'),('I15','Вторичная гипертензия','IX','I10-I15'),('I20','Стенокардия [грудная жаба]','IX','I20-I25'),('I21','Острый инфаркт миокарда','IX','I20-I25'),('I22','Повторный инфаркт миокарда','IX','I20-I25'),('I23','Некоторые текущие осложнения острого инфаркта миокарда','IX','I20-I25'),('I25','Хроническая ишемическая болезнь сердца','IX','I20-I25'),('I60','Субарахноидальное кровоизлияние','IX','I60-I69'),('I61','Внутримозговое кровоизлияние','IX','I60-I69'),('I63','Инфаркт мозга','IX','I60-I69'),('I64','Инсульт, не уточненный как кровоизлияние или инфаркт','IX','I60-I69'),('I65','Закупорка и стеноз прецеребральных артерий, не приводящие к инфаркту мозга','IX','I60-I69'),('J06','Острые инфекции верхних дыхательных путей множественной и неуточненной локализации','X','J00-J06'),('J10','Грипп, вызванный идентифицированным вирусом гриппа','X','J10-J18'),('J13','Пневмония, вызванная Streptococcus pneumoniae','X','J10-J18'),('J41','Простой и слизисто-гнойный хронический бронхит','X','J40-J47'),('J45','Астма','X','J40-J47'),('K26','Язва двенадцатиперстной кишки','XI','K20-K31'),('K29','Гастрит и дуоденит','XI','K20-K31'),('K35','Острый аппендицит','XI','K35-K38'),('K40','Паховая грыжа','XI','K40-K46'),('K41','Бедренная грыжа','XI','K40-K46'),('O13','Вызванная беременностью гипертензия без значительной протеинурии','XV','O10-O16'),('O15','Эклампсия','XV','O10-O16'),('O80','Роды одноплодные, самопроизвольное родоразрешение','XV','O80-O84'),('Z00','Общий осмотр и обследование лиц, не имеющих жалоб или установленного диагноза','XXI','Z00-Z13'),('Z10','Рутинная общая проверка здоровья определенных подгрупп населения','XXI','Z00-Z13'),('Z95.2','Наличие протеза сердечного клапана','XXI','Z95.0-Z95.9');
/*!40000 ALTER TABLE `MKB_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MKB_10_drug`
--

DROP TABLE IF EXISTS `MKB_10_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MKB_10_drug` (
  `MKB_10_code` varchar(15) NOT NULL,
  `drug_id` int unsigned NOT NULL,
  PRIMARY KEY (`MKB_10_code`,`drug_id`),
  KEY `MKB_10_drug_drug_id_idx` (`drug_id`),
  CONSTRAINT `MKB_10_drug_drug_id_fk` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MKB_10_drug_MKB_10_code_fk` FOREIGN KEY (`MKB_10_code`) REFERENCES `MKB_10` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MKB_10_drug`
--

LOCK TABLES `MKB_10_drug` WRITE;
/*!40000 ALTER TABLE `MKB_10_drug` DISABLE KEYS */;
INSERT INTO `MKB_10_drug` VALUES ('I10',1),('I11',1),('I12',1),('I13',1),('I15',1),('I20',1),('I21',1),('I22',1),('I23',1),('I25',1),('I10',2),('I11',2),('I12',2),('I13',2),('I15',2),('I20',2),('I21',2),('I22',2),('I23',2),('I25',2),('I10',3),('I11',3),('I12',3),('I13',3),('I15',3),('I20',3),('I21',3),('I22',3),('I23',3),('I25',3),('I20',4),('I21',4),('I22',4),('I23',4),('I25',4),('I10',5),('I11',5),('I12',5),('I13',5),('I15',5),('I20',5),('I21',5),('I22',5),('I23',5),('I25',5),('I10',6),('I11',6),('I12',6),('I13',6),('I15',6),('I20',6),('I21',6),('I22',6),('I23',6),('I25',6),('I10',7),('I11',7),('I12',7),('I13',7),('I15',7),('I20',7),('I21',7),('I22',7),('I23',7),('I25',7),('I10',8),('I11',8),('I12',8),('I13',8),('I15',8),('I20',8),('I21',8),('I22',8),('I23',8),('I25',8),('I20',9),('I21',9),('I22',9),('I23',9),('I25',9),('I20',10),('I21',10),('I22',10),('I23',10),('I25',10),('I10',11),('I11',11),('I12',11),('I13',11),('I15',11),('I20',12),('I21',12),('I22',12),('I23',12),('I25',12),('I20',13),('I21',13),('I22',13),('I23',13),('I25',13),('I60',15),('I61',15),('I63',15),('I64',15),('I65',15),('O13',16),('O15',16),('J13',17),('J41',17),('J06',18),('J10',18),('K26',20),('K29',20),('I10',21),('I11',21),('I12',21),('I13',21),('I15',21),('I20',21),('I21',21),('I22',21),('I23',21),('I25',21),('I10',22),('I11',22),('I12',22),('I13',22),('I15',22),('I20',22),('I21',22),('I22',22),('I23',22),('I25',22),('I10',23),('I11',23),('I12',23),('I13',23),('I15',23),('I20',23),('I21',23),('I22',23),('I23',23),('I25',23),('I10',24),('I11',24),('I12',24),('I13',24),('I15',24),('I20',24),('I21',24),('I22',24),('I23',24),('I25',24);
/*!40000 ALTER TABLE `MKB_10_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergy_drug`
--

DROP TABLE IF EXISTS `allergy_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergy_drug` (
  `case_history` int unsigned NOT NULL,
  `drug_id` int unsigned NOT NULL,
  PRIMARY KEY (`case_history`,`drug_id`),
  KEY `allergy_drug_drug_id_fk` (`drug_id`),
  CONSTRAINT `allergy_drug_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `allergy_drug_drug_id_fk` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergy_drug`
--

LOCK TABLES `allergy_drug` WRITE;
/*!40000 ALTER TABLE `allergy_drug` DISABLE KEYS */;
INSERT INTO `allergy_drug` VALUES (5,4),(21,4),(77,9),(82,9),(52,15),(98,15),(33,16),(39,16),(5,17),(21,17),(28,17),(40,17),(47,17),(5,20),(61,20);
/*!40000 ALTER TABLE `allergy_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergy_not_drug`
--

DROP TABLE IF EXISTS `allergy_not_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergy_not_drug` (
  `case_history` int unsigned NOT NULL,
  `not_drug` varchar(500) NOT NULL,
  PRIMARY KEY (`case_history`),
  CONSTRAINT `allergy_not_drug_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergy_not_drug`
--

LOCK TABLES `allergy_not_drug` WRITE;
/*!40000 ALTER TABLE `allergy_not_drug` DISABLE KEYS */;
INSERT INTO `allergy_not_drug` VALUES (5,'клубника, молоко'),(19,'сено'),(21,'молоко'),(36,'томаты'),(45,'вишня'),(75,'береза'),(86,'шоколад');
/*!40000 ALTER TABLE `allergy_not_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'first qualification category'),(3,'highest qualification category'),(2,'second qualification category');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chronic_illness`
--

DROP TABLE IF EXISTS `chronic_illness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chronic_illness` (
  `case_history` int unsigned NOT NULL,
  `MKB_10_code` varchar(15) NOT NULL,
  `doctor_id` int unsigned NOT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `basis_drug_id` int unsigned NOT NULL,
  `use_drug` varchar(500) DEFAULT NULL,
  `by_privilege` enum('yes','no') DEFAULT NULL,
  `assigned` enum('accept','cancel') DEFAULT NULL,
  PRIMARY KEY (`case_history`,`basis_drug_id`),
  KEY `chronic_illness_doctor_id_fk` (`doctor_id`),
  KEY `chronic_illness_basis_drug_id_fk` (`basis_drug_id`),
  KEY `chronic_illness_MKB_10_code_idx` (`MKB_10_code`),
  KEY `chronic_illness_case_history_doctor_id_idx` (`case_history`,`doctor_id`),
  CONSTRAINT `chronic_illness_basis_drug_id_fk` FOREIGN KEY (`basis_drug_id`) REFERENCES `drug` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chronic_illness_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chronic_illness_doctor_id_fk` FOREIGN KEY (`doctor_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `chronic_illness_MKB_10_code_fk` FOREIGN KEY (`MKB_10_code`) REFERENCES `MKB_10` (`code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chronic_illness`
--

LOCK TABLES `chronic_illness` WRITE;
/*!40000 ALTER TABLE `chronic_illness` DISABLE KEYS */;
INSERT INTO `chronic_illness` VALUES (23,'I21',18,'2020-02-09 21:40:25',1,'Способ применения …','no','accept'),(23,'I21',18,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(23,'I21',18,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(23,'I21',18,'2020-02-09 21:40:25',7,'Способ применения …','no','accept'),(24,'I21',19,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(24,'I21',19,'2020-02-09 21:40:25',5,'Способ применения …','yes','accept'),(24,'I21',19,'2020-02-09 21:40:25',6,'Способ применения …','no','accept'),(24,'I21',19,'2020-02-09 21:40:25',9,'Способ применения …','no','accept'),(26,'I21',18,'2020-02-09 21:40:25',1,'Способ применения …','no','accept'),(26,'I21',18,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(26,'I21',18,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(26,'I21',18,'2020-02-09 21:40:25',12,'Способ применения …','no','accept'),(27,'I21',19,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(27,'I21',19,'2020-02-09 21:40:25',5,'Способ применения …','yes','accept'),(27,'I21',19,'2020-02-09 21:40:25',7,'Способ применения …','no','accept'),(27,'I21',19,'2020-02-09 21:40:25',20,'Способ применения …','no','accept'),(29,'I21',2,'2020-02-09 21:40:25',1,'Способ применения …','no','accept'),(29,'I21',2,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(29,'I21',2,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(29,'I21',2,'2020-02-09 21:40:25',20,'Способ применения …','no','accept'),(31,'Z95.2',2,'2020-02-09 21:40:25',1,'Способ применения …','no','accept'),(31,'Z95.2',2,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(31,'Z95.2',2,'2020-02-09 21:40:25',4,'Способ применения …','no','accept'),(31,'Z95.2',2,'2020-02-09 21:40:25',20,'Способ применения …','no','accept'),(33,'I22',18,'2020-02-09 21:40:25',1,'Способ применения …','no','accept'),(33,'I22',18,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(33,'I22',18,'2020-02-09 21:40:25',20,'Способ применения …','no','accept'),(34,'I22',19,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(34,'I22',19,'2020-02-09 21:40:25',5,'Способ применения …','yes','accept'),(34,'I22',19,'2020-02-09 21:40:25',7,'Способ применения …','no','accept'),(36,'Z95.2',19,'2020-02-09 21:40:25',1,'Способ применения …','no','accept'),(36,'Z95.2',19,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(36,'Z95.2',19,'2020-02-09 21:40:25',4,'Способ применения …','no','accept'),(36,'Z95.2',19,'2020-02-09 21:40:25',9,'Способ применения …','no','accept'),(37,'I22',2,'2020-02-09 21:40:25',1,'Способ применения …','no','accept'),(37,'I22',2,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(37,'I22',2,'2020-02-09 21:40:25',9,'Способ применения …','no','accept'),(39,'I22',19,'2020-02-09 21:40:25',1,'Способ применения …','no','accept'),(39,'I22',19,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(39,'I22',19,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(39,'I22',19,'2020-02-09 21:40:25',6,'Способ применения …','no','accept'),(39,'I22',19,'2020-02-09 21:40:25',7,'Способ применения …','no','accept'),(41,'I10',18,'2020-02-09 21:40:25',1,'Способ применения …','yes','accept'),(41,'I10',18,'2020-02-09 21:40:25',2,'Способ применения …','no','accept'),(42,'I11',2,'2020-02-09 21:40:25',1,'Способ применения …','yes','accept'),(42,'I11',2,'2020-02-09 21:40:25',6,'Способ применения …','yes','accept'),(45,'I12',2,'2020-02-09 21:40:25',1,'Способ применения …','yes','accept'),(45,'I12',2,'2020-02-09 21:40:25',2,'Способ применения …','no','accept'),(45,'I12',2,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(45,'I12',2,'2020-02-09 21:40:25',8,'Способ применения …','yes','accept'),(45,'I12',2,'2020-02-09 21:40:25',10,'Способ применения …','no','accept'),(49,'I13',2,'2020-02-09 21:40:25',1,'Способ применения …','yes','accept'),(49,'I13',2,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(49,'I13',2,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(49,'I13',2,'2020-02-09 21:40:25',7,'Способ применения …','no','accept'),(49,'I13',2,'2020-02-09 21:40:25',12,'Способ применения …','yes','accept'),(51,'I10',2,'2020-02-09 21:40:25',1,'Способ применения …','yes','accept'),(51,'I10',2,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(51,'I10',2,'2020-02-09 21:40:25',10,'Способ применения …','no','accept'),(53,'I11',18,'2020-02-09 21:40:25',2,'Способ применения …','no','accept'),(53,'I11',18,'2020-02-09 21:40:25',6,'Способ применения …','yes','accept'),(53,'I11',18,'2020-02-09 21:40:25',8,'Способ применения …','yes','accept'),(53,'I11',18,'2020-02-09 21:40:25',10,'Способ применения …','no','accept'),(59,'I12',18,'2020-02-09 21:40:25',1,'Способ применения …','yes','accept'),(59,'I12',18,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(59,'I12',18,'2020-02-09 21:40:25',7,'Способ применения …','no','accept'),(59,'I12',18,'2020-02-09 21:40:25',12,'Способ применения …','yes','accept'),(63,'I13',18,'2020-02-09 21:40:25',1,'Способ применения …','yes','accept'),(63,'I13',18,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(63,'I13',18,'2020-02-09 21:40:25',6,'Способ применения …','yes','accept'),(63,'I13',18,'2020-02-09 21:40:25',7,'Способ применения …','no','accept'),(63,'I13',18,'2020-02-09 21:40:25',10,'Способ применения …','no','accept'),(64,'I21',18,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(64,'I21',18,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(64,'I21',18,'2020-02-09 21:40:25',5,'Способ применения …','yes','accept'),(64,'I21',18,'2020-02-09 21:40:25',6,'Способ применения …','no','accept'),(64,'I21',18,'2020-02-09 21:40:25',7,'Способ применения …','no','accept'),(64,'I21',18,'2020-02-09 21:40:25',13,'Способ применения …','no','accept'),(66,'I10',18,'2020-02-09 21:40:25',1,'Способ применения …','yes','accept'),(66,'I10',18,'2020-02-09 21:40:25',2,'Способ применения …','no','accept'),(67,'I21',19,'2020-02-09 21:40:25',1,'Способ применения …','no','accept'),(67,'I21',19,'2020-02-09 21:40:25',2,'Способ применения …','yes','accept'),(67,'I21',19,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(67,'I21',19,'2020-02-09 21:40:25',9,'Способ применения …','no','accept'),(69,'I21',2,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(69,'I21',2,'2020-02-09 21:40:25',5,'Способ применения …','yes','accept'),(69,'I21',2,'2020-02-09 21:40:25',12,'Способ применения …','no','accept'),(73,'I22',18,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(73,'I22',18,'2020-02-09 21:40:25',5,'Способ применения …','yes','accept'),(73,'I22',18,'2020-02-09 21:40:25',7,'Способ применения …','no','accept'),(74,'I22',2,'2020-02-09 21:41:25',1,'Способ применения …','no','accept'),(74,'I22',2,'2020-02-09 21:41:25',4,'Способ применения …','yes','accept'),(74,'I22',2,'2020-02-09 21:41:25',6,'Способ применения …','no','accept'),(76,'I22',18,'2020-02-09 21:41:25',1,'Способ применения …','no','accept'),(76,'I22',18,'2020-02-09 21:41:25',2,'Способ применения …','yes','accept'),(76,'I22',18,'2020-02-09 21:41:25',4,'Способ применения …','yes','accept'),(77,'I22',19,'2020-02-09 21:41:25',3,'Способ применения …','no','accept'),(77,'I22',19,'2020-02-09 21:41:25',4,'Способ применения …','yes','accept'),(77,'I22',19,'2020-02-09 21:41:25',5,'Способ применения …','yes','accept'),(79,'I22',2,'2020-02-09 21:41:25',1,'Способ применения …','no','accept'),(79,'I22',2,'2020-02-09 21:41:25',4,'Способ применения …','yes','accept'),(79,'I22',2,'2020-02-09 21:41:25',6,'Способ применения …','no','accept'),(81,'I11',19,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(81,'I11',19,'2020-02-09 21:40:25',6,'Способ применения …','no','accept'),(83,'I12',19,'2020-02-09 21:40:25',1,'Способ применения …','yes','accept'),(83,'I12',19,'2020-02-09 21:40:25',6,'Способ применения …','yes','accept'),(83,'I12',19,'2020-02-09 21:40:25',7,'Способ применения …','no','accept'),(83,'I12',19,'2020-02-09 21:40:25',10,'Способ применения …','no','accept'),(83,'I12',19,'2020-02-09 21:40:25',12,'Способ применения …','yes','accept'),(84,'I21',18,'2020-02-09 21:40:25',1,'Способ применения …','no','accept'),(84,'I21',18,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(84,'I21',18,'2020-02-09 21:40:25',13,'Способ применения …','no','accept'),(85,'I13',19,'2020-02-09 21:40:25',1,'Способ применения …','yes','accept'),(85,'I13',19,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(85,'I13',19,'2020-02-09 21:40:25',6,'Способ применения …','yes','accept'),(85,'I13',19,'2020-02-09 21:40:25',7,'Способ применения …','no','accept'),(85,'I13',19,'2020-02-09 21:40:25',12,'Способ применения …','yes','accept'),(89,'I21',19,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(89,'I21',19,'2020-02-09 21:40:25',5,'Способ применения …','yes','accept'),(89,'I21',19,'2020-02-09 21:40:25',9,'Способ применения …','no','accept'),(90,'I10',19,'2020-02-09 21:40:25',1,'Способ применения …','yes','accept'),(90,'I10',19,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(90,'I10',19,'2020-02-09 21:40:25',10,'Способ применения …','no','accept'),(93,'I22',2,'2020-02-09 21:40:25',1,'Способ применения …','no','accept'),(93,'I22',2,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(93,'I22',2,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(93,'I22',2,'2020-02-09 21:40:25',12,'Способ применения …','no','accept'),(99,'I21',2,'2020-02-09 21:40:25',1,'Способ применения …','no','accept'),(99,'I21',2,'2020-02-09 21:40:25',3,'Способ применения …','no','accept'),(99,'I21',2,'2020-02-09 21:40:25',4,'Способ применения …','yes','accept'),(99,'I21',2,'2020-02-09 21:40:25',6,'Способ применения …','no','accept'),(99,'I21',2,'2020-02-09 21:40:25',13,'Способ применения …','no','accept'),(99,'J41',16,'2020-02-11 15:35:56',17,'Способ применения …','no','accept'),(99,'J41',16,'2020-02-11 15:35:56',18,'Способ применения …','no','accept'),(99,'I21',2,'2020-02-09 21:40:25',20,'Способ применения …','no','accept');
/*!40000 ALTER TABLE `chronic_illness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_diagnostic`
--

DROP TABLE IF EXISTS `clinical_diagnostic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_diagnostic` (
  `case_history` int unsigned NOT NULL,
  `clinical_diagnostic_id` smallint unsigned NOT NULL,
  `doctor_assigner_id` int unsigned NOT NULL,
  `date_assigned` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `doctor_executor_id` int unsigned DEFAULT NULL,
  `date_executed` datetime DEFAULT NULL,
  `result_link` varchar(500) DEFAULT NULL,
  `norma` enum('norm','abnorm','undefined') DEFAULT NULL,
  PRIMARY KEY (`case_history`,`clinical_diagnostic_id`,`date_assigned`),
  KEY `clinical_diagnostic_clinical_diagnostic_id_fk` (`clinical_diagnostic_id`),
  KEY `clinical_diagnostic_doctor_assigner_id_fk` (`doctor_assigner_id`),
  KEY `clinical_diagnostic_doctor_executor_id_fk` (`doctor_executor_id`),
  KEY `clinical_diagnostic_case_history_clinical_diagnostic_id_idx` (`case_history`,`clinical_diagnostic_id`),
  CONSTRAINT `clinical_diagnostic_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `clinical_diagnostic_clinical_diagnostic_id_fk` FOREIGN KEY (`clinical_diagnostic_id`) REFERENCES `clinical_diagnostic_name` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `clinical_diagnostic_doctor_assigner_id_fk` FOREIGN KEY (`doctor_assigner_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `clinical_diagnostic_doctor_executor_id_fk` FOREIGN KEY (`doctor_executor_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_diagnostic`
--

LOCK TABLES `clinical_diagnostic` WRITE;
/*!40000 ALTER TABLE `clinical_diagnostic` DISABLE KEYS */;
INSERT INTO `clinical_diagnostic` VALUES (3,1,17,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(3,2,17,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(3,4,17,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(11,1,17,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(11,2,17,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(11,3,17,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(11,4,17,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(11,5,17,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(11,6,17,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(11,7,17,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(13,1,1,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(13,2,1,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(13,3,1,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(13,4,1,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(13,5,1,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(13,6,1,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(13,7,1,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(19,1,17,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(19,2,17,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(19,4,17,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(27,1,19,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(27,2,19,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(27,5,19,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(27,6,19,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(31,3,2,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(31,9,2,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(38,1,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(38,2,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(38,3,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(38,4,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(38,5,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(38,6,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(38,7,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(40,1,16,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(40,2,16,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(40,3,16,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(40,4,16,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(40,5,16,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(40,6,16,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(40,7,16,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(41,1,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(41,2,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(41,3,18,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(41,5,18,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(41,6,18,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(42,3,2,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(42,5,2,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(42,6,2,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(43,1,16,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(43,2,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(43,6,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(45,1,2,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(45,2,2,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(45,3,2,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(45,5,2,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(55,1,25,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(55,2,25,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(55,6,25,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(55,9,25,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(55,10,25,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(63,1,18,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(63,2,18,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(63,3,18,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(63,5,18,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(66,1,24,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(66,2,24,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(66,6,24,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(66,9,24,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(66,10,24,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(77,1,5,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(77,2,5,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(77,6,5,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(77,9,5,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(77,10,5,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(86,2,6,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(86,4,6,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(86,6,6,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(90,1,19,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(90,2,19,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(90,3,19,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(90,5,19,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(91,1,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(91,2,16,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(91,3,27,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','abnorm'),(91,4,27,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','norm'),(99,1,2,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(99,2,2,'2020-02-09 22:58:35',30,'2020-02-10 22:58:35','Результат: …','norm'),(99,5,2,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm'),(99,6,2,'2020-02-09 22:58:35',11,'2020-02-10 22:58:35','Результат: …','abnorm');
/*!40000 ALTER TABLE `clinical_diagnostic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_diagnostic_name`
--

DROP TABLE IF EXISTS `clinical_diagnostic_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_diagnostic_name` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinical_diagnostic_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_diagnostic_name`
--

LOCK TABLES `clinical_diagnostic_name` WRITE;
/*!40000 ALTER TABLE `clinical_diagnostic_name` DISABLE KEYS */;
INSERT INTO `clinical_diagnostic_name` VALUES (4,'blood chemistry'),(5,'blood test cholesterol spectrum'),(10,'blood test for blood type and Rh factor'),(7,'blood test for tumor markers'),(9,'coagulogram'),(1,'general blood analysis'),(2,'general urine analysis'),(6,'glucose test'),(8,'PSA blood test'),(3,'thyroid hormones analysis');
/*!40000 ALTER TABLE `clinical_diagnostic_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` VALUES (1,'candidate of sciences'),(2,'doctor of science');
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dispansery_MKB_code`
--

DROP TABLE IF EXISTS `dispansery_MKB_code`;
/*!50001 DROP VIEW IF EXISTS `dispansery_MKB_code`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dispansery_MKB_code` AS SELECT 
 1 AS `case_history`,
 1 AS `MKB_10_code`,
 1 AS `specialty`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dispansery_MKB_illness`
--

DROP TABLE IF EXISTS `dispansery_MKB_illness`;
/*!50001 DROP VIEW IF EXISTS `dispansery_MKB_illness`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dispansery_MKB_illness` AS SELECT 
 1 AS `case_history`,
 1 AS `illness`,
 1 AS `specialty`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dispansery_observation`
--

DROP TABLE IF EXISTS `dispansery_observation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispansery_observation` (
  `case_history` int unsigned NOT NULL,
  `MKB_10_code` varchar(15) NOT NULL,
  `specialty_id` tinyint unsigned NOT NULL,
  PRIMARY KEY (`case_history`,`MKB_10_code`),
  KEY `dispansery_observation_specialty_id_fk` (`specialty_id`),
  KEY `dispansery_observation_MKB_10_code_idx` (`MKB_10_code`),
  CONSTRAINT `dispansery_observation_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dispansery_observation_MKB_10_code_fk` FOREIGN KEY (`MKB_10_code`) REFERENCES `MKB_10` (`code`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `dispansery_observation_specialty_id_fk` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispansery_observation`
--

LOCK TABLES `dispansery_observation` WRITE;
/*!40000 ALTER TABLE `dispansery_observation` DISABLE KEYS */;
INSERT INTO `dispansery_observation` VALUES (23,'I21',2),(24,'I21',2),(26,'I21',2),(27,'I21',2),(29,'I21',2),(31,'Z95.2',2),(33,'I22',2),(34,'I22',2),(36,'Z95.2',2),(37,'I22',2),(39,'I22',2),(41,'I10',2),(42,'I11',2),(45,'I12',2),(49,'I13',2),(51,'I10',2),(53,'I11',2),(59,'I12',2),(63,'I13',2),(64,'I21',2),(66,'I10',2),(67,'I21',2),(69,'I21',2),(73,'I22',2),(74,'I22',2),(76,'I22',2),(77,'I22',2),(79,'I22',2),(81,'I11',2),(83,'I12',2),(84,'I21',2),(85,'I13',2),(89,'I21',2),(90,'I10',2),(93,'I22',2),(99,'I21',2),(86,'G35',6),(91,'G35',6);
/*!40000 ALTER TABLE `dispansery_observation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tradename` varchar(255) NOT NULL,
  `active_substance` varchar(255) DEFAULT NULL,
  `drug_view` enum('origin','generic','combi') DEFAULT NULL,
  `instruction` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `drug_tradename_uk` (`tradename`),
  KEY `drug_active_substance_idx` (`active_substance`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` VALUES (1,'конкор','бисопролол','origin','Инструкция: …'),(2,'лозап','лозартан','generic','Инструкция: …'),(3,'вальсакор','валсартан','generic','Инструкция: …'),(4,'аспирин кардио','ацетилсалициловая кислота','generic','Инструкция: …'),(5,'эгилок','метопролол','generic','Инструкция: …'),(6,'норваск','амлодипин','origin','Инструкция: …'),(7,'диувер','торасемид','generic','Инструкция: …'),(8,'лазикс','фуросемд','origin','Инструкция: …'),(9,'крестор','розувастатин','origin','Инструкция: …'),(10,'торвакард','аторвастатин','generic','Инструкция: …'),(11,'эксфорж','Валсартан + Амлодипин','combi','Инструкция: …'),(12,'моночинкве','изосорбида мононитрат','generic','Инструкция: …'),(13,'нитроспрей','нитроглицерин','generic','Инструкция: …'),(14,'дексаметазон','дексаметазон','generic','Инструкция: …'),(15,'пирацетам','пирацетам','generic','Инструкция: …'),(16,'допегит','метилдопа','origin','Инструкция: …'),(17,'амоксиклав','Амоксициллин + Клавулановая кислота','origin','Инструкция: …'),(18,'нурофен','ибупрофен','generic','Инструкция: …'),(19,'но-шпа','дротоверин','origin','Инструкция: …'),(20,'нольпаза','пантопрозол','generic','Инструкция: …'),(21,'нипертен','бисопролол','generic','Инструкция: …'),(22,'коронал','бисопролол','generic','Инструкция: …'),(23,'лорита','лозартан','generic','Инструкция: …'),(24,'козаар','лозартан','origin','Инструкция: …');
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endoscopic_diagnostic`
--

DROP TABLE IF EXISTS `endoscopic_diagnostic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endoscopic_diagnostic` (
  `case_history` int unsigned NOT NULL,
  `endoscopic_diagnostic_id` smallint unsigned NOT NULL,
  `doctor_assigner_id` int unsigned NOT NULL,
  `date_assigned` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `doctor_executor_id` int unsigned DEFAULT NULL,
  `date_executed` datetime DEFAULT NULL,
  `result_link` varchar(500) DEFAULT NULL,
  `norma` enum('norm','abnorm','undefined') DEFAULT NULL,
  PRIMARY KEY (`case_history`,`endoscopic_diagnostic_id`,`date_assigned`),
  KEY `endoscopic_diagnostic_endoscopic_diagnostic_id_fk` (`endoscopic_diagnostic_id`),
  KEY `endoscopic_diagnostic_doctor_assigner_id_fk` (`doctor_assigner_id`),
  KEY `endoscopic_diagnostic_doctor_executor_id_fk` (`doctor_executor_id`),
  KEY `endoscopic_diagnostic_case_history_endoscopic_diagnostic_id_idx` (`case_history`,`endoscopic_diagnostic_id`),
  CONSTRAINT `endoscopic_diagnostic_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `endoscopic_diagnostic_doctor_assigner_id_fk` FOREIGN KEY (`doctor_assigner_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `endoscopic_diagnostic_doctor_executor_id_fk` FOREIGN KEY (`doctor_executor_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `endoscopic_diagnostic_endoscopic_diagnostic_id_fk` FOREIGN KEY (`endoscopic_diagnostic_id`) REFERENCES `endoscopic_diagnostic_name` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endoscopic_diagnostic`
--

LOCK TABLES `endoscopic_diagnostic` WRITE;
/*!40000 ALTER TABLE `endoscopic_diagnostic` DISABLE KEYS */;
INSERT INTO `endoscopic_diagnostic` VALUES (11,1,17,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','abnorm'),(13,1,11,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','norm'),(19,1,17,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','norm'),(27,1,19,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','abnorm'),(40,1,16,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','abnorm'),(41,1,18,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','norm'),(42,1,2,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','abnorm'),(43,1,16,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','norm'),(45,1,2,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','norm'),(55,1,25,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','abnorm'),(63,1,18,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','abnorm'),(66,1,24,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','norm'),(77,1,5,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','norm'),(90,1,19,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','norm'),(99,1,2,'2020-02-09 22:58:35',15,'2020-02-10 22:58:35','Результат: …','norm');
/*!40000 ALTER TABLE `endoscopic_diagnostic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endoscopic_diagnostic_name`
--

DROP TABLE IF EXISTS `endoscopic_diagnostic_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endoscopic_diagnostic_name` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `endoscopic_diagnostic_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endoscopic_diagnostic_name`
--

LOCK TABLES `endoscopic_diagnostic_name` WRITE;
/*!40000 ALTER TABLE `endoscopic_diagnostic_name` DISABLE KEYS */;
INSERT INTO `endoscopic_diagnostic_name` VALUES (3,'bronchoscopy'),(5,'capsular endoscopy'),(4,'cholangiopancreatography'),(2,'colonoscopy'),(1,'gastroduodenoscopy');
/*!40000 ALTER TABLE `endoscopic_diagnostic_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functional_diagnostic`
--

DROP TABLE IF EXISTS `functional_diagnostic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `functional_diagnostic` (
  `case_history` int unsigned NOT NULL,
  `functional_diagnostic_id` smallint unsigned NOT NULL,
  `doctor_assigner_id` int unsigned NOT NULL,
  `date_assigned` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `doctor_executor_id` int unsigned DEFAULT NULL,
  `date_executed` datetime DEFAULT NULL,
  `result_link` varchar(500) DEFAULT NULL,
  `norma` enum('norm','abnorm','undefined') DEFAULT NULL,
  PRIMARY KEY (`case_history`,`functional_diagnostic_id`,`date_assigned`),
  KEY `functional_diagnostic_functional_diagnostic_id_fk` (`functional_diagnostic_id`),
  KEY `functional_diagnostic_doctor_assigner_id_fk` (`doctor_assigner_id`),
  KEY `functional_diagnostic_doctor_executor_id_fk` (`doctor_executor_id`),
  KEY `functional_diagnostic_case_history_functional_diagnostic_id_idx` (`case_history`,`functional_diagnostic_id`),
  CONSTRAINT `functional_diagnostic_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `functional_diagnostic_doctor_assigner_id_fk` FOREIGN KEY (`doctor_assigner_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `functional_diagnostic_doctor_executor_id_fk` FOREIGN KEY (`doctor_executor_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `functional_diagnostic_functional_diagnostic_id_fk` FOREIGN KEY (`functional_diagnostic_id`) REFERENCES `functional_diagnostic_name` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functional_diagnostic`
--

LOCK TABLES `functional_diagnostic` WRITE;
/*!40000 ALTER TABLE `functional_diagnostic` DISABLE KEYS */;
INSERT INTO `functional_diagnostic` VALUES (11,1,17,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','norm'),(13,1,11,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','norm'),(19,1,17,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','norm'),(27,1,19,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(27,2,19,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(40,1,16,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(40,2,16,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','norm'),(41,1,18,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(41,2,18,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(42,1,2,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(42,2,2,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(43,1,16,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','norm'),(45,1,2,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(45,2,2,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(55,1,25,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(63,1,18,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(63,2,18,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(66,1,24,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','norm'),(77,1,5,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','norm'),(90,1,19,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(90,2,19,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(99,1,1,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm'),(99,2,2,'2020-02-09 22:58:35',13,'2020-02-10 22:58:35','Результат: …','abnorm');
/*!40000 ALTER TABLE `functional_diagnostic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functional_diagnostic_name`
--

DROP TABLE IF EXISTS `functional_diagnostic_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `functional_diagnostic_name` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `functional_diagnostic_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functional_diagnostic_name`
--

LOCK TABLES `functional_diagnostic_name` WRITE;
/*!40000 ALTER TABLE `functional_diagnostic_name` DISABLE KEYS */;
INSERT INTO `functional_diagnostic_name` VALUES (5,'bicycle ergometry'),(4,'daily monitoring of blood pressure'),(2,'echocardiography'),(8,'echoencephalography'),(1,'electrocardiography'),(7,'electroencephalography'),(10,'electroneuromyography'),(3,'Holter monitoring'),(9,'rheoencephalography'),(6,'treadmill test');
/*!40000 ALTER TABLE `functional_diagnostic_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `med_staff_specialty`
--

DROP TABLE IF EXISTS `med_staff_specialty`;
/*!50001 DROP VIEW IF EXISTS `med_staff_specialty`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `med_staff_specialty` AS SELECT 
 1 AS `surname`,
 1 AS `name`,
 1 AS `patronym`,
 1 AS `specialty`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `med_staff_surname`
--

DROP TABLE IF EXISTS `med_staff_surname`;
/*!50001 DROP VIEW IF EXISTS `med_staff_surname`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `med_staff_surname` AS SELECT 
 1 AS `surname`,
 1 AS `name`,
 1 AS `patronym`,
 1 AS `specialty`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `med_terapia`
--

DROP TABLE IF EXISTS `med_terapia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `med_terapia` (
  `case_history` int unsigned NOT NULL,
  `drug_id` int unsigned NOT NULL,
  `doctor_id` int unsigned NOT NULL,
  `date_visit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `use_drug` varchar(500) DEFAULT NULL,
  `by_privilege` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`case_history`,`drug_id`,`date_visit`),
  KEY `med_terapia_doctor_id_fk` (`doctor_id`),
  KEY `med_terapia_drug_id_fk` (`drug_id`),
  KEY `med_terapia_case_history_doctor_id_idx` (`case_history`,`doctor_id`),
  CONSTRAINT `med_terapia_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `med_terapia_doctor_id_fk` FOREIGN KEY (`doctor_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `med_terapia_drug_id_fk` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_terapia`
--

LOCK TABLES `med_terapia` WRITE;
/*!40000 ALTER TABLE `med_terapia` DISABLE KEYS */;
INSERT INTO `med_terapia` VALUES (23,1,18,'2020-02-09 23:46:40','Способ применения …','no'),(23,3,18,'2020-02-09 23:46:40','Способ применения …','no'),(23,4,18,'2020-02-09 23:46:40','Способ применения …','yes'),(23,7,18,'2020-02-09 23:46:40','Способ применения …','no'),(24,4,19,'2020-02-09 23:46:40','Способ применения …','yes'),(24,5,19,'2020-02-09 23:46:40','Способ применения …','yes'),(24,6,19,'2020-02-09 23:46:40','Способ применения …','no'),(24,9,19,'2020-02-09 23:46:40','Способ применения …','no'),(26,1,18,'2020-02-09 23:46:40','Способ применения …','no'),(26,3,18,'2020-02-09 23:46:40','Способ применения …','no'),(26,4,18,'2020-02-09 23:46:40','Способ применения …','yes'),(26,12,18,'2020-02-09 23:46:40','Способ применения …','no'),(27,4,19,'2020-02-09 23:46:40','Способ применения …','yes'),(27,5,19,'2020-02-09 23:46:40','Способ применения …','yes'),(27,7,19,'2020-02-09 23:46:40','Способ применения …','no'),(27,20,19,'2020-02-09 23:46:40','Способ применения …','no'),(29,1,2,'2020-02-09 23:46:40','Способ применения …','no'),(29,3,2,'2020-02-09 23:46:40','Способ применения …','no'),(29,4,2,'2020-02-09 23:46:40','Способ применения …','yes'),(29,20,2,'2020-02-09 23:46:40','Способ применения …','no'),(31,1,2,'2020-02-09 23:46:40','Способ применения …','no'),(31,3,2,'2020-02-09 23:46:40','Способ применения …','no'),(31,4,2,'2020-02-09 23:46:40','Способ применения …','no'),(31,20,2,'2020-02-09 23:46:40','Способ применения …','no'),(33,1,18,'2020-02-09 23:46:40','Способ применения …','no'),(33,4,18,'2020-02-09 23:46:40','Способ применения …','yes'),(33,20,18,'2020-02-09 23:46:40','Способ применения …','no'),(34,4,19,'2020-02-09 23:46:40','Способ применения …','yes'),(34,5,19,'2020-02-09 23:46:40','Способ применения …','yes'),(34,7,19,'2020-02-09 23:46:40','Способ применения …','no'),(36,1,19,'2020-02-09 23:46:40','Способ применения …','no'),(36,3,19,'2020-02-09 23:46:40','Способ применения …','no'),(36,4,19,'2020-02-09 23:46:40','Способ применения …','no'),(36,9,19,'2020-02-09 23:46:40','Способ применения …','no'),(37,1,2,'2020-02-09 23:46:40','Способ применения …','no'),(37,4,2,'2020-02-09 23:46:40','Способ применения …','yes'),(37,9,2,'2020-02-09 23:46:40','Способ применения …','no'),(39,1,19,'2020-02-09 23:46:40','Способ применения …','no'),(39,3,19,'2020-02-09 23:46:40','Способ применения …','no'),(39,4,19,'2020-02-09 23:46:40','Способ применения …','yes'),(39,6,19,'2020-02-09 23:46:40','Способ применения …','no'),(39,7,19,'2020-02-09 23:46:40','Способ применения …','no'),(41,1,18,'2020-02-09 23:46:40','Способ применения …','yes'),(41,2,18,'2020-02-09 23:46:40','Способ применения …','no'),(42,1,2,'2020-02-09 23:46:40','Способ применения …','yes'),(42,6,2,'2020-02-09 23:46:40','Способ применения …','yes'),(45,1,2,'2020-02-09 23:46:40','Способ применения …','yes'),(45,2,2,'2020-02-09 23:46:40','Способ применения …','no'),(45,4,2,'2020-02-09 23:46:40','Способ применения …','yes'),(45,8,2,'2020-02-09 23:46:40','Способ применения …','yes'),(45,10,2,'2020-02-09 23:46:40','Способ применения …','no'),(49,1,2,'2020-02-09 23:46:40','Способ применения …','yes'),(49,3,2,'2020-02-09 23:46:40','Способ применения …','no'),(49,4,2,'2020-02-09 23:46:40','Способ применения …','yes'),(49,7,2,'2020-02-09 23:46:40','Способ применения …','no'),(49,12,2,'2020-02-09 23:46:40','Способ применения …','yes'),(51,1,2,'2020-02-09 23:46:40','Способ применения …','yes'),(51,3,2,'2020-02-09 23:46:40','Способ применения …','no'),(51,10,2,'2020-02-09 23:46:40','Способ применения …','no'),(53,2,18,'2020-02-09 23:46:40','Способ применения …','no'),(53,6,18,'2020-02-09 23:46:40','Способ применения …','yes'),(53,8,18,'2020-02-09 23:46:40','Способ применения …','yes'),(53,10,18,'2020-02-09 23:46:40','Способ применения …','no'),(59,1,18,'2020-02-09 23:46:40','Способ применения …','yes'),(59,3,18,'2020-02-09 23:46:40','Способ применения …','no'),(59,7,18,'2020-02-09 23:46:40','Способ применения …','no'),(59,12,18,'2020-02-09 23:46:40','Способ применения …','yes'),(63,1,18,'2020-02-09 23:46:40','Способ применения …','yes'),(63,4,18,'2020-02-09 23:46:40','Способ применения …','yes'),(63,6,18,'2020-02-09 23:46:40','Способ применения …','yes'),(63,7,18,'2020-02-09 23:46:40','Способ применения …','no'),(63,10,18,'2020-02-09 23:46:40','Способ применения …','no'),(64,3,18,'2020-02-09 23:46:40','Способ применения …','no'),(64,4,18,'2020-02-09 23:46:40','Способ применения …','yes'),(64,5,18,'2020-02-09 23:46:40','Способ применения …','yes'),(64,6,18,'2020-02-09 23:46:40','Способ применения …','no'),(64,7,18,'2020-02-09 23:46:40','Способ применения …','no'),(64,13,18,'2020-02-09 23:46:40','Способ применения …','no'),(66,1,18,'2020-02-09 23:46:40','Способ применения …','yes'),(66,2,18,'2020-02-09 23:46:40','Способ применения …','no'),(67,1,19,'2020-02-09 23:46:40','Способ применения …','no'),(67,2,19,'2020-02-09 23:46:40','Способ применения …','yes'),(67,4,19,'2020-02-09 23:46:40','Способ применения …','yes'),(67,9,19,'2020-02-09 23:46:40','Способ применения …','no'),(69,4,2,'2020-02-09 23:46:40','Способ применения …','yes'),(69,5,2,'2020-02-09 23:46:40','Способ применения …','yes'),(69,12,2,'2020-02-09 23:46:40','Способ применения …','no'),(73,4,18,'2020-02-09 23:46:40','Способ применения …','yes'),(73,5,18,'2020-02-09 23:46:40','Способ применения …','yes'),(73,7,18,'2020-02-09 23:46:40','Способ применения …','no'),(74,1,2,'2020-02-09 23:46:40','Способ применения …','no'),(74,4,2,'2020-02-09 23:46:40','Способ применения …','yes'),(74,6,2,'2020-02-09 23:46:40','Способ применения …','no'),(76,1,18,'2020-02-09 23:46:40','Способ применения …','no'),(76,2,18,'2020-02-09 23:46:40','Способ применения …','yes'),(76,4,18,'2020-02-09 23:46:40','Способ применения …','yes'),(77,3,19,'2020-02-09 23:46:40','Способ применения …','no'),(77,4,19,'2020-02-09 23:46:40','Способ применения …','yes'),(77,5,19,'2020-02-09 23:46:40','Способ применения …','yes'),(79,1,2,'2020-02-09 23:46:40','Способ применения …','no'),(79,4,2,'2020-02-09 23:46:40','Способ применения …','yes'),(79,6,2,'2020-02-09 23:46:40','Способ применения …','no'),(81,3,19,'2020-02-09 23:46:40','Способ применения …','no'),(81,6,19,'2020-02-09 23:46:40','Способ применения …','no'),(83,1,19,'2020-02-09 23:46:40','Способ применения …','yes'),(83,6,19,'2020-02-09 23:46:40','Способ применения …','yes'),(83,7,19,'2020-02-09 23:46:40','Способ применения …','no'),(83,10,19,'2020-02-09 23:46:40','Способ применения …','no'),(83,12,19,'2020-02-09 23:46:40','Способ применения …','yes'),(84,1,18,'2020-02-09 23:46:40','Способ применения …','no'),(84,4,18,'2020-02-09 23:46:40','Способ применения …','yes'),(84,13,18,'2020-02-09 23:46:40','Способ применения …','no'),(85,1,19,'2020-02-09 23:46:40','Способ применения …','yes'),(85,4,19,'2020-02-09 23:46:40','Способ применения …','yes'),(85,6,19,'2020-02-09 23:46:40','Способ применения …','yes'),(85,7,19,'2020-02-09 23:46:40','Способ применения …','no'),(85,12,19,'2020-02-09 23:46:40','Способ применения …','yes'),(89,4,19,'2020-02-09 23:46:40','Способ применения …','yes'),(89,5,19,'2020-02-09 23:46:40','Способ применения …','yes'),(89,9,19,'2020-02-09 23:46:40','Способ применения …','no'),(90,1,19,'2020-02-09 23:46:40','Способ применения …','yes'),(90,3,19,'2020-02-09 23:46:40','Способ применения …','no'),(90,10,19,'2020-02-09 23:46:40','Способ применения …','no'),(93,1,2,'2020-02-09 23:46:40','Способ применения …','no'),(93,3,2,'2020-02-09 23:46:40','Способ применения …','no'),(93,4,2,'2020-02-09 23:46:40','Способ применения …','yes'),(93,12,2,'2020-02-09 23:46:40','Способ применения …','no'),(99,1,2,'2020-02-09 23:46:40','Способ применения …','no'),(99,3,2,'2020-02-09 23:46:40','Способ применения …','no'),(99,4,2,'2020-02-09 23:46:40','Способ применения …','yes'),(99,6,2,'2020-02-09 23:46:40','Способ применения …','no'),(99,13,2,'2020-02-09 23:46:40','Способ применения …','no'),(99,20,2,'2020-02-09 23:46:40','Способ применения …','no');
/*!40000 ALTER TABLE `med_terapia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_staff`
--

DROP TABLE IF EXISTS `medical_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_staff` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `surname` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `patronym` varchar(100) DEFAULT NULL,
  `sex` enum('m','f') NOT NULL,
  `specialty_id` tinyint unsigned NOT NULL,
  `category_id` tinyint unsigned DEFAULT NULL,
  `degree_id` tinyint unsigned DEFAULT NULL,
  `photo_staff_id` int unsigned DEFAULT NULL,
  `birthday` date NOT NULL,
  `phone` bigint unsigned DEFAULT NULL,
  `phone_double` bigint unsigned DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `work_place` varchar(200) DEFAULT NULL,
  `ogrn_work_place` bigint unsigned DEFAULT NULL,
  `work_address` varchar(500) DEFAULT NULL,
  `history` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `medical_staff_category_id_fk` (`category_id`),
  KEY `medical_staff_degree_id_fk` (`degree_id`),
  KEY `medical_staff_photo_staff_id_fk` (`photo_staff_id`),
  KEY `medical_staff_surname_name_patronym_idx` (`surname`,`name`,`patronym`),
  KEY `medical_staff_specialty_id_idx` (`specialty_id`),
  KEY `medical_staff_ogrn_work_place_idx` (`ogrn_work_place`),
  CONSTRAINT `medical_staff_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `medical_staff_degree_id_fk` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `medical_staff_photo_staff_id_fk` FOREIGN KEY (`photo_staff_id`) REFERENCES `photo_staff` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `medical_staff_specialty_id_fk` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_staff`
--

LOCK TABLES `medical_staff` WRITE;
/*!40000 ALTER TABLE `medical_staff` DISABLE KEYS */;
INSERT INTO `medical_staff` VALUES (1,'Карпова','Светлана','Александровна','f',1,NULL,NULL,1,'1970-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(2,'Афанасьев','Николай','Алексеевич','m',2,1,1,2,'1971-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(3,'Власова','Марина','Егоровна','f',3,2,1,3,'1972-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(4,'Маслов','Сергей','Станиславович','m',4,1,NULL,4,'1973-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(5,'Исахова','Людмила','Михайловна','f',5,3,1,5,'1974-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(6,'Тихонов','Дмитрий','Константинович','m',6,NULL,NULL,6,'1975-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(7,'Аксенова','Ольга','Андреевна','f',7,1,2,7,'1976-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(8,'Гаврилов','Андрей','Дмитриевич','m',8,3,NULL,8,'1977-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(9,'Радионов','Тимур','Тимофеевич','m',9,2,2,9,'1978-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(10,'Котова','Нина','Сергеевна','f',10,NULL,NULL,10,'1979-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(11,'Горбунов','Тимофей','Александрович','m',11,3,2,11,'1980-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(12,'Кудряшова','Галина','Петровна','f',12,1,1,12,'1981-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(13,'Быков','Александр','Николаевич','m',13,2,NULL,13,'1982-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(14,'Зуева','Ксения','Вячеславовна','f',14,2,2,14,'1983-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(15,'Третьяков','Илья','Васильевич','m',15,NULL,NULL,15,'1984-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(16,'Савельева','Мария','Владимировна','f',1,3,1,16,'1985-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(17,'Панов','Алексей','Юрьевич','m',1,3,2,17,'1986-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(18,'Рыбакова','Наталья','Петровна','f',2,1,NULL,18,'1987-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(19,'Суворов','Петр','Сергеевич','m',2,1,2,19,'1988-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(20,'Абрамова','Екатерина','Алексеевна','f',3,NULL,NULL,20,'1989-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(21,'Воронов','Василий','Владимирович','m',3,1,2,21,'1990-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(22,'Мухина','Ирина','Александровна','f',4,3,NULL,22,'1991-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(23,'Архипов','Владимир','Игоревич','m',4,2,1,23,'1992-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(24,'Трофимова','Кристина','Максимовна','f',5,NULL,NULL,24,'1993-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(25,'Мартынов','Кирилл','Радионович','m',5,1,1,25,'1994-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(26,'Емельянова','Полина','Михайловна','f',6,2,2,26,'1970-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(27,'Горшков','Егор','Иванович','m',6,2,NULL,27,'1971-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(28,'Чернова','Дарья','Алексеевна','f',7,1,1,28,'1972-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(29,'Михеев','Игорь','Петрович','m',7,NULL,NULL,29,'1973-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …'),(30,'Назарова','Мария','Сергеевна','f',11,1,NULL,30,'1974-01-01',4959059595,NULL,'qwer@mail.ru','Поликлиника №',1234567890123,'Москва','Информация …');
/*!40000 ALTER TABLE `medical_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `case_history` int unsigned NOT NULL AUTO_INCREMENT,
  `surname` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `patronym` varchar(100) DEFAULT NULL,
  `sex` enum('m','f') NOT NULL,
  `birthday` date DEFAULT NULL,
  `phone` bigint unsigned DEFAULT NULL,
  `phone_double` bigint unsigned DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `med_policy` bigint unsigned DEFAULT NULL,
  `snils` bigint unsigned DEFAULT NULL,
  `passport` varchar(500) DEFAULT NULL,
  `privilege_code_1` smallint unsigned DEFAULT NULL,
  `privilege_code_2` smallint unsigned DEFAULT NULL,
  `privilege_code_3` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`case_history`),
  UNIQUE KEY `case_history` (`case_history`),
  UNIQUE KEY `med_policy` (`med_policy`),
  UNIQUE KEY `snils` (`snils`),
  UNIQUE KEY `passport` (`passport`),
  UNIQUE KEY `med_policy_2` (`med_policy`),
  UNIQUE KEY `snils_2` (`snils`),
  KEY `patient_privilege_code_1_fk` (`privilege_code_1`),
  KEY `patient_privilege_code_2_fk` (`privilege_code_2`),
  KEY `patient_privilege_code_3_fk` (`privilege_code_3`),
  KEY `patient_surname_name_patronym_idx` (`surname`,`name`,`patronym`),
  CONSTRAINT `patient_privilege_code_1_fk` FOREIGN KEY (`privilege_code_1`) REFERENCES `privilege` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `patient_privilege_code_2_fk` FOREIGN KEY (`privilege_code_2`) REFERENCES `privilege` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `patient_privilege_code_3_fk` FOREIGN KEY (`privilege_code_3`) REFERENCES `privilege` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Смирнов','Иван','Васильевич','m','1944-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000001,10000000001,'Инфо 0001',82,NULL,NULL),(2,'Иванов','Игорь','Иванович','m','1945-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000002,10000000002,'Инфо 0002',82,NULL,NULL),(3,'Кузнецов','Вячеслав','Юрьевич','m','1946-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000003,10000000003,'Инфо 0003',83,NULL,NULL),(4,'Соколов','Юрий','Леонидович','m','1947-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000004,10000000004,'Инфо 0004',82,NULL,NULL),(5,'Попов','Леонид','Яковлевич','m','1948-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000005,10000000005,'Инфо 0005',83,NULL,NULL),(6,'Лебедева','Инна','Сергеевна','f','1945-06-01',4959059595,NULL,'qwer@mail.ru',1000000000000006,10000000006,'Инфо 0006',82,NULL,NULL),(7,'Козлова','Екатерина','Юрьевна','f','1946-05-01',4959059595,NULL,'qwer@mail.ru',1000000000000007,10000000007,'Инфо 0007',83,NULL,NULL),(8,'Новикова','Марина','Александровна','f','1947-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000008,10000000008,'Инфо 0008',82,NULL,NULL),(9,'Морозова','Ольга','Алексеевна','f','1948-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000009,10000000009,'Инфо 0009',83,NULL,NULL),(10,'Петрова','Тамара','Николаевна','f','1949-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000010,10000000010,'Инфо 0010',82,NULL,NULL),(11,'Волков','Анатолий','Павлович','m','1949-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000011,10000000011,'Инфо 0011',81,NULL,NULL),(12,'Соловьев','Арсений','Константинович','m','1950-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000012,10000000012,'Инфо 0012',NULL,NULL,NULL),(13,'Васильев','Станислав','Алексеевич','m','1951-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000013,10000000013,'Инфо 0013',82,NULL,NULL),(14,'Зайцев','Николай','Александрович','m','1952-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000014,10000000014,'Инфо 0014',81,NULL,NULL),(15,'Павлов','Константин','Владимирович','m','1953-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000015,10000000015,'Инфо 0015',82,NULL,NULL),(16,'Семенова','Ксения','Валентиновна','f','1954-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000016,10000000016,'Инфо 0016',81,NULL,NULL),(17,'Голубева','Галина','Михайловна','f','1955-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000017,10000000017,'Инфо 0017',82,NULL,NULL),(18,'Виноградова','Елизавета','Геннадьевна','f','1956-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000018,10000000018,'Инфо 0018',NULL,NULL,NULL),(19,'Богданова','Мария','Кирилловна','f','1957-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000019,10000000019,'Инфо 0019',82,NULL,NULL),(20,'Воробьева','Полина','Артемовна','f','1958-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000020,10000000020,'Инфо 0020',81,NULL,NULL),(21,'Федоров','Михаил','Федорович','m','1959-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000021,10000000021,'Инфо 0021',81,NULL,NULL),(22,'Михайлов','Федор','Артурович','m','1960-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000022,10000000022,'Инфо 0022',NULL,NULL,NULL),(23,'Беляев','Тарас','Игоревич','m','1961-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000023,10000000023,'Инфо 0023',516,82,NULL),(24,'Тарасов','Макар','Осипович','m','1962-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000024,10000000024,'Инфо 0024',516,NULL,NULL),(25,'Белов','Игорь','Евгеньевич','m','1963-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000025,10000000025,'Инфо 0025',81,NULL,NULL),(26,'Комарова','Таисия','Ивановна','f','1964-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000026,10000000026,'Инфо 0026',516,82,NULL),(27,'Орлова','Ольга','Макаровна','f','1965-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000027,10000000027,'Инфо 0027',516,NULL,NULL),(28,'Киселева','Нина','Федоровна','f','1966-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000028,10000000028,'Инфо 0028',NULL,NULL,NULL),(29,'Макарова','Варвара','Александровна','f','1967-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000029,10000000029,'Инфо 0029',516,82,NULL),(30,'Андреева','Татьяна','Анатольевна','f','1968-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000030,10000000030,'Инфо 0030',81,NULL,NULL),(31,'Ковалев','Михаил','Федорович','m','1969-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000031,10000000031,'Инфо 0031',538,NULL,NULL),(32,'Ильин','Федор','Артурович','m','1970-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000032,10000000032,'Инфо 0032',NULL,NULL,NULL),(33,'Гусев','Тарас','Игоревич','m','1971-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000033,10000000033,'Инфо 0033',516,82,NULL),(34,'Титов','Макар','Осипович','m','1972-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000034,10000000034,'Инфо 0034',516,NULL,NULL),(35,'Кузьмин','Игорь','Евгеньевич','m','1973-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000035,10000000035,'Инфо 0035',81,NULL,NULL),(36,'Кудрявцева','Таисия','Ивановна','f','1974-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000036,10000000036,'Инфо 0036',538,82,NULL),(37,'Баранова','Ольга','Макаровна','f','1975-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000037,10000000037,'Инфо 0037',516,NULL,NULL),(38,'Куликова','Нина','Федоровна','f','1976-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000038,10000000038,'Инфо 0038',NULL,NULL,NULL),(39,'Алексеева','Варвара','Александровна','f','1977-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000039,10000000039,'Инфо 0039',516,82,NULL),(40,'Степанова','Татьяна','Анатольевна','f','1978-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000040,10000000040,'Инфо 0040',81,NULL,NULL),(41,'Яковлев','Иван','Васильевич','m','1979-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000041,10000000041,'Инфо 0041',540,NULL,NULL),(42,'Сорокин','Игорь','Иванович','m','1980-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000042,10000000042,'Инфо 0042',540,NULL,NULL),(43,'Сергеев','Вячеслав','Юрьевич','m','1981-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000043,10000000043,'Инфо 0043',83,NULL,NULL),(44,'Романов','Юрий','Леонидович','m','1982-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000044,10000000044,'Инфо 0044',82,NULL,NULL),(45,'Захаров','Леонид','Яковлевич','m','1983-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000045,10000000045,'Инфо 0045',540,NULL,NULL),(46,'Борисова','Инна','Сергеевна','f','1984-06-01',4959059595,NULL,'qwer@mail.ru',1000000000000046,10000000046,'Инфо 0046',82,NULL,NULL),(47,'Королева','Екатерина','Юрьевна','f','1985-05-01',4959059595,NULL,'qwer@mail.ru',1000000000000047,10000000047,'Инфо 0047',83,NULL,NULL),(48,'Герасимова','Марина','Александровна','f','1986-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000048,10000000048,'Инфо 0048',82,NULL,NULL),(49,'Пономарева','Ольга','Алексеевна','f','1988-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000049,10000000049,'Инфо 0049',540,NULL,NULL),(50,'Григорьева','Тамара','Николаевна','f','1987-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000050,10000000050,'Инфо 0050',82,NULL,NULL),(51,'Лазарев','Анатолий','Павлович','m','1989-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000051,10000000051,'Инфо 0051',540,NULL,NULL),(52,'Медведев','Арсений','Константинович','m','1990-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000052,10000000052,'Инфо 0052',NULL,NULL,NULL),(53,'Ершов','Станислав','Алексеевич','m','1991-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000053,10000000053,'Инфо 0053',540,NULL,NULL),(54,'Никитин','Николай','Александрович','m','1992-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000054,10000000054,'Инфо 0054',81,NULL,NULL),(55,'Соболев','Константин','Владимирович','m','1993-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000055,10000000055,'Инфо 0055',82,NULL,NULL),(56,'Яковлева','Ксения','Валентиновна','f','1994-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000056,10000000056,'Инфо 0056',81,NULL,NULL),(57,'Рябова','Галина','Михайловна','f','1995-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000057,10000000057,'Инфо 0057',82,NULL,NULL),(58,'Полякова','Елизавета','Геннадьевна','f','1996-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000058,10000000058,'Инфо 0058',NULL,NULL,NULL),(59,'Цветкова','Мария','Кирилловна','f','1997-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000059,10000000059,'Инфо 0059',540,NULL,NULL),(60,'Данилова','Полина','Артемовна','f','1998-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000060,10000000060,'Инфо 0060',81,NULL,NULL),(61,'Жуков','Михаил','Федорович','m','1999-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000061,10000000061,'Инфо 0061',81,NULL,NULL),(62,'Косаткин','Федор','Артурович','m','1960-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000062,10000000062,'Инфо 0062',NULL,NULL,NULL),(63,'Фролов','Тарас','Игоревич','m','1961-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000063,10000000063,'Инфо 0063',540,82,NULL),(64,'Петушков','Макар','Осипович','m','1962-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000064,10000000064,'Инфо 0064',516,NULL,NULL),(65,'Журавлев','Игорь','Евгеньевич','m','1963-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000065,10000000065,'Инфо 0065',81,NULL,NULL),(66,'Крылова','Таисия','Ивановна','f','1964-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000066,10000000066,'Инфо 0066',540,82,NULL),(67,'Максимова','Ольга','Макаровна','f','1965-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000067,10000000067,'Инфо 0067',516,NULL,NULL),(68,'Сидорова','Нина','Федоровна','f','1966-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000068,10000000068,'Инфо 0068',NULL,NULL,NULL),(69,'Осипова','Варвара','Александровна','f','1967-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000069,10000000069,'Инфо 0069',516,82,NULL),(70,'Белоусова','Татьяна','Анатольевна','f','1968-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000070,10000000070,'Инфо 0070',81,NULL,NULL),(71,'Федотов','Михаил','Федорович','m','1969-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000071,10000000071,'Инфо 0071',81,NULL,NULL),(72,'Ерофеев','Федор','Артурович','m','1970-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000072,10000000072,'Инфо 0072',NULL,NULL,NULL),(73,'Егоров','Тарас','Игоревич','m','1971-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000073,10000000073,'Инфо 0073',516,82,NULL),(74,'Матвеев','Макар','Осипович','m','1972-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000074,10000000074,'Инфо 0074',516,NULL,NULL),(75,'Бобров','Игорь','Евгеньевич','m','1973-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000075,10000000075,'Инфо 0075',81,NULL,NULL),(76,'Дмитриева','Таисия','Ивановна','f','1974-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000076,10000000076,'Инфо 0076',516,82,NULL),(77,'Калинина','Ольга','Макаровна','f','1975-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000077,10000000077,'Инфо 0077',516,NULL,NULL),(78,'Анисимова','Нина','Федоровна','f','1976-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000078,10000000078,'Инфо 0078',NULL,NULL,NULL),(79,'Тимофеева','Варвара','Александровна','f','1977-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000079,10000000079,'Инфо 0079',516,82,NULL),(80,'Филиппова','Татьяна','Анатольевна','f','1978-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000080,10000000080,'Инфо 0080',81,NULL,NULL),(81,'Юрченко','Иван','Васильевич','m','1974-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000081,10000000081,'Инфо 0081',540,NULL,NULL),(82,'Романов','Игорь','Иванович','m','1985-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000082,10000000082,'Инфо 0082',NULL,NULL,NULL),(83,'Антонов','Вячеслав','Юрьевич','m','1986-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000083,10000000083,'Инфо 0083',540,NULL,NULL),(84,'Большаков','Юрий','Леонидович','m','1987-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000084,10000000084,'Инфо 0084',516,NULL,NULL),(85,'Суханов','Леонид','Яковлевич','m','1988-01-01',4959059595,NULL,'qwer@mail.ru',1000000000000085,10000000085,'Инфо 0085',540,NULL,NULL),(86,'Ширяева','Инна','Сергеевна','f','1989-06-01',4959059595,NULL,'qwer@mail.ru',1000000000000086,10000000086,'Инфо 0086',541,NULL,NULL),(87,'Коновалова','Екатерина','Юрьевна','f','1996-05-01',4959059595,NULL,'qwer@mail.ru',1000000000000087,10000000087,'Инфо 0087',83,NULL,NULL),(88,'Шестакова','Марина','Александровна','f','1997-04-01',4959059595,NULL,'qwer@mail.ru',1000000000000088,10000000088,'Инфо 0088',NULL,NULL,NULL),(89,'Казакова','Ольга','Алексеевна','f','1998-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000089,10000000089,'Инфо 0089',516,NULL,NULL),(90,'Ефимова','Тамара','Николаевна','f','1999-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000090,10000000090,'Инфо 0090',540,NULL,NULL),(91,'Денисов','Анатолий','Павлович','m','1949-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000091,10000000091,'Инфо 0091',541,NULL,NULL),(92,'Громов','Арсений','Константинович','m','1950-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000092,10000000092,'Инфо 0092',NULL,NULL,NULL),(93,'Фомин','Станислав','Алексеевич','m','1951-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000093,10000000093,'Инфо 0093',516,NULL,NULL),(94,'Давыдов','Николай','Александрович','m','1952-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000094,10000000094,'Инфо 0094',NULL,NULL,NULL),(95,'Щербаков','Константин','Владимирович','m','1953-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000095,10000000095,'Инфо 0095',82,NULL,NULL),(96,'Колесникова','Ксения','Валентиновна','f','1954-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000096,10000000096,'Инфо 0096',81,NULL,NULL),(97,'Логинова','Галина','Михайловна','f','1955-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000097,10000000097,'Инфо 0097',NULL,NULL,NULL),(98,'Наумова','Елизавета','Геннадьевна','f','1956-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000098,10000000098,'Инфо 0098',NULL,NULL,NULL),(99,'Дроздова','Мария','Кирилловна','f','1957-02-01',4959059595,NULL,'qwer@mail.ru',1000000000000099,10000000099,'Инфо 0099',516,NULL,NULL),(100,'Назарова','Полина','Артемовна','f','1958-03-01',4959059595,NULL,'qwer@mail.ru',1000000000000100,10000000100,'Инфо 0100',NULL,NULL,NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_patient`
--

DROP TABLE IF EXISTS `photo_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_patient` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `photo` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_patient`
--

LOCK TABLES `photo_patient` WRITE;
/*!40000 ALTER TABLE `photo_patient` DISABLE KEYS */;
INSERT INTO `photo_patient` VALUES (1,'0000000001.jpg',_binary '1'),(2,'0000000002.jpg',_binary '11'),(3,'0000000003.jpg',_binary '111'),(4,'0000000004.jpg',_binary '1111'),(5,'0000000005.jpg',_binary '11111'),(6,'0000000006.jpg',_binary '111111'),(7,'0000000007.jpg',_binary '10'),(8,'0000000008.jpg',_binary '110'),(9,'0000000009.jpg',_binary '1110'),(10,'0000000010.jpg',_binary '11111'),(11,'0000000011.jpg',_binary '111110'),(12,'0000000012.jpg',_binary '100'),(13,'0000000013.jpg',_binary '1100'),(14,'0000000014.jpg',_binary '11100'),(15,'0000000015.jpg',_binary '111100'),(16,'0000000016.jpg',_binary '1000'),(17,'0000000017.jpg',_binary '11000'),(18,'0000000018.jpg',_binary '111000'),(19,'0000000019.jpg',_binary '10000'),(20,'0000000020.jpg',_binary '110000'),(21,'0000000021.jpg',_binary '100000'),(22,'0000000022.jpg',_binary '100001'),(23,'0000000023.jpg',_binary '100011'),(24,'0000000024.jpg',_binary '100111'),(25,'0000000025.jpg',_binary '101111'),(26,'0000000026.jpg',_binary '100010'),(27,'0000000027.jpg',_binary '100110'),(28,'0000000028.jpg',_binary '101110'),(29,'0000000029.jpg',_binary '100100'),(30,'0000000030.jpg',_binary '101100'),(31,'0000000031.jpg',_binary '110001'),(32,'0000000032.jpg',_binary '110010'),(33,'0000000033.jpg',_binary '110100'),(34,'0000000034.jpg',_binary '110011'),(35,'0000000035.jpg',_binary '110111'),(36,'0000000036.jpg',_binary '110110'),(37,'0000000037.jpg',_binary '111000'),(38,'0000000038.jpg',_binary '111001'),(39,'0000000039.jpg',_binary '111011'),(40,'0000000040.jpg',_binary '111010'),(41,'0000000041.jpg',_binary '101001'),(42,'0000000042.jpg',_binary '101010'),(43,'0000000043.jpg',_binary '101011'),(44,'0000000044.jpg',_binary '1'),(45,'0000000045.jpg',_binary '10'),(46,'0000000046.jpg',_binary '100'),(47,'0000000047.jpg',_binary '1000'),(48,'0000000048.jpg',_binary '10000'),(49,'0000000049.jpg',_binary '100001'),(50,'0000000050.jpg',_binary '1000000'),(51,'0000000051.jpg',_binary '11000001'),(52,'0000000052.jpg',_binary '11000011'),(53,'0000000053.jpg',_binary '11000111'),(54,'0000000054.jpg',_binary '11001111'),(55,'0000000055.jpg',_binary '11011111'),(56,'0000000056.jpg',_binary '11111111'),(57,'0000000057.jpg',_binary '11000010'),(58,'0000000058.jpg',_binary '11000110'),(59,'0000000059.jpg',_binary '11001110'),(60,'0000000060.jpg',_binary '11011111'),(61,'0000000061.jpg',_binary '11111110'),(62,'0000000062.jpg',_binary '11000100'),(63,'0000000063.jpg',_binary '11001100'),(64,'0000000064.jpg',_binary '11011100'),(65,'0000000065.jpg',_binary '11111100'),(66,'0000000066.jpg',_binary '11001000'),(67,'0000000067.jpg',_binary '11011000'),(68,'0000000068.jpg',_binary '11111000'),(69,'0000000069.jpg',_binary '11010000'),(70,'0000000070.jpg',_binary '11110000'),(71,'0000000071.jpg',_binary '11100000'),(72,'0000000072.jpg',_binary '11100001'),(73,'0000000073.jpg',_binary '11100011'),(74,'0000000074.jpg',_binary '11100111'),(75,'0000000075.jpg',_binary '11101111'),(76,'0000000076.jpg',_binary '11100010'),(77,'0000000077.jpg',_binary '11100110'),(78,'0000000078.jpg',_binary '11101110'),(79,'0000000079.jpg',_binary '11100100'),(80,'0000000080.jpg',_binary '11101100'),(81,'0000000081.jpg',_binary '11110001'),(82,'0000000082.jpg',_binary '11110010'),(83,'0000000083.jpg',_binary '11110100'),(84,'0000000084.jpg',_binary '11110011'),(85,'0000000085.jpg',_binary '11110111'),(86,'0000000086.jpg',_binary '11110110'),(87,'0000000087.jpg',_binary '11111000'),(88,'0000000088.jpg',_binary '11111001'),(89,'0000000089.jpg',_binary '11111011'),(90,'0000000090.jpg',_binary '11111010'),(91,'0000000091.jpg',_binary '11101001'),(92,'0000000092.jpg',_binary '11101010'),(93,'0000000093.jpg',_binary '11101011'),(94,'0000000094.jpg',_binary '110000001'),(95,'0000000095.jpg',_binary '110000010'),(96,'0000000096.jpg',_binary '110000100'),(97,'0000000097.jpg',_binary '110001000'),(98,'0000000098.jpg',_binary '110010000'),(99,'0000000099.jpg',_binary '110100001'),(100,'0000000100.jpg',_binary '111000000');
/*!40000 ALTER TABLE `photo_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_staff`
--

DROP TABLE IF EXISTS `photo_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_staff` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `photo` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_staff`
--

LOCK TABLES `photo_staff` WRITE;
/*!40000 ALTER TABLE `photo_staff` DISABLE KEYS */;
INSERT INTO `photo_staff` VALUES (1,'s000000001.jpg',_binary '1'),(2,'s000000002.jpg',_binary '11'),(3,'s000000003.jpg',_binary '111'),(4,'s000000004.jpg',_binary '1111'),(5,'s000000005.jpg',_binary '11111'),(6,'s000000006.jpg',_binary '111111'),(7,'s000000007.jpg',_binary '10'),(8,'s000000008.jpg',_binary '110'),(9,'s000000009.jpg',_binary '1110'),(10,'s000000010.jpg',_binary '11111'),(11,'s000000011.jpg',_binary '111110'),(12,'s000000012.jpg',_binary '100'),(13,'s000000013.jpg',_binary '1100'),(14,'s000000014.jpg',_binary '11100'),(15,'s000000015.jpg',_binary '111100'),(16,'s000000016.jpg',_binary '1000'),(17,'s000000017.jpg',_binary '11000'),(18,'s000000018.jpg',_binary '111000'),(19,'s000000019.jpg',_binary '10000'),(20,'s000000020.jpg',_binary '110000'),(21,'s000000021.jpg',_binary '100000'),(22,'s000000022.jpg',_binary '100001'),(23,'s000000023.jpg',_binary '100011'),(24,'s000000024.jpg',_binary '100111'),(25,'s000000025.jpg',_binary '101111'),(26,'s000000026.jpg',_binary '100010'),(27,'s000000027.jpg',_binary '100110'),(28,'s000000028.jpg',_binary '101110'),(29,'s000000029.jpg',_binary '100100'),(30,'s000000030.jpg',_binary '101100');
/*!40000 ALTER TABLE `photo_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privilege` (
  `code` smallint unsigned NOT NULL,
  `egisso` int unsigned DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `MKB_10_code` varchar(15) DEFAULT NULL,
  `vol_of_med_care_id` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `privilege_MKB_10_code_fk` (`MKB_10_code`),
  KEY `privilege_vol_of_med_care_id_fk` (`vol_of_med_care_id`),
  KEY `privilege_code_idx` (`code`),
  CONSTRAINT `privilege_MKB_10_code_fk` FOREIGN KEY (`MKB_10_code`) REFERENCES `MKB_10` (`code`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `privilege_vol_of_med_care_id_fk` FOREIGN KEY (`vol_of_med_care_id`) REFERENCES `volume_of_med_care` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES (513,NULL,'Бронхиальная астма (не инвалиды взрослые)','J45',7),(540,NULL,'Гипертензивная [гипертоническая] болезнь с преимущественным поражением почек (N 18)','I12',13),(540,NULL,'Гипертензивная [гипертоническая] болезнь с преимущественным поражением сердца и почек)','I13',14),(540,NULL,'Гипертензивная [гипертоническая] болезнь с преимущественным поражением сердца)','I11',12),(84,2030000,'дети-инвалиды',NULL,5),(83,2010003,'инвалид I группы',NULL,4),(82,2010002,'инвалид II группы',NULL,3),(81,2010001,'инвалид III группы',NULL,2),(10,2000000,'инвалид войны',NULL,1),(84,2040000,'инвалид с детства',NULL,6),(516,NULL,'Острый инфаркт миокарда','I21',8),(516,NULL,'Повторный инфаркт миокарда','I22',9),(541,NULL,'Рассеянный склероз','G35',10),(538,NULL,'Состояние после операции по протезированию клапанов сердца','Z95.2',15),(540,NULL,'Эссенциальная [первичная] гипертензия (АГ 1, 2, 3 степени)','I10',11);
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege_drug`
--

DROP TABLE IF EXISTS `privilege_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privilege_drug` (
  `drug_id` int unsigned NOT NULL,
  `privilege_code` smallint unsigned NOT NULL,
  PRIMARY KEY (`drug_id`,`privilege_code`),
  KEY `privilege_drug_privilege_code_fk` (`privilege_code`),
  CONSTRAINT `privilege_drug_drug_id_fk` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `privilege_drug_privilege_code_fk` FOREIGN KEY (`privilege_code`) REFERENCES `privilege` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege_drug`
--

LOCK TABLES `privilege_drug` WRITE;
/*!40000 ALTER TABLE `privilege_drug` DISABLE KEYS */;
INSERT INTO `privilege_drug` VALUES (4,516),(5,516),(1,540),(2,540),(4,540),(5,540),(6,540),(8,540),(12,540);
/*!40000 ALTER TABLE `privilege_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `case_history` int unsigned NOT NULL,
  `photo_patient_id` int unsigned DEFAULT NULL,
  `republic` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `village` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `house` varchar(20) DEFAULT NULL,
  `flat` varchar(20) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `study_place` varchar(200) DEFAULT NULL,
  `study_address` varchar(500) DEFAULT NULL,
  `work_place` varchar(200) DEFAULT NULL,
  `work_address` varchar(500) DEFAULT NULL,
  `relatives_info` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`case_history`),
  UNIQUE KEY `case_history` (`case_history`),
  UNIQUE KEY `photo_patient_id` (`photo_patient_id`),
  CONSTRAINT `profile_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `profile_photo_patient_id_fk` FOREIGN KEY (`photo_patient_id`) REFERENCES `photo_patient` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,1,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(2,2,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(3,3,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(4,4,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(5,5,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(6,6,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(7,7,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(8,8,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(9,9,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(10,10,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(11,11,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(12,12,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(13,13,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(14,14,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(15,15,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(16,16,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(17,17,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(18,18,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(19,19,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(20,20,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(21,21,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(22,22,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(23,23,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(24,24,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(25,25,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(26,26,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(27,27,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(28,28,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(29,29,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(30,30,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(31,31,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(32,32,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(33,33,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(34,34,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(35,35,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(36,36,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(37,37,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(38,38,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(39,39,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(40,40,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(41,41,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(42,42,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(43,43,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(44,44,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(45,45,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(46,46,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(47,47,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(48,48,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(49,49,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(50,50,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(51,51,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(52,52,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(53,53,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(54,54,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(55,55,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(56,56,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(57,57,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(58,58,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(59,59,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(60,60,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(61,61,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(62,62,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(63,63,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(64,64,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(65,65,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(66,66,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(67,67,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(68,68,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(69,69,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(70,70,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(71,71,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(72,72,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(73,73,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(74,74,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(75,75,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(76,76,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(77,77,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(78,78,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(79,79,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(80,80,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(81,81,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(82,82,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(83,83,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(84,84,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(85,85,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(86,86,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(87,87,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(88,88,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(89,89,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(90,90,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(91,91,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(92,92,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(93,93,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(94,94,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(95,95,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(96,96,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(97,97,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(98,98,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(99,99,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …'),(100,100,NULL,NULL,'Москва',NULL,'Достоевского','5A','23','инженер',NULL,NULL,'ООО \"Лидер\"','Москва','Контакты родственников …');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rg_diagnostic`
--

DROP TABLE IF EXISTS `rg_diagnostic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rg_diagnostic` (
  `case_history` int unsigned NOT NULL,
  `rg_diagnostic_id` smallint unsigned NOT NULL,
  `doctor_assigner_id` int unsigned NOT NULL,
  `date_assigned` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `doctor_executor_id` int unsigned DEFAULT NULL,
  `date_executed` datetime DEFAULT NULL,
  `result_link` varchar(500) DEFAULT NULL,
  `norma` enum('norm','abnorm','undefined') DEFAULT NULL,
  PRIMARY KEY (`case_history`,`rg_diagnostic_id`,`date_assigned`),
  KEY `rg_diagnostic_rg_diagnostic_id_fk` (`rg_diagnostic_id`),
  KEY `rg_diagnostic_doctor_assigner_id_fk` (`doctor_assigner_id`),
  KEY `rg_diagnostic_doctor_executor_id_fk` (`doctor_executor_id`),
  KEY `rg_diagnostic_case_history_rg_diagnostic_id_idx` (`case_history`,`rg_diagnostic_id`),
  CONSTRAINT `rg_diagnostic_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rg_diagnostic_doctor_assigner_id_fk` FOREIGN KEY (`doctor_assigner_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `rg_diagnostic_doctor_executor_id_fk` FOREIGN KEY (`doctor_executor_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `rg_diagnostic_rg_diagnostic_id_fk` FOREIGN KEY (`rg_diagnostic_id`) REFERENCES `rg_diagnostic_name` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rg_diagnostic`
--

LOCK TABLES `rg_diagnostic` WRITE;
/*!40000 ALTER TABLE `rg_diagnostic` DISABLE KEYS */;
INSERT INTO `rg_diagnostic` VALUES (11,1,17,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','abnorm'),(13,1,11,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','norm'),(19,1,17,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','norm'),(27,2,19,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','abnorm'),(40,1,16,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','norm'),(41,2,18,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','abnorm'),(42,2,2,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','abnorm'),(43,1,16,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','norm'),(45,2,2,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','abnorm'),(55,6,25,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','abnorm'),(63,2,18,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','abnorm'),(66,6,24,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','abnorm'),(77,6,5,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','abnorm'),(90,2,19,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','abnorm'),(99,1,1,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','norm'),(99,2,2,'2020-02-09 22:58:35',12,'2020-02-10 22:58:35','Результат: …','abnorm');
/*!40000 ALTER TABLE `rg_diagnostic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rg_diagnostic_name`
--

DROP TABLE IF EXISTS `rg_diagnostic_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rg_diagnostic_name` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rg_diagnostic_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rg_diagnostic_name`
--

LOCK TABLES `rg_diagnostic_name` WRITE;
/*!40000 ALTER TABLE `rg_diagnostic_name` DISABLE KEYS */;
INSERT INTO `rg_diagnostic_name` VALUES (6,'abdominal computed tomography'),(8,'angiography'),(1,'chest x-ray'),(7,'computed tomography of the brain'),(2,'coronarography'),(3,'irrigoscopy'),(4,'mammography'),(9,'salpingography'),(5,'urography'),(10,'x-ray of the sinuses');
/*!40000 ALTER TABLE `rg_diagnostic_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sick_list`
--

DROP TABLE IF EXISTS `sick_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sick_list` (
  `number` int unsigned NOT NULL,
  `case_history` int unsigned NOT NULL,
  `ogrn_id` bigint unsigned NOT NULL,
  `date_open` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_close` datetime DEFAULT NULL,
  `doctor_id_open` int unsigned NOT NULL,
  `doctor_id_close` int unsigned DEFAULT NULL,
  `continuation_number` int unsigned DEFAULT NULL,
  `cause_code` tinyint unsigned DEFAULT NULL,
  `cause_add_code` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`number`),
  UNIQUE KEY `number` (`number`),
  KEY `sick_list_ogrn_id_fk` (`ogrn_id`),
  KEY `sick_list_doctor_id_open_fk` (`doctor_id_open`),
  KEY `sick_list_doctor_id_close_fk` (`doctor_id_close`),
  KEY `sick_list_continuation_number_fk` (`continuation_number`),
  KEY `sick_list_case_history_idx` (`case_history`),
  CONSTRAINT `sick_list_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sick_list_continuation_number_fk` FOREIGN KEY (`continuation_number`) REFERENCES `sick_list` (`number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sick_list_doctor_id_close_fk` FOREIGN KEY (`doctor_id_close`) REFERENCES `medical_staff` (`id`),
  CONSTRAINT `sick_list_doctor_id_open_fk` FOREIGN KEY (`doctor_id_open`) REFERENCES `medical_staff` (`id`),
  CONSTRAINT `sick_list_ogrn_id_fk` FOREIGN KEY (`ogrn_id`) REFERENCES `medical_staff` (`ogrn_work_place`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sick_list`
--

LOCK TABLES `sick_list` WRITE;
/*!40000 ALTER TABLE `sick_list` DISABLE KEYS */;
INSERT INTO `sick_list` VALUES (123356789,2,1234567890123,'2019-06-19 09:06:19','2019-06-27 17:27:25',16,16,NULL,1,NULL),(123446789,3,1234567890123,'2018-12-02 11:06:19','2018-12-11 16:27:25',17,17,NULL,1,NULL),(123456789,1,1234567890123,'2017-02-10 10:27:25','2017-02-28 18:27:25',1,1,NULL,1,NULL);
/*!40000 ALTER TABLE `sick_list` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sick_list_del` BEFORE DELETE ON `sick_list` FOR EACH ROW BEGIN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DELETE NOT PERMITED';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialty` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (2,'cardiologist'),(11,'clinical diagnostics doctor'),(15,'endoscopic diagnostics doctor'),(13,'functional diagnostics doctor'),(1,'general practitioner'),(8,'gynecologist'),(6,'neurologist'),(3,'ophthalmologist'),(4,'otolaryngologist'),(7,'pediatrician'),(10,'resuscitator'),(12,'rg diagnostics doctor'),(5,'surgeon'),(14,'ultrasound diagnostic doctor'),(9,'urologist');
/*!40000 ALTER TABLE `specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_diagnostic`
--

DROP TABLE IF EXISTS `us_diagnostic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_diagnostic` (
  `case_history` int unsigned NOT NULL,
  `us_diagnostic_id` smallint unsigned NOT NULL,
  `doctor_assigner_id` int unsigned NOT NULL,
  `date_assigned` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `doctor_executor_id` int unsigned DEFAULT NULL,
  `date_executed` datetime DEFAULT NULL,
  `result_link` varchar(500) DEFAULT NULL,
  `norma` enum('norm','abnorm','undefined') DEFAULT NULL,
  PRIMARY KEY (`case_history`,`us_diagnostic_id`,`date_assigned`),
  KEY `us_diagnostic_us_diagnostic_id_fk` (`us_diagnostic_id`),
  KEY `us_diagnostic_doctor_assigner_id_fk` (`doctor_assigner_id`),
  KEY `us_diagnostic_doctor_executor_id_fk` (`doctor_executor_id`),
  KEY `us_diagnostic_case_history_us_diagnostic_id_idx` (`case_history`,`us_diagnostic_id`),
  CONSTRAINT `us_diagnostic_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `us_diagnostic_doctor_assigner_id_fk` FOREIGN KEY (`doctor_assigner_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `us_diagnostic_doctor_executor_id_fk` FOREIGN KEY (`doctor_executor_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `us_diagnostic_us_diagnostic_id_fk` FOREIGN KEY (`us_diagnostic_id`) REFERENCES `us_diagnostic_name` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_diagnostic`
--

LOCK TABLES `us_diagnostic` WRITE;
/*!40000 ALTER TABLE `us_diagnostic` DISABLE KEYS */;
INSERT INTO `us_diagnostic` VALUES (11,7,17,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','abnorm'),(13,1,11,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','norm'),(19,6,17,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','norm'),(27,1,19,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','abnorm'),(27,2,19,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','abnorm'),(40,2,16,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','abnorm'),(41,7,18,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','abnorm'),(42,6,2,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','abnorm'),(43,1,16,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','norm'),(45,1,2,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','abnorm'),(55,7,25,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','abnorm'),(63,2,18,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','abnorm'),(66,6,24,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','norm'),(77,2,5,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','norm'),(90,7,19,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','abnorm'),(99,6,2,'2020-02-09 22:58:35',14,'2020-02-10 22:58:35','Результат: …','abnorm');
/*!40000 ALTER TABLE `us_diagnostic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us_diagnostic_name`
--

DROP TABLE IF EXISTS `us_diagnostic_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us_diagnostic_name` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `us_diagnostic_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us_diagnostic_name`
--

LOCK TABLES `us_diagnostic_name` WRITE;
/*!40000 ALTER TABLE `us_diagnostic_name` DISABLE KEYS */;
INSERT INTO `us_diagnostic_name` VALUES (9,'brain ultrasound'),(5,'pelvic ultrasound'),(1,'thyroid ultrasound'),(8,'ultrasound during pregnancy'),(2,'ultrasound of the abdominal cavity'),(4,'ultrasound of the kidneys'),(10,'ultrasound of the mammary glands'),(3,'ultrasound of the retroperitoneal space'),(7,'ultrasound of the vessels of the legs'),(6,'ultrasound of the vessels of the neck');
/*!40000 ALTER TABLE `us_diagnostic_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_gp`
--

DROP TABLE IF EXISTS `visit_gp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_gp` (
  `case_history` int unsigned NOT NULL,
  `doctor_id` int unsigned NOT NULL,
  `date_visit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `general_status` enum('satisfactory condition','moderate condition','serious condition','extremely serious condition','terminal state','clinical death') NOT NULL,
  `inspection_link` varchar(500) DEFAULT NULL,
  `diagnosis_full` varchar(5000) DEFAULT NULL,
  `diagnosis_1_MKB_10_code` varchar(15) NOT NULL,
  `diagnosis_2_MKB_10_code` varchar(15) DEFAULT NULL,
  `diagnosis_3_MKB_10_code` varchar(15) DEFAULT NULL,
  `diet` varchar(500) DEFAULT NULL,
  `recommendation` varchar(500) DEFAULT NULL,
  `sick_list_number` int unsigned DEFAULT NULL,
  PRIMARY KEY (`case_history`,`date_visit`,`doctor_id`),
  KEY `visit_gp_MKB_10_code_1_fk` (`diagnosis_1_MKB_10_code`),
  KEY `visit_gp_MKB_10_code_2_fk` (`diagnosis_2_MKB_10_code`),
  KEY `visit_gp_MKB_10_code_3_fk` (`diagnosis_3_MKB_10_code`),
  KEY `visit_gp_doctor_id_fk` (`doctor_id`),
  KEY `visit_gp_case_history_doctor_id_idx` (`case_history`,`doctor_id`),
  CONSTRAINT `visit_gp_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `visit_gp_doctor_id_fk` FOREIGN KEY (`doctor_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `visit_gp_MKB_10_code_1_fk` FOREIGN KEY (`diagnosis_1_MKB_10_code`) REFERENCES `MKB_10` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `visit_gp_MKB_10_code_2_fk` FOREIGN KEY (`diagnosis_2_MKB_10_code`) REFERENCES `MKB_10` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `visit_gp_MKB_10_code_3_fk` FOREIGN KEY (`diagnosis_3_MKB_10_code`) REFERENCES `MKB_10` (`code`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_gp`
--

LOCK TABLES `visit_gp` WRITE;
/*!40000 ALTER TABLE `visit_gp` DISABLE KEYS */;
INSERT INTO `visit_gp` VALUES (1,1,'2020-02-09 23:00:16','satisfactory condition','000001.doc','Полный диагноз: ','J06',NULL,NULL,'Диета: …','Рекомендации: …',123456789),(2,16,'2020-02-09 23:00:16','satisfactory condition','000002.doc','Полный диагноз: ','J10',NULL,NULL,'Диета: …','Рекомендации: …',123356789),(3,17,'2020-02-09 23:00:16','satisfactory condition','000003.doc','Полный диагноз: ','J13',NULL,NULL,'Диета: …','Рекомендации: …',123446789),(11,17,'2020-02-09 23:00:16','satisfactory condition','000011.doc','Полный диагноз: ','Z00',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(13,1,'2020-02-09 23:00:16','satisfactory condition','000013.doc','Полный диагноз: ','Z10',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(15,16,'2020-02-09 23:00:16','satisfactory condition','000015.doc','Полный диагноз: ','J45',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(17,17,'2020-02-09 23:00:16','satisfactory condition','000017.doc','Полный диагноз: ','J06',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(19,17,'2020-02-09 23:00:16','satisfactory condition','000019.doc','Полный диагноз: ','J13',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(35,17,'2020-02-09 23:00:16','satisfactory condition','000035.doc','Полный диагноз: ','J06',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(36,1,'2020-02-09 23:00:16','satisfactory condition','000036.doc','Полный диагноз: ','J06',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(38,16,'2020-02-09 23:00:16','satisfactory condition','000038.doc','Полный диагноз: ','Z10',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(40,16,'2020-02-09 23:00:16','satisfactory condition','000040.doc','Полный диагноз: ','Z00',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(41,16,'2020-02-09 23:00:16','satisfactory condition','000041.doc','Полный диагноз: ','J41',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(42,17,'2020-02-09 23:00:16','satisfactory condition','000042.doc','Полный диагноз: ','J45',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(43,16,'2020-02-09 23:00:16','satisfactory condition','000043.doc','Полный диагноз: ','J13',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(44,17,'2020-02-09 23:00:16','satisfactory condition','000044.doc','Полный диагноз: ','J45',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(86,1,'2020-02-09 23:00:16','satisfactory condition','000086.doc','Полный диагноз: ','J06',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(91,16,'2020-02-09 23:00:16','satisfactory condition','000091.doc','Полный диагноз: ','J41',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(93,17,'2020-02-09 23:00:16','satisfactory condition','000093.doc','Полный диагноз: ','J06',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(99,1,'2020-02-09 23:00:16','satisfactory condition','000099.doc','Полный диагноз: ','J13',NULL,NULL,'Диета: …','Рекомендации: …',NULL);
/*!40000 ALTER TABLE `visit_gp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_specialty`
--

DROP TABLE IF EXISTS `visit_specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_specialty` (
  `case_history` int unsigned NOT NULL,
  `doctor_id` int unsigned NOT NULL,
  `date_visit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `general_status` enum('satisfactory condition','moderate condition','serious condition','extremely serious condition','terminal state','clinical death') NOT NULL,
  `inspection_link` varchar(500) DEFAULT NULL,
  `diagnosis_full` varchar(5000) DEFAULT NULL,
  `diagnosis_1_MKB_10_code` varchar(15) NOT NULL,
  `diagnosis_2_MKB_10_code` varchar(15) DEFAULT NULL,
  `diagnosis_3_MKB_10_code` varchar(15) DEFAULT NULL,
  `diet` varchar(500) DEFAULT NULL,
  `recommendation` varchar(500) DEFAULT NULL,
  `sick_list_number` int unsigned DEFAULT NULL,
  PRIMARY KEY (`case_history`,`date_visit`,`doctor_id`),
  KEY `visit_specialty_MKB_10_code_1_fk` (`diagnosis_1_MKB_10_code`),
  KEY `visit_specialty_MKB_10_code_2_fk` (`diagnosis_2_MKB_10_code`),
  KEY `visit_specialty_MKB_10_code_3_fk` (`diagnosis_3_MKB_10_code`),
  KEY `visit_specialty_doctor_id_fk` (`doctor_id`),
  KEY `visit_specialty_case_history_doctor_id_idx` (`case_history`,`doctor_id`),
  CONSTRAINT `visit_specialty_case_history_fk` FOREIGN KEY (`case_history`) REFERENCES `patient` (`case_history`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `visit_specialty_doctor_id_fk` FOREIGN KEY (`doctor_id`) REFERENCES `medical_staff` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `visit_specialty_MKB_10_code_1_fk` FOREIGN KEY (`diagnosis_1_MKB_10_code`) REFERENCES `MKB_10` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `visit_specialty_MKB_10_code_2_fk` FOREIGN KEY (`diagnosis_2_MKB_10_code`) REFERENCES `MKB_10` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `visit_specialty_MKB_10_code_3_fk` FOREIGN KEY (`diagnosis_3_MKB_10_code`) REFERENCES `MKB_10` (`code`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_specialty`
--

LOCK TABLES `visit_specialty` WRITE;
/*!40000 ALTER TABLE `visit_specialty` DISABLE KEYS */;
INSERT INTO `visit_specialty` VALUES (23,18,'2020-02-09 22:58:35','satisfactory condition','000023.doc','Полный диагноз: ','I21',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(24,19,'2020-02-09 22:58:35','satisfactory condition','000024.doc','Полный диагноз: ','I21',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(26,18,'2020-02-09 22:58:35','satisfactory condition','000026.doc','Полный диагноз: ','I21',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(27,19,'2020-02-09 22:58:35','satisfactory condition','000027.doc','Полный диагноз: ','I21',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(29,2,'2020-02-09 22:58:35','satisfactory condition','000029.doc','Полный диагноз: ','I21',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(31,2,'2020-02-09 22:58:35','satisfactory condition','000031.doc','Полный диагноз: ','Z95.2',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(33,18,'2020-02-09 22:58:35','satisfactory condition','000033.doc','Полный диагноз: ','I22',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(34,19,'2020-02-09 22:58:35','satisfactory condition','000034.doc','Полный диагноз: ','I22',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(36,19,'2020-02-09 22:58:35','satisfactory condition','000036.doc','Полный диагноз: ','Z95.2',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(37,2,'2020-02-09 22:58:35','satisfactory condition','000037.doc','Полный диагноз: ','I22',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(39,19,'2020-02-09 22:58:35','satisfactory condition','000039.doc','Полный диагноз: ','I22',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(41,18,'2020-02-09 22:58:35','satisfactory condition','000041.doc','Полный диагноз: ','I10',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(42,2,'2020-02-09 22:58:35','satisfactory condition','000042.doc','Полный диагноз: ','I11',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(45,2,'2020-02-09 22:58:35','satisfactory condition','000045.doc','Полный диагноз: ','I12',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(49,2,'2020-02-09 22:58:35','satisfactory condition','000049.doc','Полный диагноз: ','I13',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(51,2,'2020-02-09 22:58:35','satisfactory condition','000051.doc','Полный диагноз: ','I10',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(53,18,'2020-02-09 22:58:35','satisfactory condition','000053.doc','Полный диагноз: ','I11',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(55,25,'2020-02-09 22:58:35','satisfactory condition','000055.doc','Полный диагноз: ','K41',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(59,18,'2020-02-09 22:58:35','satisfactory condition','000059.doc','Полный диагноз: ','I12',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(63,18,'2020-02-09 22:58:35','satisfactory condition','000063.doc','Полный диагноз: ','I13',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(64,18,'2020-02-09 22:58:35','satisfactory condition','000064.doc','Полный диагноз: ','I21',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(66,18,'2020-02-09 22:58:35','satisfactory condition','000066.doc','Полный диагноз: ','I10',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(66,24,'2020-02-09 22:58:35','satisfactory condition','000066.doc','Полный диагноз: ','K40',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(67,19,'2020-02-09 22:58:35','satisfactory condition','000067.doc','Полный диагноз: ','I21',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(69,2,'2020-02-09 22:58:35','satisfactory condition','000069.doc','Полный диагноз: ','I21',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(73,18,'2020-02-09 22:58:35','satisfactory condition','000073.doc','Полный диагноз: ','I22',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(74,2,'2020-02-09 22:58:35','satisfactory condition','000074.doc','Полный диагноз: ','I22',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(76,18,'2020-02-09 22:58:35','satisfactory condition','000076.doc','Полный диагноз: ','I22',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(77,5,'2020-02-09 22:58:35','satisfactory condition','000077.doc','Полный диагноз: ','K35',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(77,19,'2020-02-09 22:58:35','satisfactory condition','000077.doc','Полный диагноз: ','I22',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(79,2,'2020-02-09 22:58:35','satisfactory condition','000079.doc','Полный диагноз: ','I22',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(81,19,'2020-02-09 22:58:35','satisfactory condition','000081.doc','Полный диагноз: ','I11',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(83,19,'2020-02-09 22:58:35','satisfactory condition','000083.doc','Полный диагноз: ','I12',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(84,18,'2020-02-09 22:58:35','satisfactory condition','000084.doc','Полный диагноз: ','I21',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(85,19,'2020-02-09 22:58:35','satisfactory condition','000085.doc','Полный диагноз: ','I13',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(86,6,'2020-02-09 22:58:35','satisfactory condition','000086.doc','Полный диагноз: ','G35',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(89,19,'2020-02-09 22:58:35','satisfactory condition','000089.doc','Полный диагноз: ','I21',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(90,19,'2020-02-09 22:58:35','satisfactory condition','000090.doc','Полный диагноз: ','I10',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(91,27,'2020-02-09 22:58:35','satisfactory condition','000091.doc','Полный диагноз: ','G35',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(93,2,'2020-02-09 22:58:35','satisfactory condition','000093.doc','Полный диагноз: ','I22',NULL,NULL,'Диета: …','Рекомендации: …',NULL),(99,2,'2020-02-09 22:58:35','satisfactory condition','000099.doc','Полный диагноз: ','I21',NULL,NULL,'Диета: …','Рекомендации: …',NULL);
/*!40000 ALTER TABLE `visit_specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_of_med_care`
--

DROP TABLE IF EXISTS `volume_of_med_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volume_of_med_care` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `vol_of_med_care` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_of_med_care`
--

LOCK TABLES `volume_of_med_care` WRITE;
/*!40000 ALTER TABLE `volume_of_med_care` DISABLE KEYS */;
INSERT INTO `volume_of_med_care` VALUES (1,'Информация…'),(2,'Информация…'),(3,'Информация…'),(4,'Информация…'),(5,'Информация…'),(6,'Информация…'),(7,'Информация…'),(8,'Информация…'),(9,'Информация…'),(10,'Информация…'),(11,'Информация…'),(12,'Информация…'),(13,'Информация…'),(14,'Информация…'),(15,'Информация…');
/*!40000 ALTER TABLE `volume_of_med_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `dispansery_MKB_code`
--

/*!50001 DROP VIEW IF EXISTS `dispansery_MKB_code`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dispansery_MKB_code` AS select `d`.`case_history` AS `case_history`,`d`.`MKB_10_code` AS `MKB_10_code`,`s`.`name` AS `specialty` from (`dispansery_observation` `d` join `specialty` `s`) where (`s`.`id` = `d`.`specialty_id`) order by `s`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dispansery_MKB_illness`
--

/*!50001 DROP VIEW IF EXISTS `dispansery_MKB_illness`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dispansery_MKB_illness` AS select `d`.`case_history` AS `case_history`,`m`.`illness` AS `illness`,`s`.`name` AS `specialty` from ((`dispansery_observation` `d` join `MKB_10` `m`) join `specialty` `s`) where ((`s`.`id` = `d`.`specialty_id`) and (`m`.`code` = `d`.`MKB_10_code`)) order by `s`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `med_staff_specialty`
--

/*!50001 DROP VIEW IF EXISTS `med_staff_specialty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `med_staff_specialty` AS select `m`.`surname` AS `surname`,`m`.`name` AS `name`,`m`.`patronym` AS `patronym`,`s`.`name` AS `specialty` from (`medical_staff` `m` join `specialty` `s`) where (`s`.`id` = `m`.`specialty_id`) order by `s`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `med_staff_surname`
--

/*!50001 DROP VIEW IF EXISTS `med_staff_surname`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `med_staff_surname` AS select `m`.`surname` AS `surname`,`m`.`name` AS `name`,`m`.`patronym` AS `patronym`,`s`.`name` AS `specialty` from (`medical_staff` `m` join `specialty` `s`) where (`s`.`id` = `m`.`specialty_id`) order by `m`.`surname` */;
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

-- Dump completed on 2020-02-11 22:20:51
