CREATE FUNCTION getPlayerClanId(@playerId INT) RETURNS INT
AS
BEGIN
  DECLARE @clanId AS INT
  SELECT @clanId = clan FROM Player WHERE id = @playerId
  RETURN @clanId
END