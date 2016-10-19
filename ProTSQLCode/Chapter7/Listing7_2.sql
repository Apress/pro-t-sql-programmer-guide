-- Listing 7-2

CREATE TRIGGER HumanResources.EmployeeUpdateTrigger
ON HumanResources.Employee
AFTER UPDATE
NOT FOR REPLICATION
AS
BEGIN
    -- stop if no row was affected
    IF @@ROWCOUNT = 0 RETURN
    -- Turn off "rows affected" messages 
    SET NOCOUNT ON;

    -- Make sure at least one row was affected
    -- Update ModifiedDate for all affected rows
    UPDATE HumanResources.Employee
    SET ModifiedDate = GETDATE()
    WHERE EXISTS
     (
        SELECT 1
        FROM inserted i
        WHERE i.BusinessEntityID = HumanResources.Employee.BusinessEntityID
    );
END;
