-- Listing 16-19

BEGIN TRY
    UPDATE Person.EmailAddress
    SET EmailAddress = 'pro%sql@apress@com'
    WHERE EmailAddress = 'dylan0@adventure-works.com';
END TRY
BEGIN CATCH
    IF ERROR_NUMBER() = 3991
        RAISERROR('invalid email address', 16, 10)
END CATCH

