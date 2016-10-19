-- Listing 9-4

WITH Numbers (n) 
AS 
( 
SELECT 0 AS n
 UNION ALL
SELECT n + 1
  FROM Numbers
 WHERE n < 1000 )
SELECT n 
  FROM Numbers 
OPTION (MAXRECURSION 1000);
