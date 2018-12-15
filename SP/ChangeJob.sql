CREATE PROCEDURE dbo.ChangeJob
(
	@userId INT,
	@newJob VARCHAR(50)
)
AS
	UPDATE PlayerClanRoleJob SET job = @newJob WHERE player = @userId;
RETURN