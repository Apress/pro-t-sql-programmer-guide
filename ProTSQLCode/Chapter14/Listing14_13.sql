-- Listing 14-13

SELECT s.session_id, request_id,
SUM(s.internal_objects_alloc_page_count+ 
t.internal_objects_alloc_page_count)*8.0 AS internal_obj_pages_kb,
	SUM(s.user_objects_alloc_page_count) as user_obj_pages 
FROM sys.dm_db_session_space_usage s JOIN sys.dm_db_task_space_usage t 
ON s.session_id = t.session_id
GROUP BY s.session_id, request_id;
