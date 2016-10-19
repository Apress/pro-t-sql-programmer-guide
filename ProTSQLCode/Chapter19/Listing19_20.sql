-- Listing 19-20

--List waiting user requests
SELECT 
er.session_id, er.wait_type, er.wait_time, 
er.wait_resource, er.last_wait_type, 
er.command,et.text,er.blocking_session_id
FROM sys.dm_exec_requests AS er
JOIN sys.dm_exec_sessions AS es
ON es.session_id = er.session_id
AND es.is_user_process = 1
CROSS APPLY sys.dm_exec_sql_text(er.sql_handle) AS et
GO
--List waiting user tasks
SELECT 
wt.waiting_task_address, wt.session_id, wt.wait_type, 
wt.wait_duration_ms, wt.resource_description 
FROM sys.dm_os_waiting_tasks AS wt
JOIN sys.dm_exec_sessions AS es
ON wt.session_id = es.session_id
AND es.is_user_process = 1
GO
-- List user tasks
SELECT 
t.session_id, t.request_id, t.exec_context_id, 
t.scheduler_id, t.task_address, 
t.parent_task_address
FROM sys.dm_os_tasks AS t
JOIN sys.dm_exec_sessions AS es
ON t.session_id = es.session_id
AND es.is_user_process = 1
GO
