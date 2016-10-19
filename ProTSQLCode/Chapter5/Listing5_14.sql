-- Listing 5-14

DECLARE @LastNameList HumanResources.LastNameTableType;
INSERT INTO @LastNameList
(LastName)
VALUES
(N'Walters'),
(N'Anderson'),
(N'Chen'),
(N'Rettig'),
(N'Lugo'),
(N'Zwilling'),
(N'Johnson');

EXECUTE HumanResources.GetEmployees @LastNameList;
