
--Create DataBase

CREATE DATABASE Flies_db
GO
------------------------------------------------------------------------------------

USE Flies_db

CREATE TABLE Companies_tbl
(
	CompID smallint identity(200, 1) primary key,
	CompName  varchar(10),
)
GO

CREATE TABLE Plains_tbl
(
	PlainID  smallint identity(100, 1)  primary key,
	CompID smallint references Companies_tbl,
	NumOfSeats int,
)
GO

CREATE TABLE Places_tbl
(
	PlaceID smallint identity(1, 1) primary key,
	PlaceName  varchar(10),
)
GO

CREATE TABLE Flies_tbl
(
	FlyID smallint identity(50, 1) primary key,
	PlainID smallint references Plains_tbl,
	PlaceID smallint references Places_tbl,
	CostCard money DEFAULT(1200),
	FlyDate date not null,
	CuntFlyID smallint,
)
GO


CREATE TABLE Passenger_tbl
(
	PassID int primary key identity(1000,1),
	FirstName  varchar(10) not null,
	LastName  varchar(10),
	PassPhone  varchar(10),
)
GO

CREATE TABLE Tickets_tbl
(
	TicketID smallint identity(250, 1) primary key,
	FlyID smallint references Flies_tbl,
	PassID int references Passenger_tbl,
	TicketDate date,
	SeatNum int,
)
GO


--------------------------------------------------------------

INSERT INTO [dbo].[Companies_tbl]
VALUES ('אל על')
GO	

INSERT INTO Companies_tbl
VALUES ('אקספרס')
GO	

INSERT INTO [dbo].[Companies_tbl]
VALUES ('מטוסי אנט')
GO	

INSERT INTO [dbo].[Companies_tbl]
VALUES ('טיסות')
GO	

INSERT INTO [dbo].[Companies_tbl]
VALUES ('שמיר באויר')
GO	

--

INSERT INTO [dbo].[Plains_tbl]
VALUES (200,500)
GO

INSERT INTO [dbo].[Plains_tbl]
VALUES (206,550)
GO

INSERT INTO [dbo].[Plains_tbl]
VALUES (208,600)
GO

INSERT INTO [dbo].[Plains_tbl]
VALUES (204,250)
GO

INSERT INTO [dbo].[Plains_tbl]
VALUES (204,500)
GO

---

INSERT INTO [dbo].[Places_tbl]
VALUES ('ניו יורק')
GO

INSERT INTO [dbo].[Places_tbl]
VALUES ('הולנד')
GO

INSERT INTO [dbo].[Places_tbl]
VALUES ('אוסטרליה')
GO

INSERT INTO [dbo].[Places_tbl]
VALUES ('בנגקוק')
GO

INSERT INTO [dbo].[Places_tbl]
VALUES ('אילת')
GO

--

INSERT INTO [dbo].[Flies_tbl]
VALUES (100, 1, '01/01/2022', 70, 9500)
GO

INSERT INTO [dbo].[Flies_tbl]
VALUES (101, 2, '02/02/2022', 80, 1000)
GO

INSERT INTO [dbo].[Flies_tbl]
VALUES (102,3, '03/03/2022', 93, 1500)
GO

INSERT INTO [dbo].[Flies_tbl]
VALUES (103, 4, '04/04/2022', 40, 2200)
GO

INSERT INTO [dbo].[Flies_tbl]
VALUES (104, 5, '05/05/2022', 50, 900)
GO

INSERT INTO [dbo].[Flies_tbl]
VALUES (104, 5, '05/02/2023', 98, 1500)
GO

--

INSERT INTO [dbo].[Passenger_tbl]
VALUES ( 'רותה','רותוביץ','0558558588')
GO


INSERT INTO [dbo].[Passenger_tbl]
VALUES ( 'זלפה','זילפפוביץ','0555898388')
GO


INSERT INTO [dbo].[Passenger_tbl]
VALUES ( 'שימרית','שימרתוביץ','0554158588')
GO


INSERT INTO [dbo].[Passenger_tbl]
VALUES ( 'תרצה','תרצתוביץ','055555325')
GO


INSERT INTO [dbo].[Passenger_tbl]
VALUES ( 'כרמלה','כרמלוביץ','0567258588')
GO

--
INSERT INTO [dbo].[Tickets_tbl]
VALUES (50,1000,'01/01/2021',270)
GO

INSERT INTO [dbo].[Tickets_tbl]
VALUES (51,1001,'02/02/2021',1)
GO

INSERT INTO [dbo].[Tickets_tbl]
VALUES (52,1002,'03/03/2021',98)
GO

INSERT INTO [dbo].[Tickets_tbl]
VALUES (53,1003,'04/04/2021',null)
GO

INSERT INTO [dbo].[Tickets_tbl]
VALUES (54,1004,'05/05/2021',102)
GO



