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

INSERT INTO Users VALUES ('jin','1234','������','tae',16690,'��⵵ ������');
SELECT * FROM Users;	

DROP TABLE DBO.Users;


--ī�װ� ���̺�
CREATE TABLE Pro_Category(
	cateName nvarchar(20) not null,
	cateCode varchar(30) not null,
	cateCodeRef varchar(30),
	primary key(cateCode),
	foreign key (cateCodeRef) references Pro_Category (cateCode)
);

INSERT INTO Pro_Category (cateName, cateCode) values ('ī�װ�1', '100');
insert into Pro_Category values ('ī�װ�1-1','101','100');

INSERT INTO Pro_Category (cateName, cateCode) values ('ī�װ�2', '200');
insert into Pro_Category values ('ī�װ�2-1','202','200');
insert into Pro_Category values ('ī�װ�2-2','203','200');

SELECT * FROM Pro_Category;

DROP TABLE Pro_Category;



--��ǰ ���̺�
CREATE TABLE Products
(
	