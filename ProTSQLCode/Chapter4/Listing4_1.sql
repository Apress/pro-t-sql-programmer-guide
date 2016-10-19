-- Listing 4-1

CREATE FUNCTION dbo.CalculateCircleArea (@Radius float =1.0)
RETURNS float
WITH RETURNS NULL ON NULL INPUT
AS
BEGIN
   RETURN PI() * POWER(@Radius, 2); 
END;
