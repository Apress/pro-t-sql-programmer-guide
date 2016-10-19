-- Listing 12-16

SELECT
	ProductModelID,
	Name,
	Specs.query('.') AS Result 
FROM Production.ProductModel
CROSS APPLY CatalogDescription.nodes('declare namespace ns = 
"http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
/ns:ProductDescription/ns:Specifications/Material/text()
  [ contains ( . , "Alloy" ) ]') 
AS NodeTable(Specs);
