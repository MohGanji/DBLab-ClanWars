CREATE PROCEDURE dbo.ChangeClanMotto
(
    @playerId INT,
	@clanId INT,
	@newMotto NVARCHAR(50)
)
AS
    -- isLeader(@playerId)
	UPDATE Clan SET motto = @newMotto WHERE id = @clanId;
RETURN