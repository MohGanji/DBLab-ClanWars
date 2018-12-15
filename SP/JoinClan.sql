CREATE PROCEDURE dbo.JoinClan
(
	@clanId INT,
	@playerId INT,
  @job VARCHAR(50)
)
AS
	UPDATE Player SET clan = @clanId WHERE id = @playerId;
  INSERT INTO PlayerClanRoleJob VALUES (@playerId, @clanId, 'Member', @job)
RETURN

