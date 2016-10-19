-- Listing 9-20

Select 
	LastName, 
	SalesPersonID,
	Sum(SubTotal) CurrentMonthSales,
	DateNAME(Month,OrderDate) Month,
	DateName(Year,OrderDate) Year,
	LEAD(Sum(SubTotal),1) OVER (ORDER BY SalesPersonID, OrderDate) TotalSalesNextMonth
 FROM 
	Sales.SalesOrderHeader soh
		JOIN Sales.vSalesPerson sp
		ON soh.SalesPersonID = sp.BusinessEntityID
WHERE DateName(Year,OrderDate)  = 2007
 GROUP BY 
		FirstName, LastName, SalesPersonID,OrderDate
ORDER BY SalesPersonID,OrderDate;
