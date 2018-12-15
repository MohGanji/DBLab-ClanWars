CREATE PROCEDURE dbo.CalcBuildingProgress (@clanId int) AS
BEGIN
    DECLARE @sawyerCount int
    DECLARE @resource int
    SELECT @sawyerCount = dbo.getClanJobCount(@clanId, 'Sawyer')
    SELECT @resource = Case When gold < lumber Then gold Else lumber End FROM Clan where id = @clanId
    if (@resource < @sawyerCount * 25) BEGIN
      SELECT @sawyerCount = @resource / 25
    END
    DECLARE @buildingPercentage int
    SELECT @buildingPercentage = percentage FROM ClanBuilding WHERE clan = @clanId AND is_under_upgrade = 1

    IF (@buildingPercentage >= 100 - @sawyerCount) BEGIN
      UPDATE ClanBuilding SET percentage = 100 - percentage + @sawyerCount, count = count + 1 WHERE clan = @clanId AND is_under_upgrade = 1
    end
    ELSE BEGIN
      UPDATE ClanBuilding SET percentage = percentage + @sawyerCount WHERE clan = @clanId AND is_under_upgrade = 1
    END
    --  make it a function
    UPDATE Clan SET lumber = lumber - @sawyerCount * 25, gold = gold - @sawyerCount * 25 WHERE id = @clanId
END