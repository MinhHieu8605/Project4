CREATE DATABASE  IF NOT EXISTS `estateadvance`;
USE `estateadvance`;

DROP TABLE IF EXISTS `building`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `building` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) NOT NULL,
                            `street` varchar(255) DEFAULT NULL,
                            `ward` varchar(255) DEFAULT NULL,
                            `district` varchar(255) DEFAULT NULL,
                            `structure` varchar(255) DEFAULT NULL,
                            `numberofbasement` int(11) DEFAULT NULL,
                            `floorarea` int(11) DEFAULT NULL,
                            `direction` varchar(255) DEFAULT NULL,
                            `level` varchar(255) DEFAULT NULL,
                            `rentprice` int(11) DEFAULT NULL,
                            `rentpricedescription` text,
                            `servicefee` varchar(255) DEFAULT NULL,
                            `carfee` varchar(255) DEFAULT NULL,
                            `motofee` varchar(255) DEFAULT NULL,
                            `overtimefee` varchar(255) DEFAULT NULL,
                            `waterfee` varchar(255) DEFAULT NULL,
                            `electricityfee` varchar(255) DEFAULT NULL,
                            `deposit` varchar(255) DEFAULT NULL,
                            `payment` varchar(255) DEFAULT NULL,
                            `renttime` varchar(255) DEFAULT NULL,
                            `decorationtime` varchar(255) DEFAULT NULL,
                            `brokeragefee` decimal(13,2) DEFAULT NULL,
                            `type` varchar(255) DEFAULT NULL,
                            `note` varchar(255) DEFAULT NULL,
                            `linkofbuilding` varchar(255) DEFAULT NULL,
                            `map` varchar(255) DEFAULT NULL,
                            `avatar` varchar(255) DEFAULT NULL,
                            `createddate` datetime DEFAULT NULL,
                            `modifieddate` datetime DEFAULT NULL,
                            `createdby` varchar(255) DEFAULT NULL,
                            `modifiedby` varchar(255) DEFAULT NULL,
                            `managername` varchar(255) DEFAULT NULL,
                            `managerphone` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

LOCK TABLES `building` WRITE;
INSERT INTO `building` VALUES
                           (1,'Nam Giao Building Tower','59 phan xích long','Phường 2','QUAN_1',NULL,2,500,NULL,NULL,15,'15 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NGUYEN_CAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Nam-Chị Linh','0915354727'),
                           (2,'ACM Tower','96 cao thắng','Phường 4','QUAN_2',NULL,2,650,NULL,NULL,18,'18 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NGUYEN_CAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Chú Thuận','0173546263'),
                           (3,'Alpha 2 Building Tower','153 nguyễn đình chiểu','Phường 6','QUAN_1',NULL,1,200,NULL,NULL,20,'20 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cô Lý','0555532578'),
                           (4,'IDD 1 Building','111 Lý Chính Thắng','Phường 7','QUAN_4',NULL,1,200,NULL,NULL,12,'12 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NGUYEN_CAN,NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Long','017345253'),
                           (6,'test',NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Long','017345253');
UNLOCK TABLES;

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                            `fullname` varchar(255) NOT NULL,
                            `phone` varchar(255) NOT NULL,
                            `email` varchar(255) DEFAULT NULL,
                            companyname varchar(255) DEFAULT NULL,
                            demand varchar(255) DEFAULT NULL,
                            status varchar(255) DEFAULT NULL,
                            is_active TINYINT(1) DEFAULT 1,
                            `createddate` datetime DEFAULT NULL,
                            `modifieddate` datetime DEFAULT NULL,
                            `createdby` varchar(255) DEFAULT NULL,
                            `modifiedby` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO customer(fullname,phone,email,companyname,demand)
VALUES('Luc Van Hai','0905671231','hailv@gmail.com',null,null),
      ('Nguyen Xuan Hong','0205671231','hongxuanng@gmail.com',null,null),
      ('Ta Thi Cuc','0912121231','cucthita1@gmail.com',null,null);

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `user`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
                        `id` bigint(20) NOT NULL AUTO_INCREMENT,
                        `username` varchar(255) NOT NULL,
                        `password` varchar(255) NOT NULL,
                        `fullname` varchar(255) DEFAULT NULL,
                        `phone` varchar(255) DEFAULT NULL,
                        `email` varchar(255) DEFAULT NULL,
                        `status` int(11) NOT NULL,
                        `createddate` datetime DEFAULT NULL,
                        `modifieddate` datetime DEFAULT NULL,
                        `createdby` varchar(255) DEFAULT NULL,
                        `modifiedby` varchar(255) DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van a',NULL,NULL,1,NULL,NULL,NULL,NULL),
                          (2,'nguyenvanb','$2a$10$j9VjrbR5x8d7XgURE7yXQuOEPEHwhXmF0AYfKbUfvx8kZlW.V63FO','nguyen van b',NULL,NULL,1,NULL,NULL,NULL,NULL),
                          (3,'nguyenvanc','$2a$10$ahTGSUhJUnEIn2XQlkvWSOXwfUanGOoEDaq0haJZtJx9e9qreCrk2','nguyen van c',NULL,NULL,1,NULL,NULL,NULL,NULL),
                          (4,'nguyenvand','$2a$10$ZfcS1NkXoEufD/tqeezCvutVi9oNdlUE8LgKs9upEUyh1j.HEwm4O','nguyen van d',NULL,NULL,1,NULL,NULL,NULL,NULL),
                          (5,'user','$2a$10$pFSEgdDAsIdcC5JVRP2CZOTFzMQyNjKvtm2r8HAZRs8pfvrqDQPXe','user',NULL,NULL,1,NULL,NULL,NULL,NULL);
UNLOCK TABLES;


DROP TABLE IF EXISTS `assignmentbuilding`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `assignmentbuilding` (
                                      `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                      `staffid` bigint(20) NOT NULL,
                                      `buildingid` bigint(20) NOT NULL,
                                      `createddate` datetime DEFAULT NULL,
                                      `modifieddate` datetime DEFAULT NULL,
                                      `createdby` varchar(255) DEFAULT NULL,
                                      `modifiedby` varchar(255) DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `fk_user_building` (`staffid`),
                                      KEY `fk_building_user` (`buildingid`),
                                      CONSTRAINT `fk_building_user` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`),
                                      CONSTRAINT `fk_user_building` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
LOCK TABLES `assignmentbuilding` WRITE;
INSERT INTO `assignmentbuilding` VALUES (1,2,1,NULL,NULL,NULL,NULL),(2,2,3,NULL,NULL,NULL,NULL),(3,3,1,NULL,NULL,NULL,NULL),(4,3,4,NULL,NULL,NULL,NULL);
UNLOCK TABLES;

DROP TABLE IF EXISTS `assignmentcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `assignmentcustomer` (
                                      `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                      `staffid` bigint(20) NOT NULL,
                                      `customerid` bigint(20) NOT NULL,
                                      `createddate` datetime DEFAULT NULL,
                                      `modifieddate` datetime DEFAULT NULL,
                                      `createdby` varchar(255) DEFAULT NULL,
                                      `modifiedby` varchar(255) DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `fk_user_customer` (`staffid`),
                                      KEY `fk_customer_user` (`customerid`),
                                      CONSTRAINT `fk_customer_user` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
                                      CONSTRAINT `fk_user_customer` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `assignmentcustomer` WRITE;
UNLOCK TABLES;

INSERT INTO assignmentcustomer(staffid,customerid)
VALUES(2,1),(2,3),(3,1),(3,3);

DROP TABLE IF EXISTS `rentarea`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `rentarea` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT,
                            `value` int(11) DEFAULT NULL,
                            `buildingid` bigint(20) DEFAULT NULL,
                            `createddate` datetime DEFAULT NULL,
                            `modifieddate` datetime DEFAULT NULL,
                            `createdby` varchar(255) DEFAULT NULL,
                            `modifiedby` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `rentarea_building` (`buildingid`),
                            CONSTRAINT `rentarea_building` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;


LOCK TABLES `rentarea` WRITE;
INSERT INTO `rentarea` VALUES (1,100,1,NULL,NULL,NULL,NULL),(2,200,1,NULL,NULL,NULL,NULL),(3,200,2,NULL,NULL,NULL,NULL),(4,300,2,NULL,NULL,NULL,NULL),(5,400,2,NULL,NULL,NULL,NULL),(6,300,3,NULL,NULL,NULL,NULL),(7,400,3,NULL,NULL,NULL,NULL),(8,500,3,NULL,NULL,NULL,NULL),(9,100,4,NULL,NULL,NULL,NULL),(10,400,4,NULL,NULL,NULL,NULL),(11,250,4,NULL,NULL,NULL,NULL),(24,700,6,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

DROP TABLE IF EXISTS `role`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
                        `id` bigint(20) NOT NULL AUTO_INCREMENT,
                        `name` varchar(255) NOT NULL,
                        `code` varchar(255) NOT NULL,
                        `createddate` datetime DEFAULT NULL,
                        `modifieddate` datetime DEFAULT NULL,
                        `createdby` varchar(255) DEFAULT NULL,
                        `modifiedby` varchar(255) DEFAULT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'Quản lý','MANAGER',NULL,NULL,NULL,NULL),
                          (2,'Nhân viên','STAFF',NULL,NULL,NULL,NULL),
                          (3,'Người dùng','USER',NULL,NULL,NULL,NULL);
UNLOCK TABLES;

DROP TABLE IF EXISTS `transaction`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction` (
                               `id` bigint(20) NOT NULL AUTO_INCREMENT,
                               `code` varchar(255) DEFAULT NULL,
                               `note` varchar(255) DEFAULT NULL,
                               `customerid` bigint(20) NOT NULL,
                               `createddate` datetime DEFAULT NULL,
                               `modifieddate` datetime DEFAULT NULL,
                               `createdby` varchar(255) DEFAULT NULL,
                               `modifiedby` varchar(255) DEFAULT NULL,
                               `staffid` bigint(20) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `fk_customer_transaction` (`customerid`),
                               CONSTRAINT `fk_customer_transaction` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `transaction` WRITE;
INSERT INTO `transaction` VALUES (1,'CSKH','Gọi điện thoại tư vấn',1,NULL,NULL,NULL, NULL, NULL),
                               (2,'DDX','Dẫn đi xem nhà',1,NULL,NULL,NULL, NULL, NULL),
                                (3,'CSKH','Gọi điện thoại tư vấn',2,NULL,NULL,NULL, NULL, NULL),
                                (4,'DDX','Dẫn đi xem nhà',2,NULL,NULL,NULL, NULL, NULL);
UNLOCK TABLES;


DROP TABLE IF EXISTS `user_role`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
                             `id` bigint(20) NOT NULL AUTO_INCREMENT,
                             `role_id` bigint(20) NOT NULL,
                             `user_id` bigint(20) NOT NULL,
                             `createddate` datetime DEFAULT NULL,
                             `modifieddate` datetime DEFAULT NULL,
                             `createdby` varchar(255) DEFAULT NULL,
                             `modifiedby` varchar(255) DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `fk_user_role` (`user_id`),
                             KEY `fk_role_user` (`role_id`),
                             CONSTRAINT `fk_role_user` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
                             CONSTRAINT `fk_user_role` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


LOCK TABLES `user_role` WRITE;
INSERT INTO `user_role` VALUES (1,1,1,NULL,NULL,NULL,NULL),
                               (2,2,2,NULL,NULL,NULL,NULL),
                               (3,2,3,NULL,NULL,NULL,NULL),
                               (4,2,4,NULL,NULL,NULL,NULL),
                               (5,3,5,NULL,NULL,NULL,NULL);
UNLOCK TABLES;
