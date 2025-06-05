--1.
DECLARE @FNum varchar (10)='Rivky',@LNum varchar (10)='Dayan'
PRINT @FNum+' '+@lNum

--2.
DECLARE @ELNum varchar (20)= (SELECT LastName FROM Employee_tbl WHERE EmpID=987654321 )
PRINT @ElNum

--3.
DECLARE @NUM INT=6
IF(@NUM % 2=0)
PRINT 'זוגי'
ELSE 
PRINT 'אי זוגי'

--4.
DECLARE @hodaa varchar (25)='The time now is:', @time time=getdate()
PRINT @hodaa+' '+cast(@time as varchar(20))

--5.
DECLARE @nameprod varchar(10) = 
(SELECT ProdDesc FROM Products_tbl WHERE ProdID=100),
@cost MONEY =
(SELECT Cost FROM Products_tbl WHERE ProdID=100)
PRINT @nameprod+' '+CAST (@cost as varchar(15))

--6.
DECLARE @costprod MONEY=
(SELECT Cost
FROM Products_tbl
WHERE ProdID=102)
IF(@costprod>3)
PRINT 'המחיר גדול מ-3'
ELSE 
SELECT 'המחיר קטן מ-3'

--7.
DECLARE @PRODNAME VARCHAR(10)='מחברת',
@PRODCOST FLOAT =(SELECT Cost
FROM Products_tbl
WHERE ProdDesc='מחברת')
IF @PRODCOST<5 
	BEGIN
		SET @PRODCOST=@PRODCOST*1.1
		PRINT 'מחיר חדש:'+' '+ CAST (@PRODCOST AS VARCHAR (10))
	END
ELSE IF @PRODCOST>=5 AND @PRODCOST<10 
	BEGIN
		SET @PRODCOST=@PRODCOST*1.2
		PRINT 'מחיר חדש:'+' '+ CAST (@PRODCOST AS VARCHAR (10))
	END
ELSE 
IF @PRODCOST>=10
	BEGIN
		SET @PRODCOST=@PRODCOST*1.5
		PRINT 'מחיר חדש:'+' '+ CAST (@PRODCOST AS VARCHAR (10))
	END

--8.
DECLARE @N INT =1,@M VARCHAR(15)
WHILE @N <8
	BEGIN
		(SELECT @M=CustName
		FROM Customer_tbl
		WHERE CustID=@N)
		IF @M LIKE '%י%'
		PRINT @M
		SET @N=@N+1
	END
	
--9.		
DECLARE @S VARCHAR(10),@A INT=100
START:
(SELECT @S=ProdDesc
FROM Products_tbl
WHERE ProdID=@A)
IF @S  LIKE '%ר%'
	BEGIN
		PRINT @S
		SET @A=@A+1
		GOTO START
	END
ELSE 
PRINT 'לא קיים ר'

--10.
DECLARE @ID VARCHAR(9)=326383890,@SUM INT=0,@HELP INT=1
WHILE @ID>0
BEGIN
  IF(@HELP=3)
    SET @HELP=1
	if((@ID%10*@HELP)>10)
	    SET @SUM=@SUM+(@ID%10*@HELP)%10+(@ID%10*@HELP)/10
ELSE
   SET @SUM=@SUM+(@ID%10)*@HELP
 SET @HELP=@HELP+1
 SET @ID=@ID/10
 END
IF @SUM%10=0
PRINT 'חוקי'
ELSE
PRINT 'לא חוקי'