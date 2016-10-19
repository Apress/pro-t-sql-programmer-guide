-- Listing 9-18

SELECT
	round(SUM(TotalDue),1) AS Sales,
	LastName,
	FirstName,
	SalesPersonId,
	AccountNumber,
	PERCENTILE_CONT(0.4) WITHIN GROUP (ORDER BY round(SUM(TotalDue),1)) 
			OVER(PARTITION BY AccountNumber ) AS PERCENTILE_CONT,
	PERCENTILE_DISC(0.4) WITHIN GROUP(ORDER BY round(SUM(TotalDue),1)) 
		OVER(PARTITION BY AccountNumber ) AS PERCENTILE_DISC
FROM 
	Sales.SalesOrderHeader soh
		JOIN Sales.vSalesPerson sp
		ON soh.SalesPersonID = sp.BusinessEntityID
GROUP BY AccountNumber,SalesPersonID,LastName,FirstName
