-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: electronic_store
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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `user_user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FKbut5u81fns8galxagpxo98om4` (`user_user_id`),
  CONSTRAINT `FKbut5u81fns8galxagpxo98om4` FOREIGN KEY (`user_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('0e8cb84f-3546-4e42-82aa-711ddcfd1005','2023-08-21 12:45:43.781000','c7ddd108-008d-4895-b407-e401cbb51eed'),('6e7ddb8c-3243-4a24-854f-22372f4be55c','2023-08-21 12:39:59.222000','f8473a1b-c1dc-436a-944d-26eb19ba195b'),('996170dd-5f1a-4e14-b69c-aded329ea8bc','2023-11-23 12:52:42.330000','ded77eed-a6ea-4478-a93c-2b8b635bf73e');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `total_price` int NOT NULL,
  `cart_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `FK99e0am9jpriwxcm6is7xfedy3` (`cart_id`),
  KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`),
  CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FK99e0am9jpriwxcm6is7xfedy3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (54,1,19000,'0e8cb84f-3546-4e42-82aa-711ddcfd1005','70ec0d8c-63d3-44ad-bb00-7f1bffd3b396'),(55,1,1200,'0e8cb84f-3546-4e42-82aa-711ddcfd1005','b0dbf308-0e37-41b8-bf1f-656a6e97f5ce');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` varchar(255) NOT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `category_desc` varchar(500) DEFAULT NULL,
  `category_title` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('5f702550-8684-4161-a9bd-51740fabf8ad','https://www.polytechnichub.com/wp-content/uploads/2017/04/Electronic.jpg','This  category contains   trending products related to electronics .','Trending Products'),('6498f4fa-5b82-494b-a508-dbf732d3275f','https://c8.alamy.com/comp/2GGXJK1/full-body-profile-side-photo-of-young-girl-clothes-fashion-collection-wardrobe-isolated-over-pink-color-background-2GGXJK1.jpg','This category contains products related to cloths','Clothing Deals'),('a10ae514-4540-48ea-9f8c-791575656a6e','https://thumbs.dreamstime.com/b/many-used-modern-electronic-gadgets-use-white-floor-reuse-recycle-concept-top-view-153892434.jpg','This is electronics category . which stores the electronics items  for sale.','Electronics'),('d72b4f56-43d4-4b05-bdfc-616faeab3493','https://img.freepik.com/premium-photo/sports-equipment-wooden-background_51195-86.jpg','This category contains  products related to sporsts.','Sports'),('fc5d48cd-70bc-4f50-a769-a229f7b614a4','https://m.media-amazon.com/images/I/51AhIaJKLtS.jpg','This category contains best smart phones recommended by durgesh sir. this   is best','Best Smart Phones');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `total_price` int NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `FKbioxgbv59vetrxe0ejfubep1w` (`order_id`),
  KEY `FKocimc7dtr037rh4ls4l95nlfi` (`product_id`),
  CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FKocimc7dtr037rh4ls4l95nlfi` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,4200,'b779be96-a488-44ba-b2dd-b115cf2fcc06','d308482b-8157-4dec-acf6-43382fce157b'),(2,1,2500,'b779be96-a488-44ba-b2dd-b115cf2fcc06','9c6a038c-6c17-4427-bf71-1d72500e95fe'),(3,1,19000,'7b7aed71-738f-4b26-b48b-bca4dbc43833','70ec0d8c-63d3-44ad-bb00-7f1bffd3b396'),(4,1,1200,'7b7aed71-738f-4b26-b48b-bca4dbc43833','b0dbf308-0e37-41b8-bf1f-656a6e97f5ce'),(5,1,1299,'c48b09d4-027f-415b-b416-c2baaa6a5a4f','9f913624-b5ea-4b03-8cfb-fe5beb4017be'),(6,1,19000,'1de3de2f-4d6a-45f9-8f00-40b27cb6b86f','70ec0d8c-63d3-44ad-bb00-7f1bffd3b396'),(7,1,1200,'1de3de2f-4d6a-45f9-8f00-40b27cb6b86f','b0dbf308-0e37-41b8-bf1f-656a6e97f5ce'),(8,1,1299,'1de3de2f-4d6a-45f9-8f00-40b27cb6b86f','9f913624-b5ea-4b03-8cfb-fe5beb4017be'),(9,1,4200,'1de3de2f-4d6a-45f9-8f00-40b27cb6b86f','d308482b-8157-4dec-acf6-43382fce157b'),(10,1,81500,'1de3de2f-4d6a-45f9-8f00-40b27cb6b86f','a4f0d02d-b628-4abf-980a-44e82f87c0dc'),(11,1,19000,'c90fb1e5-3723-477d-b24e-2f5004eccfe9','70ec0d8c-63d3-44ad-bb00-7f1bffd3b396'),(12,1,1200,'c90fb1e5-3723-477d-b24e-2f5004eccfe9','b0dbf308-0e37-41b8-bf1f-656a6e97f5ce'),(13,1,1299,'c90fb1e5-3723-477d-b24e-2f5004eccfe9','9f913624-b5ea-4b03-8cfb-fe5beb4017be'),(14,1,19000,'07dec411-d774-4dac-98df-5f599fe0099d','70ec0d8c-63d3-44ad-bb00-7f1bffd3b396'),(15,1,19000,'4dff4903-60f0-4553-8413-f35df65072aa','70ec0d8c-63d3-44ad-bb00-7f1bffd3b396'),(16,1,19000,'fa3c4dba-0193-42cb-9189-ee786ef291fe','70ec0d8c-63d3-44ad-bb00-7f1bffd3b396'),(17,1,19000,'cb8e9c3b-dd3b-479a-b238-34dc72549665','70ec0d8c-63d3-44ad-bb00-7f1bffd3b396');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(255) NOT NULL,
  `billing_address` varchar(1000) DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  `billing_phone` varchar(255) DEFAULT NULL,
  `delivered_date` datetime(6) DEFAULT NULL,
  `order_amount` int NOT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `ordered_date` datetime(6) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `razory_pay_order_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('07dec411-d774-4dac-98df-5f599fe0099d','testing address','Durgesh Kumar Tiwari','2424524',NULL,19000,'PENDING','2023-11-23 13:19:28.512000','NOTPAID','ded77eed-a6ea-4478-a93c-2b8b635bf73e','pay_N6zeQAp4fkCFvn','order_N6zdxnPVA7svZb'),('1de3de2f-4d6a-45f9-8f00-40b27cb6b86f','23523/235235 New Vihar , Delhi','Vandna Tiwari','12345657',NULL,107199,'DELIVERED','2023-08-26 13:43:09.802000','NOTPAID','f8473a1b-c1dc-436a-944d-26eb19ba195b',NULL,NULL),('4dff4903-60f0-4553-8413-f35df65072aa','Testing address','Webhook Test','123456789',NULL,19000,'PENDING','2023-12-01 12:36:59.620000','NOTPAID','ded77eed-a6ea-4478-a93c-2b8b635bf73e','pay_N6zcZ6F2vz8VFG','order_N6zcFzVA9a0Ui2'),('7b7aed71-738f-4b26-b48b-bca4dbc43833','235/235 Noida , INDIA','Durgesh Kr. Tiwari','3214532154',NULL,20200,'PENDING','2023-08-22 23:50:40.852000','NOTPAID','c7ddd108-008d-4895-b407-e401cbb51eed',NULL,NULL),('b779be96-a488-44ba-b2dd-b115cf2fcc06','2352/23523 Gomti nagar lucknow, INDIA ','Durgesh Kumar Tiwari','123456789',NULL,6700,'PENDING','2023-08-22 23:48:11.192000','NOTPAID','c7ddd108-008d-4895-b407-e401cbb51eed',NULL,NULL),('c48b09d4-027f-415b-b416-c2baaa6a5a4f','Another order just for testing','Durgesh Kr. Tiwari','23525',NULL,1299,'PENDING','2023-08-22 23:51:28.824000','NOTPAID','c7ddd108-008d-4895-b407-e401cbb51eed',NULL,NULL),('c90fb1e5-3723-477d-b24e-2f5004eccfe9','Testing address','Durgesh Kumar Tiwari','123353535',NULL,21499,'PENDING','2023-11-23 13:00:02.055000','NOTPAID','ded77eed-a6ea-4478-a93c-2b8b635bf73e','pay_N6zkGgB3pY8Jqg','order_N6zjusHmPgBuoj'),('cb8e9c3b-dd3b-479a-b238-34dc72549665','Testing webhooks address','Durgesh Kumar Tiwari','2345675435',NULL,19000,'PENDING','2023-12-01 13:23:17.238000','PAID','ded77eed-a6ea-4478-a93c-2b8b635bf73e','pay_N718cXUi1v9a33','order_N718EaKm5SPEH1'),('fa3c4dba-0193-42cb-9189-ee786ef291fe','Testing working','Durgesh Kumar Tiwari','7412895412',NULL,19000,'PENDING','2023-12-01 12:46:51.412000','NOTPAID','ded77eed-a6ea-4478-a93c-2b8b635bf73e',NULL,'order_N6zmfL3sMghj4J');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` varchar(255) NOT NULL,
  `added_date` datetime(6) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `discounted_price` int NOT NULL,
  `live` bit(1) NOT NULL,
  `price` int NOT NULL,
  `product_image_name` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `stock` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('043d35f2-bade-4b25-8a35-82feb6a52061','2023-08-05 23:51:50.123000','<h2><span style=\"color: rgb(33, 33, 33);\">Google Pixel 7a ----(Charcoal, 128 GB)&nbsp;&nbsp;(8 GB RAM)</span></h2><p><br></p><p><span style=\"color: rgb(33, 33, 33);\">Experience the simplicity and seamless transitions with the Google Pixel 7a, which is loaded with a variety of incredible features. The Tensor G2 processor, designed by Google, boosts the Pixel 7a\'s speed, effectiveness, and security. It\'s the same chip that\'s in Pixel 7 and Pixel 7 Pro. Furthermore, With a dual rear camera system and Google Tensor G2\'s advanced image processing, Pixel 7a lets you create perfect photos every time. It\'s easy to take amazing pictures in low light, or fix your blurry photos and remove distractions with a few taps in Google Photos. Moreover, the Pixel 7a camera includes Super Res Zoom, so that you can get up close without an extra telephoto lens.</span></p><p><br></p><p>Tensor G2: The Brains Behind Pixel 7a</p><p>Engineered by Google, the Tensor G2 chip makes Pixel 7a faster, more efficient, and more secure. It\'s the same chip that\'s in Pixel 7 and Pixel 7 Pro.</p><p><br></p><p>Pixel 7a Camera: Great Photography Made Simple</p><p>With a dual rear camera system and Google Tensor G2\'s advanced image processing, Pixel 7a lets you create perfect photos every time. It\'s easy to take amazing pictures in low light, or fix your blurry photos and remove distractions with a few taps in Google Photos.</p><p><br></p><p>Camera Features: That Help You Express Yourself</p><p>The Pixel 7a camera includes Super Res Zoom, so you can get up close without an extra telephoto lens. Furthermore, you also get camera features such as Real Tone, Magic Eraser, Photo Unblur, Night Sight, Guided Frame, and Long Exposure.</p><p><br></p><p><br></p><p><br></p>',4300,_binary '',4500,'c51175d0-0f34-4e51-be3a-596fc0621f79.png',50,_binary '\0','Google Pixel 7a','d72b4f56-43d4-4b05-bdfc-616faeab3493'),('70ec0d8c-63d3-44ad-bb00-7f1bffd3b396','2023-08-16 14:28:15.909000','<p><span style=\"color: rgb(33, 33, 33);\">SAMSUNG Galaxy F34 5G (Electric Black, 128 GB)&nbsp;&nbsp;(6 GB RAM)</span></p><p><span class=\"ql-cursor\">﻿</span>Product Description</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/ff21bf5d82ec4672896f7018927e7447_189c05984a9_3.jpg.jpeg?q=90\"></span></p><p>120 Hz AMOLED Display</p><p>This Samsung smartphone boasts a 16.42 cm FHD+ sAMOLED Display that provides a higher refresh rate of 120 Hz so you get perfect pacing and get to view every frame within the content. Designed with FHD+ and enhanced with 1000 nits of brightness Vision Booster, enjoy your time spent on the phone.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/45e91812fd61449bb1bd275677545a5b_189c05a4118_3.1.jpg.jpeg?q=90\"></span></p><p>Protected by Gorilla Glass 5</p><p>The addition of Gorilla glass 5 helps in making your phone durable enough to withstand a sudden drop while also improving the touch abilities. The glass shields your phone from scratches, marks or drops.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/2d2a9e017ae44a4c8f30f19f805670ab_189c05aaa53_3.2.jpg.jpeg?q=90\"></span></p><p>Eye Care and Comfort</p><p>Watch your favourite shows or play games without straining your eyes as this phone is designed to suit low-light situations offering comfort to the eyes.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/a1a43d8782c54f5b93549214715ee9d5_189c05b3c25_4.jpg.jpeg?q=90\"></span></p><p>50 MP No Shake Camera</p><p>Click beautiful pictures all day with interesting Fun filters, Nightography mode, and Single Take on this 50 MP No-shake camera.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/8d2974fc2df445358d57fd8d4217e7d0_189c05b92ec_4.1.jpg.jpeg?q=90\"></span></p><p>Auto Night Mode</p><p>The presence of Auto Night Mode lets you take incredible photos even in the dark. So keep clicking amazing pictures all night and create wild memories.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/230df376896d4967b30d926070981204_189c05be232_4.2.jpg.jpeg?q=90\"></span></p><p>4K Resolution Videos</p><p>Create vlogs or take videos in 4K resolution where the pictures look clear and realistic and are not pixelated.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/55842d6f0fb94582b28511636f243fbe_189c05c3ad2_4.3.jpg.jpeg?q=90\"></span></p><p>Breathtaking Captures</p><p>The 8 MP ultra-wide camera lets you capture stunning scenery where you can see the world with a 120-degree view.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/7eda0f5e67944445921ddeb1f4e6dcf1_189c05c82a5_4.4.jpg.jpeg?q=90\"></span></p><p>Fun Modes</p><p>Capture stunning portraits with a Single Take and use the different lens effects with the Fun Mode.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/32f45563bf214d31baecc0bde4f4f9ac_189c05cb956_5.jpg.jpeg?q=90\"></span></p><p>6000 mAh Large Battery</p><p>With 6000 mAh large battery, you can browse applications, stream movies, binge-watch shows, surf and scroll non-stop as the battery can last up to 2 days.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/04753a2ee2a44b29bffe60fe8f596d28_189c05d1d0e_6.jpg.jpeg?q=90\"></span></p><p>11 5G Bands</p><p>Enjoy uninterrupted internet access that is super-fast, reliable, and worry-free on this smartphone which comprises 11 Bands and Smart Hotspot.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/995f4c2099a94517aa71936c15dd153e_189c05d61b3_7.jpg.jpeg?q=90\"></span></p><p>Dolby Atmos</p><p>Experience outstanding audio quality with the power of Dolby Atmos which delivers rich surround sound like no other.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/e6123efdaa7141ff966b151d4cc67393_189c05db009_9.jpg.jpeg?q=90\"></span></p><p>Exceptional Clarity</p><p>With Voice Focus feature, you can hear loud and clear and communicate with the other person without any background noise interference.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/a60bec7c42564f29bc8014db2b798cd0_189c05e02c3_10.jpg.jpeg?q=90\"></span></p><p>Convenient Payments</p><p>With the Samsung Wallet, you can conveniently make your payments and store all important documents securely and in one place.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/df6b887fbcb34be5978e967992d21660_189c05e4074_11.jpg.jpeg?q=90\"></span></p><p>Knox Protection</p><p>Your privacy is important and Knox Security ensures that all your personal information is safe and secure.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/d71fe6b790b440e780e5a9b7ba01298e_189c05e8299_13.jpg.jpeg?q=90\"></span></p><p>Powerful Processor</p><p>Enjoy seamless scrolling and streaming with the robust and powerful Exynos 1280 - 5 nm Processor.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/53e8cba57f7345c0b7c72e1cf756b911_189c05ec3a5_14.jpg.jpeg?q=90\"></span></p><p>Immense Memory</p><p>With the RAM Plus, you can expand your memory and enjoy multitasking.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/882c49cfcb184c04935303e4d51e6ca9_189c05effe4_15.jpg.jpeg?q=90\"></span></p><p>Huge Storage Space</p><p>The 128 GB ROM offers a large storage space that can further be expanded up to 1 TB using a micro SD card.</p>',19000,_binary '',20000,'e4955b71-7ac8-45ec-9816-6311b1970fd3.jpeg',500,_binary '','SAMSUNG Galaxy F34 5G','5f702550-8684-4161-a9bd-51740fabf8ad'),('9c6a038c-6c17-4427-bf71-1d72500e95fe','2023-08-08 12:57:49.153000','<h2><strong style=\"color: rgb(33, 33, 33);\" class=\"ql-size-small\">De Venta Leather Bat Power Game 007, Free Leather Ball, 33.5 Inches Full Size Original Kashmir Willow Cricket Bat&nbsp;&nbsp;(1200 g)</strong></h2><p><br></p><p>Available offers</p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Special PriceGet extra 14% off (price inclusive of cashback/coupon)<span style=\"color: rgb(40, 116, 240);\">T&amp;C</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Bank Offer10% Instant Discount on ICICI Bank Credit Card Txns, up to ₹1,250 on orders of ₹5,000 and above<span style=\"color: rgb(40, 116, 240);\">T&amp;C</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Bank Offer10% Instant Discount on ICICI Bank Credit Card EMI Txns, up to ₹1,750 on orders of ₹5,000 and above<span style=\"color: rgb(40, 116, 240);\">T&amp;C</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Bank Offer10% Instant Discount on ICICI Bank Debit Card and EMI Txns, up to ₹500 on orders of ₹5,000 and above<span style=\"color: rgb(40, 116, 240);\">T&amp;C</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Extra ₹500 Off on Bikes &amp; Scooters on purchase of ₹30,000 or more<span style=\"color: rgb(40, 116, 240);\">T&amp;C</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Partner OfferSign-up for Flipkart Pay Later &amp; get free Times Prime Benefits worth ₹10,000*<span style=\"color: rgb(40, 116, 240);\">Know More</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Bank Offer10% Instant Discount on Kotak Bank Credit Card Txns, up to ₹1,250 on orders of ₹5,000 and above<span style=\"color: rgb(40, 116, 240);\">T&amp;C</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Bank Offer10% Instant Discount on Kotak Bank Credit Card EMI Txns, up to ₹1,750 on orders of ₹5,000 and above<span style=\"color: rgb(40, 116, 240);\">T&amp;C</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Bank OfferExtra ₹500 off on ICICI Bank Credit EMI Txns on Net Cart Value of ₹24999 and above<span style=\"color: rgb(40, 116, 240);\">T&amp;C</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Bank OfferExtra ₹500 off on ICICI Bank Debit Card EMI Txns on Net Cart Value of ₹24,999 and above<span style=\"color: rgb(40, 116, 240);\">T&amp;C</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Bank Offer10% Instant Discount on Kotak Bank Debit Card &amp; EMI Txns, up to ₹500, on orders of ₹5,000 and above<span style=\"color: rgb(40, 116, 240);\">T&amp;C</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Bank OfferExtra ₹500 off on Kotak Bank Credit Card EMI Txns on Net Cart Value of ₹24,999 and above<span style=\"color: rgb(40, 116, 240);\">T&amp;C</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Bank Offer5% Cashback on Flipkart Axis Bank Card<span style=\"color: rgb(40, 116, 240);\">T&amp;C</span></p><p><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/www/36/36/promos/06/09/2016/c22c9fc4-0555-4460-8401-bf5c28d7ba29.png?q=90\" height=\"18\" width=\"18\"></span>Partner OfferPurchase now &amp; get 1 surprise cashback coupon in Future<span style=\"color: rgb(40, 116, 240);\">Know More</span></p><p><br></p><p><strong style=\"color: rgb(135, 135, 135);\">Highlights</strong></p><ul><li>Age Group 15+ Yrs</li><li>Blade Made of Kashmir Willow</li><li>Advanced Playing Level</li><li>Bat Grade: Grade 2</li><li>Sport Type: Cricket</li><li>With Cover</li><li>Weight Range 1200 g</li></ul><p><br></p><p><strong>Description</strong></p><p>Introducing the premium Cricket Leader Bat, exclusively available now. This high-performance bat is meticulously crafted to enhance your game and deliver exceptional results on the cricket field. With its outstanding features and superior design, this bat is a must-have for every cricket enthusiast.</p>',2500,_binary '',3200,'de96e905-ac97-4a03-99d5-b36865293b1b.jpeg',60,_binary '','De Venta Leather Bat Power Game 007','5f702550-8684-4161-a9bd-51740fabf8ad'),('9f913624-b5ea-4b03-8cfb-fe5beb4017be','2023-08-16 14:23:57.537000','<p><span style=\"color: rgb(33, 33, 33);\">SAMSUNG GT-E1215ZDAINS&nbsp;&nbsp;(Gold)</span></p><p><br></p><p><span class=\"ql-cursor\">﻿</span>Product Description</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-images/7bebf8c192604d08a7eac24271368f07_16fd0981bfa_image.png?q=90\"></span></p><p>MP3 Ringtones</p><p>Preloaded with MP3 ringtones, this phone lets you choose a nice song when you get a call or message.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-images/88a8ef37f0fc4800936dbaf82817aac3_16fd0982ff8_image.png?q=90\"></span></p><p>Torchlight</p><p>This inbuilt mini-flashlight is extremely handy as it lights up the path when you are walking in a dark alley.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-images/4feab617f60943b192b0588854c8d0fe_16fd098470f_image.png?q=90\"></span></p><p>Simple and Compact Design</p><p>This phone sports an uncluttered design that lets you make a great style statement. Its unique scalloped surface back is designed to give you a good grip. It is quite sleek too, making it easy for you to carry it around.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-images/612bb505f3924dc38fd6f9f425bb82ad_16fd0985d8c_image.png?q=90\"></span></p><p>Ease of Use</p><p>Featuring a rubber anti-dust keypad, this phone is designed for usability. The dust-resistant surface keeps dust at bay. Its 4-way navigation key gives you access to popular functions. With just a press of a button, you can make calls and access your contacts.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-images/0c89566f4e45437db63c070801d0ca33_16fd098e9a2_image.png?q=90\"></span></p><p>Large Full-size Screen</p><p>This screen portrays vivid colours, thereby giving you a rich viewing experience. The screen is big enough for you to read the text clearly and view images in beautiful colours. The enhanced user interface and improved layout make your experience hassle-free and easy. You can shift from different screens easily. In addition to this, it features a powerful battery that give</p>',1299,_binary '',1300,'1e31d2d6-111f-4638-918a-ec42ce02806c.png',50,_binary '','SAMSUNG GT-E1215ZDAINS ','a10ae514-4540-48ea-9f8c-791575656a6e'),('a4f0d02d-b628-4abf-980a-44e82f87c0dc','2023-08-16 14:16:12.269000','<p><span style=\"color: rgb(33, 33, 33);\">SONY Alpha Full Frame ILCE-7M2K/BQ IN5 Mirrorless Camera Body with 28 - 70 mm Lens&nbsp;&nbsp;(Black)</span></p><p><br></p><ul><li>4K/HD format, High-performance Fast Hybrid AF, Phase-detection AF, The Sony full-frame advantage, BIONZ X?speed and precision (High-speed processing faithfully reproduces textures and details in real time, as seen by the naked eye), Expressive moviemaking, Pro-quality XAVC S format, Meticulous craftsmanship, Multi Frame NR (Noise Reduction), Anti-dust system and coating, Meticulously crafted controls, Time code / Clean HDMI output, Convenient tiltable LCD screen, WiFi &amp; NFC(One-touch remote and one-touch sharing)</li><li>Effective Pixels: 24.3 MP</li><li>Sensor Type: CMOS</li><li>WiFi Available</li><li>Full HD</li></ul><p><br></p><p><span style=\"color: rgb(33, 33, 33);\">Click breathtaking photos and blur-free videos with this Sony α7 II DSLR camera - it provides you immense freedom to reinvent your photography skills. This high-quality camera features a 5-axis Image Stabilisation, a 35 mm Full-frame 24.3 MP Exmor CMOS Sensor, and a Sony BIONZ X Image Processing Engine to allow you to capture detailed, crisp, and blur-free images and movies.</span></p>',81500,_binary '',82000,'5f694dda-280c-43dd-b9c4-80807b274fe6.png',15,_binary '','SONY Alpha Full Frame ILCE-7M2K/BQ IN5','a10ae514-4540-48ea-9f8c-791575656a6e'),('b0dbf308-0e37-41b8-bf1f-656a6e97f5ce','2023-08-16 14:25:38.502000','<p>Specifications</p><p>General</p><p>In The Box</p><ul><li>Handset, Battery, Charger, User Guide</li></ul><p>Model Number</p><ul><li>TA-1575 SS</li></ul><p>Model Name</p><ul><li>105</li></ul><p>Color</p><ul><li>Charcoal</li></ul><p>Browse Type</p><ul><li>Feature Phones</li></ul><p>SIM Type</p><ul><li>Single Sim</li></ul><p>Hybrid Sim Slot</p><ul><li>No</li></ul><p>Touchscreen</p><ul><li>No</li></ul><p>OTG Compatible</p><ul><li>No</li></ul><p>Quick Charging</p><ul><li>No</li></ul><p>Display Features</p><p>Display Size</p><ul><li>4.5 cm (1.77 inch)</li></ul><p>Resolution</p><ul><li>160 x 128 Pixels</li></ul><p>Os &amp; Processor Features</p><p>Processor Type</p><ul><li>SC6531E</li></ul><p>Primary Clock Speed</p><ul><li>0.208 GHz</li></ul><p>Operating Frequency</p><ul><li>2G GSM: 900 MHz/1800 MHz</li></ul><p>Memory &amp; Storage Features</p><p>Internal Storage</p><ul><li>32 MB</li></ul><p>RAM</p><ul><li>32 MB</li></ul><p>Camera Features</p><p>Primary Camera Available</p><ul><li>No</li></ul><p>Primary Camera</p><ul><li>0MP</li></ul><p>Optical Zoom</p><ul><li>No</li></ul><p>Secondary Camera Available</p><ul><li>No</li></ul><p>Secondary Camera</p><ul><li>0MP Front Camera</li></ul><p>Digital Zoom</p><ul><li>Yes</li></ul><p>Frame Rate</p><ul><li>NA fps</li></ul><p>Call Features</p><p>Call Wait/Hold</p><ul><li>Yes</li></ul><p>Conference Call</p><ul><li>Yes</li></ul><p>Hands Free</p><ul><li>No</li></ul><p>Video Call Support</p><ul><li>No</li></ul><p>Phone Book</p><ul><li>Yes</li></ul><p>Call Timer</p><ul><li>Yes</li></ul><p>Speaker Phone</p><ul><li>Yes</li></ul><p>Speed Dialing</p><ul><li>Yes</li></ul><p>Call Records</p><ul><li>Yes</li></ul><p>Logs</p><ul><li>Yes</li></ul><p>Connectivity Features</p><p>Network Type</p><ul><li>2G</li></ul><p>Supported Networks</p><ul><li>GSM</li></ul><p>Internet Connectivity</p><ul><li>2G</li></ul><p>3G</p><ul><li>No</li></ul><p>Micro USB Port</p><ul><li>Yes</li></ul><p>Micro USB Version</p><ul><li>v1.1</li></ul><p>Mini USB Port</p><ul><li>No</li></ul><p>Bluetooth Support</p><ul><li>No</li></ul><p>Wi-Fi</p><ul><li>No</li></ul><p>Wi-Fi Version</p><ul><li>NA</li></ul><p>Infrared</p><ul><li>No</li></ul><p>USB Connectivity</p><ul><li>Yes</li></ul><p>Audio Jack</p><ul><li>3.5 mm</li></ul><p>GPS Support</p><ul><li>No</li></ul><p>Other Details</p><p>Smartphone</p><ul><li>No</li></ul><p>SIM Size</p><ul><li>Mini Sim</li></ul><p>Instant Message</p><ul><li>Yes</li></ul><p>Business Phone</p><ul><li>Yes</li></ul><p>Removable Battery</p><ul><li>Yes</li></ul><p>SMS</p><ul><li>Yes</li></ul><p>Keypad</p><ul><li>Yes</li></ul><p>GPS Type</p><ul><li>NA</li></ul><p>Multimedia Features</p><p>FM Radio</p><ul><li>Yes</li></ul><p>FM Radio Recording</p><ul><li>Yes</li></ul><p>Music Player</p><ul><li>No</li></ul><p>Battery &amp; Power Features</p><p>Battery Capacity</p><ul><li>1000 mAh</li></ul><p>Battery Type</p><ul><li>Lithium Ion</li></ul><p>Dual Battery</p><ul><li>No</li></ul><p>Dimensions</p><p>Weight</p><ul><li>79.7 g</li></ul><p>Warranty</p><p>Warranty Summary</p><ul><li>1 Year Replacement Warranty for Device and 6 Months Manufacturer Warranty for Inbox Accessories Including Battery from the Date of Purchase</li></ul><p>Warranty Service Type</p><ul><li>Customer can call at 1800 1028 169 for customer support for further information and for any kind of service support customer can visit to nearest authorised service centre for which customer can refer our care locator to check the nearest authorised centre to his location - https://www.nokia.com/phones/en_in/support/care-center-locator</li></ul><p>Domestic Warranty</p><ul><li>1 Year</li></ul><p><br></p>',1200,_binary '',1500,'0a77e551-b6a1-4772-96d9-6016ddff2bad.jpeg',10,_binary '','Nokia 105  ','a10ae514-4540-48ea-9f8c-791575656a6e'),('c9d891f7-7eda-411c-b43a-6be20acb48df','2023-08-05 23:57:00.086000','<h2><span style=\"color: rgb(33, 33, 33);\">&nbsp;5 Hexa Core 5600H - (8 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce GTX 1650) 15ACH6 Gaming Laptop&nbsp;&nbsp;(15.6 Inch, Shadow Black, 2.25 kg</span></h2><p><br></p><p>General</p><p>Sales Package</p><ul><li>Laptop, Battery, Adapter, Cables, User Manuals</li></ul><p>Model Number</p><ul><li>15ACH6</li></ul><p>Part Number</p><ul><li>82K2025KIN</li></ul><p>Model Name</p><ul><li>Gaming 3</li></ul><p>Series</p><ul><li>Ideapad Gaming 3 AMD</li></ul><p>Color</p><ul><li>Shadow Black</li></ul><p>Type</p><ul><li>Gaming Laptop</li></ul><p>Suitable For</p><ul><li>Gaming</li></ul><p>Battery Backup</p><ul><li>Upto 5 Hours</li></ul><p>Power Supply</p><ul><li>135W Slim Tip (3-pin)</li></ul><p>MS Office Provided</p><ul><li>No</li></ul><p><br></p>',48000,_binary '',50000,'62483aa4-a24d-4b93-8b98-fff4ffe58fac.jpeg',12,_binary '','Lenovo Ideapad Gaming 3 AMD Ryzen 5 Hexa Core ','a10ae514-4540-48ea-9f8c-791575656a6e'),('cd63f375-40a5-45f2-8f62-f538b1a938ba','2023-08-08 11:42:37.486000','<h3><span style=\"color: rgb(33, 33, 33);\">MOTOROLA g14 (Steel Gray, 128 GB)&nbsp;&nbsp;(4 GB RAM).</span></h3><h3><br></h3><ol><li>4 GB RAM | 128 GB ROM | Expandable Upto 1 TB</li><li>16.51 cm (6.5 inch) Full HD+ Display</li><li>50MP + 2MP | 8MP Front Camera</li><li>5000 mAh Battery</li><li>T616 Processor</li><li>Immersive Stereo Speakers with Dolby Atmos</li></ol><p><br></p><p><br></p><p><span style=\"color: rgb(33, 33, 33);\">The moto g14 is a beautifully crafted device made from premium Acrylic Glass (PMMA), weighing just 177 g and measuring 7.99 mm thick. Immerse yourself in its 16.51 cm (6.5) Full HD+ display with a 20:9 aspect ratio, minimal bezel, and a Night Light feature. Enjoy Dolby Atmos and Moto\'s Spatial Sound for a richer audio experience. With 128 GB of internal storage (expandable to 1TB), a UNISOC T616 Octa-core processor, and 4 GB of RAM, it ensures seamless performance. Capture stunning photos with the 50 MP Quad Pixel camera system; plus, explore the world up close with the dedicated Macro Vision camera. Stay updated with Android 13 and a long-lasting 5000 mAh battery. Unlock with fingerprint or face recognition and control tasks with intuitive gestures. Embrace elegance, power, and creativity in one device.</span></p><p><br></p><p><br></p><p>Premium, Slim, Lightweight Design</p><p>Indulge in the experience of owning an elegant device that\'s been beautifully crafted from premium Acrylic Glass (PMMA) material. Weighing in at just 177 g with a thickness of a mere 7.99 mm, the moto g14 is incredibly light and slim, making it extremely comfortable to hold.</p><p><br></p><p><br></p><p><br></p><p>16.51 cm (6.5) FHD+ Display</p><p>Witness your content come to life with exceptional contrast and clarity as you immerse yourself in moto g14\'s best-in-class 16.51 cm (6.5) Full HD+ display. And an aspect ratio of 20:9 means you scroll less and see more. Find more space for work and play with its punch-hole design and minimal bezel. And while you enjoy your content, its Night Light feature reduces eye strain by casting an amber tint on the screen, making it easier to view in dim light.</p>',9999,_binary '',10000,'a830625d-bec1-494b-8881-6026e5ad1d57.jpeg',100,_binary '','MOTOROLA g14 ','fc5d48cd-70bc-4f50-a769-a229f7b614a4'),('cfaa53fe-db58-4810-b37e-f04488225193','2023-08-16 14:19:10.940000','<p><span style=\"color: rgb(33, 33, 33);\">Canon PIXMA MG2470 All-in-One Inkjet Printer&nbsp;&nbsp;(White, Grey, Ink Cartridge)</span></p><p><span style=\"color: rgb(33, 33, 33);\">Whether you need it for personal or professional purposes, the Canon PIXMA MG2470 Inkjet Printer is a versatile choice that can cater to all your printing needs. This printer’s compact size allows for easy storage even on small shelves and spaces. Moreover, this printer’s lightweight design makes it effortless to move from one location to another. Also, equipped with ink cartridges, this printer provides high-quality and crisp prints.</span></p><p><br></p><p>Compact and Lightweight</p><p>Boasting a compact size, the Canon PIXMA MG2470 Inkjet Printer can be easily stored on even small shelves and spaces. In addition, due to its lightweight design, this printer can be effortlessly moved from one location to another.</p><p><br></p><p>Auto Power ON Feature</p><p>Thanks to its Auto Power ON function, this printer can detect print commands and powers on automatically when a USB cable is connected.</p>',2500,_binary '',4000,'23c4d2f1-0df2-4dc6-af39-5fed99129d77.png',20,_binary '\0','Canon PIXMA MG2470','a10ae514-4540-48ea-9f8c-791575656a6e'),('d308482b-8157-4dec-acf6-43382fce157b','2023-08-16 14:21:53.696000','<p><span style=\"color: rgb(33, 33, 33);\">Canon PIXMA TS3370S Multi-function WiFi Color Inkjet Printer (Borderless Printing)&nbsp;&nbsp;(Black, Ink Cartridge)</span></p><p><br></p><p><br></p><p><span style=\"color: rgb(33, 33, 33);\"><span class=\"ql-cursor\">﻿</span>Designed to cater to all your printing needs, the Canon PIXMA TS3370S Inkjet Printer is a suitable choice. Featuring a convenient LCD display of up to 3.8 cm, this printer enables you to conveniently set copy size and the number of copies. Owing to its auto power-on feature, this printer can turn on automatically when it detects a print command and shut down after a set amount of time. Additionally, through its USB 2.0 interface, this printer provides fast wireless connectivity and can be shared wirelessly.</span></p><p>Product Description</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/422880beb4c34e7eadcb25584a8c929a_187983d6933_CanonIJMFPWifiTS3370S_2.jpg.jpeg?q=90\"></span></p><p>Up to 3.8 cm Segment LCD Display</p><p>Boasting a convenient LCD display of up to 3.8 cm, the Canon PIXMA TS3370S Inkjet Printer allows you to easily set copy size and the number of copies. Furthermore, the intuitive icons on the LCD display indicate the status of the printer and wireless connection.</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"https://rukminim2.flixcart.com/image/200/200/cms-rpd-img/c358d6405237493c8775eb036476fa1d_187983d36df_CanonIJMFPWifiTS3370S_3.jpg.jpeg?q=90\"></span></p><p>Auto Power ON</p><p>Featuring the Auto Power ON feature, this printer can detect a print command and turn it on automatically, as well as switch it off after a set amount of time. Therefore, you won’t need to manually turn this printer on and off, saving you time and energy.</p>',4200,_binary '',4500,'cb81b7f9-e896-46d0-9897-b1062662e353.png',20,_binary '','Canon PIXMA TS3370S ','a10ae514-4540-48ea-9f8c-791575656a6e'),('e16b19ee-dfdc-42f9-b12f-093fc6a476c7','2023-08-16 14:13:34.079000','<p>SONY Alpha Full Frame ILCE-7M2K/BQ IN5 Mirrorless Camera Body with 28 - 70 mm Lens&nbsp;&nbsp;(Black)</p><p><br></p><p>4K and vertical movies, Live YouTube streaming, Auto video transcoding, Use as a webcam, Great in low light, 10fps continuous shooting, 3.5mm external microphone input, Full HD movie at 60p, pair the camera with your smartphone via Wi-Fi or Bluetooth to perform remote shooting, a handy trick for taking group photos.</p><p><br></p><p>Effective Pixels: 24.3 MP</p><p><br></p><p>Sensor Type: CMOS</p><p><br></p><p>WiFi Available</p><p><br></p><p>Full HD</p><p><br></p><p><span style=\"color: rgb(33, 33, 33);\">Click breathtaking photos and blur-free videos with this Sony α7 II DSLR camera - it provides you immense freedom to reinvent your photography skills. This high-quality camera features a 5-axis Image Stabilisation, a 35 mm Full-frame 24.3 MP Exmor CMOS Sensor, and a Sony BIONZ X Image Processing Engine to allow you to capture detailed, crisp, and blur-free images and movies.</span></p><p><br></p><p>Viewfinder Type: XGA OLED, 1.3 cm (0.5 Type) Electronic Viewfinder (Color), Number of Dots: 2359296 dots, Brightness Control (Viewfinder): Auto/Manual (5 steps between -2 and +2), Color Temperature Control: Manual (5 steps), Dioptre Adjustment: -4.0 to +3.0 m-1, Viewfinder Display: Graphic Display, Display All Information, No Display Information, Histogram, Digital Level Gauge, Real-time Image Adjustment Display: On/Off, Eye Point: Approx 27 mm from the Eyepiece Lens, 22 mm from the Eyepiece Frame at -1 m-1 (CIPA Standard)</p><p><br></p><p><br></p>',5800,_binary '',6000,'2ebd4188-015b-485a-8ae0-7d74666cef1a.png',10,_binary '','Canon EOS M50 Mark II Mirrorless Camera ','a10ae514-4540-48ea-9f8c-791575656a6e');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` varchar(255) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('awgfasfwsdqtgasfwqgsdtg','ROLE_NORMAL'),('wetrsdfwetwfasfwdf','ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(255) NOT NULL,
  `about` varchar(1000) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `user_image_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_33uo7vet9c79ydfuwg1w848f` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1418be98-d9ea-4a43-ad50-6b1990c8feb4','I am programmer. I love to teach and code.','durgesh1@gmail.com','male',NULL,'Durgesh Kumar Tiwari','$2a$10$irureqSwMVILQ9bBsCWo.ewXixUaeWNO/X9MJdWjQNoPaUpk4RCue'),('8e37190f-5a53-4d1d-898c-44d70f7a3136','afasf','durgesh@gmail.comaf','male',NULL,'durgesh','$2a$10$UrDmau/o4u7VoL47I1QaBer4gAK8SJKihDceYD1KbM9LjG7oS0qn.'),('aa63427c-c904-4833-a782-415acc981b61','This is my electronic store account.','amar@gmail.com','male',NULL,'Amar Nath Dubey','$2a$10$oRCOrUvI/NuZnMieW75uEucarQID7AvM.M0VOX6llKQBPTQYMZwja'),('ab12e1a2-d0b9-4f69-832b-3d2a56e8ba1a','durgesh','durgesh2@gmail.com','male',NULL,'Another Durgesh','$2a$10$Ru5PfVO.02SitYfrSKSSju0rNjhBy6Ea.xy9SuYuj7JjKVAs/lBFW'),('c48d6a98-e858-4e7d-84de-158db1218b1e','loading testing','durgesh5@gmail.com','male',NULL,'durgesh','$2a$10$Q4sNW7Wo1AUCjORwt943pepHKnpxUGhWF3ja2aZdziEvMaxnBFDkm'),('c7ddd108-008d-4895-b407-e401cbb51eed','I am Normal User.','durgesh@gmail.com','Male','28e04bcc-ad94-4def-8931-4400b30e1095.jpg','DK User....','$2a$10$jCwp.6qhPzWa/PloIH78WOPwCsUC8tdZxXm6jl8wFqOTebCDE70Vi'),('d5ade816-cd95-484f-940f-b8a45786b57b','durgesh','durgesh3@gmail.com','male',NULL,'durgesh','$2a$10$z77bpFePEEbmriKbIDhv2eMy0Pr77olzWj8GLuLeKymeygFBhTVfq'),('ded77eed-a6ea-4478-a93c-2b8b635bf73e',NULL,'durgeshkumar8896@gmail.com',NULL,'https://lh3.googleusercontent.com/a/ACg8ocK2N4g1qEDdeoZ-rjPIUEupe32J0rcOsBqQrir2RJXq70E=s96-c','Durgesh Tiwari','$2a$10$hpdilMsRh.Szdqa8ysH5yuc8.1b/y7J1XfHcm5iNIKDs0fLJDc5ea'),('e4b7ce95-da37-4d59-9d0b-745a58070730','I am professional programmer','ankit@gmail.com','male',NULL,'Ankit Tiwari','$2a$10$GL6gg/Kf7aCKy2o06llvweFuxgbBtZgsxflXXXBMG3WEmA4NVFj8e'),('f8473a1b-c1dc-436a-944d-26eb19ba195b','I am  professional programmer and video creator.','admin@gmail.com','Male','3a8acbd3-5577-4221-a93e-2d29d109a404.jpg','DK  Tiwari....','$2a$10$pmxXyW.ZsB/ktwShZATLHOgnLi/G2gTkKX2UquAPXk/5IBgmMk7E2');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_user_id` varchar(255) NOT NULL,
  `roles_role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_user_id`,`roles_role_id`),
  KEY `FKtgou1kvdhyryu3fia6uu1fhoi` (`roles_role_id`),
  CONSTRAINT `FK27iuqlfirca39l6y61p4p4qo2` FOREIGN KEY (`user_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKtgou1kvdhyryu3fia6uu1fhoi` FOREIGN KEY (`roles_role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES ('1418be98-d9ea-4a43-ad50-6b1990c8feb4','awgfasfwsdqtgasfwqgsdtg'),('8e37190f-5a53-4d1d-898c-44d70f7a3136','awgfasfwsdqtgasfwqgsdtg'),('aa63427c-c904-4833-a782-415acc981b61','awgfasfwsdqtgasfwqgsdtg'),('ab12e1a2-d0b9-4f69-832b-3d2a56e8ba1a','awgfasfwsdqtgasfwqgsdtg'),('c48d6a98-e858-4e7d-84de-158db1218b1e','awgfasfwsdqtgasfwqgsdtg'),('c7ddd108-008d-4895-b407-e401cbb51eed','awgfasfwsdqtgasfwqgsdtg'),('d5ade816-cd95-484f-940f-b8a45786b57b','awgfasfwsdqtgasfwqgsdtg'),('ded77eed-a6ea-4478-a93c-2b8b635bf73e','awgfasfwsdqtgasfwqgsdtg'),('e4b7ce95-da37-4d59-9d0b-745a58070730','awgfasfwsdqtgasfwqgsdtg'),('f8473a1b-c1dc-436a-944d-26eb19ba195b','awgfasfwsdqtgasfwqgsdtg'),('f8473a1b-c1dc-436a-944d-26eb19ba195b','wetrsdfwetwfasfwdf');
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-12 10:25:33
