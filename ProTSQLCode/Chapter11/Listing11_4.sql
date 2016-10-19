-- Listing 11-4

SELECT
  ProductModelID,
  Name,
  CatalogDescription,
  Instructions 
FROM Production.ProductModel 
WHERE FREETEXT(CatalogDescription, N'weld', LANGUAGE 1033);
