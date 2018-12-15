USE [ClanWars]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[CreateClan]
		@name = "test"          -- put the @name parameter value instead of '?' (nvarchar(100))

SELECT	'Return Value' = @return_value

GO

