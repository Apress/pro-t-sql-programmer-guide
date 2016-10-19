-- Listing 14-8

SELECT
s.session_id, 
r.request_id, 
r.blocking_session_id,
DB_NAME(r.database_id) as database_name, 
r.[user_id], 
r.status AS request_status, 
s.status AS session_status,
s.login_time, 
s.is_user_process, 
ISNULL (s.[host_name], '') AS [host_name], 
ISNULL (s.[program_name], '') AS [program_name], 
ISNULL (s.login_name, '') AS login_name, 
ISNULL (r.wait_type, '')  AS wait_type, 
ISNULL (r.last_wait_type, '') AS last_wait_type, 
ISNULL (r.wait_resource, '')  AS wait_resource, 
r.transaction_id, 
r.open_transaction_count,
r.cpu_time AS request_cpu_time, 
r.logical_reads AS request_logical_reads, 
r.reads AS request_reads, 
r.writes AS request_writes, 
r.total_elapsed_time AS request_total_elapsed_time, 
r.start_time AS request_start_time, 
r.wait_time AS request_wait_time,
s.memory_usage, 
s.cpu_time AS session_cpu_time, 
s.total_elapsed_time AS session_total_elapsed_time, 
s.last_request_start_time AS session_last_request_start_time, 
s.last_request_end_time AS session_last_request_end_time, 
r.command, 
r.sql_handle
FROM sys.dm_exec_sessions s 
LEFT OUTER MERGE JOIN sys.dm_exec_requests r  
ON s.session_id = r.session_id
WHERE r.session_id <> @@SPID AND 
    ((r.session_id IS NOT NULL AND (s.is_user_process = 1 OR 
r.status NOT IN ('background', 'sleeping'))) OR 
    (s.session_id IN (SELECT DISTINCT blocking_session_id 
FROM sys.dm_exec_requests WHERE blocking_session_id != 0)))                     
OPTION (FORCE ORDER);
