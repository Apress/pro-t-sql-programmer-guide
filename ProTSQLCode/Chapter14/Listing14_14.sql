-- Listing 14-14

SELECT
cpu_count AS logical_CPUs,
hyperthread_ratio,
physical_memory_kb / 1048576.00 AS physical_MB,
virtual_memory_kb / 1048576.00 AS virtual_MB,
sqlserver_start_time,
virtual_machine_type_desc
FROM sys.dm_os_sys_info;
