-- Listing 14-11

SELECT
db_name(database_id) AS Database_Name,
SUM(unallocated_extent_page_count) AS free_pages,
SUM(unallocated_extent_page_count) * 8.0 AS free_KB,
SUM(user_object_reserved_page_count) AS user_object_pages,
SUM(user_object_reserved_page_count) * 8.0 AS user_object_pages,
SUM(internal_object_reserved_page_count) AS internal_object_pages,
SUM(internal_object_reserved_page_count) * 8.0 AS internal_object_KB 
FROM sys.dm_db_file_space_usage 
WHERE database_id = 2
GROUP BY database_id;
