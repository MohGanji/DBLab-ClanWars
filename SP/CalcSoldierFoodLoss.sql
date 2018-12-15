CREATE PROCEDURE dbo.CalcSoldierFoodLoss (@clanId int) AS
BEGIN
    DECLARE @soldierCount INT
    DECLARE @foodCount INT
    DECLARE @hungrySoldiers INT

    SELECT @soldierCount = soldier, @foodCount = food FROM Clan WHERE id = @clanId;
    SELECT @hungrySoldiers = @soldierCount / 10

    IF (@hungrySoldiers >= @foodCount) BEGIN
      UPDATE Clan SET food = 0, soldier = soldier - @hungrySoldiers + @foodCount WHERE id = @clanId
    end
    ELSE BEGIN
      UPDATE Clan SET food = food - @hungrySoldiers WHERE id = @clanId
    END
END