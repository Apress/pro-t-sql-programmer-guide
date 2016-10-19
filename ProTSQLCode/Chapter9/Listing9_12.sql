-- Listing 9-12

SELECT  
	PurchaseOrderID, 
	ProductID, 
	OrderQty,
	UnitPrice, 
	LineTotal,
	SUM(LineTotal) 
OVER (PARTITION BY PurchaseOrderID 
ORDER BY ProductId 
RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
AS CumulativeOrderOty 
FROM Purchasing.PurchaseOrderDetail;
