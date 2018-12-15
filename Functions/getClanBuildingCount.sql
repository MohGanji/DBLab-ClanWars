CREATE FUNCTION getClanBuildingCount(@clanId INT, @building VARCHAR(50)) RETURNS INT
AS
BEGIN
  DECLARE @buildingCount  AS INT
  SELECT @buildingCount = ClanBuilding.count FROM ClanBuilding WHERE clan = @clanId AND building = @building
  RETURN @buildingCount
END
