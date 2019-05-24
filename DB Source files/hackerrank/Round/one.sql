/*
Query the following two values from the STATION table:
     The sum of all values in LAT_N rounded to a scale of 2 decimal places.
     The sum of all values in LONG_W rounded to a scale of 2 decimal places.
Input Format:
The STATION table is described as follows:
STATION
Field	Type
ID	NUMBER
CITY	VARCHAR2(21)
STATE	VARCHAR2(2)
LAT_N	NUMBER
LONG_W	NUMBER
where LAT_N is the northern latitude and LONG_W is the western longitude.

Output Format
Your results must be in the form:

lat lon

where lat is the sum of all values in LAT_N and lon is the sum of all values in LONG_W. Both results must be rounded to a scale of 2 decimal places.

Analysis
sum of values in LAT_N ==> SUM(LAT_N)
round sum of LAT_N to scale of 2 decimal places ==>
SELECT ROUND(SUM(LAT_N), 2)
sum of values in LONG_W ==> SUM(LONG_W)
round sum of LONG_W to a scale of 2 decimal places ==>
ROUND(SUM(LONG_W), 2)
from STATION table ==> FROM STATION
Solution
*/
SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2)
                                    FROM STATION;
