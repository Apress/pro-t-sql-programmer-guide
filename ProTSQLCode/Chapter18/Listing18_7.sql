-- Listing 18-7

DECLARE @sampletext AS VARCHAR(10)

SET @sampletext = '123456'

SELECT TRY_CAST(@sampletext AS INT);

SELECT TRY_CAST(@sampletext AS DATE); 

SELECT IIF(TRY_CAST(@sampletext AS BINARY) IS NULL, 'FALSE', 'TRUE');
