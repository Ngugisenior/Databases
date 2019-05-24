SELECT DISTINCT f1.x, f1.y   
FROM (SELECT x, y,row_number()OVER(partition BY x, y ORDER BY x) AS cnt 
       FROM Functions) f1
JOIN Functions f2
ON f1.x=f2.y AND f1.y=f2.x AND (f1.x!=f1.y OR cnt>1)
AND f1.x<=f1.y                                  
ORDER BY f1.x;
