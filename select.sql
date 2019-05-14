--------------------------------------
Q1
--------------------------------------
SELECT OrderDate, COUNT(OrderID)
FROM Sales.SalesOrder
WHERE Status = 'Shipped'
GROUP BY OrderDate
HAVING COUNT(OrderID) > 1
ORDER BY OrderDate DESC

---------------------------------------
Q2
---------------------------------------
USE Northwind
GO

SELECT CustomerID, CompanyName
FROM Customers
WHERE CustomerID LIKE '[B-E]%';
GO

------------------------------------------------------
Q3
-----------------------------------------------------
SELECT CustomerID, CompanyName
FROM Customers
WHERE CustomerID LIKE '[B-O]%';
GO
-----------------------------------------------------
Q4
-----------------------------------------------------
SELECT EmployeeID, LastName+' '+FirstName AS FullName
FROM Employees
WHERE LastName LIKE '%a%a%';
GO

/*4*/
SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE ProductName NOT LIKE '[A-C]%'
ORDER BY ProductName;
GO
/*5*/
SELECT ProductID, ProductName, UnitPrice, UnitsOnOrder,UnitsInStock
FROM Products
WHERE UnitsOnOrder>0 AND UnitsInStock<10
ORDER BY UnitsOnOrder Desc;
GO
/*6*/
SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 50 AND 90;
GO
/*7*/
SELECT OrderID, CustomerID, OrderDate
FROM Orders
WHERE OrderDate BETWEEN '12-10-1996' AND '12-20-1996'
ORDER BY OrderDate, CustomerID DESC;
GO

/*8*/
SELECT COUNT(*) AS Number_Of_Products
FROM Products;
GO
/*9*/
SELECT COUNT(*) AS Number_Of_Products
FROM Products
GROUP BY CategoryID;
GO

/*10*/
SELECT CategoryID, AVG(UnitPrice) AS AverageUnitPrice
FROM Products
GROUP BY CategoryID;
GO

/*11*/
SELECT CategoryID, AVG(UnitPrice) AS AverageUnitPrice
FROM Products
GROUP BY CategoryID
Having AVG(UnitPrice)>30;
GO

/*12*/

SELECT COUNT(*) AS NumberOfCustomers
FROM Customers;
GO

/*13*/
SELECT COUNT(Fax) AS NumberOfCustomers
FROM Customers;
GO

/*14*/
SELECT CustomerID, CompanyName, ContactName
FROM Customers
WHERE Fax IS NULL;
GO

/*15*/
SELECT OrderID, CustomerID, OrderDate, ShippedDate
FROM Orders
WHERE ShippedDate IS NULL;
GO

/*16*/
SELECT c.CustomerID, CompanyName
FROM Customers c LEFT OUTER JOIN Orders o
ON c.CustomerID=o.CustomerID
WHERE o.CustomerID IS NULL;
     /*OR*/
SELECT CustomerID,CompanyName
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);
GO
/*17*/
SELECT  CustomerID, COUNT(*) AS NumberOfOrders
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*)>5;
GO
