/* 1. Pull a list of customer ids with the customer’s full name, and address, along with 
combining their city and country together. Be sure to make a space in between these 
two and make it UPPER CASE. (e.g. LOS ANGELES USA) */
SELECT 
CustomerID, 
FirstName || ' ' ||LastName AS FullName, 
Address, UPPER(City ||' '|| Country) AS City_Country
FROM Customers;

/* 2. Create a new employee user id by combining the first 4 letters of the employee’s 
first name with the first 2 letters of the employee’s last name. Make the new field
lower case and pull each individual step to show your work. */ 
SELECT  
LOWER(SUBSTR (FirstName, 1, 4) || '' || SUBSTR(LastName, 1, 2)) AS NewEmployeeId, 
FirstName,  
LastName
FROM Employees;

/* 3. Show a list of employees who have worked for the company for 15 or more years using the
current date function. Sort by lastname ascending. */ 
SELECT 
FirstName, 
LastName, 
STRFTIME('%Y %m %d', HireDate) AS HireDate, 
STRFTIME('%Y %m %d', 'now'), 
(STRFTIME('%Y %m %d', 'now') - STRFTIME('%Y %m %d', HireDate)) AS YearsWorked
FROM Employees
WHERE YearsWorked >= 15
ORDER BY LastName ASC;

/* 4. Profiling the Customers table, answer the following question. */ 
SELECT * 
FROM Customers;

/* 5. Find the cities with the most customers and rank in descending order. */ 
SELECT 
City, 
COUNT(CustomerID) AS CountCustomers
FROM Customers
GROUP BY City
ORDER BY CountCustomers DESC;

/* 6. Create a new customer invoice id by combining a customer’s invoice id with their first
and last name while ordering your query in the following order: firstname, lastname, 
and invoiceID. */
SELECT 
C.FirstName, 
C.LastName, 
I.InvoiceId,
C.FirstName || C.LastName || I.InvoiceID AS NewInvoiceId
FROM Customers C 
INNER JOIN Invoices I
ON C.CustomerId = I.CustomerID
WHERE NewInvoiceId 
LIKE 'AstridGruber%';