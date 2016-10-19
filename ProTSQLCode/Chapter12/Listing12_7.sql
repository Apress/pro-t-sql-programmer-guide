-- Listing 12-7

SELECT
  ProductID,
  Name,
  ProductNumber
FROM Production.Product 
WHERE ProductID = 770
FOR XML AUTO, ELEMENTS;
