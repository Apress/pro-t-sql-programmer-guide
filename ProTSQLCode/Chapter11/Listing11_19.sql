-- Listing 11-19

SELECT
  ProductID,
  Name,
  Color 
FROM Production.Product 
WHERE FREETEXT(*, N'navy');
