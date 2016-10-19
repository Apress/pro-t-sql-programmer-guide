-- Listing 3-8

WITH  EmployeesByRegion(Region)
AS
(
    SELECT
        CASE sp.StateProvinceCode
        WHEN 'CA' THEN 'West Coast'
        WHEN 'WA' THEN 'West Coast'
        WHEN 'OR' THEN 'West Coast'
        ELSE 'Elsewhere'
        END
    FROM  HumanResources.Employee e
    INNER JOIN Person.Person p
        ON e.BusinessEntityID = p.BusinessEntityID
       INNER JOIN Person.BusinessEntityAddress bea
              ON bea.BusinessEntityID = e.BusinessEntityID
       INNER JOIN Person.Address a
           ON a.AddressID = bea.AddressID
       INNER JOIN Person.StateProvince sp
              ON sp.StateProvinceID = a.StateProvinceID
    WHERE sp.CountryRegionCode = 'US'
)
SELECT  COUNT(Region)  AS  NumOfEmployees,  Region
FROM    EmployeesByRegion
GROUP  BY  Region;

