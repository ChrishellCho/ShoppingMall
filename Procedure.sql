USE ShopDB;

-- 회원가입 저장 프로시저
CREATE PROCEDURE usp_AddUsers
	@UserID NVARCHAR(25),
	@Password NVARCHAR(20),
	@UserName nvarchar(10),
	@Introducer NVARCHAR(25),
	@Address nvarchar(50)
AS
	DECLARE @Result INT
	SELECT @Result= COUNT(*) FROM Users
	WHERE UserId=@UserID

	IF @Result >0
	RETURN -1
	ELSE
	BEGIN
		INSERT Users (UserID, Password, UserName, Introducer, Address)
		VALUES (@UserID, @Password, @UserName, @Introducer, @Address)
		RETURN @@Identity
	END
GO



