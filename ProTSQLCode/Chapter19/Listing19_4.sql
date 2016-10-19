-- Listing 19-4

SET  STATISTICS IO ON;
SELECT
    Id,
    LastName,
    FirstName,
    MiddleName
FROM dbo.SmallRows;

SELECT
    Id,
    LastName,
    FirstName,
    MiddleName
FROM dbo.LargeRows;
