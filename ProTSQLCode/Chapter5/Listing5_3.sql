-- Listing 5-3

CREATE  PROCEDURE  Person.GetContactDetails  (@ID  int)
AS
BEGIN
	SET NOCOUNT ON
    -- Retrieve Name and title for a given PersonID
 	SELECT @ID, p.FirstName + ' ' + COALESCE(p.MiddleName,'') + ' ' + p.LastName, ct.[Name], cast(p.ModifiedDate as varchar(20)), 'Vendor Contact' 
	FROM [Purchasing].[Vendor] AS v
		INNER JOIN [Person].[BusinessEntityContact] bec 
		ON bec.[BusinessEntityID] = v.[BusinessEntityID]
		INNER JOIN [Person].ContactType ct
		ON ct.[ContactTypeID] = bec.[ContactTypeID]
		INNER JOIN [Person].[Person] p
		ON p.[BusinessEntityID] = bec.[PersonID]
	WHERE bec.[PersonID] = @ID;
END;
GO
