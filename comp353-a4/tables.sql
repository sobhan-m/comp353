DROP DATABASE IF EXISTS comp353_a4;
CREATE DATABASE comp353_a4;
USE comp353_a4;

DROP TABLE IF EXISTS Product;
CREATE TABLE Product(
	maker VARCHAR(100),
	model INT,
	type ENUM("pc", "laptop", "printer"),
	CONSTRAINT product_pk PRIMARY KEY (model)
);

DROP TABLE IF EXISTS PC;
CREATE TABLE PC(
	model INT,
	speed FLOAT,
	ram INT,
	hd INT,
	price INT,
	CONSTRAINT pc_pk PRIMARY KEY(model),
	CONSTRAINT pc_fk FOREIGN KEY(model) REFERENCES Product(model)
);

DROP TABLE IF EXISTS Laptop;
CREATE TABLE Laptop(
	model INT,
	speed FLOAT,
	ram INT,
	hd INT,
	screen FLOAT,
	price INT,
	CONSTRAINT laptop_pk PRIMARY KEY(model),
	CONSTRAINT laptop_fk FOREIGN KEY(model) REFERENCES Product(model)
);

DROP TABLE IF EXISTS Printer;
CREATE TABLE Printer(
	model INT,
	color BOOLEAN,
	type ENUM("ink-jet", "laser"),
	price INT,
	CONSTRAINT printer_pk PRIMARY KEY(model),
	CONSTRAINT printer_fk FOREIGN KEY(model) REFERENCES Product(model)
);