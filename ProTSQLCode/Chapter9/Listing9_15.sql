-- Listing 9-15

SELECT  
	PurchaseOrderID, 
	ProductID, 
	OrderQty,
	UnitPrice, 
	LineTotal,
	SUM(LineTotal) OVER (PARTITION BY ProductId ORDER BY DueDate
          RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS  CumulativeTotal,
	ROW_NUMBER() OVER (PARTITION BY ProductId ORDER BY DueDate ) AS  No
FROM Purchasing.PurchaseOrderDetail
ORDER BY ProductId, DueDate;
