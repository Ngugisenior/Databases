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
