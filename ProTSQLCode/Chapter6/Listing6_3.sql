-- Listing 6-3

USE AdventureWorks2014;
GO

CREATE SCHEMA [MOD] AUTHORIZATION [dbo];
GO

CREATE TABLE [MOD].[Address]
 (	
       AddressID INT NOT NULL IDENTITY(1,1)
	, AddressLine1 NVARCHAR(120) COLLATE Latin1_General_100_BIN2 NOT NULL
	, AddressLine2 NVARCHAR(120) NULL
	, City NVARCHAR(60) COLLATE Latin1_General_100_BIN2 NOT NULL
	, StateProvinceID INT NOT NULL
	, PostalCode NVARCHAR(30) COLLATE Latin1_General_100_BIN2 NOT NULL
	, rowguid UNIQUEIDENTIFIER NOT NULL 
                 INDEX [AK_MODAddress_rowguid] NONCLUSTERED
                 CONSTRAINT [DF_MODAddress_rowguid] DEFAULT (NEWID())
	, ModifiedDate DATETIME NOT NULL 
		    INDEX [IX_MODAddress_ModifiedDate] NONCLUSTERED
                 CONSTRAINT [DF_MODAddress_ModifiedDate] DEFAULT (GETDATE())

	, INDEX [IX_MODAddress_AddressLine1_ City_StateProvinceID_PostalCode]
		NONCLUSTERED
	( [AddressLine1] ASC, [StateProvinceID] ASC, [PostalCode] ASC )

       , INDEX [IX_MODAddress_City]
       ( [City] DESC )

	, INDEX [IX_MODAddress_StateProvinceID] 
		NONCLUSTERED
	( [StateProvinceID] ASC)

	, CONSTRAINT PK_MODAddress_Address_ID 
             PRIMARY KEY NONCLUSTERED HASH
	( [AddressID]) WITH (BUCKET_COUNT=30000)

) WITH(MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_AND_DATA);
GO
