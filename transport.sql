-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- Database: `transport`
CREATE DATABASE IF NOT EXISTS `transport`;
USE `transport`;

-- Drop if exists for clean creation
DROP PROCEDURE IF EXISTS `abcd`;
DROP PROCEDURE IF EXISTS `nishu`;
DROP PROCEDURE IF EXISTS `raj`;
DROP PROCEDURE IF EXISTS `get_driver_details`;
DROP PROCEDURE IF EXISTS `bus_driver_info`;

-- Drop tables to avoid conflicts
DROP TABLE IF EXISTS `ticket`;
DROP TABLE IF EXISTS `booking_det`;
DROP TABLE IF EXISTS `driver_details`;
DROP TABLE IF EXISTS `bus_details`;
DROP TABLE IF EXISTS `user_info`;
DROP TABLE IF EXISTS `admin`;

-- Table: admin
CREATE TABLE `admin` (
  `a_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `psw` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table: user_info
CREATE TABLE `user_info` (
  `uid` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `uname` VARCHAR(30) NOT NULL,
  `age` VARCHAR(30) NOT NULL,
  `adhar_no` VARCHAR(30) NOT NULL,
  `psw` VARCHAR(30) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table: bus_details
CREATE TABLE `bus_details` (
  `bus_id` INT(11) NOT NULL AUTO_INCREMENT,
  `bname` VARCHAR(30) NOT NULL,
  `bno` VARCHAR(20) NOT NULL,
  `bfrom` VARCHAR(30) NOT NULL,
  `bto` VARCHAR(30) NOT NULL,
  `time` VARCHAR(10) NOT NULL,
  `type` VARCHAR(10) NOT NULL,
  `no_seat` INT(11) NOT NULL,
  `fare` INT(11) NOT NULL,
  PRIMARY KEY (`bus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table: driver_details
CREATE TABLE `driver_details` (
  `driver_id` INT NOT NULL AUTO_INCREMENT,
  `driver_name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `license_no` VARCHAR(30) NOT NULL,
  `bus_id` INT NOT NULL,
  PRIMARY KEY (`driver_id`),
  FOREIGN KEY (`bus_id`) REFERENCES `bus_details`(`bus_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table: booking_det
CREATE TABLE `booking_det` (
  `bus_id` INT(11) NOT NULL,
  `vacant` INT(11) NOT NULL,
  `jdate` VARCHAR(30) NOT NULL,
  `bfrom` VARCHAR(30) NOT NULL,
  `bto` VARCHAR(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table: ticket
CREATE TABLE `ticket` (
  `tid` INT(11) NOT NULL AUTO_INCREMENT,
  `bus_id` INT(11) NOT NULL,
  `uid` INT(11) NOT NULL,
  `seat_no` VARCHAR(30) NOT NULL,
  `no_seat` INT(11) NOT NULL,
  `ticket_status` VARCHAR(30) NOT NULL,
  `jdate` VARCHAR(30) NOT NULL,
  `booking_date` DATE NOT NULL,
  `pname` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert admin data
INSERT INTO `admin` (`a_id`, `name`, `psw`) VALUES
(1, 'admin', 'admin');

-- Insert user info
INSERT INTO `user_info` (`uid`, `name`, `uname`, `age`, `adhar_no`, `psw`, `email`) VALUES
(1, 'Rajesh', 'rajesh', '22', '123456', 'rajesh', 'raj@gmail.com'),
(2, 'Nishant', 'nishant', '22', '12345', 'nishant', 'ni@gmail.com'),
(3, 'Rajeev Kumar', 'rajeev', '23', '1234567', 'rajeev', 'ra@gmail.com');

-- Insert bus details
INSERT INTO `bus_details` (`bus_id`, `bname`, `bno`, `bfrom`, `bto`, `time`, `type`, `no_seat`, `fare`) VALUES
(2, 'Toofan Express', 'mp 30 sc 0137', 'Bhind', 'Delhi', '6pm', 'Ac', 80, 1000),
(3, 'Satabdi Express', 'MP07 Se1212', 'Bhind', 'Delhi', '7 pm', 'Non Ac', 80, 500),
(4, 'Janrath', 'up16sc1212', 'Lucknow', 'gorakhpur', '6am', 'Ac', 80, 350),
(5, 'Taj express', 'mp30Ka1213', 'Bangalore', 'Ladakh', '8AM', 'Ac', 80, 5000);

-- Insert driver details
INSERT INTO `driver_details` (`driver_name`, `phone`, `license_no`, `bus_id`) VALUES
('Ramesh Singh', '9876543210', 'DL-12345', 2),
('Suresh Yadav', '9123456789', 'MP-98765', 3),
('Amit Kumar', '9988776655', 'UP-11223', 4),
('Ravi Verma', '9911223344', 'KA-33445', 5);

-- Insert booking details
INSERT INTO `booking_det` (`bus_id`, `vacant`, `jdate`, `bfrom`, `bto`) VALUES
(3, 75, '2019-11-16', 'Bhind', 'Delhi'),
(2, 78, '2019-11-21', 'Bhind', 'Delhi'),
(5, 70, '2019-11-23', 'Bangalore', 'Ladakh');

-- Insert tickets
INSERT INTO `ticket` (`tid`, `bus_id`, `uid`, `seat_no`, `no_seat`, `ticket_status`, `jdate`, `booking_date`, `pname`) VALUES
(1, 3, 1, '1 2', 2, 'Conform', '2019-11-16', '2019-11-17', 'rajesh'),
(2, 2, 1, '1 2', 2, 'Conform', '2019-11-21', '2019-11-21', 'Rajesh'),
(3, 5, 2, '1 2 3 4 5 6 7 8 9 10', 10, 'Conform', '2019-11-23', '2019-11-21', 'Nishant'),
(4, 3, 3, '3 4 5', 3, 'Conform', '2019-11-16', '2019-11-21', 'Rajeev Kumar');

-- Procedures
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `abcd` (IN `push` INT) NO SQL
BEGIN
  SELECT * FROM user_info;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nishu` (IN `bus` INT) NO SQL
BEGIN
  SELECT * FROM bus_details;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `raj` (IN `raj` INT) NO SQL
BEGIN
  SELECT * FROM ticket;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_driver_details`() NO SQL
BEGIN
  SELECT * FROM driver_details;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `bus_driver_info`() NO SQL
BEGIN
  SELECT b.bus_id, b.bname, b.bno, b.bfrom, b.bto, b.time, b.type, b.no_seat, b.fare,
         d.driver_name, d.phone, d.license_no
  FROM bus_details b
  JOIN driver_details d ON b.bus_id = d.bus_id;
END$$

DELIMITER ;

-- Final commit
COMMIT;
