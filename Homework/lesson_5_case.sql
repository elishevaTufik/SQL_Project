--case
--1
select Salary,
   case Position
      when 1 then Salary*1.5
      when 2 then Salary*1.3
      when 3 then Salary*1.1
	  else Salary
	  end
from Employee_pay_tbl

--2
select CustName, CustPhone, CustFax,
   case
     when CustFax is null then 'unknowen fax'
	 else CustFax
	 end
from Customer_tbl

--3
select 
   case
    when Cost between 0 and 5 then cost*1.8
    when Cost between 5 and 10 then cost*1.4
    when Cost between 10 and 20 then cost
	else cost*0.8
	end
from Products_tbl

--4
select FirstName+' '+LastName as 'full name', 
   case 
   when city = 'בני ברק' then Address
   when city in('תל אביב','רמת גן','גבעתיים') then city
   else Address+' '+City+' '+cast(Zip as varchar)
   end
from Employee_tbl

--5
select qty,custid,prodid,
   case 
     when Qty<=5 then DATEFROMPARTS(YEAR(OrdDate),MONTH(OrdDate),1)
	 else DATEADD(dd,-1,DATEFROMPARTS(YEAR(OrdDate),MONTH(OrdDate)+1,1))
	 end
from Orders_tbl

