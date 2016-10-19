-- Listing 10-35

SELECT
    d.Title,
    d.Document.PathName() AS LOB_Path,
    d.Document AS LOB_Data 
FROM Production.DocumentFS d 
WHERE d.Document IS NOT NULL;
