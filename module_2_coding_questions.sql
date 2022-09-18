/* All of the coding exercises refer to the open source Chinook Database. The ER diagram is available on:
https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png */

/* 1. Find all the tracks that have a length of 5,000,000 millisec */
SELECT COUNT(Milliseconds) 
FROM Tracks
WHERE Milliseconds >= 5000000;

/* 2. Find all the invoices whose total is between $5 and $15 dollars. */
SELECT COUNT(Total) 
FROM Invoices
WHERE Total 
BETWEEN 5 and 15;

/* 3. Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY. */
SELECT 
State, 
FirstName, 
LastName, 
Company 
FROM Customers
WHERE State 
IN ('RJ', 'DF','AB','BC', 'CA', 'WA', 'NY');

/* 4. Find all the invoices for customer 56 and 58 where the total was between 
$1.00 and $5.00. */
SELECT 
Total, 
CustomerId, 
InvoiceDate, 
InvoiceId 
FROM Invoices
WHERE Total 
BETWEEN 1 AND 5 
AND CustomerId In (56,58);

/* 5. Find all the tracks whose name starts with 'All'. */
SELECT Name 
FROM Tracks
WHERE Name 
LIKE 'All%';

/* 6. Find all the customer emails that start with "J" and are from gmail.com. */
SELECT email 
FROM Customers
WHERE email 
LIKE 'J%@gmail.com';

/* 7. Find all the invoices from the billing city Brasília, Edmonton, and Vancouver 
and sort in descending order by invoice ID. */
SELECT 
BillingCity, 
InvoiceId, 
Total 
FROM Invoices
WHERE BillingCity 
IN ('Brasília','Edmonton','Vancouver ')
ORDER BY InvoiceId DESC;

/* 8. Show the number of orders placed by each customer (hint: this is found in the invoices table)
and sort the result by the number of orders in descending order. */
SELECT CustomerId, 
COUNT(*) AS Orders 
From Invoices
GROUP BY CustomerId
ORDER BY Orders DESC;

/* 9. Find the albums with 12 or more tracks. */
SELECT AlbumID, 
COUNT(AlbumId) AS NumTracks 
FROM Tracks
GROUP BY AlbumId
HAVING NumTracks >= 12;
