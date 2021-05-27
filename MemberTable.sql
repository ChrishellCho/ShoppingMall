USE ShopDB
Go
CREATE TABLE [dbo].[Member](
 [UserId] [varchar](10)  NOT NULL,
 [Password] [varchar](10) NOT NULL,
 [Name] [nvarchar](10) NOT NULL,
 [Introducer] [varchar](10) ,
 [Address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED
(
 [UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO Member VALUES ('jin','1234','조예진','tae','경기도 수원시');
SELECT * FROM Member;
