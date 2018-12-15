CREATE FUNCTION getClanJobLevelSum(@clanId INT, @job VARCHAR(50)) RETURNS INT
AS
BEGIN
  DECLARE @sumMinerLevel  AS INT
  SELECT @sumMinerLevel = SUM(PlayerJob.level) FROM PlayerJob, PlayerClanRoleJob
        WHERE PlayerJob.job = @job AND
              PlayerJob.player = PlayerClanRoleJob.player AND
              PlayerClanRoleJob.clan = @clanId AND
              PlayerClanRoleJob.job = @job;
  RETURN @sumMinerLevel
END
