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
    `Movie_type` VARCHAR(20) NOT NULL,
    `Movie_language` VARCHAR(20) NOT NULL,
    `Movie_length` INT NOT NULL,
    `Movie_actor` VARCHAR(50) NOT NULL,
    `Movie_director` VARCHAR(50) NOT NULL,
    `Movie_plot` VARCHAR(1000) NOT NULL,
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
    `Date` DATE NOT NULL,
    `Time` TIME NOT NULL,
    `Theater_id` INT NOT NULL,
    `Movie_id` INT NOT NULL,
    `Prices` INT NOT NULL,
    PRIMARY KEY(`Session_id`),
    FOREIGN KEY(`Theater_id`) REFERENCES Movie2.`Theater_info`(`Theater_id`),
    FOREIGN KEY(`Movie_id`) REFERENCES Movie2.`Movie_info`(`Movie_id`)
);
DROP TABLE Movie.`Session_info`;

-- Seat_info --
CREATE TABLE Movie.`Seat_info`(
	`Seat_id` INT NOT NULL AUTO_INCREMENT,
    `Session_id` INT NOT NULL,
    `Seat_num` VARCHAR(255) NOT NULL,
    `Seat_status` BOOL NOT NULL DEFAULT 1,
    PRIMARY KEY(`Seat_id`),
    FOREIGN KEY(`Session_id`) REFERENCES Movie2.`Session_info`(`Session_id`)
);
DROP TABLE Movie.`Seat_info`;

-- User_ticket_record--
CREATE TABLE Movie.`User_ticket_record`(
	`Ticket_id` VARCHAR(10) NOT NULL ,
    `Uid` INT NOT NULL,
    `Session_id` INT NOT NULL,
    `Total_prices` INT NOT NULL,
	`Payment_type` VARCHAR(10) NOT NULL,
	`Ticket_status` VARCHAR(10) NOT NULL,
    PRIMARY KEY(`Ticket_id`),
    FOREIGN KEY(`Uid`) REFERENCES Movie2.`User_info`(`Uid`),
    FOREIGN KEY(`Session_id`) REFERENCES Movie2.`Session_info`(`Session_id`)
);
DROP TABLE Movie.`User_ticket_record`;




INSERT INTO Movie.`Movie_info`(`Movie_id`, `Movie_name`,`Movie_release_date`,`Movie_type`, `Movie_language`,`Movie_length`,`Movie_actor`,`Movie_director`,`Movie_plot`,`Movie_poster`,`Movie_trailer`,`Movie_restricted_level`,`Movie_status`) VALUES
(1,"Avengers: Endgame",'2019-4-22',"Action","English","181","Robert Downey Jr. ,Chris Evans , Mark Ruffalo","Anthony Russo ,Joe Russo","123","avenger-4.jpg","https://www.youtube.com/embed/TcMBFSGVi1c","16+","Hot"),
(2,"The Nun",'2018-9-4',"Horror","English","96","Demián Bichir. ,Taissa Farmiga , Jonas Bloquet","Corin Hard","456","the-nun.jpg","https://www.youtube.com/embed/pzD9zGcUNrw","16+","Hot"),
(3,"It",'2017-9-5',"Horror","English","135","Jaeden Martell ,Jeremy Ray Taylor , Sophia Lillis","Andy Muschietti","789","it.jpg","https://www.youtube.com/embed/FnCdOQsX5kc","16+","Hot"),
(4,"Iron man 3",'2013-4-14',"Action","English","131","Robert Downey Jr. ,Gwyneth Paltrow ,Don Cheadle","Shane Black","abc","iron-3.jpg","https://www.youtube.com/embed/Ke1Y3P9D0Bc","16+","Hot");

INSERT INTO Movie.`Theater_info`(`Theater_id`, `Theater_name`,`Theater_address`,`Theater_contact`, `Theater_open_time`,`Theater_close_time`,`Theater_image_src`) VALUES
(1,"Horseheads, Regal Arnot Mall","3300 Chambers RdHorseheads, NY 14845","(844) 462-7342","08:00","","t1.jpg"),
(2,"Queensbury, Regal Aviation Mall","578 Aviation Rd Queensbury, NY 12804"," (844) 462-7342","","","t2.jpg"),
(3,"Staten Island, Regal Bricktown Charleston","165 Bricktown Way Staten Island, NY 10309","(844) 462-7342","","","t3.jpg"),
(4,"Plattsburgh, Regal Champlain Centre","60 Smithfield Blvd, Suite 90 Plattsburgh, NY 12901"," (844) 462-7342","","","t4.jpg"),
(5,"Syracuse, Regal Destiny USA 4DX, IMAX & RPX","9586 Destiny USA Drive Syracuse, NY 13204"," (844) 462-7342","","","t5.jpg"),
(6,"Long Island City, Regal UA Kaufman Astoria & RPX","35-30 38th Street Long Island City, NY 11101","(844) 462-7342","","","t6.jpg"),
(7,"Clifton Park, Regal Clifton Park & RPX","22 Clifton Country Road Clifton Park, NY 12065","(844) 462-7342","","","t7.jpg"),
(8,"New York, Regal Essex Crossing & RPX","129 Delancey Street New York, NY 10002","(844) 462-7342","","","t8.jpg");
