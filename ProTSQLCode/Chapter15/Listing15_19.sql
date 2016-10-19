-- Listing 15-19

exec sp_executesql N'SELECT [t0].[LastName], [t0].[FirstName], [t0].[MiddleName], [t1].[EmailAddress]
FROM [Person].[Person] AS [t0]
INNER JOIN [Person].[EmailAddress] AS [t1] ON [t0].[BusinessEntityID] = [t1].[BusinessEntityID]
WHERE [t0].[LastName] LIKE @p0
ORDER BY [t0].[LastName], [t0].[FirstName]',N'@p0 nvarchar(5)',@p0=N'%SMI%'
