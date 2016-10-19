-- Listing 15-22

SELECT TOP (5) 
[Extent1].[BusinessEntityID] AS [BusinessEntityID], 
[Extent2].[FirstName] AS [FirstName], 
[Extent3].[LastName] AS [LastName], 
[Extent1].[BirthDate] AS [BirthDate]
FROM   [HumanResources].[Employee] AS [Extent1]
INNER JOIN [Person].[Person] AS [Extent2] ON [Extent1].[BusinessEntityID] = [Extent2].[BusinessEntityID]
LEFT OUTER JOIN [Person].[Person] AS [Extent3] ON [Extent1].[BusinessEntityID] = [Extent3].[BusinessEntityID]
WHERE N'F' = [Extent1].[Gender]
