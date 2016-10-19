-- Listing 19-21

CREATE EVENT SESSION [Troubleshoot page split] ON SERVER 
ADD EVENT sqlserver.page_split(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.database_name,sqlserver.plan_handle,sqlserver.server_instance_name,sqlserver.server_principal_name,sqlserver.server_principal_sid,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.username)),
ADD EVENT sqlserver.rpc_completed(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.database_name,sqlserver.plan_handle,sqlserver.server_instance_name,sqlserver.server_principal_name,sqlserver.server_principal_sid,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.username)),
ADD EVENT sqlserver.rpc_starting(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.database_name,sqlserver.plan_handle,sqlserver.server_instance_name,sqlserver.server_principal_name,sqlserver.server_principal_sid,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.username)),
ADD EVENT sqlserver.sp_statement_completed(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.database_name,sqlserver.plan_handle,sqlserver.server_instance_name,sqlserver.server_principal_name,sqlserver.server_principal_sid,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.username)),
ADD EVENT sqlserver.sp_statement_starting(
    ACTION(sqlserver.client_app_name,sqlserver.database_id,sqlserver.database_name,sqlserver.plan_handle,sqlserver.server_instance_name,sqlserver.server_principal_name,sqlserver.server_principal_sid,sqlserver.session_id,sqlserver.session_nt_username,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.username)) 
ADD TARGET package0.event_file(SET filename=N'C:\Temp\Troubleshoot page split.xel')
WITH (MAX_MEMORY=4096 KB,EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,MAX_DISPATCH_LATENCY=30 SECONDS,MAX_EVENT_SIZE=0 KB,MEMORY_PARTITION_MODE=NONE,TRACK_CAUSALITY=OFF,STARTUP_STATE=OFF)
GO
