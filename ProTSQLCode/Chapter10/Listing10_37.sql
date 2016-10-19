-- Listing 10-37

USE [cliparts];
GO

CREATE TABLE dbo.OpenClipartsLibrary AS FILETABLE
WITH
    (
        FILETABLE_DIRECTORY = 'OpenClipartsLibrary'
    );
GO

INSERT INTO dbo.OpenClipartsLibrary (name,is_directory)
VALUES ('import_20120501',1);
