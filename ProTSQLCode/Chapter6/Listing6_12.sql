-- Listing 6-12

CREATE PROCEDURE selAddressModifiedDate 
(	@BeginModifiedDate DATETIME
	, @EndmodifiedDate DATETIME )
 WITH
NATIVE_COMPILATION
, SCHEMABINDING
, EXECUTE AS OWNER
 AS
 BEGIN ATOMIC
  WITH
 ( TRANSACTION ISOLATION LEVEL = SNAPSHOT
	  LANGUAGE = N'us_english')

  -- T-SQL Logic Here
 SELECT AddressID, AddressLine1
		, AddressLine2, City
		, StateProvinceID, PostalCode
		, rowguid, ModifiedDate 
    FROM [MOD].[Address] 
   WHERE ModifiedDate 
         BETWEEN @BeginModifiedDate AND @EndmodifiedDate;

END;
