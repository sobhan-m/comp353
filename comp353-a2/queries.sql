/*
=================================
Query A
=================================
*/

SELECT b.bID, b.country, b.name, CONCAT(m.firstName, " ", m.lastName) generalManager, b.yearlyBudget, COUNT(DISTINCT d.dID) departmentCount, COUNT(DISTINCT e.eID) employeeCount, COUNT(DISTINCT p.pID) projectCount FROM Branches b 
	LEFT JOIN GeneralManagement gm ON b.bID = gm.bID
	LEFT JOIN Employees m ON gm.managerID = m.eID
	LEFT JOIN Departments d ON b.bID = d.bID
	LEFT JOIN Projects p ON p.dID = d.dID
	LEFT JOIN EmployeeDepartments em ON d.dID = em.dID
	LEFT JOIN Employees e ON e.eID = em.eID
GROUP BY b.bID
ORDER BY b.country ASC, b.yearlyBudget DESC;

/*
=================================
Query B
=================================
*/

SELECT b.country, b.name branchName, p.name projectName, CONCAT(m.firstName, " ", m.lastName) projectManager, p.startDate, a.assignedDate, a.numberOfHours, a.hourlyWage FROM Employees e
	INNER JOIN EmployeeDepartments ed ON e.eID = ed.eID
	INNER JOIN Departments d ON ed.dID = d.dID
	INNER JOIN Branches b ON d.bID = b.bID
	INNER JOIN Assignments a ON a.eID = e.eID
	INNER JOIN Projects p ON a.pID = p.pID
	LEFT JOIN ProjectManagement pm ON pm.pID = p.pID
	LEFT JOIN Employees m ON m.eID = pm.managerID
WHERE e.firstName = "Alfred" AND e.lastName = "McDonald"
ORDER BY b.country ASC;

/*
=================================
Query C
=================================
*/

SELECT e.eID, e.firstName, e.lastName, e.phoneNumber, d.name departmentName, m.firstName managerFirstName, m.lastName managerLastName, e.startDate, e.hourlyWage, COUNT(a.pID) numberOfProjects FROM Employees e
	INNER JOIN EmployeeDepartments ed ON e.eID = ed.eID
	INNER JOIN Departments d ON ed.dID = d.dID
	INNER JOIN Branches b ON d.bID = b.bID
	LEFT JOIN Assignments a ON a.eID = e.eID
    LEFT JOIN EmployeeManagement em ON em.eID = e.eID
	LEFT JOIN Employees m ON m.eID = em.managerID
WHERE b.bID = 1
GROUP BY e.eID
HAVING numberOfProjects = 0;

/*
=================================
Query D
=================================
*/

SELECT d.dID, d.name, d.yearlyBudget, SUM(p.budget) totalProjectBudget FROM Departments d
	INNER JOIN Branches b ON d.bID = b.bID
	LEFT JOIN Projects p ON p.dID = d.dID
WHERE d.bID = 1
GROUP BY d.dID
HAVING d.yearlyBudget < totalProjectBudget;


/*
=================================
Query E
=================================
*/

SELECT e.eID, e.firstName, e.lastName, e.phoneNumber, COUNT(a.pID) numOfProjects, SUM(a.numberOfHours) hoursInProjects FROM Employees e 
	INNER JOIN EmployeeDepartments ed ON e.eID = ed.eID
	INNER JOIN Departments d ON ed.dID = d.dID
	INNER JOIN Branches b ON d.bID = b.bID
	LEFT JOIN Assignments a ON a.eID = e.eID
WHERE b.bID = 1
GROUP BY e.eID
HAVING numOfProjects >= 5;
