-- Listing 19-18

CREATE NONCLUSTERED INDEX IX_Product_Size
ON Production.Product
(
Size,
SizeUnitMeasureCode )
WHERE Size IS NOT NULL; 
GO
SELECT
ProductID,
Size,
SizeUnitMeasureCode FROM Production.Product WHERE Size = 'L';
GO
