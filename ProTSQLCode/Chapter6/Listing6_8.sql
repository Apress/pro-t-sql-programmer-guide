-- Listing 6-8

CHECKPOINT
GO
DBCC DROPCLEANBUFFERS
GO
DBCC FREEPROCCACHE
GO

SET STATISTICS IO ON;

SELECT * FROM Person.Address WHERE AddressId = 26007;
SELECT * FROM MOD.Address WHERE AddressId = 26007;
