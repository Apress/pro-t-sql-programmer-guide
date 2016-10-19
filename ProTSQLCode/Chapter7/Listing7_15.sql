-- Listing 7-15

CREATE TABLE dbo.MyTable (i int); 
GO

SELECT
    EntryId,
    EventType,
    UserName,
    ObjectName,
    CommandText 
FROM DdlActionLog;
