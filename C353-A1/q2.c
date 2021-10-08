 #include <mysql.h>
 #include <stdio.h>

 // Compile and run using the following commands:
 // gcc -o q2 q2.c `mysql_config --cflags --libs` && ./q2
 
 // Many of the commands/structures of the code come directly from the MySQL API documentation.
 int main() {

     MYSQL *connection;
     MYSQL_RES *results;
     MYSQL_ROW row;

     char *server = "localhost";
     char *user = "root"; // Replace with the appropriate user for the server.
     char *password = "password"; // Replace with the appropriate password for the server.
     char *database = "UDC";

     // Connecting to the database.
	 connection = mysql_init(NULL);
	 if (!mysql_real_connect(connection, server, user, password, database, 0, NULL, 0))
	 {
		 printf("Error when connecting to the database.\n");
		 return 1;
	 }
     

	// Executing commands.
	char* query_deleteDatabase = "DROP TABLE IF EXISTS Employees";
	char* query_createTable = "CREATE TABLE Employees (eID INT AUTO_INCREMENT,firstName VARCHAR(150),lastName VARCHAR(150),middleInitial CHAR(1),dateOfBirth DATE,deptID INT,hourlyWage FLOAT(8,2),addr MEDIUMTEXT,city VARCHAR(150),postalCode VARCHAR(6),province ENUM('NL','PE','NS','NB','QC','ON','MB','SK','AB','BC','YT','NT','NU'), phone INT, email VARCHAR(150), PRIMARY KEY (eID))";
	char* query_createEmployee = "INSERT INTO Employees (firstName, lastName, dateOfBirth, hourlyWage, addr, city, postalCode, province, phone, email) VALUES ('John', 'Smith', '1970-01-01', 10, '111 Rue', 'Montreal', 'A1A1A1', 'QC', 111111, 'john.smith@mail.com')";
	char* query_displayAllEmployees = "SELECT * FROM Employees WHERE city='Montreal'";

	mysql_query(connection, query_deleteDatabase);
    mysql_query(connection, query_createTable);
	mysql_query(connection, query_createEmployee);
    mysql_query(connection, query_displayAllEmployees);

	// Displaying the results.
    results = mysql_store_result(connection);

	int numOfColumns = mysql_num_fields(results);
	while((row = mysql_fetch_row(results)))
	{
		for(int i = 0 ; i < numOfColumns ; i++)
			printf("%s\t", row[i] ? row[i] : "NULL");
		printf("\n");
	}

    // Terminating MySQL.
    mysql_free_result(results);
    mysql_close(connection);

	return 0;
}

/*

Using high level SQL commands in a DBMS is much more intuitive and quick compared to writing an equivalent program in C.
Its ease of use means it will be easier for design, testing, and maintanence.

However, an equivalent program in C/Java is better for the practical application of the data, after the database has been set up.

*/