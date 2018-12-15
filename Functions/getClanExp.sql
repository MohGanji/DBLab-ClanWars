CREATE FUNCTION getClanExp(@clanId INT)
RETURNS INT
AS
BEGIN
	DECLARE @ret as INT
	SELECT @ret =(
		SELECT SUM(WarLog.experience) FROM WarLog WHERE WarLog.clan = @clanId
	)
	RETURN @ret
END
