-- Listing 14-10

SELECT TOP 50
(total_elapsed_time - total_worker_time) / qs.execution_count AS average_time_blocked,
total_elapsed_time - total_worker_time AS total_time_blocked,
qs.execution_count,
qt.text blocked_query, 
DB_NAME(qt.dbid) dbname
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt
ORDER BY average_time_blocked DESC;
