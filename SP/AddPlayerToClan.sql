CREATE PROCEDURE dbo.AddPlayerToClan
(
    @actorId INT,
    @playerId INT,
    @clanId INT,
    @job VARCHAR(50)
)
AS
    DECLARE @hasPermission AS BIT
    SELECT @hasPermission = dbo.isLeaderOrColeader(@actorId)
    IF (@hasPermission = 0) RETURN
    SELECT @hasPermission = dbo.playerHasNoClan(@playerId)
    IF (@hasPermission = 0) RETURN
	  UPDATE Player SET clan = @clanId WHERE id = @playerId;
  	INSERT INTO PlayerClanRoleJob VALUES (@playerId, @clanId, 'Member', @job)
RETURN
go

