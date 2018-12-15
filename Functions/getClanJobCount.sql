CREATE FUNCTION getClanJobCount(@clanId INT, @job VARCHAR(50)) RETURNS INT
AS
BEGIN
  DECLARE @count AS INT
  SELECT @count = count(*) FROM PlayerClanRoleJob WHERE clan = @clanId AND job =@job
  RETURN @count
END
