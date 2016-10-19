-- Listing 10-14

DECLARE @lang sysname;

SET @lang = @@LANGUAGE

SELECT CAST('12/31/2012' as datetime2); --this works

SET LANGUAGE 'spanish';

SELECT 
    CASE WHEN TRY_CAST('12/31/2012' as datetime2) IS NULL 
    THEN 'Cast failed'
    ELSE 'Cast succeeded'
END AS Result;

SET LANGUAGE @lang;
