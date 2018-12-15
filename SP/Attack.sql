CREATE PROCEDURE dbo.Attack (@clanId1 int, @clanId2 int) AS
BEGIN
    BEGIN TRANSACTION
    DECLARE @soldierCount1 int
    DECLARE @soldierCount2 int
    DECLARE @winnerId int = @clanId1
    DECLARE @loserId int = @clanId2

    SELECT @soldierCount1 = soldier FROM Clan WHERE id = @clanId1;
    SELECT @soldierCount2 = soldier FROM Clan WHERE id = @clanId2;

    DECLARE @winnerSoldier int = @soldierCount1
    DECLARE @loserSoldier int = @soldierCount2

    IF (@soldierCount2 > @soldierCount1) BEGIN
        SELECT @winnerId = @clanId2
        SELECT @loserId = @clanId1
        SELECT @winnerSoldier = @soldierCount2
        SELECT @loserSoldier = @soldierCount1
    END

    DECLARE @loserFood int
    DECLARE @loserGold int

    SELECT @loserFood=food, @loserGold=gold FROM Clan WHERE id = @loserId;

    UPDATE Clan
        SET food = food + @loserFood/10,
            gold = gold + @loserGold/10,
            soldier = soldier - @winnerSoldier/10 -- random between 20-30
        WHERE id = @winnerId;
    UPDATE Clan
        SET food = food - @loserFood/10,
            gold = gold - @loserGold/10,
            soldier = soldier - @loserSoldier/5 -- random between 10-20
        WHERE id = @loserId;


--     TODO: insert into war logs

    COMMIT

END