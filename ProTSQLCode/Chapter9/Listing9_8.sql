-- Listing 9-8

WITH TotalSalesBySalesDate 
(
    DailySales, 
    OrderDate
)
AS
(
    SELECT
        SUM(soh.SubTotal) AS DailySales,
        soh.OrderDate
    FROM  Sales.SalesOrderHeader  soh
    WHERE soh.OrderDate >= '20060101'
        AND soh.OrderDate < '20070101'
    GROUP BY soh.OrderDate
)
SELECT 
    RANK() OVER
    (
        ORDER BY
        DailySales  DESC
    )  AS  Ranking,
    DailySales, 
    OrderDate
FROM  TotalSalesBySalesDate
ORDER  BY  Ranking;
