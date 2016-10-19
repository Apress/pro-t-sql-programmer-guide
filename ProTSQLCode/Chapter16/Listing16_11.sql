-- Listing 16-11

CREATE AGGREGATE Range (@value float) RETURNS float
EXTERNAL NAME ApressExamples.[Apress.Examples.Range];
GO

SELECT
    ProductID,
    dbo.Range(UnitPrice) AS UnitPriceRange 
FROM Sales.SalesOrderDetail 
WHERE UnitPrice > 0 
GROUP BY ProductID;
