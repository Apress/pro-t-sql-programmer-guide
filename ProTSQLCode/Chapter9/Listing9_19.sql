-- Listing 9-19

WITH ProductCostHistory AS 
(SELECT
  ProductID,
  LAG(StandardCost) 
OVER (PARTITION BY ProductID ORDER BY ProductID) AS PreviousProductCost,
  StandardCost AS CurrentProductCost,
  Startdate,Enddate
FROM  Production.ProductCostHistory
)
SELECT
  ProductID,
  PreviousProductCost,
  CurrentProductCost,
  StartDate,
  EndDate
FROM ProductCostHistory 
WHERE Enddate IS NULL
