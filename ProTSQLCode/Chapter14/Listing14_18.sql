-- Listing 14-18

USE AdventureWorks2014;
GO

SELECT
	DB_NAME() AS DatabaseName,
	OBJECT_SCHEMA_NAME(i.object_id, s.database_id) AS SchemaName, 
	OBJECT_NAME(i.object_id) AS TableName, 
	i.name AS IndexName,
	user_updates,
	user_seeks,
	user_scans,
	user_lookups,
	system_updates,
	last_user_seek,
	last_user_update
FROM sys.indexes i
	LEFT JOIN sys.dm_db_index_usage_stats s ON s.object_id = i.object_id AND i.index_id = s.index_id 
WHERE s.database_id = DB_ID() 
ORDER BY last_user_update DESC;

