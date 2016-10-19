-- Listing 5-8

CREATE PROCEDURE Sales.GetSalesRunningTotal (@Year int)
AS
BEGIN
WITH RunningTotalCTE
AS

    (
        SELECT soh.SalesOrderNumber,
        soh.OrderDate,
        soh.TotalDue,
        (
        SELECT  SUM(soh1.TotalDue)
        FROM  Sales.SalesOrderHeader  soh1
        WHERE  soh1.SalesOrderNumber  <=  soh.SalesOrderNumber
        )  AS  RunningTotal,
        SUM(soh.TotalDue) OVER () AS GrandTotal
        FROM Sales.SalesOrderHeader soh
        WHERE DATEPART(year, soh.OrderDate) = @Year
        GROUP BY soh.SalesOrderNumber,
        soh.OrderDate,
        soh.TotalDue
    )
    SELECT rt.SalesOrderNumber,
        rt.OrderDate, 
        rt.TotalDue,
        rt.RunningTotal,
        (rt.RunningTotal / rt.GrandTotal) * 100 AS PercentTotal
    FROM  RunningTotalCTE  rt
    ORDER BY rt.SalesOrderNumber;
    RETURN 0;
END;
GO

EXEC  Sales.GetSalesRunningTotal @Year = 2011;
GO
