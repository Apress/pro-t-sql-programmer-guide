-- Listing 10-13

SELECT language 
FROM sys.dm_exec_sessions 
WHERE session_id = @@SPID;
-- or 
SELECT @@LANGUAGE;
