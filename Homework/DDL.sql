--1
CREATE DATABASE SHOPPING_326354982

USE SHOPPING_326354982

CREATE TABLE Customers
(
custID smallint PRIMARY KEY IDENTITY (1,1),
FirstName VARCHAR(12),
LastName VARCHAR(12),
Street VARCHAR(12),
Hnum smallint,
City VARCHAR(12)
)
GO

CREATE INDEX CI_INDEX
ON Customers(City)

CREATE TABLE PRODUCTS
(
ProdID smallint PRIMARY KEY IDENTITY (10,1),
ProdName VARCHAR(12),
Cost smallint
)
GO
CREATE INDEX PI_INDEX
ON PRODUCTS(ProdName)

CREATE TABLE SaleTypes
(
STID smallint PRIMARY KEY,
STType VARCHAR(12), 
)
GO

CREATE TABLE SaleTbl
(
SaleID smallint PRIMARY KEY IDENTITY (100,1),
ProdID smallint REFERENCES PRODUCTS,
SaleType smallint REFERENCES SaleTypes,
SaleAmount smallint
)
GO

CREATE TABLE ShopTbl
(
ShopID smallint PRIMARY KEY IDENTITY (50,1),
custID smallint REFERENCES Customers,
ShopDate date default getdate()
)
GO

CREATE TABLE ProdShop 
(
PSID smallint PRIMARY KEY IDENTITY (1,1),
ShopID smallint REFERENCES ShopTbl,
ProdID smallint REFERENCES PRODUCTS,
QTY smallint
)
GO
--2
ALTER TABLE SaleTbl
ADD FromDate DATETIME,
    LastDate DATETIME
--3
ALTER TABLE Customers
ALTER COLUMN Street VARCHAR(17)
--4
UPDATE Customers
SET Street = (Street+' '+ CAST (Hnum AS VARCHAR))
ALTER TABLE Customers
DROP COLUMN Hnum
--5
SP_RENAME 'Customers.Street', 'FullAddress', 'COLUMN'
--6
ALTER TABLE ProdShop
ADD CONSTRAINT pq_ProdShop_qty CHECK(qty>0)

ALTER TABLE SaleTbl
ADD CONSTRAINT ss_SaleTbl_SaleAmount CHECK(SaleAmount>0)
--7
ALTER TABLE shopTbl
ADD CONSTRAINT sd_shopTbl_ShopDate CHECK(ShopDate<=getdate())