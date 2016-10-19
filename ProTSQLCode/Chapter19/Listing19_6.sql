-- Listing 19-6

ALTER TABLE Production.TransactionHistory REBUILD 
WITH (DATA_COMPRESSION = ROW);
