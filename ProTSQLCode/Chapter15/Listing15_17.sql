-- Listing 15-17

exec sp_executesql N'SELECT [t0].[BusinessEntityID], [t0].[PersonType], [t0].[NameStyle], [t0].[Title], [t0].[FirstName], [t0].[MiddleName], [t0].[LastName], [t0].[Suffix], [t0].[EmailPromotion], [t0].[AdditionalContactInfo], [t0].[Demographics], [t0].[rowguid], [t0].[ModifiedDate]
FROM [Person].[Person] AS [t0]
WHERE [t0].[LastName] LIKE @p0
ORDER BY [t0].[LastName], [t0].[FirstName]',N'@p0 nvarchar(5)',@p0=N'%SMI%'


