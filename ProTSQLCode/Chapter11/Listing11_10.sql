-- Listing 11-10

SELECT
  ProductModelID ,
  Name 
FROM Production.ProductModel 
WHERE CONTAINS(Instructions, 'NEAR((aluminum,jig), 3)');
