use samplegeometry
GO
CREATE TABLE Warehouse(ObjectName nvarchar(20), Place GEOMETRY);
GO
INSERT Warehouse VALUES('walls', 'LINESTRING(0 0,40 0, 40 40, 0 40, 0 0)')
INSERT Warehouse VALUES('Bean', 'POINT(5 35)');
INSERT Warehouse VALUES('Rod', 'LINESTRING(10 10, 25 25)');
INSERT Warehouse VALUES('Table', 'POLYGON((15 18, 35 18, 35 28, 15 28, 15 18))');
INSERT Warehouse VALUES('Swimblet','CURVEPOLYGON(CIRCULARSTRING(0 4, 4 0, 8 4, 4 8, 0 4), CIRCULARSTRING(2 4, 4 2, 6 4, 4 6, 2 4))');
GO
SELECT *
FROM Warehouse;

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EMPNO]
      ,[ENAME]
      ,[JOB]
      ,[MGR]
      ,[HIREDATE]
      ,[SAL]
      ,[COMM]
      ,[DEPTNO]
  FROM [ScottDB].[dbo].[EMP]
  Use ScottDB
  GO
DECLARE @MinIncome numeric(7,2)
SET @MinIncome = (SELECT MIN(sal+comm)FROM EMP)
SELECT @MinIncome AS MinimumIncome;
GO
---other solution---
DECLARE @MinIncome numeric(7,2)
SELECT @MinIncome=Min(sal+comm)
FROM EMP;
SELECT @MinIncome AS MinimumIncome;

---T-SQL Script---
---1st step create a copy---
SELECT * INTO TempEmp
FROM EMP;
GO
---create a cursor declare variables---
DECLARE @Code int, @ename varchar(10), @job varchar(9), @sal numeric(7,2)
---Introduce cursor---
DECLARE emp_Cursor CURSOR FOR
SELECT empno, ENAME, JOB, SAL
FROM TempEmp
WHERE UPPER(job) = 'CLERK'
--open the cursor---
OPEN emp_Cursor
---Retrieve the rows from the cursor--
FETCH NEXT FROM emp_Cursor
INTO @Code, @ename, @job, @sal
--createa while loop to iterate the cursor and fetch the rows---
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sal = @sal+500
	UPDATE TempEmp
	SET SAL = @sal
	WHERE EMPNO = @Code
	PRINT 'The employee empno'+ Convert(nvarchar,@code)+' new salary= '+Convert(nvarchar,@sal)
	FETCH NEXT FROM emp_Cursor
	INTO @Code, @ename, @job,  @sal
END
---close cursor with a close statement---
CLOSE emp_Cursor
---release the resources previously used by cursor---
deallocate emp_Cursor

---test excecution---
SELECT e.EMPNO, e.ENAME, e.JOB, e.sal, t.EMPNO, t.sal
FROM EMP e INNER JOIN TempEmp t
           ON e.EMPNO = t.EMPNO
GO

--------------------------------------------------------------+
--------------------------------------------------------------+
USE Northwind
GO
CREATE FUNCTION MaxUnitPrice(@Category int)
RETURNS money
AS
BEGIN
     DECLARE @Max money
	 SELECT @MAX = Max(UnitPrice)
	 FROM Products
	 WHERE CategoryID = @Category
	 IF(@Max IS NULL)
	    SET @Max = 0
RETURN @MAX
END
GO
-------Test, use the function-----
SELECT dbo.MaxUnitPrice(8)
-----Drop the function because we donot need it anymorte---
DROP FUNCTION dbo.MaxUnitPrice;
GO
USE ScottDB
DROP TABLE TempEmp;
GO


------------------------------------------------------------------------------------------------------------------------------------------
SELECT CASE 
WHEN A + B > C THEN CASE WHEN A = B AND B = C THEN 'Equilateral' WHEN A = B OR B = C OR A = C THEN 'Isosceles' WHEN A != B OR B != C OR A != C THEN 'Scalene' END 
ELSE 'Not A Triangle' END FROM TRIANGLES;


----------------------------------------------------------------------------------------------------------------------------------------
SELECT N,
CASE
WHEN P IS NULL THEN 'Root'
WHEN N IN (SELECT P FROM BST) THEN 'Inner'
ELSE 'Leaf'
END
FROM BST
ORDER by N;

-------------------------------------------------------------------------------------------------------------------------------------------
SELECT c.company_code, c.founder, COUNT(DISTINCT e.lead_manager_code), COUNT(DISTINCT e.senior_manager_code), COUNT(DISTINCT e.manager_code), COUNT(DISTINCT e.employee_code) 
FROM company c
JOIN employee e ON c.company_code = e.company_code 
GROUP BY c.company_code, c.founder 
ORDER BY c.company_code;

--------------------------------------------------------------------------------------------------------------------------------------
----Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
---Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
SELECT SUM(City.population)
FROM Country
INNER JOIN City
    ON Country.Code = City.CountryCode
WHERE Country.Continent='Asia';


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT City.NAME
FROM COUNTRY 
     INNER JOIN CITY
     ON COUNTRY.CODE=CITY.COUNTRYCODE
     WHERE COUNTRY.CONTINENT='Africa';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
