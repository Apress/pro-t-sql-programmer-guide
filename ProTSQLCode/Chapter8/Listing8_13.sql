-- Listing 8-13

-- Create certificate to protect symmetric key 
CREATE CERTIFICATE TestCertificate
  WITH SUBJECT = 'AdventureWorks Test Certificate',
  EXPIRY_DATE = '2026-10-31';

CREATE SYMMETRIC KEY TestSymmetricKey WITH ALGORITHM = AES_128 ENCRYPTION BY PASSWORD = 'p@55wOrd';

OPEN SYMMETRIC KEY TestSymmetricKey 
  DECRYPTION BY PASSWORD = 'p@55wOrd'; 

ALTER SYMMETRIC KEY TestSymmetricKey 
  ADD ENCRYPTION BY CERTIFICATE TestCertificate;

ALTER SYMMETRIC KEY TestSymmetricKey
  DROP ENCRYPTION BY PASSWORD = 'p@55wOrd';

CLOSE SYMMETRIC KEY TestSymmetricKey;

-- Drop the symmetric key 
DROP SYMMETRIC KEY TestSymmetricKey;

-- Drop the certificate 
DROP CERTIFICATE TestCertificate;
