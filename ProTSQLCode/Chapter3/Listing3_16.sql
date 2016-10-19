-- Listing 3-16

DECLARE @s varchar(10);
SELECT @s = 'A';
SELECT COALESCE(NULLIF(@s, 'A'), 'This is NULL or A');

