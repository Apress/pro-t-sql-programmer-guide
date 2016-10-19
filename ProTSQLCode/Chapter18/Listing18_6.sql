-- Listing 18-6

DECLARE @sampletext AS VARCHAR(10)

SET @sampletext = '123456'

SELECT TRY_CONVERT(INT, @sampletext);

SELECT TRY_CONVERT(DATE, @sampletext); 

SELECT IIF(TRY_CONVERT(binary, @sampletext) IS NULL, 'FALSE', 'TRUE');
