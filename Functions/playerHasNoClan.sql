CREATE FUNCTION playerHasNoClan(@playerId INT) RETURNS bit
AS
BEGIN
  DECLARE @playerClan as varchar(50);
  SELECT @playerClan = clan FROM Player WHERE id = @playerId
  IF (@playerClan IS NULL)
    BEGIN
      RETURN 1
    END
  RETURN 0
END