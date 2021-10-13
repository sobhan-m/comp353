DROP DATABASE IF EXISTS UDC;
CREATE DATABASE UDC;
USE UDC;

/*
=================================
Branches
=================================
*/

DROP TABLE IF EXISTS Branches;

CREATE TABLE Branches
(
	bID INT AUTO_INCREMENT,
	name VARCHAR(100),
	yearlyBudget INT,
	address VARCHAR(100),
	city VARCHAR(100),
	postalCode CHAR(6),
	province ENUM('NL','PE','NS','NB','QC','ON','MB','SK','AB','BC','YT','NT','NU'),
	country VARCHAR(100),
	PRIMARY KEY (bID)
);

/*
=================================
Departments
=================================
*/

DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments
(
	dID INT AUTO_INCREMENT,
	name VARCHAR(100),
	yearlyBudget INT,
	bID INT,
	PRIMARY KEY (dID),
	FOREIGN KEY bID REFERENCES Branches(bID)
);

/*
=================================
Projects
=================================
*/

DROP TABLE IF EXISTS Projects;

CREATE TABLE Projects
(
	pID INT AUTO_INCREMENT,
	name VARCHAR(100),
	budget INT,
	startDate DATE,
	endDate DATE,
	dID INT,
	PRIMARY KEY (pID),
	FOREIGN KEY dID REFERENCES Departments(dID)
);

/*
=================================
Employees
=================================
*/

DROP IF EXISTS TABLE Employees;

CREATE TABLE Employees
(
	eID INT AUTO_INCREMENT,
	firstName VARCHAR(100),
	lastName VARCHAR(100),
	dateOfBirth VARCHAR(100),
	phoneNumber VARCHAR(100),
	emailAddress VARCHAR(100),
	startDate DATE,
	endDate DATE,
	hourlyWage FLOAT,
	address VARCHAR(100),
	city VARCHAR(100),
	postalCode CHAR(6),
	province ENUM('NL','PE','NS','NB','QC','ON','MB','SK','AB','BC','YT','NT','NU'),
	country VARCHAR(100),
	PRIMARY KEY (eID)
);

/*
=================================
Managers
=================================
*/

DROP TABLE IF EXISTS Managers;

CREATE TABLE Managers
(
	eID INT,
	PRIMARY KEY (eID),
	FOREIGN KEY (eID) REFERENCES Employees(eID)
);

/*
=================================
GeneralManagement
=================================
*/

DROP TABLE IF EXISTS GeneralManagement;

CREATE TABLE GeneralManagement
(
	bID INT,
	managerID INT,
	PRIMARY KEY (bID),
	FOREIGN KEY (bID) REFERENCES Branches(bID),
	FOREIGN KEY (managerID) REFERENCES Managers(eID)	
);

/*
=================================
ProjectManagement
=================================
*/

DROP TABLE IF EXISTS ProjectManagement;

CREATE TABLE ProjectManagement
(
	pID INT,
	managerID INT,
	PRIMARY KEY (pID),
	FOREIGN KEY (pID) REFERENCES Projects(pID),
	FOREIGN KEY (managerID) REFERENCES Managers(eID)	
);

/*
=================================
EmployeeManagement
=================================
*/

DROP TABLE IF EXISTS EmployeeManagement;

CREATE TABLE EmployeeManagement
(
	eID INT,
	managerID INT,
	PRIMARY KEY (eID),
	FOREIGN KEY (eID) REFERENCES Employees(eID),
	FOREIGN KEY (managerID) REFERENCES Managers(eID)	
);

/*
=================================
EmployeeDepartments
=================================
*/

DROP TABLE IF EXISTS EmployeeDepartments;

CREATE TABLE EmployeeDepartments
(
	eID INT,
	dID INT,
	PRIMARY KEY (eID),
	FOREIGN KEY (eID) REFERENCES Employees(eID),
	FOREIGN KEY (dID) REFERENCES Departments(dID)
);

/*
=================================
Assignments
=================================
*/

DROP TABLE IF EXISTS Assignments;

CREATE TABLE Assignments
(
	eID INT,
	pID INT,
	hourlyWage FLOAT,
	numberOfHours INT,
	PRIMARY KEY (eID, pID),
	FOREIGN KEY (eID) REFERENCES Employees(eID),
	FOREIGN KEY (pID) REFERENCES Projects(pID)
);