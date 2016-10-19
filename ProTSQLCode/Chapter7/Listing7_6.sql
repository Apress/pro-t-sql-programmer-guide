-- Listing 7-6

CREATE TRIGGER HumanResources.DepartmentChangeAudit
ON HumanResources.Department
AFTER INSERT, UPDATE, DELETE
NOT FOR REPLICATION
AS
BEGIN
    -- stop if no row was affected
    IF @@ROWCOUNT = 0 RETURN

    -- Turn off "rows affected" messages 
    SET NOCOUNT ON;
    
    DECLARE @ActionType nvarchar(10), @ActionXml xml;

    -- Get count of inserted rows 
    DECLARE @inserted_count int = (
        SELECT COUNT(*)
        FROM inserted 
    );
    -- Get count of deleted rows 
    DECLARE @deleted_count int = (
        SELECT COUNT(*)
        FROM deleted
    );

    -- Determine the type of DML action that fired the trigger 
    SET @ActionType = CASE
        WHEN (@inserted_count > 0) AND (@deleted_count = 0) THEN N'insert' 
        WHEN (@inserted_count = 0) AND (@deleted_count > 0) THEN N'delete' 
        ELSE N'update' 
    END;

    -- Use FOR XML AUTO to retrieve before and after snapshots of the changed
    --  data  in  XML  format
    SELECT @ActionXml = COALESCE
    (
        (
            SELECT  *
            FROM  deleted
            FOR  XML  AUTO
        ),  N'<deleted/>'
    )  +  COALESCE
    (
        (
            SELECT  *
            FROM  inserted
            FOR  XML  AUTO
        ),  N'<inserted/>'
    );
    
    -- Insert a row for the logged action in the audit logging table
    INSERT INTO dbo.DmlActionLog
    (
        SchemaName,
        TableName,
        ActionType,
        ActionXml,
        LoginName,
        ApplicationName,
        HostName
    ) 
    SELECT
        OBJECT_SCHEMA_NAME(@@PROCID, DB_ID()),
        OBJECT_NAME(t.parent_id, DB_ID()),
        @ActionType,
        @ActionXml,
        SUSER_SNAME(),
        APP_NAME(),
        HOST_NAME()
    FROM sys.triggers t 
    WHERE t.object_id = @@PROCID;
END; 
GO
UPDATE HumanResources.Department SET Name = N'Information Technology' 
WHERE DepartmentId = 11;

INSERT INTO HumanResources.Department 
(
    Name,
    GroupName
) 
VALUES
(
    N'Customer Service', 
    N'Sales and Marketing'
);

DELETE
FROM HumanResources.Department
WHERE Name = N'Customer Service';

SELECT
    EntryNum,
    SchemaName,
    TableName,
    ActionType,
    ActionXml,
    LoginName,
    ApplicationName,
    HostName,
    ActionDateTime 
FROM dbo.DmlActionLog;
