-- Listing 11-7

SELECT
  ProductModelID ,
  Name,
  CatalogDescription 
FROM Production.ProductModel 
WHERE CONTAINS 
(
  ( 
    Name, 
    CatalogDescription
),
N'"tube" | FORMSOF (INFLECTIONAL, sport)'
); 
