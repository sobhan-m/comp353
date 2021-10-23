# Relational Schema
Here is the relational schema for the different relations in this database.

## Notation
- **Primary Key:** The attributes that make up the primary key will be <ins>underlined</ins>.
- **Foreign Key:** The attributes that are foreign keys will have the following form:
	-	foreignKey -> ForeignTable(tableAttribute)

## Schema
- Branches(<ins>bID</ins>, name, yearlyBudget, address, city, postalCode, province, country)
- Departments(<ins>dID</ins>, name, yearlyBudget, bID -> Branches(bID))
- Projects(<ins>pID</ins>, name, budget, startDate, endDate, dID -> Departments(dID))
- Employees(<ins>eID</ins>, firstName, lastName, dateOfBirth, phoneNumber, emailAddress, startDate, endDate, hourlyWage, address, city, postalCode, province, country)
- Managers(<ins>eID</ins> -> Employees(eID))
- GeneralManagement(<ins>bID</ins> -> Branches(bID), managerID -> Managers(eID))
- ProjectManagement(<ins>pID</ins> -> Projects(pID), managerID -> Managers(eID))
- EmployeeManagement(<ins>eID</ins> -> Employees(eID), managerID -> Managers(eID))
- EmployeeDepartments(<ins>eID</ins> -> Employees(eID), dID -> Departments(dID))
- Assignments(<ins>eID</ins> -> Employees(eID), <ins>pID</ins> -> Projects(pID), hourlyWage, numberOfHours, assignedDate)

