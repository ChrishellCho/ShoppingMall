USE ShopDB
Go

--회원 테이블 설계
CREATE TABLE dbo.Users(
 UID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
 UserID varchar(20)  NOT NULL,
 Password varchar(20) NOT NULL,
 UserName nvarchar(25) NOT NULL,
 Introducer varchar(10) ,
 Address varchar(50) NOT NULL,
 )

INSERT INTO Users VALUES ('jin','1234','조예진','tae','경기도 수원시');
SELECT * FROM Users;

DROP TABLE DBO.Users;