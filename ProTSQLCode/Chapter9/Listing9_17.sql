-- Listing 9-17

SELECT
	round(SUM(TotalDue),1) AS Sales,
	LastName,
	FirstName,
	SalesPersonId,
	CUME_DIST() OVER (ORDER BY round(SUM(TotalDue),1)) as CUME_DIST
	,PERCENT_RANK() OVER (ORDER BY round(SUM(TotalDue),1)) as PERCENT_RANK
FROM 
	Sales.SalesOrderHeader soh
		JOIN Sales.vSalesPerson sp
		ON soh.SalesPersonID = sp.BusinessEntityID
GROUP BY SalesPersonID,LastName,FirstName;
