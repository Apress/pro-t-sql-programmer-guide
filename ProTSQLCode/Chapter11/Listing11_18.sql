-- Listing 11-18

SELECT
  ProductID,
  Name 
FROM Production.Product 
WHERE FREETEXT(*, N'flat');
