-- Listing 8-11

-- Create DMK 
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'P@55wOrd';

-- Create asymmetric key 
CREATE ASYMMETRIC KEY TestAsymmetricKey WITH ALGORITHM = RSA_512;

-- Create message
DECLARE @message nvarchar(4000) = N'Alas, poor Yorick!';
SELECT @message;

-- Sign message by asymmetric key
SELECT SignByAsymKey(AsymKey_ID(N'TestAsymmetricKey'), @message);

-- Drop asymmetric key
DROP ASYMMETRIC KEY TestAsymmetricKey;

-- Drop DMK 
DROP MASTER KEY;
