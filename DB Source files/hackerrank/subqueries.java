/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
------------------------------------------------------------------
select min(city), len
  from (
        select city, length(city) len,
               max(length(city)) over() maxlen,
               min(length(city)) over() minlen
          from station
       )
 where len in(minlen,maxlen)
 group by len;
*/
SELECT MIN(CITY),LEN
FROM (
       SELECT CITY, LENGTH(CITY)LEN,
                      MAX(LENGTH(CITY)) OVER() MAXLEN,
                      MIN(LENGTH(CITY)) OVER() MINLEN
                FROM STATION           
)
WHERE LEN IN(MINLEN,MAXLEN)
                          GROUP BY LEN;
