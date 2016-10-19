-- Listing 10-39

INSERT INTO dbo.OpenClipartsLibrary
     (name, is_directory, creation_time, path_locator)
SELECT 
    'directory02',1, dateadd(year, -1, sysdatetime()), path_locator.GetDescendant(NULL, NULL)
FROM dbo.OpenClipartsLibrary
WHERE name = 'directory01'
AND   is_directory = 1
AND   parent_path_locator IS NULL; 
