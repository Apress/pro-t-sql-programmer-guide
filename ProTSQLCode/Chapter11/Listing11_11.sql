-- Listing 11-11

SELECT
  ProductModelID ,
  Name 
FROM Production.ProductModel 
WHERE CONTAINS(Instructions, 'NEAR((jig, aluminum),3, TRUE)');

SELECT
  ProductModelID ,
  Name 
FROM Production.ProductModel 
WHERE CONTAINS(Instructions, 'NEAR((aluminum, jig),3, TRUE)');
