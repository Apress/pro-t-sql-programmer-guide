-- Listing 9-14

SELECT  
	PurchaseOrderID,
	ProductID, 
	Duedate,
	LineTotal,
	Avg(LineTotal) 
OVER (ORDER BY Duedate 
ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) 
AS [2DayAvg]
FROM Purchasing.PurchaseOrderDetail
ORDER BY Duedate;
