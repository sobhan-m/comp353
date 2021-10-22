/*
=========================================
Branches
=========================================
*/

INSERT INTO Branches 
	(name, yearlyBudget, address, city, postalCode, province, country) VALUES 
	("Alpha", 1111111, "1 Street", "Montreal", "A1A1A1", "QC", "Canada"),
	("Beta", 2222222, "2 Street", "Laval", "B2B2B2", "QC", "Canada"),
	("Charlie", 3333333, "3 Street", "Montreal", "C3C3C3", "QC", "Canada"),
	("Delta", 4444444, "4 Street", "Cote-Saint-Luc", "D4D4D4", "QC", "Canada"),
	("Epsilon", 5555555, "5 Street", "Vancouver", "E5E5E5", "BC", "Canada"),
	("Foxtrot", 6666666, "6 Street", "Calgary", "F6F6F6", "AB", "Canada"),
	("Golf", 7777777, "7 Street", "Ontario", "G7G7G7", "ON", "Canada");

/*
=========================================
Departments
=========================================
*/

INSERT INTO Departments
	(name, yearlyBudget, bID) VALUES
	("Department A", 11111, 1),
	("Department B", 22222, 1),
	("Department C", 33333, 2),
	("Department D", 44444, 2),
	("Department E", 55555, 2),
	("Department F", 66666, 3),
	("Department G", 77777, 4),
	("Department H", 88888, 5),
	("Department I", 99999, 5),
	("Department J", 10000, 6),
	("Department K", 11000, 6),
	("Department L", 12000, 7);

/*
=========================================
Projects
=========================================
*/

INSERT INTO Projects
	(name, budget, startDate, endDate, dID) VALUES
	("A", 1111, "2001-01-01", "2006-01-01", 1),
	("B", 2222, "2002-01-01", "2004-01-01", 1),
	("C", 3333, "2003-01-01", "2007-01-01", 2),
	("D", 4444, "2004-01-01", "2008-01-01", 3),
	("E", 5555, "2005-01-01", NULL, 5),
	("F", 6666, "2006-01-01", "2010-01-01", 6),
	("F", 7777, "2007-01-01", "2012-01-01", 6),
	("G", 8888, "2008-01-01", "2015-01-01", 7),
	("H", 9999, "2009-01-01", NULL, 8),
	("I", 1000, "2010-01-01", "2011-01-01", 9),
	("J", 1100, "2011-01-01", "2013-01-01", 10),
	("K", 1200, "2012-01-01", NULL, 10),
	("L", 1300, "2013-01-01", NULL, 11),
	("M", 1400, "2014-01-01", "2020-01-01", 12),
	("N", 1500, "2015-01-01", NULL, 12),
	("O", 1600, "2016-01-01", NULL, 12);

/*
=========================================
Employees
=========================================
*/

INSERT INTO Employees
	(firstName, lastName, dateOfBirth, phoneNumber, emailAddress, startDate, 
	endDate, hourlyWage, address, city, postalCode, province,country) VALUES
	("Alex", "Andrew", "1991-01-01", "11111", "a.a@a.com", "2011-01-01",
	"2020-01-01", 20.1, "1 Street", "Montreal", "A1A1A1", "QC", "Canada"),
	("Bertrand", "Bruce", "1992-01-01", "22222", "b.b@b.com", "2000-01-01",
	NULL, 20.2, "2 Street", "Laval", "B2B2B2", "QC", "Canada"),
	("Charlie", "Chungus", "1993-01-01", "33333", "c.c@c.com", "2013-01-01",
	"2021-01-01", 20.3, "3 Street", "Montreal", "C3C3C3", "QC", "Canada"),
	("Doyle", "Derek", "1994-01-01", "44444", "d.d@d.com", "2004-01-01",
	NULL, 20.4, "4 Street", "Laval", "D4D4D4", "QC", "Canada"),
	("Ellie", "Enderson", "1995-01-01", "55555", "e.e@e.com", "2001-01-01",
	"2019-01-01", 20.5, "5 Street", "Calgary", "E5E5E5", "AB", "Canada"),
	("Francois", "Fourgrois", "1996-01-01", "66666", "f.f@f.com", "2011-01-01",
	NULL, 20.6, "6 Street", "Vancouver", "F6F6F6", "BC", "Canada"),
	("Genny", "Garfield", "1997-01-01", "77777", "g.g@g.com", "2020-01-01",
	"2012-01-01", 20.7, "7 Street", "Cote-Saint-Luc", "G7G7G7", "QC", "Canada"),
	("Han", "Hao", "1998-01-01", "88888", "h.h@h.com", "2019-01-01",
	NULL, 20.8, "8 Street", "Montreal", "H8H8H8", "QC", "Canada"),
	("Indiera", "Ina", "1999-01-01", "99999", "i.i@i.com", "2012-01-01",
	"2013-01-01", 20.9, "9 Street", "Calgary", "I9I9I9", "AB", "Canada"),
	("Jack", "Johnson", "2000-01-01", "10000", "j.j@j.com", "2008-01-01",
	NULL, 20.101, "10 Street", "Ontario", "J0J0J0", "ON", "Canada"),
	("Kevin", "Kernel", "2001-01-01", "11000", "k.k@k.com", "2016-01-01",
	"2016-01-01", 20.11, "11 Street", "Calgary", "K1K1K1", "AB", "Canada"),
	("Liam", "Lenard", "2002-01-01", "12000", "l.l@l.com", "2019-01-01",
	NULL, 20.12, "12 Street", "Vancouver", "L2L2L2", "BC", "Canada"),
	("Mohammad", "Mostafa", "2003-01-01", "13000", "m.m@m.com", "2021-01-01",
	"2019-01-01", 20.13, "13 Street", "Vancouver", "M3M3M3", "BC", "Canada"),
	("Noah", "Nelson", "2004-01-01", "14000", "n.n@n.com", "2020-01-01",
	NULL, 20.14, "14 Street", "Laval", "N4N4N4", "QC", "Canada"),
	("Oleg", "Olevsky", "2005-01-01", "15000", "o.o@o.com", "2021-01-01",
	"2020-01-01", 20.15, "15 Street", "Ontario", "O5O5O5", "ON", "Canada"),
	("Peter", "Pan", "2006-01-01", "16000", "p.p@p.com", "2019-01-01",
	NULL, 20.16, "16 Street", "Ontario", "P6P6P6", "ON", "Canada"),
	("Quentin", "Queens", "2007-01-01", "17000", "q.q@q.com", "2015-01-01",
	"2021-01-01", 20.17, "17 Street", "Calgary", "Q7Q7Q7", "AB", "Canada"),
	("Randal", "Ross", "2008-01-01", "18000", "r.r@r.com", "2009-01-01",
	NULL, 20.18, "18 Street", "Vancouver", "R8R8R8", "BC", "Canada");

/*
=========================================
Managers
=========================================
*/

INSERT INTO Managers
	(eID) VALUES
	(1),
	(2),
	(5),
	(7),
	(9),
	(12),
	(16),
	(18);

/*
=========================================
General Management
=========================================
*/

INSERT INTO GeneralManagement
	(bID, managerID) VALUES
	(1, 1),
	(4, 2),
	(5, 5),
	(6, 9);

/*
=========================================
Project Management
=========================================
*/

INSERT INTO ProjectManagement
	(pID, managerID) VALUES
	(1, 7),
	(2, 9),
	(3, 12),
	(4, 12);

/*
=========================================
Employee Management
=========================================
*/

INSERT INTO EmployeeManagement
	(eID, managerID) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 2),
	(5, 2),
	(6, 5),
	(7, 7),
	(8, 7),
	(9, 9),
	(10 ,12),
	(11, 12),
	(12, 12),
	(13, 16),
	(14, 16),
	(15, 18),
	(16, 18),
	(17, 18),
	(18, 18);

/*
=========================================
Employee Departments
=========================================
*/

INSERT INTO EmployeeDepartments
	(eID, dID) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 2),
	(5, 3),
	(6, 4),
	(7, 4),
	(8, 5),
	(9, 6),
	(10, 7),
	(11, 8),
	(12, 9),
	(13, 10),
	(14, 10),
	(15, 11),
	(16, 11),
	(17, 12),
	(18, 12);

/*
=========================================
Assignments
=========================================
*/

INSERT INTO Assignments
	(eID, pID, hourlyWage, numberOfHours) VALUES
	(1, 1, 11, 1),
	(2, 1, 12, 2),
	(3, 2, 13, 3),
	(4, 3, 14, 4),
	(5, 4, 15, 5),
	(6, 5, 16, 6),
	(7, 6, 17, 7),
	(8, 7, 18, 8),
	(9, 8, 19, 9),
	(10, 9, 20, 10),
	(11, 10, 21, 11),
	(12, 11, 22, 12),
	(13, 12, 23, 13),
	(14, 13, 24, 14),
	(15, 14, 25, 15),
	(16, 15, 26, 16),
	(17, 16, 27, 17),
	(18, 3, 28, 18);
