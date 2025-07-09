DROP DATABASE IF EXISTS my_tourist_guide;
CREATE DATABASE my_tourist_guide;
USE my_tourist_guide;
CREATE TABLE Guide(
Id INTEGER PRIMARY KEY,
Name VARCHAR(20) NOT NULL,
Address VARCHAR(30),
Contact_no BIGINT
);