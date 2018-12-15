USE [ClanWars]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[getClanExp]
		@clanId = :_clanId                   -- put the @clanId parameter value instead of '?' (int)

SELECT	'Return Value' = @return_value

GO

