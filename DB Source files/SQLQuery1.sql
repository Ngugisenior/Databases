USE Northwind
GO
CREATE TABLE #TempCustomers (CustomerID NVARCHAR(5), CompanyName NVARCHAR(40), City NVARCHAR(15));
---FILL THE TABLE WITH DATA FROM CUSTOMERS
INSERT INTO #TempCustomers
SELECT CustomerID, CompanyName, City
FROM Customers
WHERE City='London';


---lists the data
SELECT *
FROM #TempCustomers;