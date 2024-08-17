-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: asset_hub_db
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `asset_assetcat`
--

DROP TABLE IF EXISTS `asset_assetcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_assetcat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `desc` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_assetcat`
--

LOCK TABLES `asset_assetcat` WRITE;
/*!40000 ALTER TABLE `asset_assetcat` DISABLE KEYS */;
INSERT INTO `asset_assetcat` VALUES (1,'Computing Devices','Desktops, Monitor, Laptops, Servers, Workstations'),(2,'Peripherals','Keyboards, Mouse, Printers'),(3,'Audio Devices','Headphones, Speakers, Microphones, Amplifiers'),(4,'Networking Equipment','Routers, Switches, Access, Points, Modems'),(5,'Power Management','UPS, Batteries'),(6,'Surveillance and Security','CCTV Cameras, Essl Systems');
/*!40000 ALTER TABLE `asset_assetcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_assetname`
--

DROP TABLE IF EXISTS `asset_assetname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_assetname` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `desc` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_assetname`
--

LOCK TABLES `asset_assetname` WRITE;
/*!40000 ALTER TABLE `asset_assetname` DISABLE KEYS */;
INSERT INTO `asset_assetname` VALUES (1,'CPU',NULL),(2,'MONITOR',NULL),(3,'LAPTOP',NULL),(4,'KEYBOARD',NULL),(5,'MOUSE',NULL),(6,'HEADPHONE',NULL),(7,'CCTV',NULL),(8,'WEBCAMERA',NULL),(9,'SPEAKER',NULL),(10,'MICROPHONE',NULL),(11,'AMPLIFIER',NULL),(12,'UPS',NULL),(13,'BATTERY',NULL),(14,'SWITCHES',NULL),(15,'ROUTER',NULL);
/*!40000 ALTER TABLE `asset_assetname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_customuser`
--

DROP TABLE IF EXISTS `asset_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_customuser`
--

LOCK TABLES `asset_customuser` WRITE;
/*!40000 ALTER TABLE `asset_customuser` DISABLE KEYS */;
INSERT INTO `asset_customuser` VALUES (1,'pbkdf2_sha256$720000$pec79mdvqmaLaa1sGV8bY7$en5FzJL7Plkdn5DEdSXe6yv4wxixORbO7tLs51hGlxU=','2024-08-17 06:23:14.192841',1,'abspl188','','','karthick.t@aurabpo.com',1,1,'2024-08-12 14:46:22.069795',NULL);
/*!40000 ALTER TABLE `asset_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_customuser_groups`
--

DROP TABLE IF EXISTS `asset_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_customuser_groups_customuser_id_group_id_f02872d3_uniq` (`customuser_id`,`group_id`),
  KEY `asset_customuser_groups_group_id_4a6713df_fk_auth_group_id` (`group_id`),
  CONSTRAINT `asset_customuser_gro_customuser_id_34dbbb22_fk_asset_cus` FOREIGN KEY (`customuser_id`) REFERENCES `asset_customuser` (`id`),
  CONSTRAINT `asset_customuser_groups_group_id_4a6713df_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_customuser_groups`
--

LOCK TABLES `asset_customuser_groups` WRITE;
/*!40000 ALTER TABLE `asset_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_customuser_user_permissions`
--

DROP TABLE IF EXISTS `asset_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_customuser_user_pe_customuser_id_permission_5f27252b_uniq` (`customuser_id`,`permission_id`),
  KEY `asset_customuser_use_permission_id_174461f6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `asset_customuser_use_customuser_id_a04b7d3b_fk_asset_cus` FOREIGN KEY (`customuser_id`) REFERENCES `asset_customuser` (`id`),
  CONSTRAINT `asset_customuser_use_permission_id_174461f6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_customuser_user_permissions`
--

LOCK TABLES `asset_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `asset_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_dashboard`
--

DROP TABLE IF EXISTS `asset_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_dashboard` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_dashboard_title_id_aa030ab7` (`title_id`),
  CONSTRAINT `asset_dashboard_title_id_aa030ab7_fk_asset_assetname_id` FOREIGN KEY (`title_id`) REFERENCES `asset_assetname` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_dashboard`
--

LOCK TABLES `asset_dashboard` WRITE;
/*!40000 ALTER TABLE `asset_dashboard` DISABLE KEYS */;
INSERT INTO `asset_dashboard` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `asset_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_empdata`
--

DROP TABLE IF EXISTS `asset_empdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_empdata` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_empdata`
--

LOCK TABLES `asset_empdata` WRITE;
/*!40000 ALTER TABLE `asset_empdata` DISABLE KEYS */;
INSERT INTO `asset_empdata` VALUES (4,'ABSPL387','Aakash.K'),(5,'ABSPL370','Abbas Uddin.S'),(6,'ABSPL381','Abinaya.S'),(7,'ABSPL509','Ajay Raj.A'),(8,'ABSPL379','Ajith Kumar.G'),(9,'ABSPL234','Akshai.S'),(10,'ABSPL386','Akshaya.R'),(11,'ABSPL471','Anandan.M'),(12,'ABSPL298','Anandhi.S'),(13,'ABSPL266','Anita.G'),(14,'ABSPL400','Arsha.T'),(15,'ABSPL366','Arumugam.S'),(16,'ABSPL442','Arun Prabu.G.E'),(17,'ABSPL362','Arun.P'),(18,'ABSPL102','Arunkumar.A'),(19,'ABSPL063','Arunkumar.R'),(20,'ABSPL121','Arunkumar.V'),(21,'ABSPL282','Baalaa Srividha'),(22,'ABSPL407','Badma Priya.K'),(23,'ABSPL212','Bakiyalakshmi.A'),(24,'ABSPL505','Balaji.R'),(25,'ABSPL360','Bavani.K'),(26,'ABSPL350','Benziger.P.D'),(27,'ABSPL424','Bhagya Lakshmi.S'),(28,'ABSPL375','Bharani Kumar.A.G'),(29,'ABSPL503','Bharath.M'),(30,'ABSPL347','Bharathi.G'),(31,'ABSPL208','Bhavani.M'),(32,'ABSPL318','Bhavani.S'),(33,'ABSPL353','Brindha.B'),(34,'ABSPL452','Briyayohini.C'),(35,'ABSPL469','Dayana Mary.L'),(36,'ABSPL312','Deepak.K'),(37,'ABSPL310','Deepika.D'),(38,'ABSPL352','Deepika.K'),(39,'ABSPL373','Devipriya.J'),(40,'ABSPL249','Dhamodhran.P'),(41,'ABSPL458','Dhanasekari.K'),(42,'ABSPL463','Dhanus.S'),(43,'ABSPL492','Dharani.D'),(44,'ABSPL465','Dhivya Sharmila.K'),(45,'ABSPL194','Dhivya.A'),(46,'ABSPL451','Dinesh Kumar.B'),(47,'ABSPL385','Dinesh Kumar.R'),(48,'ABSPL416','Dinesh Kumar.V.M'),(49,'ABSPL496','Dinesh.M'),(50,'ABSPL417','Dinesh.P'),(51,'ABSPL468','Divakar.P'),(52,'ABSPL439','Divya.K'),(53,'ABSPL322','Divya.P'),(54,'ABSPL365','Elumalai.M'),(55,'ABSPL473','Elumalai.S'),(56,'ABSPL506','Franklin Benitto.L'),(57,'ABSPL516','Garki.N'),(58,'ABSPL164','Girija.G'),(59,'ABSPL277','Gobinath.B'),(60,'ABSPL139','Gopinath.D'),(61,'ABSPL014','Govindan.M'),(62,'ABSPL433','Hariharan.T.G'),(63,'ABSPL478','Harikaran Srinivasan'),(64,'ABSPL464','Hemalatha.R'),(65,'ABSPL257','Hemavathy.S'),(66,'ABSPL261','Hrithik Ram.J'),(67,'ABSPL481','Indhumugi Govindaraj'),(68,'ABSPL238','Irfan.K'),(69,'ABSPL224','Ishaque Ahamed'),(70,'ABSPL428','Jagadeesh.S'),(71,'ABSPL475','Janani Shankar'),(72,'ABSPL279','Janani.P'),(73,'ABSPL138','Jayalakshmi.K'),(74,'ABSPL445','Jayanthan.R.K'),(75,'ABSPL382','Jayanthi.R'),(76,'ABSPL410','Jayapal.S'),(77,'ABSPL202','Jayashree.C'),(78,'ABSPL227','Jayashree.P'),(79,'ABSPL515','Jeeva.J'),(80,'ABSPL412','Jeeva.M'),(81,'ABSPL499','Jeeva.S'),(82,'ABSPL297','Jeevitha.M'),(83,'ABSPL264','Jeya.G'),(84,'ABSPL432','Juliet Therasa.J'),(85,'ABSPL510','Kabilash.K'),(86,'ABSPL438','Kalaivani.K'),(87,'ABSPL397','Kalyani.N'),(88,'ABSPL474','Kanmani Thangamani'),(89,'ABSPL096','Karthick.G'),(90,'ABSPL374','Karthick.K'),(91,'ABSPL461','Karthick.S'),(92,'ABSPL188','Karthick.T'),(93,'ABSPL453','Karthik.R'),(94,'ABSPL497','Karthikeyan.K'),(95,'ABSPL326','Kaviya.N'),(96,'ABSPL324','Kaviya.R'),(97,'ABSPL304','Keerthana.S'),(98,'ABSPL489','Keerthika.K'),(99,'ABSPL485','Keerthika.P'),(100,'ABSPL467','Kiruthikka .S.P'),(101,'ABSPL434','Kishore.A'),(102,'ABSPL250','Kishore.R'),(103,'ABSPL394','Kishore.S'),(104,'ABSPL488','Kishore.S'),(105,'ABSPL357','Kokila.A'),(106,'ABSPL169','Kokila.N'),(107,'ABSPL454','Kumari.G'),(108,'ABSPL440','Lalith Kumar.D'),(109,'ABSPL193','Lavanya.M'),(110,'ABSPL306','Lavanya.V'),(111,'ABSPL331','Logeshawari.M'),(112,'ABSPL128','Madhavan.K'),(113,'ABSPL470','Mani.R'),(114,'ABSPL448','Manikandan.A'),(115,'ABSPL205','Meenakshi.R'),(116,'ABSPL305','Meiyarasi.N'),(117,'ABSPL431','Menaga.J'),(118,'ABSPL240','Mohammed sadain.Y'),(119,'ABSPL482','Mohanram Ramesh'),(120,'ABSPL206','Monica Celess.V'),(121,'ABSPL315','Monisha.M'),(122,'ABSPL152','Muthu.S'),(123,'ABSPL498','Mythili.A'),(124,'ABSPL403','Nalini.V'),(125,'ABSPL504','Nanda Kumar.V'),(126,'ABSPL435','Nandha Gopal.S'),(127,'ABSPL494','Nandhini.K'),(129,'ABSPL401','Nandhini.P'),(130,'ABSPL457','Naresh Amirthan.A'),(131,'ABSPL217','Nareshkumar.S'),(132,'ABSPL067','Naveen.A'),(133,'ABSPL447','Naveen.P'),(134,'ABSPL429','Naveen.T'),(135,'ABSPL502','Nishanth Kumar.M'),(136,'ABSPL363','Nivetha.V'),(137,'ABSPL031','Padmanabhan.B'),(138,'ABSPL285','Padmapriya.M'),(139,'ABSPL280','Pandiaraja.B'),(140,'ABSPL345','Panneer Selvam.V'),(141,'ABSPL413','Pavithra.J'),(142,'ABSPL450','Pavithra.N'),(143,'ABSPL443','Pavithra.r'),(144,'ABSPL361','Poornima.M'),(145,'ABSPL376','Prabhu.S.K'),(146,'ABSPL167','Prakash.D'),(147,'ABSPL316','Prakash.S'),(148,'ABSPL271','Pranobe Halder.D'),(149,'ABSPL508','Praveen Kumar.E'),(150,'ABSPL405','Praveena.V'),(151,'ABSPL281','Preethi.V'),(152,'ABSPL134','Prema.V'),(153,'ABSPL242','Premalatha.M'),(154,'ABSPL364','Priya.C'),(155,'ABSPL308','Priyadharshini.S'),(156,'ABSPL455','Purushotham.E.M'),(157,'ABSPL392','Raghu.V.S'),(158,'ABSPL418','Raghul.D'),(159,'ABSPL140','Ragupathi.S'),(160,'ABSPL486','Rahman Sharif.M'),(161,'ABSPL344','Rahul.D'),(162,'ABSPL262','Rahul.V'),(163,'ABSPL411','Rajesh.S'),(164,'ABSPL065','Rajkumar.M'),(165,'ABSPL446','Rakesh.R'),(166,'ABSPL399','Rakesh.V'),(167,'ABSPL368','Ramamoorthi.S'),(168,'ABSPL406','Ramya.K'),(169,'ABSPL384','Ramya.N'),(170,'ABSPL427','Rathinadevi.R'),(171,'ABSPL225','Ravi Kashyap'),(172,'ABSPL358','Reshma.G'),(173,'ABSPL383','Revathy.V'),(174,'ABSPL270','Ribaya Yasmin.S'),(175,'ABSPL320','Sambasivarao.T'),(176,'ABSPL178','Samson. AX'),(177,'ABSPL444','Sandhiya.G'),(178,'ABSPL359','Sandhiya.N.K'),(179,'ABSPL398','Sandhiya.S'),(180,'ABSPL466','Sangavi.K'),(181,'ABSPL263','Sangeetha.M'),(182,'ABSPL500','Sanjay.A'),(183,'ABSPL396','Sankar.M'),(184,'ABSPL154','Santhanam.S'),(185,'ABSPL477','Santhosh.C'),(186,'ABSPL338','Sarala.S'),(187,'ABSPL367','Saran.M'),(188,'ABSPL165','Saranya.R'),(189,'ABSPL255','SarojiniDevi.E'),(190,'ABSPL430','Sasikala.M'),(191,'ABSPL229','Sasireka.S'),(192,'ABSPL462','Sathish Kumar.M'),(193,'ABSPL456','Sathish.G'),(194,'ABSPL517','Sathishkumar.P'),(195,'ABSPL483','Sathya Ramesh'),(196,'ABSPL459','Sedhumathavan.A'),(197,'ABSPL501','Selvakumar.S '),(198,'ABSPL097','Selvamary.A'),(199,'ABSH002','Sevanthi'),(200,'ABSPL472','Shameem.U'),(201,'ABSPL332','Shanthini.V'),(202,'ABSPL335','Singaram.A.U'),(203,'ABSPL309','Sivakumar.B'),(204,'ABSPL388','Sivakumar.M'),(205,'ABSPL251','Sivapriya.K'),(206,'ABSPL155','Sivaranjani.A'),(207,'ABSPL514','Sivaranjani.P'),(208,'ABSPL027','Sivasankar.J'),(209,'ABSPL421','Sneha.S'),(210,'ABSPL513','Sornambigai.D'),(211,'ABSPL491','Soundarya.C'),(212,'ABSPL200','Sowmiya.S'),(213,'ABSPL395','Sridevi.D'),(214,'ABSPL118','Sridhar.B'),(215,'ABSPL075','Srikandan.M'),(216,'ABSPL307','Sripriya.R'),(217,'ABSPL006','Srivatsan.N'),(218,'ABSPL284','Subashini.V'),(219,'ABSPL192','Subashri.M'),(220,'ABSPL292','Subham Prasad.S'),(221,'ABSPL495','Subhashini.S'),(222,'ABSPL239','Subhasri.S'),(223,'ABSPL168','Suganthi.V'),(224,'ABSPL346','Sundar.R'),(225,'ABSPL476','Sunil Saravanan'),(226,'ABSPL422','Suresh.M'),(227,'ABSPL311','Suriya.G'),(228,'ABSPL437','Surya Kumar.J'),(229,'ABSPL419','Surya.M'),(230,'ABSPL484','Susmitha.G'),(231,'ABSPL327','Swetha.K'),(232,'ABSPL402','Swetha.M'),(233,'ABSPL371','Swetha.N'),(234,'ABSPL062','Tamilmaran.M'),(235,'ABSPL008','Thangamani.B'),(236,'ABSPL372','Thenmozhi.P'),(237,'ABSPL420','Thomas Raj.A'),(238,'ABSPL340','Vaitheeswari.V'),(239,'ABSPL236','Varun.B'),(240,'ABSPL259','Vasanth Raj.N'),(241,'ABSPL441','Venkatesh.S'),(242,'ABSPL449','Victoriya Agnus.S'),(243,'ABSPL479','Vignesh Balaji'),(244,'ABSPL480','Vignesh Krishnan'),(245,'ABSPL341','Vignesh.M'),(246,'ABSPL490','Vignesh.S'),(247,'ABSPL415','Vigneshwar.S'),(248,'ABSPL511','Vijaya Pandian.B'),(249,'ABSPL149','Vijayalakshmi.R'),(250,'ABSPL162','Vimal.D'),(251,'ABSPL237','Vindhya.R'),(252,'ABSPL351','Vinisha.S'),(253,'ABSPL460','Vinod.K.V'),(254,'ABSPL291','Vinodhini.M'),(255,'ABSPL487','Vinoth Kumar.R.B'),(256,'ABSPL328','Vishal Grover.J'),(257,'ABSPL423','Vishal.P'),(258,'ABSPL244','Vishnupriya.P'),(259,'ABSPL356','Yadesh.R'),(260,'ABSPL047','Yasminbegam.K'),(261,'ABSPL507','Yuvan Shree.R'),(262,'ABSPL404','Yuvasri.D');
/*!40000 ALTER TABLE `asset_empdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_it_asset`
--

DROP TABLE IF EXISTS `asset_it_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_it_asset` (
  `sno` int NOT NULL AUTO_INCREMENT,
  `assetname` varchar(50) DEFAULT NULL,
  `assetID` varchar(50) DEFAULT NULL,
  `assetcat` varchar(50) DEFAULT NULL,
  `purchasedate` date DEFAULT NULL,
  `purchasefrom` varchar(50) DEFAULT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `serialno` varchar(50) DEFAULT NULL,
  `invono` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `warranty` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `dayuser` varchar(50) DEFAULT NULL,
  `nightuser` varchar(50) DEFAULT NULL,
  `givenby` varchar(50) DEFAULT NULL,
  `Dstatus` varchar(50) DEFAULT NULL,
  `Ddate` date DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  UNIQUE KEY `asset_it_asset_assetID_f95ce8ce_uniq` (`assetID`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_it_asset`
--

LOCK TABLES `asset_it_asset` WRITE;
/*!40000 ALTER TABLE `asset_it_asset` DISABLE KEYS */;
INSERT INTO `asset_it_asset` VALUES (39,'CPU','ABSITCPU001','Computing Devices','2012-05-22','P R Computer Castle India Pvt Ltd','Assembled','Assembled','00E04A0A38E9','530','Disposed',NULL,'12000',NULL,NULL,NULL,NULL,NULL,NULL),(40,'CPU','ABSITCPU002','Computing Devices','2012-05-22','P R Computer Castle India Pvt Ltd','Assembled','Assembled','00E04C771FB6','530','In Use',NULL,'12000',NULL,NULL,NULL,NULL,NULL,NULL),(41,'CPU','ABSITCPU003','Computing Devices','2012-05-22','P R Computer Castle India Pvt Ltd','Assembled','Assembled','00E04C82EA0C','530','In Use',NULL,'12000',NULL,NULL,NULL,NULL,NULL,NULL),(42,'CPU','ABSITCPU004','Computing Devices','2012-05-22','P R Computer Castle India Pvt Ltd','Assembled','Assembled','00FF0AF88821','530','In Use',NULL,'12000',NULL,NULL,NULL,NULL,NULL,NULL),(43,'CPU','ABSITCPU005','Computing Devices','2012-05-22','P R Computer Castle India Pvt Ltd','Assembled','Assembled','00FF1807E41E','530','In Use',NULL,'12000',NULL,NULL,NULL,NULL,NULL,NULL),(44,'CPU','ABSITCPU006','Computing Devices','2012-05-22','P R Computer Castle India Pvt Ltd','Assembled','Assembled','00FF23BBFA98','530','In Use',NULL,'12000',NULL,NULL,NULL,NULL,NULL,NULL),(45,'CPU','ABSITCPU007','Computing Devices','2012-05-22','P R Computer Castle India Pvt Ltd','Assembled','Assembled','00FF439D88D8','530','In Use',NULL,'12000',NULL,NULL,NULL,NULL,NULL,NULL),(46,'CPU','ABSITCPU008','Computing Devices','2012-05-22','P R Computer Castle India Pvt Ltd','Assembled','Assembled','00FF8C8F4BDE','530','In Use',NULL,'12000',NULL,NULL,NULL,NULL,NULL,NULL),(47,'CPU','ABSITCPU009','Computing Devices','2012-05-22','P R Computer Castle India Pvt Ltd','Assembled','Assembled','00FF97F018A3','530','In Use',NULL,'12000',NULL,NULL,NULL,NULL,NULL,NULL),(48,'CPU','ABSITCPU010','Computing Devices','2012-05-22','P R Computer Castle India Pvt Ltd','Assembled','Assembled','00FF9C839EC5','530','In Use',NULL,'12000',NULL,NULL,NULL,NULL,NULL,NULL),(49,'CPU','ABSITCPU011','Computing Devices','2012-05-22','P R Computer Castle India Pvt Ltd','Assembled','Assembled','00FFAE50EA92','530','In Use',NULL,'12000',NULL,NULL,NULL,NULL,NULL,NULL),(50,'CPU','ABSITCPU012','Computing Devices','2012-08-13','P R Computer Castle India Pvt Ltd','Assembled','Assembled','E840F206795B','1506','In Use',NULL,'12700',NULL,NULL,NULL,NULL,NULL,NULL),(51,'CPU','ABSITCPU013','Computing Devices','2012-08-13','P R Computer Castle India Pvt Ltd','Assembled','Assembled','ECA86BF9AA65','1506','In Use',NULL,'12700',NULL,NULL,NULL,NULL,NULL,NULL),(52,'CPU','ABSITCPU014','Computing Devices','2012-08-13','P R Computer Castle India Pvt Ltd','Assembled','Assembled','ECA86BF9C9A2','1506','In Use',NULL,'12700',NULL,NULL,NULL,NULL,NULL,NULL),(53,'CPU','ABSITCPU015','Computing Devices','2013-01-03','Saraswati Computers','Assembled','Assembled','E840F2067946','001','In Use',NULL,'10300',NULL,NULL,NULL,NULL,NULL,NULL),(54,'CPU','ABSITCPU016','Computing Devices','2013-01-03','Saraswati Computers','Assembled','Assembled','E840F2067963','001','In Use',NULL,'10300',NULL,NULL,NULL,NULL,NULL,NULL),(55,'CPU','ABSITCPU017','Computing Devices','2013-01-03','Saraswati Computers','Assembled','Assembled','1C1B0D579042','001','In Use',NULL,'10600',NULL,NULL,NULL,NULL,NULL,NULL),(56,'CPU','ABSITCPU018','Computing Devices','2013-10-10','Sethia Infotech','Assembled','Assembled','8CEC4B4B7BEB','05183','In Use',NULL,'13150',NULL,NULL,NULL,NULL,NULL,NULL),(57,'CPU','ABSITCPU019','Computing Devices','2013-10-10','Sethia Infotech','Assembled','Assembled','E840F2067953','05184','In Use',NULL,'21567',NULL,NULL,NULL,NULL,NULL,NULL),(58,'CPU','ABSITCPU020','Computing Devices','2013-12-19','Sree Computers','Assembled','Assembled','38607750A5CB','1482','Disposed',NULL,'13943',NULL,NULL,NULL,NULL,NULL,NULL),(59,'CPU','ABSITCPU021','Computing Devices','2013-12-19','Sree Computers','Assembled','Assembled','E840F2067937','1482','In Use',NULL,'13943',NULL,NULL,NULL,NULL,NULL,NULL),(60,'CPU','ABSITCPU022','Computing Devices','2014-11-14','Sree Computers','Assembled','Assembled','E840F206796C','1010','In Use',NULL,'20072',NULL,NULL,NULL,NULL,NULL,NULL),(61,'CPU','ABSITCPU023','Computing Devices','2015-09-15','Nexbase Technologies','Assembled','Assembled','ECA86B75757E','1963','In Use',NULL,'14720',NULL,NULL,NULL,NULL,NULL,NULL),(62,'CPU','ABSITCPU024','Computing Devices','2015-09-15','Nexbase Technologies','Assembled','Assembled','ECA86BF73948','1963','In Use',NULL,'14720',NULL,NULL,NULL,NULL,NULL,NULL),(63,'CPU','ABSITCPU025','Computing Devices','2017-08-10','Omega Computers','Assembled','Assembled','38607750A6D2','8','In Use',NULL,'21900',NULL,NULL,NULL,NULL,NULL,NULL),(64,'CPU','ABSITCPU026','Computing Devices','2017-08-10','Omega Computers','Assembled','Assembled','ECA86B749C62','8','Disposed',NULL,'21900',NULL,NULL,NULL,NULL,NULL,NULL),(65,'CPU','ABSITCPU027','Computing Devices','2018-02-15','Konet Technology Inc','Dell','OPTIPLEX 3050','1C1B0D57906D','002879','In Use',NULL,'26300',NULL,NULL,NULL,NULL,NULL,NULL),(66,'CPU','ABSITCPU028','Computing Devices','2018-02-15','Konet Technology Inc','Dell','OPTIPLEX 3050','509A4C04B027','002879','In Use',NULL,'26300',NULL,NULL,NULL,NULL,NULL,NULL),(67,'CPU','ABSITCPU029','Computing Devices','2018-02-15','Konet Technology Inc','Dell','OPTIPLEX 3050','509A4C22A55C','002879','In Use',NULL,'26300',NULL,NULL,NULL,NULL,NULL,NULL),(68,'CPU','ABSITCPU030','Computing Devices','2018-05-29','Konet Technology Inc','Dell','OPTIPLEX 3050','509A4C22AEE0','113','In Use',NULL,'26000',NULL,NULL,NULL,NULL,NULL,NULL),(69,'CPU','ABSITCPU031','Computing Devices','2018-05-29','Konet Technology Inc','Dell','OPTIPLEX 3050','509A4C3C9E00','113','In Use',NULL,'26000',NULL,NULL,NULL,NULL,NULL,NULL),(70,'CPU','ABSITCPU032','Computing Devices','2018-05-29','Konet Technology Inc','Dell','OPTIPLEX 3050','509A4C3CA126','113','In Use',NULL,'26000',NULL,NULL,NULL,NULL,NULL,NULL),(71,'CPU','ABSITCPU033','Computing Devices','2018-08-24','Simos Peripherals Pvt Ltd','Dell','OPTIPLEX 3050','5M6CFN2','291','In Use',NULL,'27000',NULL,NULL,NULL,NULL,NULL,NULL),(72,'CPU','ABSITCPU034','Computing Devices','2018-08-24','Simos Peripherals Pvt Ltd','Dell','OPTIPLEX 3050','5L59FN2','291','In Use',NULL,'27000',NULL,NULL,NULL,NULL,NULL,NULL),(73,'CPU','ABSITCPU035','Computing Devices','2019-03-29','Simos Peripherals Pvt Ltd','Dell','OPTIPLEX 5060','7N107T2','703','In Use',NULL,'26900',NULL,NULL,NULL,NULL,NULL,NULL),(74,'CPU','ABSITCPU036','Computing Devices','2019-03-29','Simos Peripherals Pvt Ltd','Dell','OPTIPLEX 5060','7N4S6T2','703','In Use',NULL,'29600',NULL,NULL,NULL,NULL,NULL,NULL),(75,'CPU','ABSITCPU037','Computing Devices','2019-11-28','Konet Technology Inc','Asus','Prime H310','K2MOKC277572MRA','3090','In Use',NULL,'15167',NULL,NULL,NULL,NULL,NULL,NULL),(76,'CPU','ABSITCPU038','Computing Devices','2019-11-28','Konet Technology Inc','Asus','Prime H310','K2MOKC277576MRA','3090','In Use',NULL,'15167',NULL,NULL,NULL,NULL,NULL,NULL),(77,'CPU','ABSITCPU039','Computing Devices','2021-07-26','Simos Peripherals Pvt Ltd','Dell','Vostro 3681','4S03TD3','113','In Use',NULL,'26000',NULL,NULL,NULL,NULL,NULL,NULL),(78,'CPU','ABSITCPU040','Computing Devices','2021-07-26','Simos Peripherals Pvt Ltd','Dell','Vostro 3681','8R03TD','113','In Use',NULL,'26000',NULL,NULL,NULL,NULL,NULL,NULL),(79,'CPU','ABSITCPU041','Computing Devices','2021-07-26','Simos Peripherals Pvt Ltd','Dell','Vostro 3681','BT03TD3','113','In Use',NULL,'26000',NULL,NULL,NULL,NULL,NULL,NULL),(80,'CPU','ABSITCPU042','Computing Devices','2021-07-27','Simos Peripherals Pvt Ltd','Dell','Optiplex 9010','7N4S6T2','703','In Use',NULL,'30000',NULL,NULL,NULL,NULL,NULL,NULL),(81,'CPU','ABSITCPU043','Computing Devices','2021-07-27','Simos Peripherals Pvt Ltd','Dell','Optiplex 9010','7N4S6T2','703','In Use',NULL,'30000',NULL,NULL,NULL,NULL,NULL,NULL),(82,'CPU','ABSITCPU044','Computing Devices','2021-07-27','Simos Peripherals Pvt Ltd','Dell','Optiplex 9010','7N4S6T2','703','In Use',NULL,'30000',NULL,NULL,NULL,NULL,NULL,NULL),(83,'CPU','ABSITCPU045','Computing Devices','2021-10-06','Konet Technology Inc','Assembled','Assembled','971zv3','01972','In Use',NULL,'22448',NULL,NULL,NULL,NULL,NULL,NULL),(84,'CPU','ABSITCPU046','Computing Devices','2021-10-06','Konet Technology Inc','Assembled','Assembled','971zv3','01972','In Use',NULL,'22448',NULL,NULL,NULL,NULL,NULL,NULL),(85,'CPU','ABSITCPU047','Computing Devices','2021-10-06','Konet Technology Inc','Assembled','Assembled','971zv3','01972','In Use',NULL,'22448',NULL,NULL,NULL,NULL,NULL,NULL),(86,'CPU','ABSITCPU048','Computing Devices','2021-10-06','Konet Technology Inc','Assembled','Assembled','971zv3','01972','In Use',NULL,'22448',NULL,NULL,NULL,NULL,NULL,NULL),(87,'CPU','ABSITCPU049','Computing Devices','2022-03-12','Trust Communications','Dell ','Optiplex 3070','84713010','351','In Use',NULL,'23700',NULL,NULL,NULL,NULL,NULL,NULL),(88,'CPU','ABSITCPU050','Computing Devices','2022-03-12','Trust Communications','Dell ','Optiplex 3070','84713010','351','In Use',NULL,'23700',NULL,NULL,NULL,NULL,NULL,NULL),(89,'CPU','ABSITCPU051','Computing Devices','2022-03-12','Trust Communications','Dell ','Optiplex 3070','84713010','351','In Use',NULL,'23700',NULL,NULL,NULL,NULL,NULL,NULL),(90,'CPU','ABSITCPU052','Computing Devices','2022-03-12','Trust Communications','Dell ','Optiplex 3070','84713010','351','In Use',NULL,'23700',NULL,NULL,NULL,NULL,NULL,NULL),(91,'CPU','ABSITCPU053','Computing Devices','2022-03-12','Trust Communications','Dell ','Optiplex 3070','84713010','351','In Use',NULL,'23700',NULL,NULL,NULL,NULL,NULL,NULL),(92,'CPU','ABSITCPU054','Computing Devices','2022-03-12','Trust Communications','Dell ','Optiplex 3070','84713010','351','In Use',NULL,'23700',NULL,NULL,NULL,NULL,NULL,NULL),(93,'CPU','ABSITCPU055','Computing Devices','2022-03-12','Trust Communications','Dell ','Optiplex 3070','84713010','351','In Use',NULL,'23700',NULL,NULL,NULL,NULL,NULL,NULL),(94,'CPU','ABSITCPU056','Computing Devices','2022-03-12','Trust Communications','Dell ','Optiplex 3070','84713010','351','In Use',NULL,'23700',NULL,NULL,NULL,NULL,NULL,NULL),(95,'CPU','ABSITCPU057','Computing Devices','2022-03-12','Trust Communications','Dell ','Optiplex 3070','84713010','351','In Use',NULL,'23700',NULL,NULL,NULL,NULL,NULL,NULL),(96,'CPU','ABSITCPU058','Computing Devices','2022-03-12','Trust Communications','Dell ','Optiplex 3070','84713010','351','In Use',NULL,'23700',NULL,NULL,NULL,NULL,NULL,NULL),(97,'CPU','ABSITCPU059','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(98,'CPU','ABSITCPU060','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(99,'CPU','ABSITCPU061','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(100,'CPU','ABSITCPU062','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(101,'CPU','ABSITCPU063','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(102,'CPU','ABSITCPU064','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(103,'CPU','ABSITCPU065','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(104,'CPU','ABSITCPU066','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(105,'CPU','ABSITCPU067','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(106,'CPU','ABSITCPU068','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(107,'CPU','ABSITCPU069','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(108,'CPU','ABSITCPU070','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(109,'CPU','ABSITCPU071','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(110,'CPU','ABSITCPU072','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(111,'CPU','ABSITCPU073','Computing Devices','2022-09-29','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','354','In Use',NULL,'20779',NULL,NULL,NULL,NULL,NULL,NULL),(112,'CPU','ABSITCPU074','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(113,'CPU','ABSITCPU075','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(114,'CPU','ABSITCPU076','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(115,'CPU','ABSITCPU077','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(116,'CPU','ABSITCPU078','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(117,'CPU','ABSITCPU079','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(118,'CPU','ABSITCPU080','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(119,'CPU','ABSITCPU081','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(120,'CPU','ABSITCPU082','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(121,'CPU','ABSITCPU083','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(122,'CPU','ABSITCPU084','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(123,'CPU','ABSITCPU085','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(124,'CPU','ABSITCPU086','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(125,'CPU','ABSITCPU087','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(126,'CPU','ABSITCPU088','Computing Devices','2022-11-30','Simos Peripherals Pvt Ltd','Assembled','Assembled','Assembled','474','In Use',NULL,'20011',NULL,NULL,NULL,NULL,NULL,NULL),(127,'CPU','ABSITCPU089','Computing Devices','2023-01-20','Konet Technology Inc','Assembled','Assembled','Assembled','4946','In Use',NULL,'20660',NULL,NULL,NULL,NULL,NULL,NULL),(128,'CPU','ABSITCPU090','Computing Devices','2023-01-20','Konet Technology Inc','Assembled','Assembled','Assembled','4946','In Use',NULL,'20660',NULL,NULL,NULL,NULL,NULL,NULL),(129,'CPU','ABSITCPU091','Computing Devices','2023-01-20','Konet Technology Inc','Assembled','Assembled','Assembled','4946','In Use',NULL,'20660',NULL,NULL,NULL,NULL,NULL,NULL),(130,'CPU','ABSITCPU092','Computing Devices','2023-04-14','Konet Technology Inc','Assembled','Assembled','Assembled','196','In Use',NULL,'28600',NULL,NULL,NULL,NULL,NULL,NULL),(131,'CPU','ABSITCPU093','Computing Devices','2023-04-14','Konet Technology Inc','Assembled','Assembled','Assembled','196','In Use',NULL,'28600',NULL,NULL,NULL,NULL,NULL,NULL),(132,'CPU','ABSITCPU094','Computing Devices','2023-04-14','Konet Technology Inc','Assembled','Assembled','Assembled','196','In Use',NULL,'28600',NULL,NULL,NULL,NULL,NULL,NULL),(133,'CPU','ABSITCPU095','Computing Devices','2023-04-14','Konet Technology Inc','Assembled','Assembled','Assembled','196','In Use',NULL,'28600',NULL,NULL,NULL,NULL,NULL,NULL),(134,'CPU','ABSITCPU096','Computing Devices','2023-04-14','Konet Technology Inc','Assembled','Assembled','Assembled','196','In Use',NULL,'28600',NULL,NULL,NULL,NULL,NULL,NULL),(135,'CPU','ABSITCPU097','Computing Devices','2023-04-14','Konet Technology Inc','Assembled','Assembled','Assembled','196','In Use',NULL,'28600',NULL,NULL,NULL,NULL,NULL,NULL),(136,'CPU','ABSITCPU098','Computing Devices','2023-04-14','Konet Technology Inc','Assembled','Assembled','Assembled','196','In Use',NULL,'28600',NULL,NULL,NULL,NULL,NULL,NULL),(137,'CPU','ABSITCPU099','Computing Devices','2023-04-14','Konet Technology Inc','Assembled','Assembled','Assembled','4946','In Use',NULL,'20660',NULL,NULL,NULL,NULL,NULL,NULL),(138,'CPU','ABSITCPU100','Computing Devices','2023-04-14','Konet Technology Inc','Assembled','Assembled','Assembled','4946','In Use',NULL,'20660',NULL,NULL,NULL,NULL,NULL,NULL),(139,'CPU','ABSITCPU101','Computing Devices','2023-04-14','Konet Technology Inc','Assembled','Assembled','Assembled','4946','In Use',NULL,'20660',NULL,NULL,NULL,NULL,NULL,NULL),(140,'CPU','ABSITCPU102','Computing Devices','2023-05-18','Konet Technology Inc','Assembled','Assembled','ASUS82874B9','732','In Use',NULL,'27100',NULL,NULL,NULL,NULL,NULL,NULL),(141,'CPU','ABSITCPU103','Computing Devices','2023-05-18','Konet Technology Inc','Assembled','Assembled','ASUSV8229P7','732','In Use',NULL,'27100',NULL,NULL,NULL,NULL,NULL,NULL),(142,'CPU','ABSITCPU104','Computing Devices','2023-05-18','Konet Technology Inc','Assembled','Assembled','ASUS8220N6V','732','In Use',NULL,'27100',NULL,NULL,NULL,NULL,NULL,NULL),(143,'CPU','ABSITCPU105','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(144,'CPU','ABSITCPU106','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(145,'CPU','ABSITCPU107','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(146,'CPU','ABSITCPU108','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(147,'CPU','ABSITCPU109','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(148,'CPU','ABSITCPU110','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(149,'CPU','ABSITCPU111','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(150,'CPU','ABSITCPU112','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(151,'CPU','ABSITCPU113','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(152,'CPU','ABSITCPU114','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(153,'CPU','ABSITCPU115','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(154,'CPU','ABSITCPU116','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(155,'CPU','ABSITCPU117','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(156,'CPU','ABSITCPU118','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(157,'CPU','ABSITCPU119','Computing Devices','2023-08-09','Simos Peripherals Pvt Ltd','ASUS','Assembled','ASUS','300','In Use',NULL,'28796',NULL,NULL,NULL,NULL,NULL,NULL),(158,'CPU','ABSITCPU120','Computing Devices','2023-10-26','Konet Technology Inc','ASUS','Prime H6103','R630KC146909NJ7','2620','In Use',NULL,'25910',NULL,NULL,NULL,NULL,NULL,NULL),(159,'CPU','ABSITCPU121','Computing Devices','2023-10-26','Konet Technology Inc','ASUS','Prime H6103','R630KC146908XKV','2620','In Use',NULL,'25910',NULL,NULL,NULL,NULL,NULL,NULL),(160,'CPU','ABSITCPU122','Computing Devices','2023-10-26','Konet Technology Inc','ASUS','Prime H6103','R630KC146907DTD','2620','In Use',NULL,'25910',NULL,NULL,NULL,NULL,NULL,NULL),(161,'CPU','ABSITCPU123','Computing Devices','2023-10-26','Konet Technology Inc','ASUS','Prime H6103','R630KC1469053UK','2620','In Use',NULL,'25910',NULL,NULL,NULL,NULL,NULL,NULL),(162,'CPU','ABSITCPU124','Computing Devices','2023-10-26','Konet Technology Inc','ASUS','Prime H6103','R630KC1469068TH','2620','In Use',NULL,'25910',NULL,NULL,NULL,NULL,NULL,NULL),(163,'CPU','ABSITCPU125','Computing Devices','2024-06-24','Konet Technology Inc','ASUS','610MCS','RCM0KC220428CDC','777','In Use',NULL,'22337',NULL,NULL,NULL,NULL,NULL,NULL),(164,'CPU','ABSITCPU126','Computing Devices','2024-06-24','Konet Technology Inc','ASUS','610MCS','RCM0KC220429F27','777','In Use',NULL,'22337',NULL,NULL,NULL,NULL,NULL,NULL),(165,'CPU','ABSITCPU127','Computing Devices','2024-06-24','Konet Technology Inc','ASUS','610MCS','RCM0KC220430SXF','777','In Use',NULL,'22337',NULL,NULL,NULL,NULL,NULL,NULL),(166,'CPU','ABSITCPU128','Computing Devices','2024-06-24','Konet Technology Inc','ASUS','610MCS','RCM0KC220431MRA','777','In Use',NULL,'22337',NULL,NULL,NULL,NULL,NULL,NULL),(167,'CPU','ABSITCPU129','Computing Devices','2024-06-24','Konet Technology Inc','ASUS','610MCS','RCM0KC2204338MV','777','In Use',NULL,'22337',NULL,NULL,NULL,NULL,NULL,NULL),(168,'CPU','ABSITCPU130','Computing Devices','2024-06-24','Konet Technology Inc','ASUS','610MCS','RCM0KC22043428L','777','In Use',NULL,'22337',NULL,NULL,NULL,NULL,NULL,NULL),(169,'CPU','ABSITCPU131','Computing Devices','2024-06-24','Konet Technology Inc','ASUS','610MCS','RCM0KC220435WHG','777','In Use',NULL,'22337',NULL,NULL,NULL,NULL,NULL,NULL),(170,'CPU','ABSITCPU132','Computing Devices','2024-06-24','Konet Technology Inc','ASUS','610MCS','RCM0KC220436G3B','777','In Use',NULL,'22337',NULL,NULL,NULL,NULL,NULL,NULL),(171,'CPU','ABSITCPU133','Computing Devices','2024-06-24','Konet Technology Inc','ASUS','610MCS','RCM0KC220437VC6','777','In Use',NULL,'22337',NULL,NULL,NULL,NULL,NULL,NULL),(172,'CPU','ABSITCPU134','Computing Devices','2024-06-24','Konet Technology Inc','ASUS','610MCS','RCM0KC220432FD5','777','In Use',NULL,'22337',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `asset_it_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_manufacture`
--

DROP TABLE IF EXISTS `asset_manufacture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_manufacture` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `desc` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_manufacture_name_8d617b0d_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_manufacture`
--

LOCK TABLES `asset_manufacture` WRITE;
/*!40000 ALTER TABLE `asset_manufacture` DISABLE KEYS */;
INSERT INTO `asset_manufacture` VALUES (1,'DELL',NULL),(2,'ASUS',NULL),(3,'BENQ',NULL),(4,'LOGITECH',NULL);
/*!40000 ALTER TABLE `asset_manufacture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_projects`
--

DROP TABLE IF EXISTS `asset_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_projects` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `desc` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_projects`
--

LOCK TABLES `asset_projects` WRITE;
/*!40000 ALTER TABLE `asset_projects` DISABLE KEYS */;
INSERT INTO `asset_projects` VALUES (1,'Humphreys Peak',''),(2,'Mount Rainier',''),(3,'Mount Sunflower',''),(4,'Wichita',''),(5,'RDC',''),(6,'RDCO',''),(7,'Paris Mountain',''),(8,'Pleasant Lake','');
/*!40000 ALTER TABLE `asset_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_userlist`
--

DROP TABLE IF EXISTS `asset_userlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_userlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cpu_id` varchar(50) DEFAULT NULL,
  `monitor_id` varchar(50) DEFAULT NULL,
  `sec_monitor_id` varchar(50) DEFAULT NULL,
  `project` varchar(50) DEFAULT NULL,
  `emp_id` varchar(50) DEFAULT NULL,
  `shift` varchar(50) DEFAULT NULL,
  `emp_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `monitor_id` (`monitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_userlist`
--

LOCK TABLES `asset_userlist` WRITE;
/*!40000 ALTER TABLE `asset_userlist` DISABLE KEYS */;
INSERT INTO `asset_userlist` VALUES (22,'ABSITCPU001','','','','ABSPL188','',NULL);
/*!40000 ALTER TABLE `asset_userlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_vendor`
--

DROP TABLE IF EXISTS `asset_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_vendor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `desc` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_vendor_name_a0045a5d_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_vendor`
--

LOCK TABLES `asset_vendor` WRITE;
/*!40000 ALTER TABLE `asset_vendor` DISABLE KEYS */;
INSERT INTO `asset_vendor` VALUES (1,'Konet technology Inc',NULL),(2,'Simos Peripherals Pvt Ltd',NULL),(3,'P R Computer Castle India Pvt Ltd',NULL),(4,'Saraswati Computers',NULL),(5,'Sethia Infotech',NULL),(6,'Sree Computers',NULL),(7,'Nexbase Technologies',NULL),(8,'Omega Computers',NULL),(9,'Trust Communications',NULL);
/*!40000 ALTER TABLE `asset_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_voip`
--

DROP TABLE IF EXISTS `asset_voip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_voip` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vendor` varchar(50) DEFAULT NULL,
  `callbacknumber` varchar(50) DEFAULT NULL,
  `usernumber` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `dop` varchar(50) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_voip`
--

LOCK TABLES `asset_voip` WRITE;
/*!40000 ALTER TABLE `asset_voip` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_voip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_wrnty`
--

DROP TABLE IF EXISTS `asset_wrnty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_wrnty` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `desc` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_wrnty_name_7f9ac327_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_wrnty`
--

LOCK TABLES `asset_wrnty` WRITE;
/*!40000 ALTER TABLE `asset_wrnty` DISABLE KEYS */;
INSERT INTO `asset_wrnty` VALUES (1,'1 Year','365'),(2,'2 Years','730'),(3,'3 years','1095'),(4,'4 Years','1460'),(5,'5 Years','1825'),(6,'6 Years','2190'),(7,'7 Years','2555'),(8,'8 Years','2920'),(9,'9 Years','3285'),(10,'10 Years','3650');
/*!40000 ALTER TABLE `asset_wrnty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add cred',6,'add_cred'),(22,'Can change cred',6,'change_cred'),(23,'Can delete cred',6,'delete_cred'),(24,'Can view cred',6,'view_cred'),(25,'Can add dashboard',7,'add_dashboard'),(26,'Can change dashboard',7,'change_dashboard'),(27,'Can delete dashboard',7,'delete_dashboard'),(28,'Can view dashboard',7,'view_dashboard'),(29,'Can add it_asset',8,'add_it_asset'),(30,'Can change it_asset',8,'change_it_asset'),(31,'Can delete it_asset',8,'delete_it_asset'),(32,'Can view it_asset',8,'view_it_asset'),(33,'Can add voip',9,'add_voip'),(34,'Can change voip',9,'change_voip'),(35,'Can delete voip',9,'delete_voip'),(36,'Can view voip',9,'view_voip'),(37,'Can add user',10,'add_customuser'),(38,'Can change user',10,'change_customuser'),(39,'Can delete user',10,'delete_customuser'),(40,'Can view user',10,'view_customuser'),(41,'Can add asset',11,'add_asset'),(42,'Can change asset',11,'change_asset'),(43,'Can delete asset',11,'delete_asset'),(44,'Can view asset',11,'view_asset'),(45,'Can add assetcat',12,'add_assetcat'),(46,'Can change assetcat',12,'change_assetcat'),(47,'Can delete assetcat',12,'delete_assetcat'),(48,'Can view assetcat',12,'view_assetcat'),(49,'Can add assetname',11,'add_assetname'),(50,'Can change assetname',11,'change_assetname'),(51,'Can delete assetname',11,'delete_assetname'),(52,'Can view assetname',11,'view_assetname'),(53,'Can add manufacturer',13,'add_manufacturer'),(54,'Can change manufacturer',13,'change_manufacturer'),(55,'Can delete manufacturer',13,'delete_manufacturer'),(56,'Can view manufacturer',13,'view_manufacturer'),(57,'Can add vendor',14,'add_vendor'),(58,'Can change vendor',14,'change_vendor'),(59,'Can delete vendor',14,'delete_vendor'),(60,'Can view vendor',14,'view_vendor'),(61,'Can add manufacture',13,'add_manufacture'),(62,'Can change manufacture',13,'change_manufacture'),(63,'Can delete manufacture',13,'delete_manufacture'),(64,'Can view manufacture',13,'view_manufacture'),(65,'Can add wrnty',15,'add_wrnty'),(66,'Can change wrnty',15,'change_wrnty'),(67,'Can delete wrnty',15,'delete_wrnty'),(68,'Can view wrnty',15,'view_wrnty'),(69,'Can add userlist',16,'add_userlist'),(70,'Can change userlist',16,'change_userlist'),(71,'Can delete userlist',16,'delete_userlist'),(72,'Can view userlist',16,'view_userlist'),(73,'Can add projects',17,'add_projects'),(74,'Can change projects',17,'change_projects'),(75,'Can delete projects',17,'delete_projects'),(76,'Can view projects',17,'view_projects'),(77,'Can add empdata',6,'add_empdata'),(78,'Can change empdata',6,'change_empdata'),(79,'Can delete empdata',6,'delete_empdata'),(80,'Can view empdata',6,'view_empdata');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_asset_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_asset_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `asset_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-08-12 14:55:18.777923','1','assetname object (1)',1,'[{\"added\": {}}]',11,1),(2,'2024-08-12 14:58:14.658323','1','Computing Devices',1,'[{\"added\": {}}]',12,1),(3,'2024-08-12 14:58:51.512144','2','Peripherals',1,'[{\"added\": {}}]',12,1),(4,'2024-08-12 14:59:54.521886','3','Audio Devices',1,'[{\"added\": {}}]',12,1),(5,'2024-08-12 15:00:16.265079','4','Networking Equipment',1,'[{\"added\": {}}]',12,1),(6,'2024-08-12 15:00:50.240788','5','Power Management',1,'[{\"added\": {}}]',12,1),(7,'2024-08-12 15:01:21.744829','6','Surveillance and Security',1,'[{\"added\": {}}]',12,1),(8,'2024-08-12 15:43:59.553971','1','CPU',1,'[{\"added\": {}}]',7,1),(9,'2024-08-12 17:43:56.744665','2','MONITOR',1,'[{\"added\": {}}]',11,1),(10,'2024-08-12 17:44:06.216391','3','LAPTOP',1,'[{\"added\": {}}]',11,1),(11,'2024-08-12 17:44:26.745160','4','KEYBOARD',1,'[{\"added\": {}}]',11,1),(12,'2024-08-12 17:44:29.511749','5','MOUSE',1,'[{\"added\": {}}]',11,1),(13,'2024-08-12 17:44:32.743969','6','HEADPHONE',1,'[{\"added\": {}}]',11,1),(14,'2024-08-12 17:44:37.216112','7','CCTV',1,'[{\"added\": {}}]',11,1),(15,'2024-08-12 17:44:41.286616','8','WEBCAMERA',1,'[{\"added\": {}}]',11,1),(16,'2024-08-12 17:44:46.144490','9','SPEAKER',1,'[{\"added\": {}}]',11,1),(17,'2024-08-12 17:44:49.503077','10','MICROPHONE',1,'[{\"added\": {}}]',11,1),(18,'2024-08-12 17:44:52.736983','11','AMPLIFIER',1,'[{\"added\": {}}]',11,1),(19,'2024-08-12 17:44:55.471660','12','UPS',1,'[{\"added\": {}}]',11,1),(20,'2024-08-12 17:44:58.623782','13','BATTERY',1,'[{\"added\": {}}]',11,1),(21,'2024-08-12 17:45:18.648406','14','SWITCHES',1,'[{\"added\": {}}]',11,1),(22,'2024-08-12 17:45:29.512491','15','ROUTER',1,'[{\"added\": {}}]',11,1),(23,'2024-08-12 17:46:40.704670','2','MONITOR',1,'[{\"added\": {}}]',7,1),(24,'2024-08-12 18:24:26.936242','1','DELL',1,'[{\"added\": {}}]',13,1),(25,'2024-08-12 18:24:29.432309','2','ASUS',1,'[{\"added\": {}}]',13,1),(26,'2024-08-12 18:24:32.816164','3','BENQ',1,'[{\"added\": {}}]',13,1),(27,'2024-08-12 18:24:43.103476','4','LOGITECH',1,'[{\"added\": {}}]',13,1),(28,'2024-08-12 18:35:14.968775','1','Konet technology Inc',1,'[{\"added\": {}}]',14,1),(29,'2024-08-12 18:35:47.329788','2','Simos Peripherals Pvt Ltd',1,'[{\"added\": {}}]',14,1),(30,'2024-08-12 18:39:29.720524','1','1 Year',1,'[{\"added\": {}}]',15,1),(31,'2024-08-12 18:39:40.888619','2','2 Years',1,'[{\"added\": {}}]',15,1),(32,'2024-08-12 18:39:51.256528','3','3 years',1,'[{\"added\": {}}]',15,1),(33,'2024-08-12 18:40:00.575451','4','4 Years',1,'[{\"added\": {}}]',15,1),(34,'2024-08-12 18:40:11.415896','5','5 Years',1,'[{\"added\": {}}]',15,1),(35,'2024-08-12 18:40:22.816365','6','6 Years',1,'[{\"added\": {}}]',15,1),(36,'2024-08-12 18:40:34.287898','7','7 Years',1,'[{\"added\": {}}]',15,1),(37,'2024-08-12 18:40:55.720290','8','8 Years',1,'[{\"added\": {}}]',15,1),(38,'2024-08-12 18:41:06.559212','9','9 Years',1,'[{\"added\": {}}]',15,1),(39,'2024-08-12 18:41:20.768246','10','10 Years',1,'[{\"added\": {}}]',15,1),(40,'2024-08-13 18:15:06.049697','3','P R Computer Castle India Pvt Ltd',1,'[{\"added\": {}}]',14,1),(41,'2024-08-13 18:15:10.016879','4','Saraswati Computers',1,'[{\"added\": {}}]',14,1),(42,'2024-08-13 18:15:14.152972','5','Sethia Infotech',1,'[{\"added\": {}}]',14,1),(43,'2024-08-13 18:15:17.296129','6','Sree Computers',1,'[{\"added\": {}}]',14,1),(44,'2024-08-13 18:15:20.288795','7','Nexbase Technologies',1,'[{\"added\": {}}]',14,1),(45,'2024-08-13 18:15:42.505819','8','Omega Computers',1,'[{\"added\": {}}]',14,1),(46,'2024-08-13 18:15:54.129167','9','Trust Communications',1,'[{\"added\": {}}]',14,1),(47,'2024-08-13 20:29:45.212296','1','projects object (1)',1,'[{\"added\": {}}]',17,1),(48,'2024-08-13 20:29:52.266731','2','projects object (2)',1,'[{\"added\": {}}]',17,1),(49,'2024-08-13 20:29:56.249289','3','projects object (3)',1,'[{\"added\": {}}]',17,1),(50,'2024-08-13 20:30:00.176891','4','projects object (4)',1,'[{\"added\": {}}]',17,1),(51,'2024-08-13 20:30:02.146416','5','projects object (5)',1,'[{\"added\": {}}]',17,1),(52,'2024-08-13 20:30:06.250234','6','projects object (6)',1,'[{\"added\": {}}]',17,1),(53,'2024-08-13 20:30:27.594212','7','projects object (7)',1,'[{\"added\": {}}]',17,1),(54,'2024-08-13 20:30:46.538849','8','projects object (8)',1,'[{\"added\": {}}]',17,1),(55,'2024-08-13 20:47:38.786760','1','Test',1,'[{\"added\": {}}]',6,1),(56,'2024-08-13 20:47:48.128213','2','Test1',1,'[{\"added\": {}}]',6,1),(57,'2024-08-13 22:28:58.546994','3','username',3,'',6,1),(58,'2024-08-13 22:28:58.549157','2','Test1',3,'',6,1),(59,'2024-08-13 22:28:58.550159','1','Test',3,'',6,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(12,'asset','assetcat'),(11,'asset','assetname'),(10,'asset','customuser'),(7,'asset','dashboard'),(6,'asset','empdata'),(8,'asset','it_asset'),(13,'asset','manufacture'),(17,'asset','projects'),(16,'asset','userlist'),(14,'asset','vendor'),(9,'asset','voip'),(15,'asset','wrnty'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-08-12 14:45:59.051683'),(2,'contenttypes','0002_remove_content_type_name','2024-08-12 14:45:59.079852'),(3,'auth','0001_initial','2024-08-12 14:45:59.224574'),(4,'auth','0002_alter_permission_name_max_length','2024-08-12 14:45:59.256330'),(5,'auth','0003_alter_user_email_max_length','2024-08-12 14:45:59.256330'),(6,'auth','0004_alter_user_username_opts','2024-08-12 14:45:59.270932'),(7,'auth','0005_alter_user_last_login_null','2024-08-12 14:45:59.270932'),(8,'auth','0006_require_contenttypes_0002','2024-08-12 14:45:59.270932'),(9,'auth','0007_alter_validators_add_error_messages','2024-08-12 14:45:59.270932'),(10,'auth','0008_alter_user_username_max_length','2024-08-12 14:45:59.286174'),(11,'auth','0009_alter_user_last_name_max_length','2024-08-12 14:45:59.286174'),(12,'auth','0010_alter_group_name_max_length','2024-08-12 14:45:59.286174'),(13,'auth','0011_update_proxy_permissions','2024-08-12 14:45:59.301182'),(14,'auth','0012_alter_user_first_name_max_length','2024-08-12 14:45:59.301182'),(15,'asset','0001_initial','2024-08-12 14:45:59.537923'),(16,'admin','0001_initial','2024-08-12 14:45:59.620118'),(17,'admin','0002_logentry_remove_auto_add','2024-08-12 14:45:59.620118'),(18,'admin','0003_logentry_add_action_flag_choices','2024-08-12 14:45:59.633255'),(19,'asset','0002_alter_it_asset_ddate_alter_it_asset_purchasedate','2024-08-12 14:45:59.695146'),(20,'asset','0003_alter_it_asset_value','2024-08-12 14:45:59.720064'),(21,'asset','0004_alter_it_asset_value','2024-08-12 14:45:59.747970'),(22,'sessions','0001_initial','2024-08-12 14:45:59.774848'),(23,'asset','0005_asset_assetcat','2024-08-12 14:52:19.736173'),(24,'asset','0006_rename_asset_assetname','2024-08-12 14:53:53.778991'),(25,'asset','0007_alter_assetcat_desc_alter_assetname_desc','2024-08-12 14:55:07.755656'),(26,'asset','0008_alter_dashboard_title','2024-08-12 15:43:47.679092'),(27,'asset','0009_assetname_ascat','2024-08-12 17:32:38.067410'),(28,'asset','0010_remove_assetname_ascat','2024-08-12 17:43:09.938563'),(29,'asset','0011_manufacturer_vendor','2024-08-12 18:17:55.889051'),(30,'asset','0012_rename_manufacturer_manufacture','2024-08-12 18:18:47.300249'),(31,'asset','0013_wrnty','2024-08-12 18:38:50.143263'),(32,'asset','0014_alter_it_asset_assetid','2024-08-12 19:06:13.158915'),(33,'asset','0015_userlist','2024-08-12 21:07:36.006156'),(34,'asset','0016_projects_alter_manufacture_name_alter_vendor_name_and_more','2024-08-13 20:25:20.239107'),(35,'asset','0017_rename_cred_empdata_rename_password_empdata_project','2024-08-13 20:44:26.803841'),(36,'asset','0018_userlist_emp_name','2024-08-13 22:07:47.010036'),(37,'asset','0019_remove_empdata_dept_remove_empdata_project','2024-08-13 22:25:47.172605');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4hnmw02xw1ajtvpl413kom645qrvwz83','.eJxVi7sOAiEQRf-F2myAXV6WWltak2EYgvGxiQOV8d_FZAstbnHvPeclIvRWY2d6xksWe6HE7ndLgFd6fA9gpjZtnadj57bez4M5rZluh437kytwHWYqiMFkp11SI94CWEW5zNrI7MFjSiANZQcBvaYEGtyi_GLnYmVAFO8PK-U3gw:1se0T2:Erus-SxTTkpLTmL61A5qq2eXUeZazT0J2lqajq9aIMQ','2024-08-14 02:18:16.387889'),('4y78s7o461n0cu5574ym3ebx0791wop2','.eJxVi7sOAiEQRf-F2myAXV6WWltak2EYgvGxiQOV8d_FZAstbnHvPeclIvRWY2d6xksWe6HE7ndLgFd6fA9gpjZtnadj57bez4M5rZluh437kytwHWYqiMFkp11SI94CWEW5zNrI7MFjSiANZQcBvaYEGtyi_GLnYmVAFO8PK-U3gw:1sdcH3:Gt1KSQ90hQnSCMT5g76DDgqrOMlredzqcn-UnhxMGmA','2024-08-13 00:28:17.756309'),('7ig9y5yvkng6nb4z4he6por8p8hteezf','.eJxVi7sOAiEQRf-F2myAXV6WWltak2EYgvGxiQOV8d_FZAstbnHvPeclIvRWY2d6xksWe6HE7ndLgFd6fA9gpjZtnadj57bez4M5rZluh437kytwHWYqiMFkp11SI94CWEW5zNrI7MFjSiANZQcBvaYEGtyi_GLnYmVAFO8PK-U3gw:1sfCqI:8GRpv0hzuzNnKT9JpvtVSxsZdBU0APV14UWb1GwXKaw','2024-08-17 09:43:14.195841'),('jg3f8i66ju6tnu56u88ep99srxjd0o6p','.eJxVi7sOAiEQRf-F2myAXV6WWltak2EYgvGxiQOV8d_FZAstbnHvPeclIvRWY2d6xksWe6HE7ndLgFd6fA9gpjZtnadj57bez4M5rZluh437kytwHWYqiMFkp11SI94CWEW5zNrI7MFjSiANZQcBvaYEGtyi_GLnYmVAFO8PK-U3gw:1sdtje:74W2OYVIrJQwn19Lb8mzGh2_Mn7_m4MlANd4ZyUII7k','2024-08-13 19:06:58.729687'),('ou8vjdi1rz7tg3egl9r78ho8ypqdl10s','.eJxVi7sOAiEQRf-F2myAXV6WWltak2EYgvGxiQOV8d_FZAstbnHvPeclIvRWY2d6xksWe6HE7ndLgFd6fA9gpjZtnadj57bez4M5rZluh437kytwHWYqiMFkp11SI94CWEW5zNrI7MFjSiANZQcBvaYEGtyi_GLnYmVAFO8PK-U3gw:1sdxDX:OTVLSCxx8A_TgeWl0v1hwpzyL3Dqv9EYnSbiY_ROQSI','2024-08-13 22:50:03.039811'),('yi8fxc005kpn36u3z64pri8ji15oh2l1','.eJxVi7sOAiEQRf-F2myAXV6WWltak2EYgvGxiQOV8d_FZAstbnHvPeclIvRWY2d6xksWe6HE7ndLgFd6fA9gpjZtnadj57bez4M5rZluh437kytwHWYqiMFkp11SI94CWEW5zNrI7MFjSiANZQcBvaYEGtyi_GLnYmVAFO8PK-U3gw:1sdYyE:ZASWASxK6UdceyfE-Q0m42VZvE2f4KE19TR1jyvO2W8','2024-08-12 20:56:38.880614');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-17  5:32:29
