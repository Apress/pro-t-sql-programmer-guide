-- Listing 6-5

SET IDENTITY_INSERT [MOD].[Address] ON;

 INSERT INTO [MOD].[Address]
 (	AddressID, AddressLine1, AddressLine2
       , City, StateProvinceID, PostalCode
	--, SpatialLocation
	, rowguid, ModifiedDate  )

 SELECT AddressID, AddressLine1, AddressLine2
	, City, StateProvinceID, PostalCode
	--, SpatialLocation
	, rowguid, ModifiedDate   
   FROM [Person].[Address];

   SET IDENTITY_INSERT [MOD].[Address] OFF;

   UPDATE STATISTICS [MOD].[Address] WITH FULLSCAN, NORECOMPUTE;
   GO
