-- Listing 16-7

CREATE FUNCTION dbo.GetYahooNews()
RETURNS TABLE(title nvarchar(256), link nvarchar(256), pubdate datetime, description nvarchar(max))
AS EXTERNAL NAME ApressExamples.[Apress.Examples.YahooRSS].GetYahooNews
GO

SELECT
    title,
    link,
    pubdate,
    description 
FROM dbo.GetYahooNews();
