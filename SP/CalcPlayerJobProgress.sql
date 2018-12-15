CREATE PROCEDURE dbo.CalcPlayerJobProgress (@clanId int) AS
BEGIN
    DECLARE @playerId INT
    DECLARE @playerExp INT
    DECLARE @job VARCHAR(50)
    BEGIN TRANSACTION
      DECLARE playerCur CURSOR LOCAL FOR SELECT id FROM dbo.Player WHERE clan = @clanId
      OPEN playerCur
        FETCH NEXT FROM playerCur INTO @clanId
        WHILE @@FETCH_STATUS = 0 BEGIN
            SELECT @job = PlayerJob.job ,@playerExp = PlayerJob.exp FROM dbo.PlayerJob, dbo.PlayerClanRoleJob
              WHERE PlayerJob.player = @playerId AND
                    PlayerJob.player = PlayerClanRoleJob.player AND
                    PlayerJob.job = PlayerClanRoleJob.job AND
                    PlayerClanRoleJob.clan = @clanId;

            IF (@playerExp = 90) BEGIN
              UPDATE PlayerJob SET exp = 0, level = level + 1 WHERE player = @playerId AND job = @job
            end
            ELSE BEGIN
              UPDATE PlayerJob SET exp = exp + 10 WHERE player = @playerId AND job = @job
            END
        END
      CLOSE playerCur
    COMMIT
END