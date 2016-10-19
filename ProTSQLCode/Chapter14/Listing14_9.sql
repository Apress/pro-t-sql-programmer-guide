-- Listing 14-9

SELECT 
	DB_Name(qp.dbid) AS [DB],
	qp.dbid AS [DBID],
	qt.text,
	SUBSTRING(qt.TEXT, 
	(qs.statement_start_offset/2)+1, 
		((CASE qs.statement_end_offset 
			WHEN -1 
				THEN DATALENGTH(qt.TEXT) 
				ELSE qs.statement_end_offset 
			END - qs.statement_start_offset)/2)+1) AS stmt_text,
	qs.execution_count,
	qs.total_rows,
	qs.min_rows,
	qs.max_rows,
	qs.last_rows,
	qs.total_logical_reads/qs.execution_count AS avg_logical_reads,
	qs.total_physical_reads/qs.execution_count AS avg_physical_reads,
	qs.total_logical_writes/qs.execution_count AS avg_writes,
	(qs.total_worker_time/1000)/qs.execution_count AS avg_CPU_Time_ms,
	qs.total_elapsed_time/qs.execution_count/1000 AS avg_elapsed_time_ms, 
qs.last_execution_time,
	qp.query_plan AS [Plan]
FROM sys.dm_exec_query_stats qs
	CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt
		CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) qp
ORDER BY 
execution_count DESC, qs.total_logical_reads desc, total_rows desc;
