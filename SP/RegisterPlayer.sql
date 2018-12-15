CREATE PROCEDURE dbo.RegisterPlayer
(
	@name NVARCHAR(50)
)
AS
	INSERT INTO Player (name) VALUES (@name);
	DECLARE @playerId INT;
	SELECT @playerId = Player.id FROM Player WHERE name = @name;
	INSERT INTO PlayerJob (player, job, level) VALUES (@playerId, 'Farmer', 0);
	INSERT INTO PlayerJob (player, job, level) VALUES (@playerId, 'Trainer', 0);
	INSERT INTO PlayerJob (player, job, level) VALUES (@playerId, 'Sawyer', 0);
	INSERT INTO PlayerJob (player, job, level) VALUES (@playerId, 'Miner', 0);
RETURN