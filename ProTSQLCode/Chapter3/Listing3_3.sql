-- Listing 3-3

DECLARE @i int = 1; 
WHILE @i <= 10 
BEGIN
   PRINT @i;
   SET @i = @i + 1; 
END
