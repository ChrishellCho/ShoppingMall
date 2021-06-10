USE ShopDB
Go

--회원 테이블 설계
CREATE TABLE dbo.Users(
 UID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
 UserID varchar(20)  NOT NULL,
 Password varchar(20) NOT NULL,
 UserName nvarchar(25) NOT NULL,
 Introducer varchar(10) ,
 Postcode int NOT NULL,
 Address varchar(50) NOT NULL,
 )

INSERT INTO Users VALUES ('jin','1234','조예진','tae',16690,'경기도 수원시');
SELECT * FROM Users;

DROP TABLE DBO.Users;


--카테고리 테이블
CREATE TABLE goods_category(
	cateName nvarchar(20) not null,
	cateCode varchar(30) not null,
	cateCodeRef varchar(30),
	primary key(cateCode),
	foreign key (cateCodeRef) references goods_category (cateCode)
);

INSERT INTO goods_category (cateName, cateCode) values ('카테고리1', '100');
insert into goods_category values ('카테고리1-1','101','100');

INSERT INTO goods_category (cateName, cateCode) values ('카테고리2', '200');
insert into goods_category values ('카테고리2-1','202','200');
insert into goods_category values ('카테고리2-2','203','200');

SELECT * FROM goods_category;

DROP TABLE goods_category;
