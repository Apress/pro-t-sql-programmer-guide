-- Listing 18-5

DECLARE @fauxdate AS varchar(10)
DECLARE @realdate AS VARCHAR(10)

SET @fauxdate = 'iamnotadate'
SET @realdate = '01/05/2012'

SELECT TRY_PARSE(@fauxdate AS DATE); 

SELECT TRY_PARSE(@realdate AS DATE);

SELECT TRY_PARSE(@realdate AS DATE USING 'Fr-FR');
	 
SELECT IIF(TRY_PARSE(@realdate AS DATE) IS NULL, 'False', 'True')
