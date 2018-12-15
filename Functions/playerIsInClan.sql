CREATE FUNCTION playerIsInClan(
  @playerId INT,
  @clanId INT
  ) RETURNS int
  BEGIN
    DECLARE @is as varchar(50);
    SELECT @is = count(*) FROM Player WHERE id = @playerId AND clan = @clanId
    IF (@is = 1) RETURN 1
    RETURN 0
END
