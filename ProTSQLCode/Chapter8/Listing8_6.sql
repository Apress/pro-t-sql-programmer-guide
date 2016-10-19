-- Listing 8-6

BACKUP CERTIFICATE TestCertificate 
  TO FILE = 'c:\CH08\TestCertificate.CER' 
  WITH PRIVATE KEY 
  (
    FILE = 'c:\CH08\TestCertificate.PVK',
    ENCRYPTION BY PASSWORD = ' 7&rtOxp2',
    DECRYPTION BY PASSWORD = 'p@$$wOrd' 
  );



