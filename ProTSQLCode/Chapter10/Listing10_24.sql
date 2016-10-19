-- Listing 10-24

SELECT 
    BomNode,
    BomNode.ToString(), 
    ProductAssemblyID,
    ComponentID,
    UnitMeasureCode,
    PerAssemblyQty,
    BomLevel 
FROM Production.HierBillOfMaterialsORDER BY BomNode;
