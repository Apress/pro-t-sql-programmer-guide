-- Listing 5-4

-- Declare variables to hold the result 
DECLARE @ContactID int;
SET @ContactID = 1511;
--Call procedure to get consumer information 
EXEC Person.GetContactDetails @ContactID with result sets(

(
ContactID int,--Column Name changed
ContactName varchar(200),--Column Name changed
Title varchar(50),--Column Name changed
LastUpdatedBy varchar(20),--Column Name changed and the data type has been changed from date to varchar
TypeOfContact varchar(20)
))
