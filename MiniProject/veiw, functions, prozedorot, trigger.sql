

--====--
--View--
--====--

CREATE VIEW FlyFullDetails
AS
	SELECT fl.FlyID,plain.PlainID,co.CompName,pl.PlaceName,fl.FlyDate, pa.FirstName,pa.LastName,pa.PassPhone
	FROM Flies_tbl fl 
	left join Places_tbl pl
	on fl.PlaceID=pl.PlaceID 
	join Tickets_tbl t
	on fl.FlyID=t.FlyID
	join Passenger_tbl pa 
	on pa.PassID=t.PassID 
	join Plains_tbl plain 
	on plain.PlainID=fl.PlainID
	join Companies_tbl co
	on co.CompID=plain.CompID
GO



CREATE VIEW CheckCostFly
AS
	SELECT f1.CostCard, f1.FlyID
	FROM Flies_tbl f1 join Flies_tbl f2
	on f1.FlyID=f2.FlyID
	where f1.CostCard= f2.CostCard
GO

--=========--
--PROCEDURE--
--=========--

--הפורצדורה מקבלת יעד ומחזירה פרטים על טיסות אפשריות
CREATE PROCEDURE ProcPlaces (@place varchar(10)) 
AS
	SELECT *
	FROM Flies_tbl
	WHERE PlaceID in (SELECT PlaceID
					 FROM Places_tbl
				 	 WHERE  PlaceName = @place
					 )
GO

EXEC ProcPlaces 'הולנד'
GO

EXEC ProcPlaces 'ניו יורק'
GO

select *
from Flies_tbl

---
CREATE PROCEDURE FlyCost (@cost money) 

AS
		SELECT *, 
			CASE 
				WHEN @cost< 1000 THEN 'נמוך'
				WHEN @cost<= 1000 THEN 'בינוני'
				ELSE 'גבוה'
			END 
		FROM Flies_tbl
		WHERE CostCard=@cost
GO

EXEC FlyCost 900
GO

EXEC FlyCost 9500
GO

EXEC FlyCost 1000
GO

--=========--
--FUNCTIONS--
--=========--

--1
--הפונקציה מקבלת קוד יעד ומחזירה את ממוצע מחיר הכרטיסים ליעד זה
CREATE FUNCTION AvgCostCard1(@PlaceId int)
RETURNS float 
AS
	BEGIN
		DECLARE @AvgCostCard float
			SELECT @AvgCostCard = Avg(f1.CostCard) 
			FROM Flies_tbl f1 join Flies_tbl f2
			ON F1.PlaceID = F1.PlaceID
			WHERE f1.PlaceID=@PlaceId
			GROUP BY f1.PlaceID
		RETURN  @AvgCostCard
	END
GO

PRINT dbo.AvgCostCard1(3)

PRINT dbo.AvgCostCard1(1)

--2
--הפונקציה מקבלת שנה ומחזירה את מספר הטיסות לכל יעד שהיו בה
CREATE FUNCTION CheckNumFliesInYear(@year int) 
RETURNS TABLE 
AS
		RETURN (SELECT f.PlaceID,p.PlaceName, COUNT(*) AS CountFlies
 				FROM Flies_tbl f join Places_tbl p
				ON f.PlaceID = p.PlaceID
  				WHERE Year(FlyDate) = @year
				GROUP BY f.PlaceID, p.PlaceName)
GO

SELECT * 
FROM CheckNumFliesInYear(2023)
WHERE CountFlies>=1

--=========--
---TRIGGER---
--=========--

CREATE TRIGGER AddPlaces ON Plains_tbl 

FOR UPDATE
	AS
	BEGIN
		IF UPDATE(NumOfSeats) 
			BEGIN
				PRINT 'נוספו מושבים'
				DECLARE @oldSeats int
				DECLARE @newSeats int
				SELECT @oldSeats = NumOfSeats FROM deleted
				SELECT @newSeats = NumOfSeats FROM inserted 
				IF @oldSeats > 600
					ROLLBACK
			END
	END

UPDATE Plains_tbl SET NumOfSeats = NumOfSeats+10
