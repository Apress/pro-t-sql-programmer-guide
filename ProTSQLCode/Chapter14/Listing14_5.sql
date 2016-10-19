-- Listing 14-5

SELECT
db_name(database_id) dbname,
session_id,
host_name,
program_name,
client_interface_name,
login_name,
cpu_time,
CASE WHEN ansi_nulls = 0 THEN 'OFF' ELSE 'ON' END ansi_nulls,
CASE WHEN ansi_padding = 0 THEN 'OFF' ELSE 'ON' END ansi_padding
 FROM sys.dm_exec_sessions;
