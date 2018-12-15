CREATE PROCEDURE dbo.CalcNextCycle AS
BEGIN
    DECLARE @clanId INT
    BEGIN TRANSACTION
      DECLARE clanCur CURSOR LOCAL FOR SELECT id FROM dbo.Clan
      OPEN clanCur
        FETCH NEXT FROM clanCur INTO @clanId
        WHILE @@FETCH_STATUS = 0 BEGIN
            dbo.CalcBuildingProgress @clanId = @clanId;
            dbo.CalcClanGold @clanId = @clanId;
            dbo.CalcClanLumber @clanId = @clanId;
            dbo.CalcClanFood @clanId = @clanId;
            dbo.CalcSoldierFoodLoss @clanId = @clanId;

            dbo.CalcPlayerJobProgress @clanId = @clanId;
        END
      CLOSE clanCur
    COMMIT
END
GO