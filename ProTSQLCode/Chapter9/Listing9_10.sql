-- Listing 9-10

WITH TotalSalesBySalesDatePartitioned
(
    DailySales, 
    OrderMonth,
    OrderDate
)
AS
(
    SELECT
        SUM(soh.SubTotal) AS DailySales,
        DATENAME(MONTH, soh.OrderDate) AS OrderMonth,
        soh.OrderDate
    FROM  Sales.SalesOrderHeader  soh
    WHERE soh.OrderDate >= '20050101'
        AND soh.OrderDate < '20060101'
    GROUP BY soh.OrderDate
)
SELECT 
 RANK() OVER
    (
        PARTITION BY
        OrderMonth
        ORDER BY
        DailySales  DESC
    )  AS  Ranking,
    DENSE_RANK() OVER
    (
        PARTITION BY
        OrderMonth
        ORDER BY
        DailySales  DESC
    )  AS  Dense_Ranking,
    DailySales, 
    OrderMonth,
    OrderDate
FROM TotalSalesBySalesDatePartitioned
ORDER BY DATEPART(mm,OrderDate),
    Ranking; 
