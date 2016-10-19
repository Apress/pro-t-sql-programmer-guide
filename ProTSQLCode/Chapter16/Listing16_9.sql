-- Listing 16-9

CREATE PROCEDURE dbo.GetEnvironmentVars
AS EXTERNAL NAME ApressExamples.[Apress.Examples.SampleProc].GetEnvironmentVars;
GO

EXEC dbo.GetEnvironmentVars;
