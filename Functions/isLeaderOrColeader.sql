CREATE FUNCTION isLeaderOrColeader(@playerId INT) RETURNS bit
AS
BEGIN
  DECLARE @role as varchar(50);
  SELECT @role = role FROM PlayerClanRoleJob WHERE player = @playerId
  IF (@role = 'Leader' OR @role = 'Coleader')
    BEGIN
      RETURN 1
    END
  RETURN 0
END

CREATE FUNCTION isLeader(@playerId INT) RETURNS bit
AS
BEGIN
  DECLARE @role as varchar(50);
  SELECT @role = role FROM PlayerClanRoleJob WHERE player = @playerId
  IF (@role = 'Leader')
    BEGIN
      RETURN 1
    END
  RETURN 0
END