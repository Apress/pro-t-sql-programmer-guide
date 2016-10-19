-- Listing 7-12

UPDATE Sales.vIndividualCustomer
SET FirstName = N'Dave',
    MiddleName = N'Robert',
    EmailAddress = N'dave.robinett@adventure-works.com' 
WHERE BusinessEntityID = 1699;

SELECT BusinessEntityID, FirstName, MiddleName, LastName, EmailAddress
FROM Sales.vIndividualCustomer 
WHERE BusinessEntityID = 1699;
