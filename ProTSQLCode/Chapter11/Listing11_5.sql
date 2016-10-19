-- Listing 11-5

SELECT
  ProductModelID ,
  Name,
  CatalogDescription,
  Instructions 
FROM Production.ProductModel 
WHERE CONTAINS (*, N'weld'); 
