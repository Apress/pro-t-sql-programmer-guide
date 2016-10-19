-- Listing 12-6

SELECT
  Product.ProductID,
  Product.Name,
  Product.ProductNumber,
  Inventory.Quantity 
FROM Production.Product Product 
INNER JOIN Production.ProductInventory Inventory
ON Product.ProductID = Inventory.ProductID 
WHERE Product.ProductID IN (770, 3)
FOR XML AUTO;
