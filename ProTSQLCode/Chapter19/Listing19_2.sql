-- Listing 19-2

SELECT
    sys.fn_PhysLocFormatter(%%physloc%%) AS [Row_Locator],
    Id
FROM dbo.SmallRows;
