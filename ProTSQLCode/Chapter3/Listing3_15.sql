-- Listing 3-15

SELECT p.FirstName,
       pp.PhoneNumber, 
       CHOOSE(pp.PhoneNumberTypeID, 'Cell', 'Home', 'Work') 'Phone Type'
FROM Person.Person p 
JOIN Person.PersonPhone pp
ON p.BusinessEntityID = pp.BusinessEntityID

