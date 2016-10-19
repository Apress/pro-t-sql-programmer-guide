-- Listing 10-46

DECLARE @path_locator hierarchyid

SET @path_locator = GetPathLocator('\\Sql2012\mssqlserver\cliparts\OpenClipartsLibrary\import_20120501\Yason');

SELECT * 
FROM dbo.OpenClipartsLibrary
WHERE path_locator = @path_locator;
