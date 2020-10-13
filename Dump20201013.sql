-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: exam
-- ------------------------------------------------------
-- Server version	5.7.31-log

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `num` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(500) NOT NULL,
  `readcount` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'asd','asd','asd','asd',10,'2020-10-12 09:29:20'),(3,'dev','dev','dev','devcsasdwqrefas111',5,'2020-10-12 09:33:04'),(4,'sss','sss','sss','sss',0,'2020-10-12 09:34:25'),(5,'sss','s','s','s',0,'2020-10-12 09:34:33'),(6,'sss','123','123','123',2,'2020-10-12 09:34:40'),(7,'sss','123','123','4321',0,'2020-10-12 09:34:48'),(8,'sss','cxzcxc','zxczxcxz','xczxczxczx',0,'2020-10-12 09:34:55'),(9,'sss','zxczxczx','czxczxc','zxczxczx',1,'2020-10-12 09:34:59'),(10,'sss','ddwqd','dsadsa','czxcxz',0,'2020-10-12 09:35:06'),(11,'sss','erewre','cxzgew','rggvcv',0,'2020-10-12 09:35:11'),(12,'sss','hgfhfgh','gfhfghg','fhgfhfg',0,'2020-10-12 09:35:17'),(13,'asd','bvbs','gfgwgwe','rewrewtgrbe',0,'2020-10-12 09:35:30'),(14,'asd','gfgfd','fdgfdgfd','gfg',0,'2020-10-12 09:35:35'),(15,'asd','sadsa','fdsfs','dfsdfds',0,'2020-10-12 09:35:40'),(16,'asd','fq3wr','fsdfdfds','fdfds',3,'2020-10-12 09:35:45'),(17,'asd','54346','546546','45654654',6,'2020-10-12 09:35:52'),(18,'admin','admin','[공지]가나다라','가나다라마바사아자차카타파하',28,'2020-10-12 09:36:35'),(19,'tetete','1','여기핵꿀맛','뻥임',7,'2020-10-12 17:38:15');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `num` int(11) NOT NULL,
  `id` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `title` varchar(30) NOT NULL,
  `content` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `dateup` datetime DEFAULT NULL,
  `pnum` int(11) NOT NULL,
  PRIMARY KEY (`date`),
  UNIQUE KEY `num` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,'sss','sss','asd','awdsdsad','2020-10-12 09:32:04','2020-10-12 09:32:04',1),(3,'dev','asd','sss','asd','2020-10-12 09:33:14','2020-10-12 09:33:14',2),(4,'dev','zzz','dev','zzz','2020-10-12 09:33:29','2020-10-12 09:33:29',3),(5,'dev','','dev','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','2020-10-12 09:33:39','2020-10-12 09:33:39',3),(6,'asd','asd','[공지]가나다라','asd','2020-10-12 09:37:54','2020-10-12 09:37:54',18),(7,'asd','asd','[공지]가나다라','댓글','2020-10-12 09:38:12','2020-10-12 09:38:12',18),(8,'dev','dev','[공지]가나다라','댓글','2020-10-12 09:38:32','2020-10-12 09:38:32',18),(9,'sss','sss','[공지]가나다라','댓글\r\n','2020-10-12 09:39:32','2020-10-12 09:39:32',18),(10,'sss','sss','fsdfdfds','sss','2020-10-12 16:55:32','2020-10-12 16:55:32',16),(11,'tetete','1','여기핵꿀맛','진짜 맛있어요','2020-10-12 17:38:28','2020-10-12 17:38:28',19);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `num` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `file` varchar(100) NOT NULL,
  `content` varchar(200) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'ㅁㄴㅇ','gpy_rk6.jpg','일\r\n이삼\r\n사오육		','2020-10-11 14:57:38'),(2,'ㅁㄴㅇ','gbgj2.jpg','ㅁㄴㅇ\r\nㅀㅎ		','2020-10-11 14:59:46'),(3,'coupon','coupon2.png','첨부된 쿠폰 다운 후 보여주시면 원하는 \r\n음료수 2캔 증정!		','2020-10-11 15:39:19');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` varchar(20) NOT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `detail_addr` varchar(200) DEFAULT NULL,
  `extra_addr` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('465789','465789','456789','devhoony@naver.com','48053','부산 해운대구 재반로64번길 74-1','1110호',' (재송동, 한보미도아파트)','010456789','051789456'),('admin','admin','관리자','banghoooe@gmail.com','48053','부산 해운대구 재반로64번길 74-1','1110호',' (재송동, 한보미도아파트)','051-123-4567','010-1234-5678'),('asd','asd','asd','asd@asd.asd','05245','서울 강동구 천중로 6','asd',' (천호동, 집앤사스윗사이드아파트)','111asd','222asd'),('dev','dev','dev','devhoony@naver.com','06302','서울 강남구 양재천로 163','123',' (도곡동)','dev','dev'),('sss','sss','sss','sss@sss.sss','07622','서울 강서구 남부순환로 5','ssss',' (공항동)','sss','sss'),('tetete','aaaaa','악플러','engineer201@naver.com','06035','서울 강남구 가로수길 5','11',' (신사동)','','');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `category` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `cost` varchar(50) NOT NULL,
  `file` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('요리부','고추잡채와꽃빵','小 ￦30,000 大 ￦ 43,000','gj_rk1.jpg','2020-10-08',9),('식사부','곱빼기','￦1,000','none3.jpg','2020-10-08',13),('식사부','공기밥','￦1,000','none2.jpg','2020-10-08',12),('주류','공부가주(39도)','小 ￦15,000 中 ￦25,000 大 ￦40,000','gbgj1.jpg','2020-10-08',3),('요리부','군만두(8pcs)','￦ 5,000','md1.jpg','2020-10-08',12),('요리부','깐풍새우','小 ￦27,000 大 ￦39,000','ggan_shrimp1.jpg','2020-10-08',6),('요리부','깐풍육','小 ￦25,000 大 ￦38,000','gpy_rk2.jpg','2020-10-08',4),('요리부','꽃빵(5pcs)','￦5,000','ggbb1.jpg','2020-10-08',13),('주류','대만죽엽청주(45도)','￦60,000','jycj1.jpg','2020-10-08',1),('식사부','땡초짜장','￦ 6,500','jjm_rk2.jpg','2020-10-08',2),('식사부','락경짬뽕','￦ 8,500','rkzb_rk1.jpg','2020-10-08',4),('요리부','류산슬','￦30,000','ryu_rk1.jpg','2020-10-08',7),('식사부','류산슬밥','￦ 12,000','ryubob1.jpg','2020-10-08',10),('주류','맥주(카스,테라,하이트)','￦4,000','beer1.jpg','2020-10-08',9),('요리부','미니탕수육','￦11,000','mini_rk10.jpg','2020-10-08',1),('식사부','백짬뽕','￦8,000','whitezb_rk1.jpg','2020-10-08',5),('주류','북경고량주(50도)','￦8,000','bkgr1.jpg','2020-10-08',6),('주류','북경소주(34도)','￦15,000','bksj1.jpg','2020-10-08',5),('요리부','사천탕수육','小 ￦22,000 大 ￦33,000','st_rk2.jpg','2020-10-08',3),('식사부','새우볶음밥','￦ 7,500','sf_rk1.jpg','2020-10-08',7),('주류','소주(좋은데이,진로,대선,시원)','￦4,000','soju1.jpg','2020-10-08',8),('주류','연태고량주(34도)','小 ￦14,000 大 ￦24,000','ytgr1.jpg','2020-10-08',4),('주류','음료수(펩시,칠성,미린다(파인))','￦1,500','csm1.jpg','2020-10-08',10),('주류','이과두주(47도)','￦4,000','egdj1.jpg','2020-10-08',7),('식사부','잡채밥','￦ 8,000','jcb_rk1.jpg','2020-10-08',8),('식사부','잡탕밥','￦13,000','jtbob1.jpg','2020-10-08',11),('주류','죽엽청주(47도)','小 ￦20,000 大 ￦40,000','jy1.jpg','2020-10-08',2),('식사부','짜장면','￦6,000','jjm_rk1.jpg','2020-10-08',1),('식사부','짬뽕','￦ 7,000','zb_rk1.jpg','2020-10-08',3),('식사부','짬뽕밥','￦8,000','none1.jpg','2020-10-08',9),('요리부','짬뽕탕','￦ 20,000','none.jpg','2020-10-08',11),('요리부','칠리새우','小 ￦27,000 大 ￦39,000','cs_rk1.jpg','2020-10-08',5),('요리부','탕수육','小 ￦20,000 大 ￦30,000','tang_rk3.jpg','2020-10-08',2),('요리부','팔보채','￦33,000','pbc1.jpg','2020-10-08',8),('요리부','해물누룽지탕','小 ￦32,000 大 ￦44,000','hmnrg1.jpg','2020-10-08',10),('식사부','해물쟁반짜장(2인)','￦15,000','jbjj_rk1.jpg','2020-10-08',6);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-13 14:04:21
