-- Listing 6-7

SELECT AddressID, AddressLine1, RowGuid
   FROM [MOD].[Address] 	
  WHERE AddressID IN (804, 831)
    AND AddressLine1 COLLATE SQL_Latin1_General_CP1_CI_AS LIKE '%plaza';
