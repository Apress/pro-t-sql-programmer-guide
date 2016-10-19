-- Listing 19-15

SELECT 
    ProductID,
    Name,
    ProductNumber,
    SellStartDate,
    Color,
    Class
FROM  Production.SparseProduct
WHERE ProductID IN (1, 317);
