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
