SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';

----------------------------------------------------------------------------------------------------------------------------
/*
Task: Query the list of CITY names from STATION table that either do not start with vowels or do not end with vowels.
Results cannot contain duplicates.
*/
SELECT DISTINCT city
FROM STATION
WHERE NOT REGEXP_LIKE(city, '^[AEIOU]') OR
NOT REGEXP_LIKE(city, '[aeiou]$');
/*
Task: Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
Results cannot contain duplicates.
*/
SELECT DISTINCT CITY
FROM STATION
WHERE NOT REGEXP_LIKE(city, '^[AEIOU]') AND
NOT REGEXP_LIKE(city, '[aeiou]$');

-------------------------------------------------------------------------------------------------------------------------------------------
/*
Higher Than 75 Marks
Task: Query the NAME of any student in STUDENTS table who scored higher than 75 MARKS. Order output by last three characters of each name.
If two students have name with same three characters, secondary sort them by ascending ID.
*/
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY SUBSTR(Name, -3, 3), ID;
------------------------------------------------------------------------------------------------------------------------------------------
/*
Employee Names
Task: Query that prints out list of employee NAME from EMPLOYEE table in alphabetical order.
*/
SELECT NAME
FROM EMPLOYEE
ORDER BY NAME ASC;

-------------------------------------------------------------------------------------------------------------------------------------------------------
/*
Employee Salaries
Task: Query to print list of employee NAME from EMPLOYEE table if they have a salary greater than $2000 per month and have been employed for less than 10 months. 
Sort by ascending EMPLOYEE_ID.
*/
SELECT NAME
FROM EMPLOYEE
WHERE 
      SALARY > 2000 
      AND
      MONTHS < 10
ORDER BY EMPLOYEE_ID ASC;
---------------------------------------------------------------------------------------------------------------------------------
SELECT SUM(Population)
FROM City
WHERE District = 'California';
