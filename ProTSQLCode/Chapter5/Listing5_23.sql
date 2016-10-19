-- Listing 5-23

CREATE  PROCEDURE  dbo.GetRecompiledProcs  
AS
BEGIN
    SELECT 
        sql_text.text,
        stats.sql_handle,
        stats.plan_generation_num,
        stats.creation_time,
        stats.execution_count,
        sql_text.dbid,
        sql_text.objectid 
    FROM sys.dm_exec_query_stats stats
        Cross apply sys.dm_exec_sql_text(sql_handle) as sql_text
    WHERE stats.plan_generation_num > 1
        and sql_text.objectid is not null --Filter adhoc queries
    ORDER BY stats.plan_generation_num desc
END;
GO
