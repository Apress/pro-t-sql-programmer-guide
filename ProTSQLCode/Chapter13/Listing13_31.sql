-- Listing 13-31

SELECT CatalogDescription.query (

N'declare namespace ns =
"http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription";
for $spec in //ns:ProductDescription/ns:Specifications/* return <detail> {
$spec/text() } </detail>' ) AS Description
FROM Production.ProductModel WHERE ProductModelID = 19;
