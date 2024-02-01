CREATE DATABASE  IF NOT EXISTS `ispp01up02` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ispp01up02`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: prserver    Database: ispp01up02
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(200) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Общестроительные материалы'),(2,'Стеновые и фасадные материалы'),(3,'Сухие строительные смеси и гидроизоляция'),(4,'Ручной инструмент'),(5,'Защита лица, глаз, головы');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `CityID` int NOT NULL AUTO_INCREMENT,
  `CityName` text NOT NULL,
  PRIMARY KEY (`CityID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'г. Сыктывкар');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `ManufacturerID` int NOT NULL AUTO_INCREMENT,
  `ManufacturerName` varchar(110) NOT NULL,
  `ManufacturerINN` varchar(45) NOT NULL,
  `ManufacturerRating` tinyint NOT NULL DEFAULT '0',
  `ManufacturerDealStartDate` date NOT NULL,
  `ManufacturerTypeID` int NOT NULL,
  PRIMARY KEY (`ManufacturerID`),
  KEY `fk_Manufacturer_ManufacturerType1_idx` (`ManufacturerTypeID`),
  CONSTRAINT `fk_Manufacturer_ManufacturerType1` FOREIGN KEY (`ManufacturerTypeID`) REFERENCES `manufacturertype` (`ManufacturerTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'Cиб','1949139718',89,'2010-10-26',2),(2,'CибCибОрио','1988313615',1,'2019-02-22',3),(3,'Асбоцем','1944834477',23,'2012-09-07',5),(4,'Асбоцемент','1650212184',32,'2018-12-08',5),(5,'ВодРыб','1113468466',38,'2016-09-20',4),(6,'ВостокМети','1488487851',51,'2019-04-08',3),(7,'ГаражГазМ','1740623312',99,'2017-10-07',2),(8,'ГаражГлав','1404774111',1,'2014-11-20',1),(9,'ГаражТелекомГор','1718185951',18,'2018-11-26',1),(10,'ГаражХозФлот','2164720385',19,'2019-01-03',2),(11,'ГлавАвтоГазТрест','2059691335',28,'2013-07-17',5),(12,'ГлавРыб','1426268088',59,'2013-12-07',5),(13,'ГорМонтаж','1564667734',39,'2013-07-10',3),(14,'ЖелДорГаз','1255275062',25,'2017-09-07',5),(15,'ИнфоГазМотор','1954050214',92,'2011-02-10',2),(16,'Казань','1965011544',77,'2017-04-21',2),(17,'Компания Во','2027005945',23,'2014-04-08',6),(18,'Компания К','1468114280',54,'2014-08-09',6),(19,'Компания КазаньАвтоCиб','1371692583',72,'2010-04-16',1),(20,'Компания МорМетал','1947163072',93,'2010-02-25',3),(21,'Компания Мотор','1429908355',85,'2010-09-16',3),(22,'Компания НефтьITИнф','1685247455',56,'2014-09-26',3),(23,'Компания Омск','1878504395',49,'2012-05-10',2),(24,'Компания СервисМикроО','1178826599',27,'2013-04-14',3),(25,'Микро','2293562756',25,'2014-07-15',1),(26,'МобайлДизайнОмск','1014490629',99,'2011-05-10',3),(27,'Монтаж','1163880101',66,'2019-06-01',2),(28,'Мор','1906157177',38,'2010-10-14',1),(29,'МорФинансФинансМаш','1549496316',50,'2016-04-15',3),(30,'Мотор','1019917089',59,'2017-09-09',6),(31,'МоторКаз','1076279398',37,'2015-08-27',2),(32,'МясКрепТеле','2152486844',78,'2013-03-17',6),(33,'РыбВектор','2275526397',72,'2010-11-25',2),(34,'СеверТехВостокЛизинг','1846812080',34,'2010-12-26',3),(35,'Сервис','2031832854',5,'2014-03-11',2),(36,'Софт','1036521658',84,'2017-10-13',1),(37,'ТверьБухГаз','2167673760',54,'2014-03-26',2),(38,'Теле','2170198203',96,'2010-04-13',6),(39,'ТелекомТранс','2200735978',87,'2019-02-17',2),(40,'ТелеРыбХм','2299034130',51,'2019-02-21',3),(41,'ТомскНефть','1002996016',44,'2010-01-13',3),(42,'ТомскТяжРеч','1102143492',59,'2010-09-11',5),(43,'ТяжКазаньБашкир','1794419510',55,'2016-06-01',6),(44,'ТяжЛифтВостокС','1032089879',70,'2018-03-01',2),(45,'УралСервисМон','1892306757',77,'2015-04-22',1),(46,'УралХме','2291253256',40,'2010-06-15',3),(47,'ЦементОбл','2021607106',46,'2012-11-14',3),(48,'Электро','1755853973',43,'2012-05-14',4),(49,'ЭлектроХром','1654184411',13,'2014-08-17',2),(50,'ЮпитерТомс','1551173338',11,'2010-06-05',6);
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturertype`
--

DROP TABLE IF EXISTS `manufacturertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturertype` (
  `ManufacturerTypeID` int NOT NULL AUTO_INCREMENT,
  `ManufacturerTypeName` varchar(10) NOT NULL,
  PRIMARY KEY (`ManufacturerTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturertype`
--

LOCK TABLES `manufacturertype` WRITE;
/*!40000 ALTER TABLE `manufacturertype` DISABLE KEYS */;
INSERT INTO `manufacturertype` VALUES (1,' МКК'),(2,' ОАО'),(3,' ООО'),(4,' ЗАО'),(5,' МФО'),(6,' ПАО');
/*!40000 ALTER TABLE `manufacturertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `MaterialID` int NOT NULL AUTO_INCREMENT,
  `MaterialName` varchar(100) NOT NULL,
  `MaterialImagePath` varchar(150) DEFAULT NULL,
  `MaterialPrice` int NOT NULL,
  `MaterialQuantityInStock` int NOT NULL,
  `MaterialMinCount` int NOT NULL,
  `MaterialCountInPack` int NOT NULL,
  `MaterialTypeID` int NOT NULL,
  `MeasureTypeID` int NOT NULL,
  PRIMARY KEY (`MaterialID`),
  KEY `fk_material_materialtype1_idx` (`MaterialTypeID`),
  KEY `fk_material_measuretype1_idx` (`MeasureTypeID`),
  CONSTRAINT `fk_material_materialtype1` FOREIGN KEY (`MaterialTypeID`) REFERENCES `materialtype` (`MaterialTypeID`),
  CONSTRAINT `fk_material_measuretype1` FOREIGN KEY (`MeasureTypeID`) REFERENCES `measuretype` (`MeasureTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'Краска 0x0',NULL,35754,318,28,8,1,1),(2,'Краска 0x1',NULL,13666,228,14,7,1,1),(3,'Краска 0x2',NULL,20629,235,15,9,1,1),(4,'Краска 0x3',NULL,8487,646,5,2,1,2),(5,'Краска 0x4','\\materials\\material_7.jpeg',31475,3,45,10,1,2),(6,'Краска 0x5',NULL,36762,559,50,7,1,1),(7,'Краска 1x0','\\materials\\material_18.jpeg',51511,12,49,5,1,2),(8,'Краска 1x1','\\materials\\material_11.jpeg',19485,281,20,2,1,1),(9,'Краска 1x2',NULL,48813,801,28,9,1,1),(10,'Краска 1x3',NULL,46354,91,50,6,1,1),(11,'Краска 1x4',NULL,52716,576,7,9,1,2),(12,'Краска 2x0','\\materials\\material_1.jpeg',28464,595,27,3,1,1),(13,'Краска 2x1','\\materials\\material_2.jpeg',48799,2,5,4,1,1),(14,'Краска 2x2','\\materials\\material_21.jpeg',45084,787,16,2,1,1),(15,'Краска 2x24','\\materials\\material_22.jpeg',26008,797,23,2,1,2),(16,'Краска 2x28',NULL,9273,916,42,4,1,1),(17,'Краска 2x29',NULL,37812,465,30,7,1,2),(18,'Краска 2x3','\\materials\\material_16.jpeg',24447,414,33,8,1,1),(19,'Краска 2x31',NULL,32610,771,14,1,1,2),(20,'Краска 2x4','\\materials\\material_6.jpeg',35636,761,49,10,1,1),(21,'Краска 2x5',NULL,29855,542,32,9,1,2),(22,'Краска 3x0',NULL,41707,921,20,7,1,1),(23,'Краска 3x1',NULL,10299,729,21,3,1,2),(24,'Краска 3x13',NULL,41211,851,6,3,1,1),(25,'Краска 3x14','\\materials\\material_8.jpeg',38060,34,13,5,1,1),(26,'Краска 3x18','\\materials\\material_10.jpeg',20504,128,5,10,1,1),(27,'Краска 3x2',NULL,44456,922,35,10,1,1),(28,'Краска 3x27',NULL,14606,568,37,3,1,2),(29,'Краска 3x31',NULL,30698,365,32,3,1,1),(30,'Краска 3x35',NULL,6825,479,31,4,1,2),(31,'Краска 3x4',NULL,21211,83,41,5,1,1),(32,'Краска 4x0','\\materials\\material_9.jpeg',55038,713,22,9,1,1),(33,'Краска 4x04',NULL,54177,657,25,9,1,2),(34,'Краска 4x3',NULL,42215,218,27,2,1,1),(35,'Краска 5x0',NULL,43028,844,24,10,1,1),(36,'Резина 0x0',NULL,18283,897,20,8,2,2),(37,'Резина 0x1',NULL,24135,986,18,3,2,3),(38,'Резина 0x10',NULL,47481,354,22,3,2,2),(39,'Резина 0x12','\\materials\\material_4.jpeg',14110,380,13,1,2,2),(40,'Резина 0x13',NULL,54301,376,48,6,2,2),(41,'Резина 0x2',NULL,46929,577,38,9,2,2),(42,'Резина 0x3',NULL,11310,340,16,6,2,3),(43,'Резина 0x30',NULL,21180,143,48,1,2,3),(44,'Резина 0x37',NULL,33541,764,26,9,2,3),(45,'Резина 0x65',NULL,9263,133,34,1,2,3),(46,'Резина 0x78',NULL,38768,593,48,3,2,2),(47,'Резина 11x0',NULL,39297,402,17,5,2,3),(48,'Резина 1x0',NULL,469,459,22,10,2,3),(49,'Резина 1x1',NULL,8906,244,43,2,2,3),(50,'Резина 1x14',NULL,17063,7,9,5,2,3),(51,'Резина 1x3','\\materials\\material_15.jpeg',8334,77,44,3,2,3),(52,'Резина 1x32',NULL,36799,709,45,9,2,3),(53,'Резина 1x37',NULL,1053,110,47,8,2,2),(54,'Резина 1x5',NULL,42602,481,11,2,2,3),(55,'Резина 1x9',NULL,10774,587,48,10,2,3),(56,'Резина 2x0',NULL,46084,129,11,3,2,3),(57,'Резина 2x1','\\materials\\material_13.jpeg',36226,886,7,10,2,3),(58,'Резина 2x2',NULL,44820,851,7,3,2,3),(59,'Резина 2x27',NULL,47429,434,32,6,2,3),(60,'Резина 2x3',NULL,52328,50,11,9,2,3),(61,'Резина 2x35',NULL,30798,271,13,7,2,3),(62,'Резина 3x1',NULL,24002,713,27,6,2,3),(63,'Резина 3x2',NULL,12723,131,31,4,2,3),(64,'Резина 3x22',NULL,27626,672,14,6,2,2),(65,'Резина 3x23',NULL,23578,167,45,7,2,2),(66,'Резина 3x25',NULL,9652,199,5,6,2,3),(67,'Резина 3x28',NULL,54007,395,43,8,2,2),(68,'Резина 3x3',NULL,42751,727,46,8,2,2),(69,'Резина 3x34',NULL,42162,218,47,4,2,3),(70,'Резина 3x37',NULL,18158,870,43,10,2,3),(71,'Резина 3x38','\\materials\\material_17.jpeg',11039,892,9,10,2,3),(72,'Силикон 0x0',NULL,17974,929,37,5,3,2),(73,'Силикон 0x1',NULL,29767,401,9,3,3,2),(74,'Силикон 0x11',NULL,34946,465,11,9,3,3),(75,'Силикон 0x12',NULL,5588,610,12,6,3,2),(76,'Силикон 0x18',NULL,15243,631,8,2,3,2),(77,'Силикон 0x2',NULL,9098,669,43,2,3,3),(78,'Силикон 0x23',NULL,9412,753,10,9,3,3),(79,'Силикон 0x28',NULL,43526,144,34,8,3,3),(80,'Силикон 0x3',NULL,4589,117,21,1,3,3),(81,'Силикон 1x1',NULL,10649,110,10,1,3,2),(82,'Силикон 1x2','\\materials\\material_19.jpeg',24120,469,50,7,3,2),(83,'Силикон 1x22',NULL,31182,649,48,7,3,3),(84,'Силикон 1x27',NULL,6286,950,14,8,3,2),(85,'Силикон 2x1',NULL,19352,461,13,6,3,3),(86,'Силикон 2x13',NULL,19429,423,5,3,3,3),(87,'Силикон 2x17',NULL,12158,409,16,1,3,2),(88,'Силикон 2x2','\\materials\\material_3.jpeg',42856,46,42,8,3,3),(89,'Силикон 3x0','\\materials\\material_5.jpeg',23681,901,48,9,3,2),(90,'Силикон 3x1','\\materials\\material_12.jpeg',33602,16,17,9,3,3),(91,'Силикон 3x14',NULL,38935,324,19,7,3,3),(92,'Силикон 3x15','\\materials\\material_14.jpeg',40057,856,17,7,3,2),(93,'Силикон 3x18',NULL,40196,978,24,5,3,3),(94,'Силикон 3x2','\\materials\\material_20.jpeg',55673,863,32,8,3,2),(95,'Силикон 3x28',NULL,37171,92,47,7,3,3),(96,'Силикон 3x3',NULL,2870,870,6,10,3,3),(97,'Силикон 3x33',NULL,54740,687,45,7,3,3),(98,'Силикон 3x35',NULL,3326,610,32,2,3,3),(99,'Силикон 3x37',NULL,489,680,41,9,3,2),(100,'Силикон 3x39',NULL,31438,858,8,9,3,3);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialmanufacturer`
--

DROP TABLE IF EXISTS `materialmanufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materialmanufacturer` (
  `MaterialID` int NOT NULL,
  `ManufacturerID` int NOT NULL,
  PRIMARY KEY (`MaterialID`,`ManufacturerID`),
  KEY `fk_material_has_manufacturer_manufacturer1_idx` (`ManufacturerID`),
  KEY `fk_material_has_manufacturer_material1_idx` (`MaterialID`),
  CONSTRAINT `fk_material_has_manufacturer_manufacturer1` FOREIGN KEY (`ManufacturerID`) REFERENCES `manufacturer` (`ManufacturerID`),
  CONSTRAINT `fk_material_has_manufacturer_material1` FOREIGN KEY (`MaterialID`) REFERENCES `material` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialmanufacturer`
--

LOCK TABLES `materialmanufacturer` WRITE;
/*!40000 ALTER TABLE `materialmanufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `materialmanufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialtype`
--

DROP TABLE IF EXISTS `materialtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materialtype` (
  `MaterialTypeID` int NOT NULL AUTO_INCREMENT,
  `MaterialTypeName` varchar(45) NOT NULL,
  PRIMARY KEY (`MaterialTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialtype`
--

LOCK TABLES `materialtype` WRITE;
/*!40000 ALTER TABLE `materialtype` DISABLE KEYS */;
INSERT INTO `materialtype` VALUES (1,'Краска'),(2,'Резина'),(3,'Силикон');
/*!40000 ALTER TABLE `materialtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measuretype`
--

DROP TABLE IF EXISTS `measuretype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measuretype` (
  `MeasureTypeID` int NOT NULL AUTO_INCREMENT,
  `MeasureTypeName` varchar(45) NOT NULL,
  PRIMARY KEY (`MeasureTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measuretype`
--

LOCK TABLES `measuretype` WRITE;
/*!40000 ALTER TABLE `measuretype` DISABLE KEYS */;
INSERT INTO `measuretype` VALUES (1,'л'),(2,'кг'),(3,'м'),(4,'шт.');
/*!40000 ALTER TABLE `measuretype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderCreateDate` date NOT NULL,
  `OrderDeliveryDate` date NOT NULL,
  `OrderReceiveCode` varchar(10) NOT NULL,
  `PickupPointID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `OrderStatusID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_order_pickuppoint1_idx` (`PickupPointID`),
  KEY `fk_order_user1_idx` (`UserID`),
  KEY `fk_order_orderstatus1_idx` (`OrderStatusID`),
  CONSTRAINT `fk_order_orderstatus1` FOREIGN KEY (`OrderStatusID`) REFERENCES `orderstatus` (`OrderStatusID`),
  CONSTRAINT `fk_order_pickuppoint1` FOREIGN KEY (`PickupPointID`) REFERENCES `pickuppoint` (`PickupPointID`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2022-05-15','2022-05-21','701',18,NULL,2),(2,'2022-05-16','2022-05-22','702',14,NULL,1),(3,'2022-05-17','2022-05-23','703',22,7,2),(4,'2022-05-17','2022-05-23','704',22,NULL,1),(5,'2022-05-19','2022-05-25','705',26,8,2),(6,'2022-05-20','2022-05-26','706',28,NULL,1),(7,'2022-05-22','2022-05-28','707',28,2,2),(8,'2022-05-22','2022-05-28','708',32,NULL,1),(9,'2022-05-23','2022-05-29','709',36,NULL,2),(10,'2022-05-24','2022-05-30','710',36,4,2);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordercomposion`
--

DROP TABLE IF EXISTS `ordercomposion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordercomposion` (
  `ProductArticleNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OrderID` int NOT NULL,
  `ProductCount` int NOT NULL,
  PRIMARY KEY (`ProductArticleNumber`,`OrderID`),
  KEY `fk_product_has_order_order1_idx` (`OrderID`),
  KEY `fk_product_has_order_product1_idx` (`ProductArticleNumber`),
  CONSTRAINT `fk_product_has_order_order1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  CONSTRAINT `fk_product_has_order_product1` FOREIGN KEY (`ProductArticleNumber`) REFERENCES `product` (`ProductArticleNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordercomposion`
--

LOCK TABLES `ordercomposion` WRITE;
/*!40000 ALTER TABLE `ordercomposion` DISABLE KEYS */;
INSERT INTO `ordercomposion` VALUES ('2G3280',4,40),('3L7RCZ',3,17),('3XBOTN',3,13),('4JR1HN',9,10),('4WZEOT',9,10),('ASPXSG',8,40),('BPV4MM',1,2),('EQ6RKO',10,1),('F895RB',2,15),('JVL42J',2,15),('K0YACK',8,40),('LPDDM4',6,20),('LQ48MW',6,20),('M26EXW',7,50),('MIO8YV',4,100),('O43COU',7,50),('PMEZMH',1,2),('QHNOKR',10,1),('UER2QD',5,100),('ZR70B4',5,100);
/*!40000 ALTER TABLE `ordercomposion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `OrderStatusID` int NOT NULL AUTO_INCREMENT,
  `OrderStatusName` varchar(45) NOT NULL DEFAULT 'Новый',
  PRIMARY KEY (`OrderStatusID`),
  UNIQUE KEY `OrderStatusName_UNIQUE` (`OrderStatusName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (2,'Завершен'),(1,'Новый');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickuppoint`
--

DROP TABLE IF EXISTS `pickuppoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickuppoint` (
  `PickupPointID` int NOT NULL AUTO_INCREMENT,
  `PuckupPointIndex` text NOT NULL,
  `PickupPointStreet` text NOT NULL,
  `PickupPointBuilding` varchar(10) DEFAULT NULL,
  `CityID` int NOT NULL,
  PRIMARY KEY (`PickupPointID`),
  KEY `fk_pickuppoint_city1_idx` (`CityID`),
  CONSTRAINT `fk_pickuppoint_city1` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickuppoint`
--

LOCK TABLES `pickuppoint` WRITE;
/*!40000 ALTER TABLE `pickuppoint` DISABLE KEYS */;
INSERT INTO `pickuppoint` VALUES (1,'344288',' ул. Чехова',' 1',1),(2,'614164','  ул. Степная',' 30',1),(3,'394242',' ул. Коммунистическая',' 43',1),(4,'660540',' ул. Солнечная',' 25',1),(5,'125837',' ул. Шоссейная',' 40',1),(6,'125703',' ул. Партизанская',' 49',1),(7,'625283',' ул. Победы',' 46',1),(8,'614611',' ул. Молодежная',' 50',1),(9,'454311',' ул. Новая',' 19',1),(10,'660007',' ул. Октябрьская',' 19',1),(11,'603036',' ул. Садовая',' 4',1),(12,'450983',' ул. Комсомольская',' 26',1),(13,'394782',' ул. Чехова',' 3',1),(14,'603002',' ул. Дзержинского',' 28',1),(15,'450558',' ул. Набережная',' 30',1),(16,'394060',' ул. Фрунзе',' 43',1),(17,'410661',' ул. Школьная',' 50',1),(18,'625590',' ул. Коммунистическая',' 20',1),(19,'625683',' ул. 8 Марта',NULL,1),(20,'400562',' ул. Зеленая',' 32',1),(21,'614510',' ул. Маяковского',' 47',1),(22,'410542',' ул. Светлая',' 46',1),(23,'620839',' ул. Цветочная',' 8',1),(24,'443890',' ул. Коммунистическая',' 1',1),(25,'603379',' ул. Спортивная',' 46',1),(26,'603721',' ул. Гоголя',' 41',1),(27,'410172',' ул. Северная',' 13',1),(28,'420151',' ул. Вишневая',' 32',1),(29,'125061',' ул. Подгорная',' 8',1),(30,'630370',' ул. Шоссейная',' 24',1),(31,'614753',' ул. Полевая',' 35',1),(32,'426030',' ул. Маяковского',' 44',1),(33,'450375',' ул. Клубная',' 44',1),(34,'625560',' ул. Некрасова',' 12',1),(35,'630201',' ул. Комсомольская',' 17',1),(36,'190949',' ул. Мичурина',' 26',1);
/*!40000 ALTER TABLE `pickuppoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductArticleNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProductName` text NOT NULL,
  `ProductDescription` text NOT NULL,
  `ProductPhoto` varchar(100) DEFAULT NULL,
  `ProductPrice` int NOT NULL,
  `ProductMaxDiscount` tinyint NOT NULL,
  `ProductDiscount` tinyint DEFAULT NULL,
  `ProductQuantityInStock` int NOT NULL,
  `ProviderID` int NOT NULL,
  `ManufacturerID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `MeasureTypeID` int NOT NULL,
  PRIMARY KEY (`ProductArticleNumber`),
  KEY `fk_product_measuretype1_idx` (`MeasureTypeID`),
  KEY `fk_product_provider1_idx` (`ProviderID`),
  KEY `fk_product_provider2_idx` (`ManufacturerID`),
  KEY `fk_product_category1_idx` (`CategoryID`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  CONSTRAINT `fk_product_measuretype1` FOREIGN KEY (`MeasureTypeID`) REFERENCES `measuretype` (`MeasureTypeID`),
  CONSTRAINT `fk_product_provider1` FOREIGN KEY (`ProviderID`) REFERENCES `provider` (`ProviderID`),
  CONSTRAINT `fk_product_provider2` FOREIGN KEY (`ManufacturerID`) REFERENCES `provider` (`ProviderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('0YGHZ7','Очки защитные ','Очки защитные Husqvarna Clear (5449638-01) открытые с прозрачными линзами',NULL,700,9,9,36,30,30,5,4),('2G3280','Угол наружный','Угол наружный Vinylon 3050 мм серо-голубой','2G3280.jpg',795,16,9,20,6,6,2,4),('3L7RCZ','Газобетон','Газобетон ЛСР 100х250х625 мм D400','3L7RCZ.jpg',7400,7,2,20,6,6,2,4),('3XBOTN','Керамзит фракция','Керамзит фракция 10-20 мм 0,05 куб.м','3XBOTN.jpg',110,14,5,21,5,5,1,4),('4JR1HN','Шпатель','Шпатель малярный 100 мм с пластиковой ручкой',NULL,26,3,6,7,20,20,4,4),('4WZEOT','Лезвие для ножа ','Лезвие для ножа Armero 18 мм прямое (10 шт.)',NULL,110,2,6,17,19,19,4,4),('61PGH3','Очки защитные','Очки защитные Delta Plus KILIMANDJARO (KILIMGRIN) открытые с прозрачными линзами',NULL,184,2,6,25,24,24,5,4),('81F1WG','Каска защитная','Каска защитная Delta Plus BASEBALL DIAMOND V UP (DIAM5UPBCFLBS) белая',NULL,1500,1,2,13,29,29,5,4),('83M5ME','Кисть','Кисть плоская смешанная щетина 100х12 мм для красок и антисептиков на водной основе',NULL,122,16,9,26,23,23,4,4),('ASPXSG','Ровнитель','Ровнитель (наливной пол) финишный Weber.vetonit 4100 самовыравнивающийся высокопрочный 20 кг',NULL,711,17,10,20,17,17,3,4),('BPV4MM','Пленка техническая','Пленка техническая полиэтиленовая Изостронг 60 мк 3 м рукав 1,5 м, пог.м','BPV4MM.jpg',8,13,8,2,2,2,1,4),('EQ6RKO','Подшлемник','Подшлемник для каски одноразовый',NULL,36,17,3,22,28,28,5,4),('F895RB','Песок строительный','Песок строительный 50 кг','F895RB.jpg',102,17,6,7,4,4,1,4),('GN6ICZ','Каска защитная ','Каска защитная Исток (КАС001О) оранжевая',NULL,154,10,6,8,25,25,5,4),('I6MH89','Валик','Валик Wenzo Roma полиакрил 250 мм ворс 18 мм для красок грунтов и антисептиков на водной основе с рукояткой',NULL,326,12,6,3,25,25,4,4),('JVL42J','Пленка техническая','Пленка техническая полиэтиленовая Изостронг 100 мк 3 м рукав 1,5 м, пог.м','JVL42J.jpg',13,1,4,34,3,3,1,4),('K0YACK','Смесь цементно-песчаная','Смесь цементно-песчаная (ЦПС) 300 по ТУ MixMaster Универсал 25 кг',NULL,160,9,8,19,16,16,3,4),('LPDDM4','Штукатурка гипсовая','Штукатурка гипсовая Knauf Ротбанд 30 кг',NULL,500,17,6,38,11,11,3,4),('LQ48MW','Штукатурка гипсовая','Штукатурка гипсовая Knauf МП-75 машинная 30 кг',NULL,462,16,6,33,13,13,3,4),('M26EXW','Клей для плитки, керамогранита и камня','Клей для плитки, керамогранита и камня Крепс Усиленный серый (класс С1) 25 кг',NULL,340,8,8,2,15,15,3,4),('MIO8YV','Кирпич','Кирпич рядовой Боровичи полнотелый М150 250х120х65 мм 1NF','MIO8YV.jpg',30,9,9,31,9,9,2,4),('O43COU','Шпаклевка','Шпаклевка полимерная Weber.vetonit LR + для сухих помещений белая 20 кг',NULL,750,9,1,16,14,14,3,4),('PMEZMH','Цемент','Цемент Евроцемент М500 Д0 ЦЕМ I 42,5 50 кг','PMEZMH.jpg',440,10,8,34,1,1,1,4),('QHNOKR','Маска защитная','Маска защитная Исток (ЩИТ001) ударопрочная и термостойкая',NULL,251,6,2,22,27,27,5,4),('S72AM3','Пазогребневая плита ','Пазогребневая плита ВОЛМА Гидро 667х500х80 мм полнотелая','S72AM3.jpg',500,9,5,35,6,6,2,4),('UER2QD','Скоба для пазогребневой плиты','Скоба для пазогребневой плиты Knauf С1 120х100 мм','UER2QD.jpg',25,20,8,27,10,10,2,4),('Z3LO0U','Очки защитные ','Очки защитные Delta Plus RUIZ (RUIZ1VI) закрытые с прозрачными линзами',NULL,228,19,9,11,26,26,5,4),('Z3XFSP','Нож строительный ','Нож строительный Hesler 18 мм с ломающимся лезвием пластиковый корпус',NULL,63,19,8,5,21,21,4,4),('ZKQ5FF','Лезвие для ножа ','Лезвие для ножа Hesler 18 мм прямое (10 шт.)',NULL,65,13,6,6,17,17,4,4),('ZR70B4','Кирпич','Кирпич рядовой силикатный Павловский завод полнотелый М200 250х120х65 мм 1NF',NULL,16,3,3,26,11,11,2,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `ProviderID` int NOT NULL AUTO_INCREMENT,
  `ProviderName` varchar(45) NOT NULL,
  PRIMARY KEY (`ProviderID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'Cиб'),(2,'CибCибОрио'),(3,'Асбоцем'),(4,'Асбоцемент'),(5,'ВодРыб'),(6,'ВостокМети'),(7,'ГаражГазМ'),(8,'ГаражГлав'),(9,'ГаражТелекомГор'),(10,'ГаражХозФлот'),(11,'ГлавАвтоГазТрест'),(12,'ГлавРыб'),(13,'ГорМонтаж'),(14,'ЖелДорГаз'),(15,'ИнфоГазМотор'),(16,'Казань'),(17,'Компания Во'),(18,'Компания К'),(19,'Компания КазаньАвтоCиб'),(20,'Компания МорМетал'),(21,'Компания Мотор'),(22,'Компания НефтьITИнф'),(23,'Компания Омск'),(24,'Компания СервисМикроО'),(25,'Микро'),(26,'МобайлДизайнОмск'),(27,'Монтаж'),(28,'Мор'),(29,'МорФинансФинансМаш'),(30,'Мотор'),(31,'МоторКаз'),(32,'МясКрепТеле'),(33,'РыбВектор'),(34,'СеверТехВостокЛизинг'),(35,'Сервис'),(36,'Софт'),(37,'ТверьБухГаз'),(38,'Теле'),(39,'ТелекомТранс'),(40,'ТелеРыбХм'),(41,'ТомскНефть'),(42,'ТомскТяжРеч'),(43,'ТяжКазаньБашкир'),(44,'ТяжЛифтВостокС'),(45,'УралСервисМон'),(46,'УралХме'),(47,'ЦементОбл'),(48,'Электро'),(49,'ЭлектроХром'),(50,'ЮпитерТомс');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(100) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Администратор'),(2,'Менеджер'),(3,'Клиент');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserSurname` varchar(100) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `UserPatronymic` varchar(100) NOT NULL,
  `UserLogin` text NOT NULL,
  `UserPassword` text NOT NULL,
  `RoleID` int NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `UserRole` (`RoleID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Аксенова','Ульяна','Ивановна','hsqixl2vebuz@mail.com','YOyhfR',2),(2,'Андреева','Полина','Артёмовна','4o72gufv3xlz@tutanota.com','JlFRCZ',3),(3,'Басова','Амина','Кирилловна','klh7pi4rcbtz@gmail.com','2L6KZG',1),(4,'Васильева','Василиса','Фёдоровна','01zji3wfuq7h@outlook.com','LdNyos',3),(5,'Васильева','Камила','Ивановна','towkse0hf26b@outlook.com','RSbvHv',2),(6,'Ильин','Артём','Родионович','khx0ncdwz4uj@gmail.com','rwVDh9',2),(7,'Кириллова','Николь','Святославовна','wt9q8i6ypx47@outlook.com','AtnDjr',3),(8,'Кудрявцева','Василиса','Матвеевна','am65k18q7bwp@mail.com','gynQMT',3),(9,'Михайлов','Андрей','Денисович','gn0354mbiork@outlook.com','uzWC67',1),(10,'Сидоров','Егор','Александрович','1o4l05k8dwpv@yahoo.com','8ntwUp',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ispp01up02'
--

--
-- Dumping routines for database 'ispp01up02'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 12:01:34
