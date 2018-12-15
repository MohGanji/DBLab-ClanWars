CREATE PROCEDURE dbo.CalcClanSolider (@clanId int) AS
BEGIN
    DECLARE @sumTrainerLevel int
    DECLARE @resource int
    DECLARE @goldCount int

    SELECT @sumTrainerLevel = dbo.getClanJobLevelSum(@clanId, 'Trainer')

    SELECT @resource = @sumTrainerLevel * 10

    SELECT @goldCount = gold FROM Clan where id = @clanId
    if (@goldCount < @resource * 5) BEGIN
      SELECT @resource = @goldCount / 5
    END

    UPDATE Clan SET gold = gold - @resource * 5, soldier = soldier + @resource WHERE id = @clanId
END