-- Listing 7-18

USE Master;
GO

CREATE TRIGGER DenyLogons
ON ALL SERVER
WITH EXECUTE AS 'sa'
FOR LOGON
AS
BEGIN
    IF EXISTS ( SELECT 1
        FROM Master .dbo.DenyLogonSchedule 
        WHERE UserId = ORIGINAL_LOGIN() 
        AND DayOfWeek = DATEPART(WeekDay, GETDATE()) 
        AND CAST(GETDATE() AS TIME) BETWEEN TimeStart AND TimeEnd 
    ) BEGIN
        ROLLBACK TRANSACTION;
    END; 
END;
