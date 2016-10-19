-- Listing 16-20

CREATE TRIGGER atr_Person_EmailAddress_ValidateEmail
ON Person.EmailAddress
AFTER INSERT, UPDATE
AS BEGIN
    IF @@ROWCOUNT = 0 RETURN

    IF EXISTS (SELECT * FROM inserted WHERE dbo.EmailMatch(EmailAddress) = 0)
    BEGIN
        RAISERROR('an email is invalid', 16, 10)
        ROLLBACK TRANSACTION        
    END

END;
