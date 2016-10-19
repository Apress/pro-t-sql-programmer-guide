-- Listing 11-8

SELECT
  ProductModelID ,
  Name 
FROM Production.ProductModel 
WHERE CONTAINS (Name, N'"bot*"');
