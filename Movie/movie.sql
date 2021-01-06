/*
 Navicat Premium Data Transfer

 Source Server         : tset
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3307
 Source Schema         : movie

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 06/01/2021 23:39:09
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
  `Time` time NOT NULL,
  PRIMARY KEY (`Movie_date_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_date_info
-- ----------------------------
INSERT INTO `movie_date_info` VALUES (1, 1, '2020-12-22', '08:00:00');
INSERT INTO `movie_date_info` VALUES (2, 1, '2020-12-22', '10:00:00');
INSERT INTO `movie_date_info` VALUES (3, 1, '2020-12-22', '10:00:00');
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_info
-- ----------------------------
INSERT INTO `movie_info` VALUES (1, 'Avengers: Endgame', '2019-04-22', 'Action', 'English', 181, 'Robert Downey Jr. ,Chris Evans , Mark Ruffalo', 'Anthony Russo ,Joe Russo', '123', 'avenger-4.jpg', 'https://www.youtube.com/embed/TcMBFSGVi1c', '16+', 'Hot');
INSERT INTO `movie_info` VALUES (2, 'The Nun', '2018-09-04', 'Horror,Suspense', 'English', 96, 'Demián Bichir. ,Taissa Farmiga , Jonas Bloquet', 'Corin Hard', '456', 'the-nun.jpg', 'https://www.youtube.com/embed/pzD9zGcUNrw', '16+', 'Hot');
INSERT INTO `movie_info` VALUES (3, 'It', '2017-09-05', 'Horror,Suspense', 'English', 135, 'Jaeden Martell ,Jeremy Ray Taylor , Sophia Lillis', 'Andy Muschietti', '789', 'it.jpg', 'https://www.youtube.com/embed/FnCdOQsX5kc', '16+', 'Hot');
INSERT INTO `movie_info` VALUES (4, 'Iron man 3', '2013-04-14', 'Action', 'English', 131, 'Robert Downey Jr. ,Gwyneth Paltrow ,Don Cheadle', 'Shane Black', 'abc', 'iron-3.jpg', 'https://www.youtube.com/embed/Ke1Y3P9D0Bc', '16+', 'Hot');
INSERT INTO `movie_info` VALUES (5, 'Spider-Man: Homecoming', '2017-07-28', 'Action', 'English', 133, 'Tom Holland ,Michael Keaton ,Robert Downey Jr.', 'Jon Watts', 'Following the Battle of New York,[N 1] Adrian Toomes and his salvage company are contracted to clean up the city, but their operation is taken over by the Department of Damage Control (D.O.D.C.), a partnership between Tony Stark and the U.S. government. Enraged at being driven out of business, Toomes persuades his employees to keep the Chitauri technology they have already scavenged and use it to create and sell advanced weapons. Eight years later, Peter Parker is drafted into the Avengers by Stark to help with an internal dispute in Berlin,[N 2] but resumes his studies at the Midtown School of Science and Technology when Stark tells him he is not yet ready to become a full Avenger.\n\nParker quits his school\'s academic decathlon team to spend more time focusing on his crime-fighting activities as Spider-Man. One night, after preventing criminals from robbing an ATM with their advanced weapons Toomes sold them, Parker returns to his Queens apartment, where his best friend Ned discovers his secret identity. On another night, Parker comes across Toomes\' associates Jackson Brice / Shocker and Herman Schultz selling weapons to local criminal Aaron Davis. Parker saves Davis before being caught by Toomes and dropped in a lake, nearly drowning after becoming tangled in a parachute built into his suit. He is rescued by Stark, who is monitoring the Spider-Man suit he gave Parker and warns him against further involvement with the criminals. Toomes accidentally kills Brice with one of their weapons, and Schultz becomes the new Shocker.', 'spi3.jpg', 'https://www.youtube.com/embed/U0D3AOldjMU', '16+', 'Hot');
INSERT INTO `movie_info` VALUES (6, 'The Avengers', '2012-04-11', 'Action', 'English', 143, '	\r\nRobert Downey Jr.,Chris Evans,Mark Ruffalo', 'Joss Whedon', 'The Asgardian Loki encounters the Other, the leader of an extraterrestrial race known as the Chitauri. In exchange for retrieving the Tesseract,[N 2] a powerful energy source of unknown potential, the Other promises Loki an army with which he can subjugate Earth. Nick Fury, director of the espionage agency S.H.I.E.L.D., and his lieutenant Agent Maria Hill arrive at a remote research facility during an evacuation, where physicist Dr. Erik Selvig is leading a research team experimenting on the Tesseract. Agent Phil Coulson says that the object has begun radiating an unusual form of energy. The Tesseract suddenly activates and opens a wormhole, allowing Loki to reach Earth. Loki takes the Tesseract and uses his scepter to enslave Selvig and a few other agents, including Clint Barton, to aid him in his getaway.\r\n\r\nIn response to the attack, Fury reactivates the \"Avengers Initiative\". Agent Natasha Romanoff sends to Kolkata to recruit Dr. Bruce Banner to trace the Tesseract through its gamma radiation emissions. Coulson visits Tony Stark to have him check Selvig\'s research, and Fury approaches Steve Rogers with an assignment to retrieve the Tesseract.', 'ava1.jpg', 'https://www.youtube.com/embed/hIR8Ar-Z4hw', '16+', 'Hot');
INSERT INTO `movie_info` VALUES (7, 'Wonder Woman 1984', '2020-12-17', 'Action', 'English', 151, ' Gal Gadot,Chris Pine, Kristen Wiig', 'Patty Jenkins', 'In her youth, Diana Prince participates in an island-spanning athletic race on Themyscira against older Amazons. After falling from her horse, Diana takes a shortcut to catch up. However, Antiope removes her from the competition for this, lecturing Diana that any worthwhile goal must be achieved through honest effort..\r\n\r\nIn 1984, Diana works at the Smithsonian Institution in Washington, D.C., while clandestinely performing heroic deeds as a costumed crime fighter. Diana introduces herself to Barbara Ann Minerva, a new archaeologist and zoologist with the museum. Barbara is good-natured, socially awkward and unassertive, which make most people look past her. She forms a friendship with Diana, whom she comes to admire and envy. Barbara is asked by the FBI to identify stolen antiquities from a robbery Diana had foiled. Barbara and Diana notice one artifact — later revealed to be the \"Dreamstone\" — contains a Latin inscription claiming that anyone holding it will have any one wish granted. Diana unknowingly uses the stone to wish her deceased lover Steve Trevor back to life. After being saved by Diana from an attempted sexual assault, Barbara wishes upon the stone to become like Diana, attaining Diana\'s superpowers.', 'women.jpg', 'https://www.youtube.com/embed/OASpkr_ljhw', '12+', 'Hot');
INSERT INTO `movie_info` VALUES (8, 'Venom', '2018-10-03', 'Action', 'English', 112, 'Edward Thomas,Michelle Ingrid Williams,Riz Ahmed', 'Ruben Samuel Fleischer', 'While exploring space for new habitable worlds, a probe belonging to the bio-engineering corporation Life Foundation discovers a comet covered in symbiotic lifeforms. The probe returns to Earth with four samples, but one escapes and causes the ship to crash in Malaysia. The Life Foundation recovers the other three and transports them to their research facility in San Francisco, where they discover that the symbiotes cannot survive without oxygen-breathing hosts, which often fatally reject the symbiosis. Investigative journalist Eddie Brock reads about these human trials in a classified document in the possession of his fiancée Anne Weying, an attorney preparing a lawsuit defense for the Life Foundation. Brock confronts Life Foundation CEO Carlton Drake about the trials, leading to both Brock and Weying losing their jobs. Consequently, Weying ends their relationship.\r\n\r\nSix months later, Drake\'s symbiosis trials are closer to success, though one of his symbiotes dies due to carelessness. Brock is approached by Dora Skirth, one of Drake\'s scientists who disagrees with his methods and wants to expose him. She helps Brock break into the research facility to search for evidence, and he learns that an acquaintance of his, a homeless woman named Maria, is one of the test subjects. Brock attempts to rescue Maria, but the symbiote possessing her transfers to his body without him realizing, leaving her dead. Brock escapes and soon begins displaying strange symptoms. He reaches out to Weying for help, and her new boyfriend, Dr. Dan Lewis, discovers the symbiote on examining Brock. Drake exposes Skirth to the remaining captive symbiote, killing both. This leaves the symbiote inside Brock as the only known surviving specimen.', 'vemon.png', 'https://www.youtube.com/embed/u9Mv98Gr5pY', '18+', 'Hot');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seat_info
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `Theater_open_time` time NULL DEFAULT NULL,
  `Theater_close_time` time NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_ticket_record
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
