-- Listing 13-22

DECLARE @x xml = N'';
SELECT @x.query(N'3.141592 eq "Pi"') ;
