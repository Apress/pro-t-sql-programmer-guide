-- Listing 16-1

EXEC sp_configure 'CLR Enabled';
RECONFIGURE;

CREATE ASSEMBLY ApressExamples
AUTHORIZATION dbo
FROM N'C:\MyApplication\CLRDemo.DLL'
WITH PERMISSION_SET = SAFE;
GO
