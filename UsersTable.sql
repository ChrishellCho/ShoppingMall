USE ShopDB
Go

--ȸ�� ���̺� ����
CREATE TABLE dbo.Users(
 UID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
 UserID varchar(20)  NOT NULL,
 Password varchar(20) NOT NULL,
 UserName nvarchar(25) NOT NULL,
 Introducer varchar(10) ,
 Postcode int NOT NULL,
 Address varchar(50) NOT NULL,
 )

INSERT INTO Users VALUES ('jin','1234','������','tae','��⵵ ������');
SELECT * FROM Users;

DROP TABLE DBO.Users;