-- Listing 2-1

-- Windows environment variable
SELECT '$(PATH)';
-- SQLCMD scripting variable
SELECT '$(SQLCMDSERVER)';
-- Command-line scripting variable -v COLVAR= "Name" switch
SELECT $(COLVAR)
FROM Sys.Tables;

-- ListPerson.sql
SELECT TOP 10 FirstName, LastName
FROM AdventureWorks2014.Person.Person
GO