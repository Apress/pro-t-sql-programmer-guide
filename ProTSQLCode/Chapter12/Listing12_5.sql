-- Listing 12-5

USE AdventureWorks2014;
GO

SELECT
   ProductID,
   Name,
   ProductNumber 
FROM Production.Product 
WHERE ProductID IN (770, 903)
FOR XML AUTO;
