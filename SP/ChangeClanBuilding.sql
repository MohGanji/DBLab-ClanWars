CREATE PROCEDURE dbo.ChangeClanBuilding
(
	@playerId INT,
	@newBuilding VARCHAR(50)
)
AS
	DECLARE @hasPermission AS BIT
	DECLARE @clanId AS INT
	SELECT @hasPermission = dbo.isLeaderOrColeader(@playerId)
	IF (@hasPermission = 0) RETURN
	SELECT @clanId = dbo.getPlayerClanId(@playerId)
	UPDATE ClanBuilding SET is_under_upgrade = 0 WHERE clan = @clanId and is_under_upgrade = 1;
	UPDATE ClanBuilding SET is_under_upgrade = 1 WHERE clan = @clanId and building = @newBuilding;
RETURN
