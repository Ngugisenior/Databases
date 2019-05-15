---------GLOBAL TEMPORARY TABLE
USE Northwind
GO
CREATE TABLE ##CustTemp
(CustomerID NVARCHAR(5), CompanyName NVARCHAR(40), City NVARCHAR(15));
INSERT INTO ##CustTemp
SELECT CustomerID, CompanyName, City
FROM Customers
WHERE City='London';
-----LISTS
SELECT *
FROM ##CustTemp;