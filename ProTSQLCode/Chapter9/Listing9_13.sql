-- Listing 9-13

SELECT  
	PurchaseOrderID, 
	ProductID, 
	OrderQty,
	UnitPrice, 
	LineTotal,
	SUM(LineTotal) 
OVER (PARTITION BY PurchaseOrderID 
ORDER BY ProductId 
) 
AS TotalSalesDefaultFraming,
	SUM(LineTotal) 
OVER (PARTITION BY PurchaseOrderID 
ORDER BY ProductId RANGE BETWEEN UNBOUNDED PRECEDING 
AND UNBOUNDED FOLLOWING
) 
AS TotalSalesDefinedFraming
FROM Purchasing.PurchaseOrderDetail
ORDER BY PurchaseOrderID;
