CREATE PROCEDURE dbo.RemovePlayerFromClan
(
    @actorId INT,
    @playerId INT,
	  @clanId INT
)
AS
    DECLARE @hasPermission AS BIT
    SELECT @hasPermission = dbo.isLeaderOrColeader(@actorId)
    IF (@hasPermission = 0) RETURN
    SELECT @hasPermission = dbo.playerIsInClan(@playerId, @clanId)
    IF (@hasPermission = 0) RETURN
	  UPDATE Player SET clan = NULL WHERE id = @playerId;
    DELETE FROM PlayerClanRoleJob WHERE player = @playerId AND clan = @clanId
RETURN