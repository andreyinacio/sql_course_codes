/* All of the questions in this quiz refer to the open source Chinook Database. The ER diagram is available on:
https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png */

/* 1. Retrieve all the records from the Employees table. */
SELECT * 
FROM Employees;


/* 2. Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the 
Employees table.*/
SELECT 
FirstName,
LastName,
Birthdate,
Address,
City,
State
FROM Employees;

/* 3. Retrieve all the columns from the Tracks table, but only return 20 rows.*/
SELECT * 
FROM Tracks
LIMIT 20;
