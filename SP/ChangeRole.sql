CREATE PROCEDURE dbo.ChangeRole
(
	@actorId INT,
	@playerId INT,
	@newRole VARCHAR(50)
)
AS
  DECLARE @isLeader AS BIT
  DECLARE @isInClan AS BIT
  DECLARE @playerClan AS INT
  SELECT @isLeader = dbo.isLeader(@actorId)
  IF(@isLeader = 0) RETURN
  SELECT @playerClan = dbo.getPlayerClanId(@actorId)
  SELECT @isInClan = dbo.playerIsInClan(@playerId, @playerClan)
  IF(@isInClan = 0) RETURN
  UPDATE PlayerClanRoleJob SET role = @newRole WHERE player = @playerId;
RETURN