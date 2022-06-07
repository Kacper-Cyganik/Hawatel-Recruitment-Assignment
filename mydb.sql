-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.21.10.2

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `AddressID` varchar(8) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `Address_Type` varchar(20) NOT NULL,
  `AddressLine1` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Province` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `PostalCode` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES ('AD123','US2348','WORK','987 business avenue','Vancouver','British Columbia','Canada','G6H 7S9'),('AD146','US2784','BILLING','972 long road','Dawson Creek','Calgary','Canada','D7B S3H'),('AD276','US2498','HOME','11 rodeo blvd','Saskatoon','Saskatchewan','Canada','J7C 2X7'),('AD432','US2123','BILLING','129 shore street','Sherbrooke','Quebec','Canada','H3S B7S'),('AD552','US2498','SHIPPING','10873 butterfly street','Gotham','Saskatchewan','Canada','D7C 1D6'),('AD7982','US2895','HOME','876 apple drive','Montreal','Quebec','Canada','H7D 9S3'),('AD873','US2435','SHIPPING','397 hustle drive','Kahnawake','Quebec','Canada','F7B 2D8');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Buyers`
--

DROP TABLE IF EXISTS `Buyers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Buyers` (
  `BuyerID` varchar(8) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `USER_TYPE` varchar(1) NOT NULL,
  `MembershipID` varchar(8) DEFAULT NULL,
  `FName` varchar(45) NOT NULL,
  `LName` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) NOT NULL DEFAULT 'xxx-xxx-xxxx',
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`UserID`,`USER_TYPE`),
  CONSTRAINT `Buyers_chk_1` CHECK ((`USER_TYPE` = _utf8mb4'B'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Buyers`
--

LOCK TABLES `Buyers` WRITE;
/*!40000 ALTER TABLE `Buyers` DISABLE KEYS */;
INSERT INTO `Buyers` VALUES ('B3656','US2098','B',NULL,'Sean','Romero','519-556-9422','sean.rom@other.com'),('B3465','US2123','B','M1458','Georges','Bienvenu','555-098-7638','gbienvenu@email.com'),('B3680','US2213','B','M1178','Ginette','Beauregard','514-098-8334','beauregard.ginette@other.com'),('B3326','US2348','B','M1318','Nancy','Book','555-868-8379','booknancy@other.com'),('B3342','US2435','B',NULL,'Daniel','Dam','074-515-5458','ddam@email.com'),('B3432','US2456','B','M1968','Elise','Fort','919-887-0965','elise.f@email.com'),('B3442','US2498','B',NULL,'Yung','Xi','250-753-0094','xi.yung@email.com'),('B3765','US2654','B','M1867','Taylor','Swing','012-3370697','swing@email.com'),('B3998','US2784','B','M1957','Red','Forman','972-670-3345','redismad@email.com'),('B3568','US2874','B','M1568','Jack','Smith','676-876-0094','js@email.com'),('B3235','US2895','B','M1642','Sarah','Mansour','037-146-2742','sarahsarah@other.com');
/*!40000 ALTER TABLE `Buyers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `DepartmentID` varchar(8) NOT NULL,
  `DepName` varchar(45) NOT NULL,
  `ContactFName` text NOT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('D1145','Fashion','Corinne Levis'),('D1173','Home','Sarah Lola'),('D1178','Electronics','John Doe'),('D1183','Beauty','France Dupuis'),('D1567','Books','Michael Grant');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Discount`
--

DROP TABLE IF EXISTS `Discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Discount` (
  `DiscountID` varchar(8) NOT NULL,
  `DiscountPrecent` decimal(5,2) NOT NULL,
  PRIMARY KEY (`DiscountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discount`
--

LOCK TABLES `Discount` WRITE;
/*!40000 ALTER TABLE `Discount` DISABLE KEYS */;
INSERT INTO `Discount` VALUES ('DSCT10',0.10),('DSCT25',0.25),('DSCT50',0.50);
/*!40000 ALTER TABLE `Discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Membership`
--

DROP TABLE IF EXISTS `Membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Membership` (
  `MembershipID` varchar(8) NOT NULL,
  `MembershipType` varchar(45) NOT NULL,
  PRIMARY KEY (`MembershipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Membership`
--

LOCK TABLES `Membership` WRITE;
/*!40000 ALTER TABLE `Membership` DISABLE KEYS */;
INSERT INTO `Membership` VALUES ('M1178','PREMIUM'),('M1298','PREMIUM'),('M1318','STUDENT'),('M1322','STUDENT'),('M1458','STUDENT'),('M1499','PREMIUM'),('M1568','BUSINESS'),('M1642','PREMIUM'),('M1867','STUDENT'),('M1884','PREMIUM'),('M1957','OLD AGE'),('M1968','STUDENT');
/*!40000 ALTER TABLE `Membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Offer`
--

DROP TABLE IF EXISTS `Offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Offer` (
  `OfferID` varchar(8) NOT NULL,
  `ProductID` varchar(8) DEFAULT NULL,
  `DiscountID` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`OfferID`),
  KEY `fk_Product_has_Discount_Discount1_idx` (`DiscountID`),
  KEY `fk_Product_has_Discount_Product1_idx` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offer`
--

LOCK TABLES `Offer` WRITE;
/*!40000 ALTER TABLE `Offer` DISABLE KEYS */;
INSERT INTO `Offer` VALUES ('O101','PR8796','DSCT10'),('O102','PR8765','DSCT25'),('O103','PR8786','DSCT50');
/*!40000 ALTER TABLE `Offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` varchar(8) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `ShipperID` varchar(8) NOT NULL,
  `OrderDate` date NOT NULL,
  `RequiredDate` date NOT NULL,
  `Freight` decimal(10,0) NOT NULL,
  `SalesTax` decimal(10,0) NOT NULL,
  `TimeStamp` timestamp NOT NULL,
  `TransactStatus` varchar(25) NOT NULL,
  `InvoiceAmount` int NOT NULL,
  `PaymentDate` date NOT NULL,
  `ItemQuantity` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID_idx` (`UserID`),
  KEY `ShipperID_idx` (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES ('OR6018','US2654','SH17648','2017-06-27','2017-07-05',13,6,'2017-02-26 15:30:36','complete',59,'2017-06-27',2),('OR6091','US2435','SH17626','2017-06-26','2017-07-05',4,5,'2017-02-27 15:30:35','complete',90,'2017-06-26',3),('OR6182','US2124','SH17648','2017-02-22','2017-03-06',25,25,'2017-02-26 15:30:33','complete',326,'2017-02-27',4),('OR6534','US2123','SH17648','2017-02-22','2017-03-04',0,4,'2017-02-26 15:30:31','complete',36,'2017-02-27',2),('OR6676','US2498','SH17526','2017-02-24','2017-03-05',25,25,'2017-02-26 15:30:32','complete',235,'2017-02-27',1),('OR6906','US2098','SH17648','2017-06-28','2017-07-05',21,11,'2017-02-27 15:30:37','complete',124,'2017-06-28',6),('OR6986','US2895','SH17526','2017-06-25','2017-07-05',99,6,'2017-02-27 15:30:34','complete',746,'2017-06-27',1);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders_has_Product`
--

DROP TABLE IF EXISTS `Orders_has_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders_has_Product` (
  `OrderProductID` varchar(8) NOT NULL,
  `Orders_OrderID` varchar(8) NOT NULL,
  `Product_ProductID` varchar(8) NOT NULL,
  PRIMARY KEY (`OrderProductID`),
  KEY `fk_Orders_has_Product_Product1_idx` (`Product_ProductID`),
  KEY `fk_Orders_has_Product_Orders1_idx` (`Orders_OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders_has_Product`
--

LOCK TABLES `Orders_has_Product` WRITE;
/*!40000 ALTER TABLE `Orders_has_Product` DISABLE KEYS */;
INSERT INTO `Orders_has_Product` VALUES ('OP1234','OR6091','PR4298'),('OP2394','OR6534','PR4394'),('OP2589','OR6182','PR4192'),('OP6723','OR6534','PR4789'),('OP9999','OR6018','PR4689');
/*!40000 ALTER TABLE `Orders_has_Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `PaymentID` varchar(8) NOT NULL,
  `OrderID` varchar(8) NOT NULL,
  `Payment_Type` varchar(1) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `OrderID_idx` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES ('P7332','OR6906','C'),('P7565','OR6986','C'),('P7768','OR6676','C'),('P7836','OR6534','G'),('P7853','OR6018','C'),('P7864','OR6182','A'),('P7865','OR6091','C');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment_CreditCard`
--

DROP TABLE IF EXISTS `Payment_CreditCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment_CreditCard` (
  `CreditCardID` varchar(8) NOT NULL,
  `PaymentID` varchar(8) NOT NULL,
  `CreditCardNum` varchar(20) NOT NULL,
  `CardExpM` int NOT NULL,
  `CardExpY` int NOT NULL,
  `CardSecurityNumber` varchar(45) NOT NULL,
  `CardAddress` varchar(45) NOT NULL,
  `CardCity` varchar(45) NOT NULL,
  `CardPostalCode` varchar(45) NOT NULL,
  PRIMARY KEY (`CreditCardID`),
  KEY `PaymentID_idx` (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment_CreditCard`
--

LOCK TABLES `Payment_CreditCard` WRITE;
/*!40000 ALTER TABLE `Payment_CreditCard` DISABLE KEYS */;
INSERT INTO `Payment_CreditCard` VALUES ('CC4586','P7565','4510655885838439',9,2019,'238','123 TREE STREET','SPRINGFIELD','S7F 2V8'),('CC4791','P7768','4510934832848328',10,2018,'345','876 RUE BEAUBIEN','MONTREAL','H7F 6V2'),('CC4897','P7853','5590649276962332',3,2020,'456','387 PAPINEAU DRIVE','VANCOUVER','D8V 0D2'),('CC5434','P7865','5590778844927402',3,2022,'866','143 OAKLAND ROAD','QUEBEC','F7B 3V9'),('CC5967','P7332','8930384039459342',6,2018,'285','5119 ARCHER BLVD','MEMPHIS','G9V 2B7');
/*!40000 ALTER TABLE `Payment_CreditCard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment_Giftcard`
--

DROP TABLE IF EXISTS `Payment_Giftcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment_Giftcard` (
  `GiftcardID` varchar(8) NOT NULL,
  `PaymentID` varchar(8) NOT NULL,
  `GiftCardNumber` char(16) NOT NULL,
  `GiftcardExpMM` char(2) NOT NULL,
  `GiftcardExpYYYY` varchar(4) NOT NULL,
  PRIMARY KEY (`GiftcardID`),
  KEY `PaymentID_idx` (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment_Giftcard`
--

LOCK TABLES `Payment_Giftcard` WRITE;
/*!40000 ALTER TABLE `Payment_Giftcard` DISABLE KEYS */;
INSERT INTO `Payment_Giftcard` VALUES ('G764','P7836','4556 8598 9698','12','2020');
/*!40000 ALTER TABLE `Payment_Giftcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ProductID` varchar(8) NOT NULL,
  `DepartmentID` varchar(8) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `IDSKU` varchar(8) NOT NULL,
  `ProductName` varchar(45) NOT NULL,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(10,0) NOT NULL,
  `Ranking` int DEFAULT NULL,
  `ProductDesc` text,
  `UnitsInStock` int DEFAULT NULL,
  `UnitsInOrder` int DEFAULT NULL,
  `Picture` blob,
  `UnitPriceUSD` decimal(10,0) NOT NULL DEFAULT '1',
  `UnitPriceEuro` decimal(10,0) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('PR4192','D1183','Makeup','SKU9763','Maybelline New York Super Stay',1,10,88,'Matte ink lip color',438,300,_binary 'maybellinenylip.jpg',43,46),('PR4298','D1183','Beauty appliances','SKU76G2','T3 Featherweight',1,247,5,'Hair dryer with 2 speed settings, 3 heat settings and a 2-year warranty',87,20,_binary 'T3hairdryerwhite.png',1060,1133),('PR4394','D1145','Sneakers','SKU8723','Under Armour Micro G running shoes',1,67,12,'Black running shoes with rubber sole & breathable mesh',566,66,_binary 'underarmourblack.jpg',288,307),('PR4467','D1178','Adaptor','SKUGNXW','Poweradd power converter',1,30,701,'2-outlet universal travel adapter',5000,20,_binary 'poweraddconverter.png',129,138),('PR4689','D1145','Jewelery','SKU7263','10k Rose Gold plated white Gold Diamond ring',1,538,83766,'0.75cttw, I-J Color, I2-I3 Clarity',30,4,_binary 'diamondring.png',2310,2467),('PR4769','D1178','Tablet','SKU6789','Kindle Paperwhite',1,140,767,'Tablet with 6\" high-resolution display with builtin light',3987,200,_binary 'kindle.jpg',601,642),('PR4789','D1178','Laptop','SKUB00V','ASUS Chromebook C201',1,270,18,'11.6 inch latop, navy blue',4534,445,_binary 'asuschromebook.png',1159,1238);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviews` (
  `ReviewID` varchar(8) NOT NULL,
  `ProductID` varchar(8) NOT NULL,
  `CustomerReview` varchar(45) DEFAULT NULL,
  `Rating` tinyint(1) NOT NULL,
  PRIMARY KEY (`ReviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES ('R419','PR4192','Great opacity. Very matte.',4),('R429','PR4467','hated it. went to get reimursed',2),('R439','PR4394','Glad this shoe fit as well as it does.',4),('R468','PR4689','I love the engagement ring!',5),('R517','PR4769','Great product.',3);
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sellers`
--

DROP TABLE IF EXISTS `Sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sellers` (
  `SellerID` varchar(8) NOT NULL,
  `UserID` varchar(8) NOT NULL,
  `USER_TYPE` varchar(1) NOT NULL,
  `CompanyName` varchar(45) NOT NULL,
  `ContactFName` varchar(45) NOT NULL,
  `ContactLName` varchar(45) NOT NULL,
  `ContactPosition` varchar(45) NOT NULL,
  `Phone` varchar(15) NOT NULL DEFAULT 'xxx-xxx-xxxx',
  `Email` varchar(45) NOT NULL,
  `Logo` blob,
  PRIMARY KEY (`UserID`,`USER_TYPE`),
  KEY `UserID_idx` (`UserID`),
  CONSTRAINT `Sellers_chk_1` CHECK ((`USER_TYPE` = _utf8mb3'B'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sellers`
--

LOCK TABLES `Sellers` WRITE;
/*!40000 ALTER TABLE `Sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipper`
--

DROP TABLE IF EXISTS `Shipper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shipper` (
  `ShipperID` varchar(8) NOT NULL,
  `ShipperName` varchar(45) DEFAULT NULL,
  `ContactName` varchar(45) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`),
  UNIQUE KEY `ShipperID_UNIQUE` (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipper`
--

LOCK TABLES `Shipper` WRITE;
/*!40000 ALTER TABLE `Shipper` DISABLE KEYS */;
INSERT INTO `Shipper` VALUES ('SH1752','Frank shipments Inc.','Rosie Chianti','332-431-3452'),('SH1762','Worldwide Delivery Service','Paola Ricardo','242-241-2423'),('SH1764','Ship for Cheap','Ronald McDime','555-634-2342');
/*!40000 ALTER TABLE `Shipper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shopping Cart`
--

DROP TABLE IF EXISTS `Shopping Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shopping Cart` (
  `ShoppingCartID` varchar(8) NOT NULL,
  `ProductID` varchar(8) NOT NULL,
  `OrderStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ShoppingCartID`),
  KEY `ProductID_idx` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shopping Cart`
--

LOCK TABLES `Shopping Cart` WRITE;
/*!40000 ALTER TABLE `Shopping Cart` DISABLE KEYS */;
INSERT INTO `Shopping Cart` VALUES ('SC7099','PR7786','CONFIRMED'),('SC7100','PR4769','SAVED'),('SC7656','PR7786','PENDING'),('SC7680','PR4769','PENDING'),('SC7786','PR7680','CONFIRMED');
/*!40000 ALTER TABLE `Shopping Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `UserID` varchar(8) NOT NULL,
  `UserFName` varchar(45) NOT NULL,
  `UserLName` varchar(45) NOT NULL,
  `USER_TYPE` varchar(1) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `DateCreated` date NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('US2098','Sean','Romero','B','OUVO8V','2003-02-16'),('US2123','Georges','Bienvenu','B','LKGCKF','2016-03-21'),('US2124','Georges','Bienvenu','B','YVUOT7D','2009-11-28'),('US2193','Sell','Junk','S','pyg8p7','2013-02-18'),('US2213','Ginette','Beauregard','B','KGHCY','2012-03-02'),('US2348','Nancy','Book','B','LHSBDJ','2000-12-12'),('US2435','Daniel','Dam','B','8IVYIGV','2016-12-13'),('US2456','Elise','Fort','B','QOWUDHC','2004-02-24'),('US2498','Yung','Xi','B','Y8VP8VY','2010-10-10'),('US2654','Taylor','Swing','B','8YVIKV','2017-01-26'),('US2784','Red','Forman','B','97VIYGV','2003-12-30'),('US2874','Jack','Smith','B','LKEHDJK','2011-08-02'),('US2895','Sarah','Mansour','B','P8YVUUG','2017-07-02'),('US6283','Fun','Shop','S','LWIEYFG','2003-03-24'),('US6381','Shop','Drop','S','P8EUBW','2015-09-15');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wishlist`
--

DROP TABLE IF EXISTS `Wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Wishlist` (
  `WishlistID` varchar(8) NOT NULL,
  `ProductID` varchar(8) NOT NULL,
  PRIMARY KEY (`WishlistID`),
  KEY `ProductID_idx` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wishlist`
--

LOCK TABLES `Wishlist` WRITE;
/*!40000 ALTER TABLE `Wishlist` DISABLE KEYS */;
INSERT INTO `Wishlist` VALUES ('W832','PR4467'),('W602','PR4769'),('W652','PR4789');
/*!40000 ALTER TABLE `Wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-07 19:26:00
