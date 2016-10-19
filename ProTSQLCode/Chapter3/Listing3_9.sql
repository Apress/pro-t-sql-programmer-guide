-- Listing 3-9

WITH  EmployeesByRegion(Region)
AS
(
    SELECT
        CASE WHEN sp.StateProvinceCode IN ('CA', 'WA', 'OR') THEN 'West Coast'
        WHEN sp.StateProvinceCode IN ('HI', 'AK') THEN 'Pacific'
        WHEN  sp.StateProvinceCode  IN  ('CT',  'MA', 'ME', 'NH', 'RI', 'VT')
        THEN 'New England'
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
SELECT  COUNT(Region)  AS  NumOfCustomers,  Region
FROM    EmployeesByRegion
GROUP  BY  Region;