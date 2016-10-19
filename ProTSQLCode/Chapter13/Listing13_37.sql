-- Listing 13-37

declare @BusinessEntityId int
INSERT INTO Person.BusinessEntity(rowguid, ModifiedDate)
VALUES (NEWID(),CURRENT_TIMESTAMP) 
SET @BusinessEntityId = SCOPE_IDENTITY()
INSERT INTO [Person].[Person]
           ([BusinessEntityID]
           ,[PersonType]
           ,[NameStyle]
           ,[Title]
           ,[FirstName]
           ,[MiddleName]
           ,[LastName]
           ,[Suffix]
           ,[EmailPromotion]
           ,[AdditionalContactInfo]
           ,[Demographics]
           ,[rowguid]
           ,[ModifiedDate])
     VALUES
		(@BusinessEntityId,
		'EM',
		0,
		NULL,
		N'T' + nchar(0xD834) + nchar(0xDD25), 
		'J', 
		'Kim', 
		NULL,
		0,
		NULL,
		'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>',
		NEWID(),
		CURRENT_TIMESTAMP)
