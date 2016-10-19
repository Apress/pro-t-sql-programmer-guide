-- Listing 11-26

SELECT TOP(10) KEYP_TBL.keyphrase
FROM SEMANTICKEYPHRASETABLE
    (
    Production.ProductModel,
	Name
    ) AS KEYP_TBL
ORDER BY KEYP_TBL.score DESC;
GO
