-- Listing 10-34

CREATE TABLE Production.DocumentFS (
    DocumentNode    hierarchyid NOT NULL PRIMARY KEY,
    DocumentLevel   AS (DocumentNode.GetLevel()),
    Title           nvarchar(50) NOT NULL,
    Owner           int NOT NULL,
    FolderFlag      bit NOT NULL,
    FileName        nvarchar(400) NOT NULL,
    FileExtension   nvarchar(8) NOT NULL,
    Revision        nchar(5) NOT NULL,
    ChangeNumber    int NOT NULL,
    Status          tinyint NOT NULL,
    DocumentSummary nvarchar(max) NULL,
    Document        varbinary(max) FILESTREAM NULL,
    rowguid         uniqueidentifier ROWGUIDCOL NOT NULL UNIQUE,
    ModifiedDate    datetime NOT NULL
);
GO

INSERT INTO Production.DocumentFS
    (DocumentNode, Title, Owner, FolderFlag, FileName, FileExtension, Revision, ChangeNumber, Status, DocumentSummary, Document, rowguid, ModifiedDate)
SELECT 
    DocumentNode, Title, Owner, FolderFlag, FileName, FileExtension, Revision, ChangeNumber, Status, DocumentSummary, Document, rowguid, ModifiedDate
FROM Production.Document;
