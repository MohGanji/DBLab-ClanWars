CREATE FUNCTION getClanLevel(@clanId INT)
RETURNS INT
AS
BEGIN
	DECLARE @ret as INT
	SELECT @ret = dbo.getClanExp(@clanId) / 100
	RETURN @ret
END
