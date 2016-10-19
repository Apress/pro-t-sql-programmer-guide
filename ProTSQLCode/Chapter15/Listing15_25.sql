-- Listing 15-25

exec sp_executesql N'insert [Person].[BusinessEntity]([rowguid], [ModifiedDate])
values (@0, @1)
select [BusinessEntityID]
from [Person].[BusinessEntity]
where @@ROWCOUNT > 0 and [BusinessEntityID] = scope_identity()',N'@0 uniqueidentifier,@1 datetime2(7)',@0='92EEC64E-BD11-4936-97C3-6528B5D1D97D',@1='2012-05-21 15:14:05.3493966'
