-- Listing 12-10

DECLARE @x XML;
CREATE TABLE XmlPurchaseOrders
(
   PoNum int NOT NULL PRIMARY KEY,
   XmlPurchaseOrder xml );
