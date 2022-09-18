/* All of the coding exercises refer to the open source Chinook Database. The ER diagram is available on:
https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png */

/* 1. Using a subquery, find the names of all the tracks for the album "Californication". */
SELECT Name
FROM Tracks
WHERE AlbumId = (
  SELECT AlbumId 
  FROM albums 
  WHERE Title = 'Californication'
);

/* 2. Find the total number of invoices for each customer along with the customer's full name,
city and email. */
SELECT 
FirstName,
LastName, 
City, 
Email, 
COUNT(InvoiceId) AS Invoices
FROM Customers 
INNER JOIN Invoices 
ON Customers.CustomerId = Invoices.CustomerId
GROUP BY Customers.CustomerId;

/* 3. Retrieve the track name, album, artistID, and trackID for all the albums. */ 
SELECT 
Tracks.Name, 
Albums.Title, 
Albums.ArtistId, 
Tracks.TrackId
FROM Albums 
INNER JOIN Tracks 
ON Albums.AlbumID = Tracks.AlbumID;

/* 4. Retrieve a list with the managers last name, and the last name of the employees
who report to him or her. */ 
SELECT 
m.LastName AS Manager, 
e.LastName As Employee
FROM Employees m 
INNER JOIN Employees e 
ON e.ReportsTo = m.EmployeeId;

/* 5. Find the name and ID of the artists who do not have albums. */ 
SELECT 
Artists.Name, 
Artists.ArtistId, 
Albums.Title
FROM Artists 
LEFT JOIN Albums 
ON Artists.ArtistId = Albums.ArtistId
WHERE Title IS NULL;

/* 6. Use a UNION to create a list of all the employee's and customer's first names 
and last names ordered by the last name in descending order. */ 
SELECT 
FirstName, 
LastName
FROM Employees
UNION SELECT 
FirstName, 
LastName
FROM Customers
ORDER BY LastName DESC;

/* 7. See if there are any customers who have a different city listed in their billing city 
versus their customer city. */
SELECT 
c.CustomerId, 
c.City, 
i.BillingCity
FROM Customers c 
INNER JOIN Invoices i 
ON c.CustomerId = i.CustomerId
WHERE City <> BillingCity;
