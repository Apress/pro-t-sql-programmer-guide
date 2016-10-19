-- Listing 1-6

SELECT  
   p.BusinessEntityID, 
   p.FirstName, 
   p.LastName, 
   sp.SalesYTD
FROM Person.Person p INNER JOIN Sales.SalesPerson sp
   ON p.BusinessEntityID = sp.BusinessEntityID;
