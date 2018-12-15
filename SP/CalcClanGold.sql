CREATE PROCEDURE dbo.CalcClanGold (@clanId int) AS
BEGIN
    DECLARE @sumMinerLevel int

    SELECT @sumMinerLevel = dbo.getClanJobLevelSum(@clanId, 'Miner')

    UPDATE Clan SET gold = gold + @sumMinerLevel * 20 WHERE id = @clanId
END