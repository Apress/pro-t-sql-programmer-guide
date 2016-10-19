-- Listing 11-3

SELECT
   ProductModelID,
   Name,
   CatalogDescription,
   Instructions 
FROM Production.ProductModel 
WHERE FREETEXT(*, N'sock');

SELECT
  ProductModelID,
  Name,
  CatalogDescription,
  Instructions 
FROM Production.ProductModel 
WHERE FREETEXT(*, N'sock') 
AND ProductModelID < 100;
