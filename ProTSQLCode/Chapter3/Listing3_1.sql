-- Listing 3-1

DECLARE @i int = NULL; 
IF @i = 10
    PRINT 'TRUE.'; 
ELSE IF NOT (@i = 10)
    PRINT 'FALSE.'; 
ELSE
    PRINT 'UNKNOWN.';