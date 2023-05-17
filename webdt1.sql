-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: webdt
-- ------------------------------------------------------
-- Server version	8.0.30

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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'đề xuất'),(2,'nổi bật'),(3,'giá rẻ'),(4,'trả góp');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_name` varchar(350) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Trần Vũ Minh Quý','minhquy3107@gmail.com','+84342939269','chu de 1','sản phẩm tốt',1,'2023-04-01 21:39:47','2023-05-14 00:43:15'),(2,'Đào Trọng Phúc','phucdt@gmail.com','0963991723','mua hàng','t chưa nhận đc hàng đặt',0,'2023-05-17 00:20:27','2023-05-17 00:20:27');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galery`
--

DROP TABLE IF EXISTS `galery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `thumbnail` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `galery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galery`
--

LOCK TABLES `galery` WRITE;
/*!40000 ALTER TABLE `galery` DISABLE KEYS */;
/*!40000 ALTER TABLE `galery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `num` int DEFAULT NULL,
  `total_money` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,1,6100000,1,6100000),(15,13,6,12000000,1,12000000),(16,14,6,12000000,1,12000000),(17,14,5,5000000,1,5000000);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `fullname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `total_money` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'Trương Văn Tân','tantv@gmail.com','0123456789','Hà Đông','mua đt','2023-05-13 00:00:00',2,13420000),(13,5,'Đào Trọng Phúc','phucdt@gmail.com','0963991723','Hà Đông','iphone','2023-05-16 23:57:05',0,12000000),(14,5,'Đào Trọng Phúc','phucdt@gmail.com','0963991723','Hà Đông','đặt mua 2 chiếc iphone','2023-05-17 02:54:37',0,17000000);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `title` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `thumbnail` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `symbol` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pin` int DEFAULT NULL,
  `ram` int DEFAULT NULL,
  `rom` int DEFAULT NULL,
  `CPU` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `KTmanHinh` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cameraTruoc` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cameraSau` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,2,'Huawei-mate-20-pro-green',6500000,6100000,'img/products/huawei-mate-20-pro-green-600x600.jpg','<p>Hãng:huawei,CPU:Hisilicon Kirin 980</p>','2023-03-30 01:25:24','2023-05-17 02:02:39',0,'Huawei',4200,8,128,'Hisilicon Kirin 980','6.39\'\'','24','64'),(2,2,'Huawei-nova-3-2',7500000,7000000,'img/products/huawei-nova-3-2-600x600.jpg','<p>Hãng :huawei, CPU:&nbsp;Hisilicon Kirin 980, Kích thước màn hình: 6.3\'\'</p>','2023-05-13 16:08:33','2023-05-17 02:03:29',0,'Huawei',3750,4,128,'Hisilicon Kirin 980','6.3\'\'','24','60'),(3,2,'Huawei-y5-2017',8000000,7560000,'img/products/huawei-y5-2017-300x300.jpg','<p>Hãng: huawei, pin: 4000, ram: 4, rom:128, CPU: kirin 970, KT màn hình: 6.28\'\', camera trước : 24, camera sau: 60. </p>','2023-03-31 04:09:37','2023-05-17 02:23:56',0,'Huawei',4000,4,128,'kirin 970','6.28\'\'','24','60'),(4,4,'Ipad-wifi-32gb-2018-thumb',25000000,25000000,'img/products/ipad-wifi-32gb-2018-thumb-600x600.jpg','<p>hãng: Apple, pin: 6000, ram: 32, rom: 528, CPU: M1, Kích thước màn hình: 9.7\'\', camera trước: 32, camera sau: 128.</p>','2023-04-02 19:11:13','2023-04-19 18:19:57',0,'Apple',6000,32,528,'M1','9.7\'\'','32','128'),(5,3,'Iphone-7-plus-32gb',5000000,5000000,'img/products/iphone-7-plus-32gb-600x600.jpg','<p>hãng: Apple, pin: 2800, ram: 4, rom: 32, CPU: A10, kích thước màn hình: 5.28\'\', camera trước: 24, camera sau:32 </p>','2023-04-02 19:11:16','2023-04-19 18:19:58',0,'Apple',2800,4,32,'A10','5.28\'\'','24','32'),(6,4,'Iphone-x-256gb-silver',12000000,12000000,'img/products/iphone-x-256gb-silver-400x400.jpg','hãng: Apple, pin: 2800, ram: 4, rom: 32, CPU: A10, kích thước màn hình: 6.3\'\', camera trước: 24, camera sau:64','2023-04-02 19:14:19','2023-05-17 02:24:18',0,'Apple',2800,4,32,'A10','6.3\'\'','24','64'),(7,3,'Mobiistar-b310-orange',1200000,1000000,'img/products/mobiistar-b310-orange-600x600.jpg','<p>hãng: Mobistar , pin: 8000, ram: 1, rom: 16, CPU: Snapdragon 888+, kích thước màn hình: 3\'\', camera trước: 0, camera sau: 16 <br></p>','2023-04-02 19:54:21','2023-05-17 02:23:12',0,'Mobistar',8000,1,16,'Snapdragon 888+','3\'\'','0','16'),(8,2,'Mobiistar-e-selfie-300',5400000,5400000,'img/products/mobiistar-e-selfie-300-600x600.jpg','<p>hãng: Mobistar , pin: 5000, ram: 4, rom: 32, CPU: Snapdragon 415, kích thước màn hình: 6\'\', camera trước: 12, camera sau: 64<br></p>','2023-04-02 19:45:23','2023-04-19 19:02:02',0,'Mobistar',5000,4,32,'Snapdragon 415','6\'\'','12','64'),(9,3,'Mobiistar-x-3',4800000,4800000,'img/products/mobiistar-x-3-600x600.jpg','<p>hãng: Mobistar , pin: 3800, ram: 4, rom: 16, CPU: Snapdragon 515, kích thước màn hình: 6.2\'\', camera trước: 16, camera sau: 24<br></p>','2023-04-02 19:36:26','2023-04-19 19:08:04',0,'Mobistar',3800,4,16,'Snapdragon  515','6.2\'\'','16','24'),(10,4,'Mobiistar-zumbo-s2-dual',8000000,8000000,'img/products/mobiistar-zumbo-s2-dual-300x300.jpg','<p>hãng: Mobistar , pin: 8000, ram: 4, rom: 128, CPU: Snapdragon 712, kích thước màn hình: 6.8\'\', camera trước: 24, camera sau: 6<br></p>','2023-04-02 19:47:28','2023-04-19 19:06:05',0,'Mobistar',8000,4,128,'Snapdragon 712','6.8\'\'','24','60'),(11,2,'Nokia-51-plus-black',6500000,6500000,'img/products/nokia-51-plus-black-400x400.jpg','<p>hãng: Nokia , pin: 8000, ram: 4, rom: 128, CPU: Snapdragon 450, kích thước màn hình: 6.3\'\', camera trước: 24, camera sau: 64 <br></p>','2023-04-02 19:52:30','2023-05-17 02:24:27',0,'Nokia',8000,4,128,'Snapdragon 450','6.3\'\'','24','64'),(12,3,'Oppo-a3s-32gb',5700000,5700000,'img/products/oppo-a3s-32gb-600x600.jpg','<p>hãng: Oppo, pin: 4500, ram: 4, rom: 32, CPU: A3, kích thước màn hình: 5.6\'\', camera trước: 24, camera sau: 48 <br></p>','2023-04-02 19:06:33','2023-04-19 19:42:06',0,'Oppo',4500,4,32,'A3','5.6\'\'','24','48'),(13,4,'Oppo-f9-red',7800000,7800000,'img/products/oppo-f9-red-600x600.jpg','<p>hãng: Oppo, pin: 5800, ram: 4, rom: 16, CPU: Snapdragon 715, kích thước màn hình: 5.8\'\', camera trước: 24, camera sau: 48<br></p>','2023-04-02 19:05:35','2023-04-19 19:27:07',0,'Oppo',5800,4,16,'Snapdragon 715','5.8\'\'','24','48'),(14,2,'Samsung-galaxy-a8-plus',11000000,11000000,'img/products/samsung-galaxy-a8-plus-2018-gold-600x600.jpg','<p>hãng: Samsung, pin: 4000, ram: 4, rom: 128, CPU: Kryo 465, kích thước màn hình: 5.8\'\', camera trước: 24, camera sau: 64 <br></p>','2023-04-02 19:13:37','2023-04-19 19:27:10',0,'Samsung',4000,4,128,'Kryo 465','5.8\'\'','24','64'),(15,4,'Samsung-galaxy-j4-plus-pink',14000000,14000000,'img/products/samsung-galaxy-j4-plus-pink-400x400.jpg','<p>hãng: Samsung, pin: 4000, ram: 8, rom: 128, CPU: kryo 777, kích thước màn hình: 6.8\'\', camera trước: 24, camera sau: 64 <br></p>','2023-04-02 19:27:39','2023-04-19 19:27:11',0,'Samsung',4000,8,128,'kryo 777','6.8\'\'','24','64'),(16,3,'Xiaomi-mi-8-1',4300000,4300000,'img/products/xiaomi-mi-8-1-600x600.jpg','<p>hãng: Xiaomi, pin: 4000, ram: 4, rom: 128, CPU: Snapdragon 712, kích thước màn hình: 5.9\'\', camera trước: 24, camera sau: 48<br></p>','2023-04-02 19:20:42','2023-04-19 19:29:12',0,'Xiaomi',4000,4,128,'Snapdragon 712','5.9\'\'','24','48'),(17,2,'Xiaomi-mi-8-lite-black-1',5000000,5000000,'img/products/xiaomi-mi-8-lite-black-1-600x600.jpg','<p>hãng: Xiaomi, pin: 5000, ram: 4, rom: 32, CPU: Snapdragon 615, kích thước màn hình: 6\'\', camera trước: 24, camera sau: 48<br></p>','2023-04-02 19:07:44','2023-04-19 19:19:13',0,'Xiaomi',5000,4,32,'Snapdragon 615','6\'\'','24','48'),(18,1,'Xiaomi-redmi-5-plus',6500000,6500000,'img/products/xiaomi-redmi-5-plus-600x600.jpg','<p>hãng: Xiaomi, pin: 5200, ram: 4, rom: 128, CPU: Snapdragon 888, kích thước màn hình: 6.3\'\', camera trước: 24, camera sau: 48 <br></p>','2023-04-02 19:32:46','2023-05-17 02:24:37',0,'Xiaomi',5200,4,128,'Snapdragon 888','6.3\'\'','24','48'),(19,3,'Xiaomi-redmi-note-5-pro',4300000,4300000,'img/products/xiaomi-redmi-note-5-pro-600x600.jpg','<p>hãng: Xiaomi, pin: 4500, ram: 4, rom: 16, CPU: Kryo 412, kích thước màn hình: 5\'\', camera trước: 16, camera sau: 48 <br></p>','2023-04-02 19:25:48','2023-04-19 19:29:15',0,'Xiaomi',4500,4,16,'Kryo 412','5\'\'','16','48'),(20,4,'Oppo A77s 8GB-128GB',6290000,6290000,'img/products/photosoppo-a77s-den (2).jpg','<p>hãng: Oppo, kích thước màn hình: 6.55\'\', ram: 8 gb,rom: 128gb CPU: snapdragon 680.</p>','2023-04-15 11:19:42','2023-04-19 19:29:16',0,'Oppo',0,8,126,'Snapdragon 680','6.55\'','',''),(21,3,'realme C30s 2GB-32GB',1890000,1890000,'img/products/photosrealme-c30s-xanh-5 (2).jpg','','2023-04-15 11:03:49','2023-05-16 23:49:37',1,'Realme',0,0,0,'','','','');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_product` int NOT NULL,
  `star` int DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,3,'sp dùng tốt','2023-05-15 19:54:42',0),(2,1,7,3,'sp dùng đc','2023-05-16 02:16:26',0),(13,5,2,4,'sp dùng tốt','2023-05-16 23:17:41',0),(15,5,7,3,'dùng tạm ổn','2023-05-16 02:45:54',0),(16,5,21,3,'dùng tốt','2023-05-16 11:28:40',0),(17,5,11,3,'sp dùng đc','2023-05-16 11:32:45',0),(18,5,3,4,'sp dùng tốt','2023-05-16 18:24:54',0),(19,5,5,4,'sp dùng tốt','2023-05-16 19:37:51',0),(20,7,21,2,'sp tệ','2023-05-16 21:15:35',0),(21,7,19,3,'sp dùng tạm đc','2023-05-16 21:16:10',0),(22,7,2,3,'sp dùng tạm đc','2023-05-16 21:20:24',0),(23,7,11,4,'dùng ok','2023-05-16 21:20:52',0),(24,6,14,4,'dùng tốt','2023-05-16 21:26:31',0),(25,6,19,1,'dùng tệ','2023-05-16 21:29:54',0),(26,6,7,1,'dùng chán quá','2023-05-16 21:32:51',0),(27,5,6,5,'dùng rất tốt','2023-05-16 23:58:12',0),(28,5,20,3,'dùng tạm đc','2023-05-17 11:55:14',0);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `user_id` int NOT NULL,
  `token` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`token`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Trương Văn Tân','tantv@gmail.com','0123456789','Hà Đông','1234567890',2,'2023-05-12 14:55:50','2023-05-17 02:17:54',0),(4,'Trần Vũ Minh Quý','minhquy3107@gmail.com','0342939269','Hà Đông','12345678',1,'2023-05-13 00:00:17','2023-05-13 03:56:22',0),(5,'Đào Trọng Phúc','phucdt@gmail.com','0963991723','Hà Đông','dt123456',2,'2023-05-13 11:10:11','2023-05-15 21:34:39',0),(6,'Nguyễn Hoàng Việt','vietnh@gmail.com','0932941538','Hà Đông','nh123456',2,'2023-05-13 11:12:01','2023-05-13 11:12:01',0),(7,'Phạm Hải Đăng','dangdb@gmail.com','0355916018','Hà Đông','db123456',2,'2023-05-15 13:39:53','2023-05-17 02:17:34',0),(11,'ádfghjkl','m@gmail.com','12345678','Hà Nội','kmz123456',2,'2023-05-15 21:21:05','2023-05-15 21:23:33',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-17 12:35:20
