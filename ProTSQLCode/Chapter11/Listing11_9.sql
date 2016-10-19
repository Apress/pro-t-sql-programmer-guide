-- Listing 11-9

SELECT
  ProductModelID ,
  Name 
FROM Production.ProductModel 
WHERE CONTAINS (Instructions, N'aluminum NEAR jig');
