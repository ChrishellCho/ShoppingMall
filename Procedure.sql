CREATE PROCEDURE usp_SigninUsers
	@UserID NVARCHAR(25),
	@Password NVARCHAR(20),
	@UserName nvarchar(10),
	@Introducer NVARCHAR(25),
	@Address nvarchar(50)
AS
	INSERT INTO dbo.Users VALUES (@UserID, @Password, @UserName, @Introducer);


