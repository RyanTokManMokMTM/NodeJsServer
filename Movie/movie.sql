/*
 Navicat Premium Data Transfer

 Source Server         : Movie
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : movie

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 05/01/2021 16:56:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for movie_date_info
-- ----------------------------
DROP TABLE IF EXISTS `movie_date_info`;
CREATE TABLE `movie_date_info`  (
  `Movie_date_id` int NOT NULL AUTO_INCREMENT,
  `Date_id` int NOT NULL,
  `Date` date NOT NULL,
  `Time` time(0) NOT NULL,
  PRIMARY KEY (`Movie_date_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_date_info
-- ----------------------------
INSERT INTO `movie_date_info` VALUES (1, 1, '2020-12-22', '08:00:00');
INSERT INTO `movie_date_info` VALUES (2, 1, '2020-12-22', '10:00:00');
INSERT INTO `movie_date_info` VALUES (3, 1, '2020-12-22', '12:00:00');
INSERT INTO `movie_date_info` VALUES (4, 2, '2020-12-24', '10:00:00');
INSERT INTO `movie_date_info` VALUES (5, 2, '2020-12-24', '14:00:00');

-- ----------------------------
-- Table structure for movie_info
-- ----------------------------
DROP TABLE IF EXISTS `movie_info`;
CREATE TABLE `movie_info`  (
  `Movie_id` int NOT NULL AUTO_INCREMENT,
  `Movie_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Movie_release_date` date NOT NULL,
  `Movie_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Movie_language` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Movie_length` int NOT NULL,
  `Movie_actor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Movie_director` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Movie_plot` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Movie_poster` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Movie_trailer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Movie_restricted_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Movie_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Movie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_info
-- ----------------------------
INSERT INTO `movie_info` VALUES (1, 'Avengers: Endgame', '2019-04-22', 'Action', 'English', 181, 'Robert Downey Jr. ,Chris Evans , Mark Ruffalo', 'Anthony Russo ,Joe Russo', '123', 'avenger-4.jpg', 'https://www.youtube.com/embed/TcMBFSGVi1c', '16+', 'Hot');
INSERT INTO `movie_info` VALUES (2, 'The Nun', '2018-09-04', 'Horror,Suspense', 'English', 96, 'Demián Bichir. ,Taissa Farmiga , Jonas Bloquet', 'Corin Hard', '456', 'the-nun.jpg', 'https://www.youtube.com/embed/pzD9zGcUNrw', '16+', 'Hot');
INSERT INTO `movie_info` VALUES (3, 'It', '2017-09-05', 'Horror,Suspense', 'English', 135, 'Jaeden Martell ,Jeremy Ray Taylor , Sophia Lillis', 'Andy Muschietti', '789', 'it.jpg', 'https://www.youtube.com/embed/FnCdOQsX5kc', '16+', 'Hot');
INSERT INTO `movie_info` VALUES (4, 'Iron man 3', '2013-04-14', 'Action', 'English', 131, 'Robert Downey Jr. ,Gwyneth Paltrow ,Don Cheadle', 'Shane Black', 'abc', 'iron-3.jpg', 'https://www.youtube.com/embed/Ke1Y3P9D0Bc', '16+', 'Hot');

-- ----------------------------
-- Table structure for seat_info
-- ----------------------------
DROP TABLE IF EXISTS `seat_info`;
CREATE TABLE `seat_info`  (
  `Seat_id` int NOT NULL AUTO_INCREMENT,
  `Session_id` int NOT NULL,
  `Seat_num` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Seat_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`Seat_id`) USING BTREE,
  INDEX `Session_id`(`Session_id`) USING BTREE,
  CONSTRAINT `seat_info_ibfk_1` FOREIGN KEY (`Session_id`) REFERENCES `session_info` (`Session_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seat_info
-- ----------------------------
INSERT INTO `seat_info` VALUES (1, 1, 'A1', 1);
INSERT INTO `seat_info` VALUES (2, 1, 'A2', 1);
INSERT INTO `seat_info` VALUES (3, 1, 'B2', 1);
INSERT INTO `seat_info` VALUES (4, 1, 'B1', 1);
INSERT INTO `seat_info` VALUES (5, 1, 'B3', 1);
INSERT INTO `seat_info` VALUES (6, 1, 'A3', 1);
INSERT INTO `seat_info` VALUES (7, 1, 'B5', 1);
INSERT INTO `seat_info` VALUES (8, 1, 'A4', 1);
INSERT INTO `seat_info` VALUES (9, 1, 'B4', 1);
INSERT INTO `seat_info` VALUES (10, 1, 'B5', 1);
INSERT INTO `seat_info` VALUES (11, 1, 'A4', 1);
INSERT INTO `seat_info` VALUES (12, 1, 'B4', 1);
INSERT INTO `seat_info` VALUES (13, 1, 'C2', 1);
INSERT INTO `seat_info` VALUES (14, 1, 'C3', 1);
INSERT INTO `seat_info` VALUES (15, 1, 'A4', 1);
INSERT INTO `seat_info` VALUES (16, 1, 'A5', 1);
INSERT INTO `seat_info` VALUES (17, 1, 'A5', 1);
INSERT INTO `seat_info` VALUES (18, 1, 'A5', 1);
INSERT INTO `seat_info` VALUES (19, 1, 'A5', 1);

-- ----------------------------
-- Table structure for session_info
-- ----------------------------
DROP TABLE IF EXISTS `session_info`;
CREATE TABLE `session_info`  (
  `Session_id` int NOT NULL AUTO_INCREMENT,
  `Date` int NOT NULL,
  `Theater_id` int NOT NULL,
  `Movie_id` int NOT NULL,
  `Prices` int NOT NULL,
  PRIMARY KEY (`Session_id`) USING BTREE,
  INDEX `Theater_id`(`Theater_id`) USING BTREE,
  INDEX `Movie_id`(`Movie_id`) USING BTREE,
  INDEX `Date`(`Date`) USING BTREE,
  CONSTRAINT `session_info_ibfk_1` FOREIGN KEY (`Theater_id`) REFERENCES `theater_info` (`Theater_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `session_info_ibfk_2` FOREIGN KEY (`Movie_id`) REFERENCES `movie_info` (`Movie_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `session_info_ibfk_3` FOREIGN KEY (`Date`) REFERENCES `movie_date_info` (`Movie_date_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of session_info
-- ----------------------------
INSERT INTO `session_info` VALUES (1, 1, 1, 1, 200);
INSERT INTO `session_info` VALUES (2, 2, 1, 1, 200);
INSERT INTO `session_info` VALUES (3, 3, 1, 2, 200);
INSERT INTO `session_info` VALUES (4, 4, 1, 3, 200);
INSERT INTO `session_info` VALUES (5, 5, 2, 1, 200);

-- ----------------------------
-- Table structure for theater_info
-- ----------------------------
DROP TABLE IF EXISTS `theater_info`;
CREATE TABLE `theater_info`  (
  `Theater_id` int NOT NULL AUTO_INCREMENT,
  `Theater_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Theater_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Theater_contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Theater_open_time` time(0) NULL DEFAULT NULL,
  `Theater_close_time` time(0) NULL DEFAULT NULL,
  `Theater_image_src` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Theater_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of theater_info
-- ----------------------------
INSERT INTO `theater_info` VALUES (1, 'Horseheads, Regal Arnot Mall', '3300 Chambers RdHorseheads, NY 14845', '(844) 462-7342', '08:00:00', '01:00:00', 't1.jpg');
INSERT INTO `theater_info` VALUES (2, 'Queensbury, Regal Aviation Mall', '578 Aviation Rd Queensbury, NY 12804', ' (844) 462-7342', '08:00:00', '01:00:00', 't2.jpg');
INSERT INTO `theater_info` VALUES (3, 'Staten Island, Regal Bricktown Charleston', '165 Bricktown Way Staten Island, NY 10309', '(844) 462-7342', '08:00:00', '01:00:00', 't3.jpg');
INSERT INTO `theater_info` VALUES (4, 'Plattsburgh, Regal Champlain Centre', '60 Smithfield Blvd, Suite 90 Plattsburgh, NY 12901', ' (844) 462-7342', '08:00:00', '01:00:00', 't4.jpg');
INSERT INTO `theater_info` VALUES (5, 'Syracuse, Regal Destiny USA 4DX, IMAX & RPX', '9586 Destiny USA Drive Syracuse, NY 13204', ' (844) 462-7342', '08:00:00', '01:00:00', 't5.jpg');
INSERT INTO `theater_info` VALUES (6, 'Long Island City, Regal UA Kaufman Astoria & RPX', '35-30 38th Street Long Island City, NY 11101', '(844) 462-7342', '08:00:00', '01:00:00', 't6.jpg');
INSERT INTO `theater_info` VALUES (7, 'Clifton Park, Regal Clifton Park & RPX', '22 Clifton Country Road Clifton Park, NY 12065', '(844) 462-7342', '08:00:00', '01:00:00', 't7.jpg');
INSERT INTO `theater_info` VALUES (8, 'New York, Regal Essex Crossing & RPX', '129 Delancey Street New York, NY 10002', '(844) 462-7342', '08:00:00', '01:00:00', 't8.jpg');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `Uid` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FirstName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'Guest',
  `LastName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'User',
  `Cash_point` int NULL DEFAULT 9999,
  PRIMARY KEY (`Uid`) USING BTREE,
  UNIQUE INDEX `Email`(`Email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'RyanTokManMokMTM@hotmail.com', '$2a$08$YUGuGWOTT8fdT0v6XjLE8eHO2POHICmgQenNEaCTxDA5fwhYIR8P6', 'Hi i\'m new user.', '鐸文', '莫', 9999);

-- ----------------------------
-- Table structure for user_ticket_record
-- ----------------------------
DROP TABLE IF EXISTS `user_ticket_record`;
CREATE TABLE `user_ticket_record`  (
  `Ticket_id` int NOT NULL AUTO_INCREMENT,
  `Uid` int NOT NULL,
  `Movie_id` int NOT NULL,
  `Theater_id` int NOT NULL,
  `Date_id` int NOT NULL,
  `Seat_id` int NOT NULL,
  `Total_prices` int NOT NULL,
  `Payment_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Ticket_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Ticket_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Ticket_id`) USING BTREE,
  INDEX `Uid`(`Uid`) USING BTREE,
  INDEX `Movie_id`(`Movie_id`) USING BTREE,
  INDEX `Theater_id`(`Theater_id`) USING BTREE,
  INDEX `Date_id`(`Date_id`) USING BTREE,
  INDEX `Seat_id`(`Seat_id`) USING BTREE,
  CONSTRAINT `user_ticket_record_ibfk_1` FOREIGN KEY (`Uid`) REFERENCES `user_info` (`Uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ticket_record_ibfk_2` FOREIGN KEY (`Movie_id`) REFERENCES `movie_info` (`Movie_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ticket_record_ibfk_3` FOREIGN KEY (`Theater_id`) REFERENCES `theater_info` (`Theater_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ticket_record_ibfk_4` FOREIGN KEY (`Date_id`) REFERENCES `movie_date_info` (`Movie_date_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ticket_record_ibfk_5` FOREIGN KEY (`Seat_id`) REFERENCES `seat_info` (`Seat_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_ticket_record
-- ----------------------------
INSERT INTO `user_ticket_record` VALUES (1, 1, 1, 1, 1, 1, 200, 'cash_point', 'unuse', 'FULL TICKET');
INSERT INTO `user_ticket_record` VALUES (2, 1, 1, 1, 1, 2, 200, 'cash_point', 'unuse', 'FULL TICKET');
INSERT INTO `user_ticket_record` VALUES (3, 1, 1, 1, 1, 3, 200, 'cash_point', 'unuse', 'FULL TICKET');
INSERT INTO `user_ticket_record` VALUES (4, 1, 1, 1, 1, 4, 200, 'cash_point', 'unuse', 'FULL TICKET');
INSERT INTO `user_ticket_record` VALUES (5, 1, 1, 1, 1, 5, 200, 'cash_point', 'unuse', 'FULL TICKET');
INSERT INTO `user_ticket_record` VALUES (6, 1, 1, 1, 1, 6, 200, 'cash_point', 'unuse', 'FULL TICKET');
INSERT INTO `user_ticket_record` VALUES (7, 1, 1, 1, 1, 7, 200, 'cash_point', 'unuse', 'FULL TICKET');
INSERT INTO `user_ticket_record` VALUES (8, 1, 1, 1, 1, 8, 200, 'cash_point', 'unuse', 'FULL TICKET');
INSERT INTO `user_ticket_record` VALUES (9, 1, 1, 1, 1, 9, 200, 'cash_point', 'unuse', 'FULL TICKET');
INSERT INTO `user_ticket_record` VALUES (10, 1, 1, 1, 1, 11, 200, 'cash_point', 'unuse', 'FULL TICKET');
INSERT INTO `user_ticket_record` VALUES (11, 1, 1, 1, 1, 12, 200, 'cash_point', 'unuse', 'FULL TICKET');
INSERT INTO `user_ticket_record` VALUES (12, 1, 1, 1, 1, 13, 200, 'cash_point', 'unuse', 'FULL TICKET');
INSERT INTO `user_ticket_record` VALUES (13, 1, 1, 1, 1, 14, 200, 'cash_point', 'unuse', 'FULL TICKET');

SET FOREIGN_KEY_CHECKS = 1;
