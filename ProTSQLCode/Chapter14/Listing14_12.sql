-- Listing 14-12

SELECT object_name(o.object_id) AS Object, 
	CASE 
		WHEN index_id = 0 then 'heap'
		WHEN index_id = 1 then 'clustered index'
		WHEN index_id > 1 then 'nonclustered index'
	END AS IndexType,
	SUM(reserved_page_count) AS ReservedPages, 
	SUM(used_page_count) AS UsedPages,
	SUM(case when (index_id < 2) then row_count else 0 end) AS Rows
FROM sys.dm_db_partition_stats p JOIN sys.objects o ON p.object_id = o.object_id
WHERE type_desc = 'USER_TABLE' 
GROUP BY o.object_id,index_id
ORDER BY sum(used_page_count) DESC;
