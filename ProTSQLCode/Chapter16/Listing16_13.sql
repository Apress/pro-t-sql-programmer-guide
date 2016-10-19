-- Listing 16-13

CREATE AGGREGATE dbo.Median (@value float) RETURNS float
EXTERNAL NAME ApressExamples.[Apress.Examples.Median];
GO

SELECT
    ProductID,
    dbo.Median(UnitPrice) AS MedianUnitPrice 
FROM Sales.SalesOrderDetail 
GROUP BY ProductID;
