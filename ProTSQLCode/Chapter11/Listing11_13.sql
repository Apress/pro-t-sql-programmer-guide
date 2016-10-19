-- Listing 11-13

SELECT
  [KEY],
  [RANK] 
FROM CONTAINSTABLE (
Production.ProductModel,
[Name],
N'FORMSOF(INFLECTIONAL, tours)' 
);
