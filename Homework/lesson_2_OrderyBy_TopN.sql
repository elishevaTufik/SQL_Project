
--1
SELECT*
FROM Products_tbl
ORDER BY cost desc

--2
SELECT EmpID, DateHire, Salary+Bonus AS 'FULL SALARY'
FROM Employee_pay_tbl
WHERE Position in(1,2,7) or Salary<5000 and DateHire not between '2009-01-01' and '2010-01-01'
ORDER BY 'FULL SALARY' ASC

--3
SELECT OrderNum, CustID 
FROM Orders_tbl
WHERE OrdDate BETWEEN '2008-04-01' AND '2008-05-01'
ORDER BY OrdDate, CustID DESC

--4
SELECT CustID, CustName, CustAddress+' '+CustCity AS 'ADRESS', CustPhone
FROM Customer_tbl
WHERE EmpID LIKE '%[3,8,1]%' AND CustCity IN ('ירושלים','תל אביב','חיפה')
ORDER BY EmpID, 'ADRESS'

--5
SELECT TOP 3 Cost, ProdDesc
FROM Products_tbl
ORDER BY Cost DESC

--6
SELECT TOP 1 *
FROM Products_tbl
ORDER BY Cost ASC

--7
SELECT TOP 5 PERCENT Salary
FROM Employee_pay_tbl
ORDER BY SALARY DESC




