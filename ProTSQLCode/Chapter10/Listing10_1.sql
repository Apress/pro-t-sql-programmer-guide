-- Listing 10-1

DECLARE
    @string VARCHAR(50) = 'hello earth',
    @nstring NVARCHAR(50) = 'hello earth';

SELECT
    DATALENGTH(@string) as DatalengthString,
    DATALENGTH(@nstring) as DatalengthNString,
    LEN(@string) as lenString,
    LEN(@nstring) as lenNString;
