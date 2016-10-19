-- Listing 19-19

use Adventureworks2014
go
CREATE TABLE [dbo].[waitsdemo](
	[Id] [int] NOT NULL,
	[LastName] [nchar](600) NOT NULL,
	[FirstName] [nchar](600) NOT NULL,
	[MiddleName] [nchar](600) NULL
) ON [PRIMARY]

GO

declare @id int = 1
while (@id <= 50000)
begin
	insert into waitsdemo 
		select @id,'Foo', 'User',NULL
	SET @id = @id + 1
end
