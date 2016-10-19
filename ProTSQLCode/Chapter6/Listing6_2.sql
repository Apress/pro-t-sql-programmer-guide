-- Listing 6-2

IF NOT EXISTS 
  ( SELECT * FROM AdventureWorks2014.sys.data_spaces ds 
             JOIN AdventureWorks2014.sys.database_files df ON   
                  ds.data_space_id=df.data_space_id 
            WHERE ds.type='FX'    )
   ALTER DATABASE AdventureWorks2014
	   ADD FILE (name=' AdventureWorks2014_mem',  
                   filename='C:\SQLData\AdventureWorks2014_mem') 
	  TO FILEGROUP [AdventureWorks2014_mem]
GO
