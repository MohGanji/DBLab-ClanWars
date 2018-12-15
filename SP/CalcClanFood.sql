CREATE PROCEDURE dbo.CalcClanFood (@clanId int) AS
BEGIN
    DECLARE @sumFarmerLevel int
    DECLARE @farmCount int

    SELECT @sumFarmerLevel = dbo.getClanJobLevelSum(@clanId, 'Farmer')
    SELECT @farmCount = dbo.getClanBuildingCount(@clanId, 'Farm')

    UPDATE Clan SET food = food + @sumFarmerLevel * @farmCount WHERE id = @clanId
END