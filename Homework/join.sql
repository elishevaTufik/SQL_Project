--תרגילים join

--1
SELECT O.OrderNum , C.CustName 
FROM Orders_tbl O JOIN Customer_tbl C 
ON O.CustID= C.CustID
WHERE CustName LIKE '%י%'

--2
SELECT P.ProdDesc, MAX(OrdDate)
FROM Products_tbl P LEFT JOIN Orders_tbl O 
ON P.ProdID=O.ProdID
GROUP BY P.ProdDesc

--3
SELECT  C.CustName, MAX(O.OrdDate)
FROM Customer_tbl C LEFT JOIN Orders_tbl O 
ON C.CustID=O.CustID
GROUP BY CustName

--4
SELECT  O.CustID, O.OrdDate, O.Qty*P.COST AS 'סכום לתשלום'
FROM Orders_tbl O LEFT JOIN  Products_tbl P 
ON P.ProdID=O.ProdID

--5
SELECT  O.CustID, (O.Qty*P.COST) AS 'סכום לתשלום', (O.Qty*P.COST*5/100) AS 'הנחה 5%',(O.Qty*P.COST*95/100)AS 'מחיר לאחר הנחה'
FROM Orders_tbl O LEFT JOIN  Products_tbl P 
ON P.ProdID=O.ProdID
WHERE O.Qty>20

--6
SELECT SUM(O.Qty*P.COST) AS 'רווח כללי'
FROM Orders_tbl O LEFT JOIN  Products_tbl P 
ON P.ProdID=O.ProdID 

--7
--בהנחה שצריך לשים פה לקוחות גם אם הם לא הזמינו שום הזמנה
--אם לא, מורידים את המילה לפט
SELECT C.CustName, SUM (O.Qty*P.COST) AS 'סכום לתשלום'
FROM Orders_tbl O LEFT JOIN  Products_tbl P 
ON P.ProdID=O.ProdID
RIGHT JOIN Customer_tbl C 
ON C.CustID=O.CustID
GROUP BY C.CustName

--8
SELECT AVG(EP.Salary) AS ' משכורת ממוצעת', SUM(EP.Salary) AS 'סכום'
FROM Employee_pay_tbl EP LEFT JOIN Employee_tbl ET
ON EP.EmpID = ET.EmpID 
WHERE ET.Phone LIKE '03%'
GROUP BY ET.City

--9
SELECT O.ProdID,SUM(O.Qty)
FROM Orders_tbl O LEFT JOIN  Products_tbl P 
ON P.ProdID=O.ProdID 
WHERE P.Cost>1
GROUP BY O.ProdID

--10
SELECT O.ProdID,SUM(O.Qty)
FROM Orders_tbl O JOIN Customer_tbl C ON C.CustID=O.CustID
WHERE C.CustCity LIKE 'ירושלים'
GROUP BY O.ProdID

--11
SELECT O.CustID, AVG(QTY) AS 'ממוצע'
FROM Products_tbl P JOIN Orders_tbl O
ON P.ProdID =O.ProdID
GROUP BY O.CustID
HAVING AVG(P.Cost)>1.75

--12
SELECT O.OrderNum, ISNULL(C.CustName,'UNKNOWN'),ISNULL(P.ProdDesc,'UNKNOWN')
FROM  Orders_tbl O LEFT JOIN Products_tbl P ON P.ProdID=O.ProdID
LEFT JOIN Customer_tbl C ON O.CustID=C.CustID

--13
SELECT E1.FirstName,E1.LastName
FROM Employee_tbl E1 JOIN Employee_tbl E2
ON E1.LastName=E2.LastName AND E1.EMPID !=E2.EMPID

--14
SELECT P1.ProdDesc,P2.ProdDesc
FROM Products_tbl P1 JOIN Products_tbl P2
ON P1.Cost=P2.Cost AND P1.ProdDesc !=P2.ProdDesc

--15
SELECT P1.ProdDesc,P1.Cost
FROM Products_tbl P1 JOIN Products_tbl P2
ON P2.ProdDesc='דפדפת'
WHERE P1.Cost>P2.Cost