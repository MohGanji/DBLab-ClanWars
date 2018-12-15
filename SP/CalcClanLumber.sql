CREATE PROCEDURE dbo.CalcClanLumber (@clanId int) AS
BEGIN
    DECLARE @sumSawyerLevel int
    DECLARE @resource int
    DECLARE @goldCount int

    SELECT @sumSawyerLevel = dbo.getClanJobLevelSum(@clanId, 'Sawyer')

    SELECT @resource = @sumSawyerLevel * 10

    SELECT @goldCount = gold FROM Clan where id = @clanId
    if (@goldCount < @resource) BEGIN
      SELECT @resource = @goldCount
    END

    UPDATE Clan SET gold = gold - @resource, lumber = lumber + @resource WHERE id = @clanId
END