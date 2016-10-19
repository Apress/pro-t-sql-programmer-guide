-- Listing 9-7

CREATE  PROCEDURE  Person.GetContacts
	@StartPageNum int,
	@RowsPerPage int
AS
	SELECT 
		LastName, 
		FirstName,
		MiddleName
	FROM Person.Person
	ORDER BY 
		LastName,
		FirstName,
		MiddleName
	OFFSET (@StartPageNum - 1) * @RowsPerPage ROWS
	FETCH NEXT @RowsPerPage ROWS ONLY;
GO
