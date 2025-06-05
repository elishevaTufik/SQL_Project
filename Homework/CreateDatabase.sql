CREATE DATABASE Employee_db
GO
------------------------------------------------------------------------------------

USE Employee_db

CREATE TABLE Employee_tbl
(
	EmpID varchar(10) primary key,
	LastName  varchar(10),
	FirstName  varchar(10),
	Zip  int,
	Phone  varchar(10),
	Address  varchar(10),
	City  varchar(10) --DEFAULT('ירושלים')
	--PRIMARY KEY(EmpID)
)
GO

CREATE TABLE Employee_pay_tbl
(
	EmpID varchar(10) references Employee_tbl,--(EmpID), מתייחס אוטומטית למפתח ראשי 
	Position smallint,
	DateHire date,
	PayRate  smallint,
	DateLastRaise  date,
	Salary smallint,
	Bonus smallint

	--CONSTRAINT PK_Employee_pay_tbl_EmpID_DateHire  primary key (EmpID, DateHire)
	primary key (EmpID, DateHire)
)
GO

CREATE TABLE Customer_tbl
(
	CustID smallint identity(1, 1) primary key,
	CustName  varchar(10),
	CustAddress  varchar(10),
	CustCity  varchar(10),
	CustPhone  varchar(10),
	CustFax  varchar(10),
	EmpID  varchar(10)  --references Employee_tbl

	CONSTRAINT FK_Customer_tbl_EmpID FOREIGN KEY(EmpID) REFERENCES Employee_tbl(EMPID)
	--FOREIGN KEY(EmpID) REFERENCES Employee_tbl
)
GO

CREATE TABLE Products_tbl
(
	ProdID smallint primary key,
	ProdDesc varchar(10),
	Cost money --CHECK(Cost BETWEEN 10 AND 40)

	--CONSTRAINT CK_Products_tbl_Cost CHECK(Cost BETWEEN 10 AND 40)
)
GO

CREATE TABLE Orders_tbl
(
	OrderNum smallint identity(1,1) primary key,
	CustID  smallint references Customer_tbl,
	ProdID  smallint references Products_tbl,-- NOT NULL,
	Qty  smallint,
	OrdDate  date
)
GO
------------------------------------------------------------------------------------

INSERT INTO Employee_tbl
VALUES ('301120514', 'כהן' , 'יוסף', 12345,'03-5174578', 'פוקסמן 12', 'תל אביב')
GO		 
	
INSERT INTO Employee_tbl
VALUES ('036974101', 'לוי' , 'dan', 85214,'02-6410258', 'קינג גורג', 'ירושלים')
GO	

INSERT INTO Employee_tbl
VALUES ('123456789', 'מנשה' , 'חיים', 11111,'', 'שושנים 2', 'גבעתיים')
GO	

INSERT INTO Employee_tbl
VALUES ('987654321', 'גרין' , 'AVi', 22222,'03-5721414', 'צבי 4', 'רמת גן')
GO	

INSERT INTO Employee_tbl
VALUES ('265432189', 'כהן' , 'ישי', 33333,'03-7661245', 'הירקון 1', 'תל אביב')
GO	

INSERT INTO Employee_tbl
VALUES ('654321987', 'חביב' , 'אהרן', 44444,'03-7677474', 'הגולן 1', 'תל אביב')
GO	

INSERT INTO Employee_tbl
VALUES ('123987456', 'פריד' , 'דוד', 55555,'02-5871245', 'מינץ 23', 'ירושלים')
GO	

INSERT INTO Employee_tbl
VALUES ('852147963', 'ברגר' , 'אורי', 66666,'03-5704512', 'הרצוג 12', 'בני ברק')
GO	
------------------------------------------------------------------------------------

INSERT INTO Employee_pay_tbl(EmpID, Position, DateHire, DateLastRaise, Salary, Bonus )
VALUES ('301120514', 1, '01/10/2010','01/01/2000',4000,300)
GO

INSERT INTO Employee_pay_tbl(EmpID, Position, DateHire, PayRate, DateLastRaise, Bonus)
VALUES ('036974101', 2, '01/05/2008', 1000, '01/01/2005',500)
GO

INSERT INTO Employee_pay_tbl(EmpID, Position, DateHire, DateLastRaise, Salary, Bonus )
VALUES ('123456789', 7, '01/11/2004','01/08/1988',5000,400)
GO

INSERT INTO Employee_pay_tbl(EmpID, Position, DateHire, DateLastRaise, Salary, Bonus )
VALUES ('987654321', 2, '01/01/2000','01/09/1995',1500,400)
GO

INSERT INTO Employee_pay_tbl(EmpID, Position, DateHire, PayRate, DateLastRaise, Bonus)
VALUES ('301120514', 1, '01/08/2010',3000, '01/07/2007',700)
GO

INSERT INTO Employee_pay_tbl(EmpID, Position, DateHire, DateLastRaise, Salary, Bonus )
VALUES ('654321987', 3, '01/03/2005','01/01/2000',12000,300)
GO	
------------------------------------------------------------------------------------
INSERT INTO Customer_tbl (CustName, CustAddress, CustCity, CustPhone, CustFax, EmpID)
VALUES('Dani', 'רבינו תם','בני ברק', '03-5555555' ,'03-5555555', '987654321')
GO

INSERT INTO Customer_tbl (CustName, CustAddress, CustCity, CustPhone, CustFax, EmpID)
VALUES('nati', 'הנרקיס','רמת גן', '03-5744444' ,'03-5745588', '036974101')
GO

INSERT INTO Customer_tbl (CustName, CustAddress, CustCity, CustPhone, EmpID)
VALUES('גדעון', 'חבצלת','הרצליה', '03-9875455', '301120514')
GO

INSERT INTO Customer_tbl (CustName, CustAddress, CustCity, CustPhone, EmpID)
VALUES('פנחס', 'הירקון','תל אביב', '03-9125121', '987654321')
GO

INSERT INTO Customer_tbl (CustName, CustAddress, CustCity, CustPhone)
VALUES('איתן', 'יפו','ירושלים', '03-5388888')
GO

INSERT INTO Customer_tbl (CustName, CustAddress, CustCity, CustPhone, CustFax, EmpID)
VALUES('בני', 'הפרחים','בני ברק', '03-6188888' ,'03-6666666', '301120514')
GO
--------------------------------------------------------------------

INSERT INTO Products_tbl (ProdID, ProdDesc, Cost)
VALUES(100, 'מחברת', 1.20) 
GO

INSERT INTO Products_tbl (ProdID, ProdDesc, Cost)
VALUES(101, 'דפדפת', 2.00) 
GO

INSERT INTO Products_tbl (ProdID, ProdDesc, Cost)
VALUES(102, 'קלסר קטן', 8.60) 
GO

INSERT INTO Products_tbl (ProdID, ProdDesc, Cost)
VALUES(103, 'מחדד', 1.10) 
GO
--------------------------------------------------------------------

INSERT INTO Orders_tbl (CustID, ProdID, Qty, OrdDate)
VALUES(4, 100, 5, '01/01/2009') 
GO

INSERT INTO Orders_tbl (CustID, ProdID, Qty, OrdDate)
VALUES(3, 101, 10, '01/01/2004') 
GO

INSERT INTO Orders_tbl (CustID, ProdID, Qty, OrdDate)
VALUES(6, 100, 13, '01/01/2010') 
GO
--------------------------------------------------------------------

