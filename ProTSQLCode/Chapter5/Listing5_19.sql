-- Listing 5-19

CREATE  PROCEDURE  Sales.GetSalesBySalesPerson  (@SalesPersonId  int)
AS
BEGIN
    SELECT 
        soh.SalesOrderID,
        soh.OrderDate,
        soh.TotalDue
    FROM  Sales.SalesOrderHeader  soh
    WHERE soh.SalesPersonID = @SalesPersonId;
END;
GO
