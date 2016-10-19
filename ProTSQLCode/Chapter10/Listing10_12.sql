-- Listing 10-12

DECLARE @dt2 datetime2 = '2011-12-31T23:59:59';

SELECT  FORMAT(@dt2, 'F', 'en-US') as with_format,
        CONVERT(varchar(50), @dt2, 109) as with_convert;
