CREATE PROCEDURE dbo.CreateClan
(
	@name NVARCHAR(50)
)
AS
	INSERT INTO Clan (name) VALUES (@name);
	DECLARE @clanId INT;
	SELECT @clanId = Clan.id FROM Clan WHERE name = @name;
	INSERT INTO ClanBuilding (clan, building, count, percentage, is_under_upgrade) VALUES (@clanId, 'Farm', 0, 0, 0);
	INSERT INTO ClanBuilding (clan, building, count, percentage, is_under_upgrade) VALUES (@clanId, 'Barrack', 0, 0, 0);
RETURN