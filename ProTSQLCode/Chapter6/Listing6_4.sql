-- Listing 6-4

SELECT t.name as 'Table Name'
	, t.object_id
       , t.schema_id  
	, filestream_data_space_id
	, is_memory_optimized
	, durability
	, durability_desc
  FROM sys.tables t
 WHERE type='U'
   AND t.schema_id = SCHEMA_ID(N'MOD');
