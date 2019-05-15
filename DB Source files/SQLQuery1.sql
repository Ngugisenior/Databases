USE Northwind
GO
DECLARE @myProdName NVARCHAR(40), @myProdID int
SET @myProdName='Pavlova'
SET @myProdID=7

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE ProductID=@myProdID OR
      ProductName = @myProdName;
GO

-----------------IF Statements-----------------------------------------------------------------------------------

	  IF (SELECT COUNT(*) FROM Products WHERE UnitPrice<5)>0
	  BEGIN
	       PRINT 'A kovetkezo termekek egysegara kisebb mint 5$'
		   SELECT ProductID, ProductName, UnitPrice
		   FROM Products
		   WHERE UnitPrice<5
	END
	ELSE
	BEGIN
	    PRINT 'Nincs olyan termek aminek az egysegara  kisebb mint 5$'
	END
--------------------------------------------------------------------------------------------------------------
---------SIMPLE CASE EXPRESSION----------------------------------------------------------
USE AdventureWorks2017
GO
 

SELECT CASE ProductLine
   WHEN 'R' THEN 'Road'
   WHEN 'M' THEN 'Mountain'
   WHEN 'T' THEN 'Touring'
   WHEN 'S' THEN 'Other'
   ELSE 'Parts'
END AS Category,
Name AS ProductName,
ProductNumber
FROM AdventureWorks2017.Production.Product
ORDER BY ProductName;
GO

---------------------------------------------CURSOR-------------------------------------------------------------------
-----------Its a server side object that allows you to accesss one row at a time, within the result set and even allows you to scroll 
-----------forward and backward through the result set.
---EXAMPLE: USING CURSOR LIST THE PRODUCTS TABLE ROWS
---Using cursor
USE Northwind
GO
-----1 step: Declare variables
DECLARE @myProductID int, @myProductName NVARCHAR(40), @myUnitPrice money
-----2 step: Declare cursor
DECLARE ProductCursor CURSOR FOR
SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE ProductID<=10
---3 step: Open the cursor
OPEN ProductCursor
---4 step: FETCH rows
FETCH NEXT FROM ProductCursor INTO @myProductID, @myProductName, @myUnitPrice
WHILE @@FETCH_STATUS=0
BEGIN
     PRINT 'myProductID= '+CAST(@myProductID AS NVARCHAR)
	 PRINT 'myProductName= '+@myProductName
	 PRINT 'myUnitPrice= '+CAST(@myUnitPrice AS NVARCHAR)
	 FETCH NEXT FROM ProductCursor INTO @myProductID, @myProductName, @myUnitPrice
END
---5 step: close the cursor
CLOSE ProductCursor
DEALLOCATE ProductCursor

