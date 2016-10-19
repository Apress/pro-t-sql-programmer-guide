-- Listing 10-20

CREATE TABLE dbo.Document (
    DocumentId uniqueidentifier NOT NULL PRIMARY KEY DEFAULT (NEWID())
);

INSERT INTO dbo.Document DEFAULT VALUES;
INSERT INTO dbo.Document DEFAULT VALUES;
INSERT INTO dbo.Document DEFAULT VALUES;

SELECT * FROM dbo.Document;
