-- Listing 14-15

SELECT 
	DB_NAME(f.database_id) AS DBName, 
	f.name AS FileName, 
	volume_mount_point, 
	volume_id,
	logical_volume_name,
	total_bytes,
	available_bytes,
	CAST(CAST(available_bytes AS FLOAT)/ CAST(total_bytes AS FLOAT) AS DECIMAL(18,1)) * 100 AS [Space Used %],
	v.is_read_only
FROM sys.master_files  f 
	CROSS APPLY sys.dm_os_volume_stats(f.database_id, f.file_id) v
ORDER BY f.database_id DESC;
