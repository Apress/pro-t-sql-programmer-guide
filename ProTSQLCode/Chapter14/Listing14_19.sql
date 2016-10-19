-- Listing 14-19

SELECT TOP 20
 wait_type,
 wait_time_ms / 1000 wait_time_secs,
 CONVERT(DECIMAL(12,2), wait_time_ms * 100.0 
               / SUM(wait_time_ms) OVER()) Per_waiting
FROM sys.dm_os_wait_stats
ORDER BY wait_time_ms DESC;
