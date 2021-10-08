/*
================================================
Part 1 - A
================================================
*/

-- Initiating a database.
CREATE DATABASE UDC;
USE UDC;

-- Creating the employee table.
CREATE TABLE Employees 
(
	eID INT AUTO_INCREMENT,
	firstName VARCHAR(150),
	lastName VARCHAR(150),
	middleInitial CHAR(1),
	dateOfBirth DATE,
	deptID INT,
	hourlyWage FLOAT,
	address VARCHAR(150),
	city VARCHAR(150),
	postalCode VARCHAR(6),
	province ENUM('NL','PE','NS','NB','QC','ON','MB','SK','AB','BC','YT','NT','NU'),
	PRIMARY KEY (eID)
);

-- Creating department table.
CREATE TABLE Departments
(
	dID INT AUTO_INCREMENT,
	name VARCHAR(150),
	budget FLOAT,
	managerID INT,
	PRIMARY KEY (dID)
);

-- Creating projects table.
CREATE TABLE Projects
(
	pID INT AUTO_INCREMENT,
	name VARCHAR(150),
	deptID INT,
	budget FLOAT,
	startDate DATE,
	endDATE DATE,
	PRIMARY KEY (pID)
);

-- Creating assignments table.
CREATE TABLE Assignments
(
	empID INT,
	projectID INT,
	startDate DATE,
	hoursAssigned INT unsigned,
	PRIMARY KEY (empID, projectID)
);

/*
================================================
Part 1 - B
================================================
*/

ALTER TABLE Employees DROP COLUMN middleInitial;

/*
================================================
Part 1 - C
================================================
*/

ALTER TABLE Employees
	ADD phone VARCHAR(150) DEFAULT "Unknown",
	ADD email VARCHAR(150) DEFAULT "Unknown";

/*
================================================
Part 1 - D
================================================
*/

INSERT INTO Employees
	(firstName, lastName, dateOfBirth, hourlyWage, address, city, postalCode, province, phone, email)
	VALUES ("John", "Smith", "1970-01-01", 10, "111 Rue", "Montreal", "A1A1A1", "QC", 111111, "john.smith@mail.com");

INSERT INTO Employees
	(firstName, lastName, dateOfBirth, hourlyWage, address, city, postalCode, province, phone, email)
	VALUES ("Mary", "Jane", "1980-01-01", 20, "222 Rue", "Montreal", "B2B2B2", "QC", 222222, "mary.jane@mail.com");

INSERT INTO Employees
	(firstName, lastName, dateOfBirth, hourlyWage, address, city, postalCode, province)
	VALUES ("Bruce", "Wayne", "1990-01-01", 30, "333 Rue", "Gotham", "C3C3C3", "QC");

/*
================================================
Part 1 - E
================================================
*/

DELETE FROM Employees WHERE eID >= 0;

/*
================================================
Part 1 - F
================================================
*/

DROP TABLE Assignments;
DROP TABLE Projects;
DROP TABLE Employees;
DROP TABLE Departments;



/*
================================================
Part 2 - A
================================================
*/

-- The following are just rows in order to test out the queries.
INSERT INTO Departments (name, budget, managerID)
	VALUES ("ABC", 11111.11, 1),
	("DEF", 22222.22, 2),
	("GHI", 33333.33, 3);

INSERT INTO Employees (firstName, lastName, dateOfBirth, phone, email, hourlyWage, deptID, city)
	VALUES ("John", "Smith", "1970-01-01", "1111111111", "john.smith@mail.com", 111.11, 1, "Montreal"),
	("Samantha", "Singer", "1980-01-01", "2222222222", "samantha.singer@mail.com", 222.22, 2, "Montreal"),
	("Eric", "Dirk", "1990-01-01", "3333333333", "eric.dirk@mail.com", 333.33, 3, "Laval"),
	("Han", "Solo", "2000-01-01", "4444444444", "han.solo@falcon.com", 444.44, 2, "Laval"),
	("Harry", "Potter", "2001-01-1", "5555555555", "harry.potter@hogwarts.com", 555.55, 1, "London"),
	("Obi Wan", "Kenobi", "2002-01-01", "6666666666", "obi.wan@jedi.com", 666.66, 1, "Laval"),
	("Roger", "Albertson", "2003-01-01", "7777777777", "roger.albertson@mail.com", 777.77, 1, "Montreal");

INSERT INTO Projects (name, deptID, budget, startDate)
	VALUES ("A", 1, 1111, "1970-01-01"),
	("B", 1, 2222, "1980-01-01"),
	("C", 2, 3333, "1990-01-01"),
	("D", 2, 4444, "2000-01-01"),
	("E", 2, 5555, "2010-01-01"),
	("F", 3, 6666, "2020-01-01");

INSERT INTO Assignments (empID, projectID, startDate, hoursAssigned)
	VALUES (1, 1, "1970-01-01", 3),
	(1, 2, "1980-01-01", 13),
	(1, 5, "2000-01-01", 5),
	(2, 3, "1970-01-01", 4),
	(2, 4, "1980-01-01", 2),
	(2, 5, "1990-01-01", 11),
	(3, 1, "1930-01-01", 15),
	(3, 6, "1940-01-01", 21),
	(4, 3, "1980-01-01", 13),
	(5, 1, "2000-01-01", 11),
	(5, 2, "2010-01-01", 5),
	(5, 3, "2020-01-01", 3),
	(6, 2, "1990-01-01", 1),
	(6, 3, "2030-01-01", 10),
	(7, 3, "1990-01-01", 17),
	(7, 2, "1970-01-01", 20);

SELECT e.firstName, e.lastName, e.dateOfBirth, e.phone, e.email, d.name, e.hourlyWage
	FROM Employees e INNER JOIN Departments d 
		ON e.deptID = d.dID
	WHERE e.city = 'Montreal';

/*
================================================
Part 2 - B
================================================
*/

SELECT a.empID, COUNT(a.projectID), SUM(a.hoursAssigned)
	FROM Assignments a INNER JOIN Employees e ON a.empID = e.eID
	WHERE e.city = 'Laval'
	GROUP BY a.empID;

/*
================================================
Part 2 - C
================================================
*/

-- Robert's hours in the project.
SELECT p.name, d.name, p.startDate, a.hoursAssigned
	FROM (((Employees e INNER JOIN Assignments a
		ON e.eID = a.empID) INNER JOIN Projects p
			ON a.projectID = p.pID) INNER JOIN Departments d
				ON p.deptID = d.dID)
	WHERE e.firstName = "Roger" AND e.lastName = "Albertson";

-- Total hours in all the projects Robert is a part of.
SELECT q1.projectName, q1.departmentName, q1.startDate, q2.totalHours
	FROM (
		SELECT p.name projectName, d.name departmentName, p.startDate
			FROM (((Employees e INNER JOIN Assignments a
				ON e.eID = a.empID) INNER JOIN Projects p
					ON a.projectID = p.pID) INNER JOIN Departments d
						ON p.deptID = d.dID)
		WHERE e.firstName = "Roger" AND e.lastName = "Albertson") q1 
			INNER JOIN
		(
		SELECT p.name allProjectNames, SUM(a.hoursAssigned) totalHours
			FROM Projects p INNER JOIN Assignments a
				ON p.pID = a.projectID
			GROUP BY p.name) 
		q2 ON q1.projectName = q2.allProjectNames;
        
/*
================================================
Part 2 - D
================================================
*/

SELECT DISTINCT q2.name, q2.firstName, q2.lastName, q2.budget, q1.totalProjectBudget
	FROM (
	SELECT d.name, SUM(p.budget) totalProjectBudget
		FROM ((Departments d INNER JOIN Employees m
			ON d.managerID = m.eID) INNER JOIN Projects p
				ON p.deptID = d.dID)
		GROUP BY d.name) q1
        INNER JOIN (
	SELECT d.name, m.firstName, m.lastName, d.budget
		FROM ((Departments d INNER JOIN Employees m
			ON d.managerID = m.eID) INNER JOIN Projects p
				ON p.deptID = d.dID)) q2
        ON q1.name = q2.name;

/*
================================================
Part 2 - E
================================================
*/

SELECT e.firstName, e.lastName
	FROM ((Employees e INNER JOIN Assignments a
		ON e.eID = a.empID) INNER JOIN Projects p
			ON p.pID = a.projectID)
	WHERE e.deptID <> p.deptID;