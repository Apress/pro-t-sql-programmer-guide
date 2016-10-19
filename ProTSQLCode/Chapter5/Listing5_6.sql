-- Listing 5-6

ALTER  PROCEDURE  Person.GetContactDetails
AS
BEGIN
	SET NOCOUNT ON
    -- Retrieve Name and title for a given PersonID
 	SELECT p.BusinessEntityID, p.FirstName + ' ' + COALESCE(p.MiddleName,'') + ' ' + p.LastName, ct.[Name], cast(p.ModifiedDate as varchar(20)), 'Vendor Contact' 
	FROM [Purchasing].[Vendor] AS v
		INNER JOIN [Person].[BusinessEntityContact] bec 
		ON bec.[BusinessEntityID] = v.[BusinessEntityID]
		INNER JOIN [Person].ContactType ct
		ON ct.[ContactTypeID] = bec.[ContactTypeID]
		INNER JOIN [Person].[Person] p
		ON p.[BusinessEntityID] = bec.[PersonID];
			
	SELECT p.BusinessEntityID, p.FirstName + ' ' + COALESCE(p.MiddleName,'') + ' ' + p.LastName, ct.[Name], cast(p.ModifiedDate as varchar(20)), p.Suffix, 'Store Contact' 
	FROM [Sales].[Store] AS s
		INNER JOIN [Person].[BusinessEntityContact] bec 
		ON bec.[BusinessEntityID] = s.[BusinessEntityID]
		INNER JOIN [Person].ContactType ct
		ON ct.[ContactTypeID] = bec.[ContactTypeID]
		INNER JOIN [Person].[Person] p
		ON p.[BusinessEntityID] = bec.[PersonID];

END;
GO
