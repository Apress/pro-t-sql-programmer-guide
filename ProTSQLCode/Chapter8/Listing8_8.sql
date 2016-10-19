-- Listing 8-8

-- Create a DMK
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'P@55w0rd';
-- Create a certificate
CREATE CERTIFICATE TestCertificate
WITH SUBJECT = 'Adventureworks Test Certificate',
EXPIRY_DATE = '2026-10-31';
-- Create message
DECLARE @message nvarchar(4000) = N'Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.
Now we are engaged in a great civil war, testing whether that nation, or any nation, so conceived and so dedicated, can long endure. We are met on a great battle-field of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this. ';
-- Sign the message by certificate
SELECT SignByCert(Cert_ID(N'TestCertificate'), @message);
-- Drop the certificate
DROP CERTIFICATE TestCertificate;
-- Drop the DMK DROP MASTER KEY;
