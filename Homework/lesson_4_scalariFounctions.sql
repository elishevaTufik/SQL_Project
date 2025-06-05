--scalar function
--המרה
--1
select cast(CustID as varchar)+' '+CustName
from Customer_tbl
--2
select *
from Employee_tbl
where not EmpID like cast(EmpID as int)
--3
select convert(varchar(10),OrdDate,3), convert(varchar(10),OrdDate,101), convert(varchar(10),OrdDate,106)
from Orders_tbl
--isnull
--4
select CustName, CustPhone, isnull(convert(varchar(20),custfax),'אין פקס. טל:'+CustPhone) as CastFax
from Customer_tbl
--פונקציות מחרוזתיות
--5
select EmpID, lower(FirstName), upper(lastName)
from Employee_tbl
where SUBSTRING(EmpID,1,1) between 1 and 2
--6
select EmpID, upper(SUBSTRING(firstName,1,1))+lower(SUBSTRING(firstName,2,10))
from Employee_tbl
--7א
select firstName,LastName,SUBSTRING(firstName,1,1)+SUBSTRING(LastName,3,1)+'@mail.com'
from Employee_tbl
--7ב
select firstName,LastName,SUBSTRING(firstName,1,1)+SUBSTRING(LastName,LEN(LastName)-2,3)+'@mail.com'
from Employee_tbl
--8
select LastName, len(LastName)
from Employee_tbl
where len(lastname)>4
--9
--א
select CustName,CustPhone,REPLACE(CustPhone,'02','??') as 'new phone'
from Customer_tbl
where charindex('02',CustPhone)>0 
--9
--ב
select CustPhone,CustName,REPLACE(CustPhone,'02','??') as 'new phone'
from Customer_tbl
where charindex('02',CustPhone)=1 
--10
select OrderNum, OrdDate, DATEADD (d, -10,OrdDate),DATEADD (m, 1,OrdDate),DATENAME (DW,OrdDate),DATENAME(YY,OrdDate),DATEDIFF(D,OrdDate,GETDATE())
from Orders_tbl
--11
select OrderNum, CustID, OrdDate, DATEFROMPARTS(YEAR(GETDATE()),MONTH(OrdDate),DAY(OrdDate)) 
from Orders_tbl
--12
select *
from Employee_pay_tbl
where DATEDIFF(YY,DateLastRaise,GETDATE())>10
--13
select *
from Employee_pay_tbl
where DATEDIFF(YY,DateLastRaise,GETDATE())=5
--14
select EmpID,Salary, ROUND((Salary+Bonus)*1.167,2),CEILING((Salary+Bonus)*1.167),FLOOR((Salary+Bonus)*1.167),((Salary+Bonus)*((cast(RAND()*4 +2as int)*0.01))+salary+Bonus
from Employee_pay_tbl
--15
select sign(-5),sign(abs(-5)),sign(power(-5,2))
