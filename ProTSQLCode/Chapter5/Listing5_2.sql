-- Listing 5-2

-- Declare variables to hold the result 
DECLARE @Email nvarchar(50),@Name nvarchar(100),@Result int;
--Call procedure to get employee information 
EXECUTE @Result = Person.GetEmployee 123, @Email OUTPUT, @Name OUTPUT;

-- Display Results
SELECT @Result AS Result, @Email AS Email, @Name AS [Name];