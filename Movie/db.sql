CREATE DATABASE Movie;
DROP DATABASE Movie;  

-- USER　TABLE --
CREATE TABLE Movie.`User_info` (
    `Uid` INT NOT NULL AUTO_INCREMENT,
    `Email` VARCHAR(50) NOT NULL UNIQUE,
    `Password` VARCHAR(255) NOT NULL,
    `Bio` VARCHAR(255),
    `FirstName`  VARCHAR(20) DEFAULT 'Guest',
    `LastName` VARCHAR(20) DEFAULT 'User',
    `Cash_point` INT DEFAULT '9999',
	PRIMARY KEY(`Uid`)
);
DROP TABLE Movie.`User_info`;

-- movie_info --
CREATE TABLE Movie.`Movie_info`(
	`Movie_id` INT NOT NULL AUTO_INCREMENT,
    `Movie_name` VARCHAR(50),
    `Movie_release_date` DATE NOT NULL,
    `Movie_type` VARCHAR(30) NOT NULL,
    `Movie_language` VARCHAR(20) NOT NULL,
    `Movie_length` INT NOT NULL,
    `Movie_actor` VARCHAR(50) NOT NULL,
    `Movie_director` VARCHAR(50) NOT NULL,
    `Movie_plot` VARCHAR(2500) NOT NULL,
    `Movie_poster` VARCHAR(20) NOT NULL,
    `Movie_trailer` VARCHAR(100)NOT NULL,
    `Movie_restricted_level` VARCHAR(10) NOT NULL,
    `Movie_status` VARCHAR(10) NOT NULL,
    PRIMARY KEY(`Movie_id`)
);
DROP TABLE Movie.`Movie_info`;

-- Theater_info --
CREATE TABLE Movie.`Theater_info`(
	`Theater_id` INT NOT NULL AUTO_INCREMENT,	
    `Theater_name` VARCHAR(50) NOT NULL,
    `Theater_address` VARCHAR(50) NOT NULL,
    `Theater_contact` VARCHAR(20) NOT NULL,
    `Theater_open_time` TIME ,
    `Theater_close_time` TIME ,
    `Theater_image_src` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`Theater_id`)
);
DROP TABLE Movie.`Theater_info`;

-- Session_info --
CREATE TABLE Movie.`Session_info`(
	`Session_id` INT NOT NULL AUTO_INCREMENT,
	`Date` INT NOT NULL,
    `Theater_id` INT NOT NULL,
    `Movie_id` INT NOT NULL,
    `Prices` INT NOT NULL,
    PRIMARY KEY(`Session_id`),
    FOREIGN KEY(`Theater_id`) REFERENCES Movie.`Theater_info`(`Theater_id`),
    FOREIGN KEY(`Movie_id`) REFERENCES Movie.`Movie_info`(`Movie_id`),
	FOREIGN KEY(`Date`) REFERENCES Movie.`Movie_date_info`(`Movie_date_id`)
);
DROP TABLE Movie.`Session_info`;

CREATE TABLE Movie.`Movie_date_info`(
	`Movie_date_id` INT NOT NULL AUTO_INCREMENT,
    `Date_id` INT NOT NULL,
    `Date` DATE NOT NULL,
    `Time` TIME NOT NULL,
    PRIMARY KEY(`Movie_date_id`)
);
DROP TABLE Movie.`Movie_date_info`;

-- Seat_info --
CREATE TABLE Movie.`Seat_info`(
	`Seat_id` INT NOT NULL AUTO_INCREMENT,
    `Session_id` INT NOT NULL,
    `Seat_num` VARCHAR(3) NOT NULL,
    `Seat_status` BOOL NOT NULL DEFAULT 1,
    PRIMARY KEY(`Seat_id`),
    FOREIGN KEY(`Session_id`) REFERENCES Movie.`Session_info`(`Session_id`)
);
DROP TABLE Movie.`Seat_info`;

-- User_ticket_record--
CREATE TABLE Movie.`User_ticket_record`(
	`User_ticket_ids` INT NOT NULL AUTO_INCREMENT,
	`Ticket_id` VARCHAR(10) NOT NULL ,
    `Uid` INT NOT NULL,
    `Session_id` INT NOT NULL,
    `Seat_id` INT NOT NULL,
    `Total_prices` INT NOT NULL,
	`Payment_type` VARCHAR(10) NOT NULL,
	`Ticket_status` VARCHAR(10) NOT NULL,
    PRIMARY KEY(`User_ticket_ids`),
    FOREIGN KEY(`Uid`) REFERENCES Movie.`User_info`(`Uid`),
    FOREIGN KEY(`Session_id`) REFERENCES Movie.`Session_info`(`Session_id`),
	FOREIGN KEY(`Seat_id`) REFERENCES Movie.`Seat_info`(`Seat_id`)
);
DROP TABLE Movie.`User_ticket_record`;

INSERT INTO Movie.`Seat_info`(`Seat_id`,`Session_id`,`Seat_num`,`Seat_status`) VALUES 
(1,1,"A1",false),
(2,1,"A2",false),
(3,1,"A3",false),
(4,1,"A4",false),
(5,1,"A5",false),
(6,1,"A6",false),
(7,1,"A7",false),
(8,1,"A8",false),
(9,1,"A9",false),
(10,1,"A10",true),
(11,1,"B1",false),
(12,1,"B2",false),
(13,1,"B3",false),
(14,1,"B4",true),
(15,1,"B5",true),
(16,1,"B6",false),
(17,1,"B7",false),
(18,1,"B8",false),
(19,1,"B9",false),
(20,1,"B10",false),
(21,1,"C1",false),
(22,1,"C2",false),
(23,1,"C3",false),
(24,1,"C4",true),
(25,1,"C5",true),
(26,1,"C6",false),
(27,1,"C7",false),
(28,1,"C8",false),
(29,1,"C9",false),
(30,1,"C10",false),
(31,1,"D1",false),
(32,1,"D2",false),
(33,1,"D3",false),
(34,1,"D4",true),
(35,1,"D5",true),
(36,1,"D6",false),
(37,1,"D7",false),
(38,1,"D8",false),
(39,1,"D9",false),
(40,1,"D10",false),
(41,1,"E1",false),
(42,1,"E2",false),
(43,1,"E3",false),
(44,1,"E4",true),
(45,1,"E5",true),
(46,1,"E6",false),
(47,1,"E7",false),
(48,1,"E8",false),
(49,1,"E9",false),
(50,1,"E10",false),
(51,1,"F1",true),
(52,1,"F2",true),
(53,1,"F3",true),
(54,1,"F4",true),
(55,1,"F5",true),
(56,1,"F6",true),
(57,1,"F7",true),
(58,1,"F8",true),
(59,1,"F9",true),
(60,1,"F10",true);



INSERT INTO Movie.`Session_info`(`Session_id`, `Date`,`Theater_id`,`Movie_id`,`Prices`) VALUES
(1,1,1,1,"200"),
(2,2,1,1,"200"),
(3,3,1,2,"200"),
(4,4,1,3,"200"),
(5,5,2,1,"200");

INSERT INTO Movie.`Movie_info`(`Movie_id`, `Movie_name`,`Movie_release_date`,`Movie_type`, `Movie_language`,`Movie_length`,`Movie_actor`,`Movie_director`,`Movie_plot`,`Movie_poster`,`Movie_trailer`,`Movie_restricted_level`,`Movie_status`) VALUES
(1,"Avengers: Endgame",'2019-4-22',"Action","English","181","Robert Downey Jr. ,Chris Evans , Mark Ruffalo","Anthony Russo ,Joe Russo","123","avenger-4.jpg","https://www.youtube.com/embed/TcMBFSGVi1c","16+","Hot"),
(2,"The Nun",'2018-9-4',"Horror,Suspense","English","96","Demián Bichir. ,Taissa Farmiga , Jonas Bloquet","Corin Hard","456","the-nun.jpg","https://www.youtube.com/embed/pzD9zGcUNrw","16+","Hot"),
(3,"It",'2017-9-5',"Horror,Suspense","English","135","Jaeden Martell ,Jeremy Ray Taylor , Sophia Lillis","Andy Muschietti","789","it.jpg","https://www.youtube.com/embed/FnCdOQsX5kc","16+","Hot"),
(4,"Iron man 3",'2013-4-14',"Action","English","131","Robert Downey Jr. ,Gwyneth Paltrow ,Don Cheadle","Shane Black","abc","iron-3.jpg","https://www.youtube.com/embed/Ke1Y3P9D0Bc","16+","Hot");

INSERT INTO Movie.`Theater_info`(`Theater_id`, `Theater_name`,`Theater_address`,`Theater_contact`, `Theater_open_time`,`Theater_close_time`,`Theater_image_src`) VALUES
(1,"Horseheads, Regal Arnot Mall","3300 Chambers RdHorseheads, NY 14845","(844) 462-7342","08:00","01:00","t1.jpg"),
(2,"Queensbury, Regal Aviation Mall","578 Aviation Rd Queensbury, NY 12804"," (844) 462-7342","08:00","01:00","t2.jpg"),
(3,"Staten Island, Regal Bricktown Charleston","165 Bricktown Way Staten Island, NY 10309","(844) 462-7342","08:00","01:00","t3.jpg"),
(4,"Plattsburgh, Regal Champlain Centre","60 Smithfield Blvd, Suite 90 Plattsburgh, NY 12901"," (844) 462-7342","08:00","01:00","t4.jpg"),
(5,"Syracuse, Regal Destiny USA 4DX, IMAX & RPX","9586 Destiny USA Drive Syracuse, NY 13204"," (844) 462-7342","08:00","01:00","t5.jpg"),
(6,"Long Island City, Regal UA Kaufman Astoria & RPX","35-30 38th Street Long Island City, NY 11101","(844) 462-7342","08:00","01:00","t6.jpg"),
(7,"Clifton Park, Regal Clifton Park & RPX","22 Clifton Country Road Clifton Park, NY 12065","(844) 462-7342","08:00","01:00","t7.jpg"),
(8,"New York, Regal Essex Crossing & RPX","129 Delancey Street New York, NY 10002","(844) 462-7342","08:00","01:00","t8.jpg");


INSERT INTO Movie.`Movie_date_info`(`Movie_date_id`,`Date_id`,`Date`,`Time`) VALUES 
(1,1,"2020-12-22","08:00"),
(2,1,"2020-12-22","10:00"),
(3,1,"2020-12-22","10:00"),
(4,2,"2020-12-24","10:00"),
(5,2,"2020-12-24","14:00");



select * FROM `Session_info`;
SELECT Movie.`Session_info`.`Session_id`,Movie.`Theater_info`.`Theater_name`,Movie.`Movie_info`.`Movie_name` ,Movie.`Movie_info`.`Movie_id` FROM Movie.`Session_info` 
INNER JOIN Movie.`Theater_info` ON Movie.`Session_info`.`Theater_id` = Movie.`Theater_info`.`Theater_id` 
INNER JOIN Movie.`Movie_info` ON Movie.`Session_info`.`Movie_id` = Movie.`Movie_info`.`Movie_id` 
WHERE  Movie.`Theater_info`.`Theater_id` = 1;

