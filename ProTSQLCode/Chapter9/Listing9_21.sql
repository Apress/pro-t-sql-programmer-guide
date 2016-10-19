-- Listing 9-21

SELECT DISTINCT
	LastName, 
	SalesPersonID,
	datename(year,OrderDate) OrderYear,
	datename(month, OrderDate) OrderMonth,
	FIRST_VALUE(SubTotal) OVER (PARTITION BY SalesPersonID, OrderDate ORDER BY  SalesPersonID ) FirstSalesAmount,
	LAST_VALUE(SubTotal) OVER (PARTITION BY SalesPersonID, OrderDate ORDER BY  SalesPersonID) LastSalesAmount,
OrderDate
 FROM 
	Sales.SalesOrderHeader soh
		JOIN Sales.vSalesPerson sp
		ON soh.SalesPersonID = sp.BusinessEntityID
ORDER BY OrderDate;
