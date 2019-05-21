/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.

An equijoin is a join with a join condition containing an equality operator.
*/
SELECT (COUNT(CITY)-COUNT(DISTINCT CITY))
                          FROM STATION;
