-- Listing 4-6

SELECT LastName,
   dbo.EncodeNYSIIS(LastName) AS NYSIIS 
FROM Person.Person 
GROUP BY LastName;
