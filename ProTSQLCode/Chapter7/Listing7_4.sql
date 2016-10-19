-- Listing 7-4

CREATE TABLE dbo.DmlActionLog (
    EntryNum int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    SchemaName sysname NOT NULL,
    TableName sysname NOT NULL,
    ActionType nvarchar(10) NOT NULL,
    ActionXml xml NOT NULL,
    LoginName sysname NOT NULL,
    ApplicationName sysname NOT NULL,
    HostName sysname NOT NULL,
    ActionDateTime datetime2(0) NOT NULL DEFAULT (SYSDATETIME()) 
); 
GO
