-- Listing 9-9

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
    DailySales, 
    OrderMonth,
    OrderDate
FROM TotalSalesBySalesDatePartitioned
ORDER BY DATEPART(mm,OrderDate),
    Ranking;
