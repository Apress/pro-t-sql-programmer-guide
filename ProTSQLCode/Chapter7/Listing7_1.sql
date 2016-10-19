-- Listing 7-1

DISABLE TRIGGER HumanResources.EmployeeUpdateTrigger 
ON HumanResources.Employee;

SELECT 
    name, 
    OBJECT_SCHEMA_NAME(parent_id) + '.' + OBJECT_NAME(parent_id) as Parent 
FROM sys.triggers 
WHERE is_disabled = 1;

ENABLE TRIGGER HumanResources.EmployeeUpdateTrigger 
ON HumanResources.Employee;

-- disabling and enabling all triggers on the object
DISABLE TRIGGER ALL ON HumanResources.Employee;
ENABLE TRIGGER ALL ON HumanResources.Employee;
