USE ShopDB;

-- 1.회원가입 저장 프로시저
CREATE PROC usp_AddUser
	@UserID NVARCHAR(25),
	@Password NVARCHAR(20),
	@UserName nvarchar(10),
	@Introducer NVARCHAR(25),
	@Postcode int,
	@Address nvarchar(50)
AS
	-- 이미 가입된 아이디라면
	DECLARE @Result INT
	SELECT @Result= COUNT(*) FROM Users
	WHERE UserId=@UserID

	IF @Result >0
		RETURN -1 -- -1이 반환되면 회원가입 불가
	ELSE
	BEGIN
		INSERT Users (UserID, Password, UserName, Introducer,Postcode, Address)
		VALUES (@UserID, @Password, @UserName, @Introducer,@Postcode, @Address)
		RETURN @@Identity
	END
GO

-- 2.로그인 저장 프로시저
CREATE PROC usp_LoginUser
	@UserID	VARCHAR(20),
	@Password VARCHAR(20)
AS
	-- ID와 암호가 일치하는지
	DECLARE @Result INT
	SELECT @Result=COUNT(*) FROM Users
	WHERE UserID=@UserID AND Password=@Password

	IF @Result>0
	BEGIN
		SELECT '1' -- 1이 반환되면 로그인 처리
	END
	ELSE
	BEGIN
		SELECT '-1' -- -1이 반환되면 로그인 불가
	END
GO

CREATE PROC usp_GetUsers
AS
	SELECT*FROM Users ORDER BY UID DESC
GO

DROP PROC usp_AddUser;


