-- Listing 12-4

USE AdventureWorks2014;
GO

SELECT
   ProductID,
   Name,
   ProductNumber 
FROM Production.Product 
WHERE ProductID IN (770, 903)
FOR XML RAW;
