-- Listing 10-18

DECLARE @current datetime = CURRENT_TIMESTAMP;
SELECT @current AS [No_0ffset];
SELECT TODATETIMEOFFSET(@current, '-04:00') AS [With_0ffset];
