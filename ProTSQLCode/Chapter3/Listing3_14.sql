-- Listing 3-14

--Example 1. IIF Statement Using Variables

DECLARE @valueA int = 85
DECLARE @valueB int = 45

SELECT IIF (@valueA < @valueB, 'True', 'False') AS Result

--Example 2. IIF Statement Using Table Column

SELECT IIF (Name in ('Alberta', 'British Columbia'), 'Canada', Name)
FROM [Person].[StateProvince]
