-- Listing 10-3

CREATE TABLE dbo.bigtable (
    bigtableId int identity(-2147483648,1) NOT NULL
);

INSERT INTO dbo.bigtable DEFAULT VALUES;
INSERT INTO dbo.bigtable DEFAULT VALUES;

SELECT * FROM dbo.bigtable;
