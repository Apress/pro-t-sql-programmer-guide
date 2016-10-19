-- Listing 11-22

SELECT
  ProductModelID,
  Name 
FROM Production.ProductModel 
WHERE FREETEXT(*, N'instructions');
