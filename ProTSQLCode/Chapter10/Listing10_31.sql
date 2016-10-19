-- Listing 10-31

SELECT 
    SERVERPROPERTY('ServerName') AS ServerName, 
    SERVERPROPERTY('FilestreamSharename') AS ShareName, 
    CASE SERVERPROPERTY('FilestreamEffectiveLevel')
        WHEN 0 THEN 'Disabled'
        WHEN 1 THEN 'T-SQL Access Only'
        WHEN 2 THEN 'Local T-SOL/File System Access Only'
        WHEN 3 THEN 'Local T-SOL/File System and Remote File System Access'
    END AS Effective_Level, 
    CASE SERVERPROPERTY('FilestreamConfiguredLevel')
        WHEN 0 THEN 'Disabled'
        WHEN 1 THEN 'T-SQL Access Only'
        WHEN 2 THEN 'Local T-SOL/File System Access Only'
        WHEN 3 THEN 'Local T-SOL/File System and Remote File System Access'
    END AS Configured_Level;
