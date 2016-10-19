-- Listing 14-4

CREATE PROCEDURE dbo.RebuildIndexes
	@db sysname = 'Adventureworks', 
	@online bit = 1, 
	@maxfrag int = 10, 
	@rebuildthreshold int = 30, 
	@WeekdayRebuildOffline int = 1
AS
BEGIN;
	SET NOCOUNT ON; 
	DECLARE 
		@objectid int,
		@indexid int, 
		@indextype nvarchar(60),
		@schemaname nvarchar(130),
		@objectname nvarchar(130),
		@indexname nvarchar(130),
		@frag float,
		@sqlcommand nvarchar(4000);

	-- Select tables and indexes from the 
	-- sys.dm_db_index_physical_stats function based on the threhold defined
	SELECT 
		object_id AS objectid, 
		index_id AS indexid, 
		index_type_desc AS indextype,
		avg_fragmentation_in_percent AS frag 
	INTO 
		#reindexobjects 
	FROM 
		sys.dm_db_index_physical_stats(DB_ID(@db), NULL, NULL, NULL, 'LIMITED') 
	WHERE 
		avg_fragmentation_in_percent > @maxfrag
		AND index_id > 0 

	-- Declare the cursor for the list of objects to be processed. 
	DECLARE objects CURSOR FOR 
		SELECT o.* FROM #reindexobjects o
		INNER JOIN sys.indexes i ON i.object_id = o.objectid
		WHERE i.is_disabled = 0 AND i.is_hypothetical = 0; 

	-- Open the cursor. 
	OPEN objects; 

	WHILE (1=1) 
	BEGIN;
		FETCH NEXT FROM objects INTO @objectid, @indexid, @indextype, @frag; 
		IF @@FETCH_STATUS < 0 BREAK; 
		SELECT @objectname = QUOTENAME(o.name), @schemaname = QUOTENAME(s.name) 
		FROM sys.objects AS o 
		JOIN sys.schemas AS s ON s.schema_id = o.schema_id 
		WHERE o.object_id = @objectid; 

		SELECT @indexname = QUOTENAME(name) 
		FROM sys.indexes 
		WHERE object_id = @objectid AND index_id = @indexid; 
	
		SET @sqlcommand = N'ALTER INDEX ' + @indexname + N' ON ' + 
					@schemaname + N'.' + @objectname; 

		IF @frag > @rebuildthreshold
		BEGIN;
			SET @sqlcommand = @sqlcommand + N' REBUILD';

			IF (DATEPART(WEEKDAY, GETDATE()) <> @WeekdayRebuildOffline) 
AND ((@indextype Like 'HEAP') OR (@indextype like '%CLUSTERED%'))
			SET @sqlcommand = @sqlcommand + N' WITH (ONLINE = ON)';
		END;
		ELSE
			SET @sqlcommand = @sqlcommand + N' REORGANIZE';
		PRINT N'Executing: ' + @sqlcommand; 
		EXEC (@sqlcommand) ;
	END;

	-- Close and deallocate the cursor. 
	CLOSE objects; 
	DEALLOCATE objects; 

	--  UPDATE STATISTICS & SP_RECOMPILE
	DECLARE tablelist CURSOR FOR 
		SELECT distinct OBJECT_NAME(o.objectid) FROM #reindexobjects o;

	-- Open the cursor. 
	OPEN tablelist; 

	FETCH NEXT FROM tablelist INTO @objectname; 

	-- Loop through the partitions. 
	WHILE @@FETCH_STATUS = 0
	BEGIN; 
		--Update Statistics
		SET @sqlcommand = ' UPDATE STATISTICS ' + @objectname;
		PRINT N'Executing: ' + @sqlcommand; 
		EXEC (@sqlcommand) ;
	
		--Recompile Stored Procedures and Triggers
		SET @sqlcommand = ' EXEC sp_recompile ' + @objectname;
		PRINT N'Executing: ' + @sqlcommand; 
		EXEC (@sqlcommand) ;
		FETCH NEXT FROM tablelist INTO @objectname; 
	END;

	CLOSE tablelist;
	DEALLOCATE tablelist;
	DROP TABLE #reindexobjects;
END;
GO
