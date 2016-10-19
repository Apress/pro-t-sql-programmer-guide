-- Listing 6-6

SELECT AddressID, AddressLine1, RowGuid
   FROM [MOD].[Address] 
  WHERE AddressID IN (804, 831)
    AND AddressLine1 LIKE '%plaza'
