-- Listing 10-44

;WITH mycte AS (
    SELECT name, path_locator.GetLevel() as Level, path_locator
    FROM dbo.OpenClipartsLibrary
    WHERE name = 'Yason' 
    AND is_directory = 1

    UNION ALL 

    SELECT l1.name, l1.path_locator.GetLevel() as Level, l1.path_locator
    FROM dbo.OpenClipartsLibrary l1
    JOIN mycte l2 ON l1.parent_path_locator = l2.path_locator
    WHERE l1.is_directory = 1
)
SELECT name, Level
FROM mycte
ORDER BY level, name;
