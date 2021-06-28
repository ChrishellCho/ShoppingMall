USE ShopDB;
GO

-- 1.ȸ������ ���� ���ν���
CREATE PROC usp_AddUser
	@UserID NVARCHAR(25),
	@Password NVARCHAR(20),
	@UserName nvarchar(10),
	@Introducer NVARCHAR(25),
	@Postcode int,
	@Address nvarchar(50)
AS
	-- �̹� ���Ե� ���̵���
	DECLARE @Result INT
	SELECT @Result= COUNT(*) FROM Users
	WHERE UserId=@UserID

	IF @Result >0
		RETURN -1 -- -1�� ��ȯ�Ǹ� ȸ������ �Ұ�
	ELSE
	BEGIN
		INSERT Users (UserID, Password, UserName, Introducer,Postcode, Address)
		VALUES (@UserID, @Password, @UserName, @Introducer,@Postcode, @Address)
		RETURN @@Identity
	END
GO

-- 2.�α��� ���� ���ν���
CREATE PROC usp_LoginUser
	@UserID	VARCHAR(20),
	@Password VARCHAR(20)
AS
	-- ID�� ��ȣ�� ��ġ�ϴ���
	DECLARE @Result INT
	SELECT @Result=COUNT(*) FROM Users
	WHERE UserID=@UserID AND Password=@Password

	IF @Result>0
	BEGIN
		SELECT '1' -- 1�� ��ȯ�Ǹ� �α��� ó��
	END
	ELSE
	BEGIN
		SELECT '-1' -- -1�� ��ȯ�Ǹ� �α��� �Ұ�
	END
GO

CREATE PROC usp_GetUsers
AS
	SELECT*FROM Users ORDER BY UID DESC
GO

DROP PROC usp_AddUser;


