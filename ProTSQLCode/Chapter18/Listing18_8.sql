-- Listing 18-8

--1. Using THROW without paramaters

        BEGIN TRY
	INSERT INTO Person.Address (AddressID)
	VALUES (1);
     END TRY
     BEGIN CATCH
	PRINT 'This is an error'; 
	THROW
     END CATCH ;

--2. Using THROW with parameters

  THROW 52000,  'This is also an error',  1

     BEGIN TRY	
        INSERT INTO Person.Address (AddressID)
	VALUES (1);
	END TRY
     BEGIN CATCH
	 THROW
     END CATCH
