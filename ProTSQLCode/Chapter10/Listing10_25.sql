-- Listing 10-25

DECLARE @CurrentNode hierarchyid;

SELECT @CurrentNode = BomNode
FROM Production.HierBillOfMaterials
WHERE ProductAssemblyID = 749;

SELECT
    BomNode,
    BomNode.ToString(),
    ProductAssemblyID,
    ComponentID,
    UnitMeasureCode,
    PerAssemblyQty,
    BomLevel
FROM Production.HierBillOfMaterials
WHERE @CurrentNode.IsDescendantOf(BomNode) = 1;
