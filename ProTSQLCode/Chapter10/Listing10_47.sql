-- Listing 10-47

CREATE TABLE dbo.cliparts_log (
    path nvarchar(4000) not null,
    deletion_date datetime2(0),
    deletion_user sysname,
    is_directory bit
)
GO

CREATE TRIGGER OpenClipartsLibrary_logTrigger
ON [dbo].[OpenClipartsLibrary]
AFTER DELETE
AS BEGIN
    IF @@ROWCOUNT = 0 RETURN;
    SET NOCOUNT ON;

    INSERT INTO dbo.cliparts_log (path, deletion_date, deletion_user, is_directory)
    SELECT name, SYSDATETIME(), SUSER_SNAME(),is_directory
    FROM deleted
END;
