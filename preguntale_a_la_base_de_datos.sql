-- El total de ordenes del cliente con el ID 3
-- 1. Total orders from client 3
SELECT COUNT(OrderID) 
FROM Orders
WHERE CustomerID=3;
COUNT(OrderID)
--------------
6 

-- El total de ordenes del cliente con el ContactName igual a 'Jim Wood'
-- 2. Total orders from client Jim WoodSELECT count(*) 
FROM Customers join Orders on Customers.CustomerID = Orders.CustomerID
WHERE ContactName='Jim Wood';
count(*) 
----------
6         

-- El total de ordenes del cliente con CompanyName igual a 'Slots Carpet'
-- 3. Total orders from company Slots Carpet
SELECT count(*) FROM Customers join Orders on Customers.CustomerID = Orders.CustomerID
WHERE CompanyName='Slots Carpet';
count(*)  
----------
2         

-- El total de ordenes de cada compañía ordenado de manera descendente
-- 4. Total orders for each company ordered by the company with the most orders
SELECT Customers.Companyname, 
COUNT(Orders.CustomerID) AS TotalOrders
FROM Customers 
JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
GROUP BY Companyname ORDER BY TotalOrders DESC;
CompanyName  TotalOrders
-----------  -----------
Floor Co.    6          
Sagebrush C  5          
Main Tile a  4          
Deerfield T  3          
Slots Carpe  2

-- El total de ordenes de cada compañía ordenado de manera ascendente
-- 5. Total orders for each company ordered by the company with the least orders 
SELECT Customers.Companyname, COUNT(Orders.CustomerID) AS TotalOrders 
FROM Customers 
JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
GROUP BY Companyname 
ORDER BY TotalOrders asc;
CompanyName   TotalOrders
------------  -----------
Slots Carpet  2          
Deerfield Ti  3          
Main Tile an  4          
Sagebrush Ca  5          
Floor Co.     6          

-- La compañía con el mayor número de ordenes
-- 6. The company with the most orders
SELECT Customers.Companyname, COUNT(Orders.CustomerID) AS TotalOrders 
FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
WHERE CompanyName LIKE 'Floor Co.' 
ORDER BY CompanyName;
CompanyName  TotalOrders
-----------  -----------
Floor Co.    6

-- La suma total de piezas que fueron ordenadas por cada compañía.
-- 7. Total items ordered by each company ordered by the company with the most items 
SELECT Companyname, SUM(Quantity) AS TotalO 
FROM Customers 
JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Companyname 
ORDER BY TotalOrders DESC;  
CompanyName         TotalOrders
------------------  -----------
Main Tile and Bath  940        
Sagebrush Carpet    740        
Floor Co.           670        
Deerfield Tile      340        
Slots Carpet        250

-- El monto total en pesos de la orden con ID 4 
-- 8. Total amount of order 4
SELECT OrderDetails.OrderID, OrderDetails.unitprice * OrderDetails.Quantity AS TotalPrice
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE Orderdetails.OrderID = 4;
OrderID     TotalPrice
----------  ----------
4           400.0 

-- El monto total en pesos de cada orden
-- 9. Total amount for each order
SELECT OrderDetails.OrderID, SUM(OrderDetails.unitprice * OrderDetails.Quantity) AS TotalPrices
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orderdetails.OrderID;	
OrderID     TotalPrices
----------  -----------
1           48.0       
2           1948.7     
3           2395.9     
4           400.0      
5           3638.6     
6           384.5      
7           1321.5     
8           1941.7     
9           300.0      
10          133.2      
11          421.2      
12          32.0       
13          250.0      
14          881.0      
15          1344.1     
16          207.5      
17          1942.6     
18          285.5      
19          1626.5     
20          166.0

-- La consulta del inciso anterior pero únicamente mostrando aquellas ordenes que sean mayores a $1,000.00 pesos
-- 10. Total amount for each order having more than 1000
SELECT OrderDetails.OrderID, SUM(OrderDetails.unitprice * OrderDetails.Quantity) AS TotalPrices
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orderdetails.OrderID
HAVING SUM(OrderDetails.unitprice * OrderDetails.Quantity) > 1000;
OrderID     TotalPrices
----------  -----------
2           1948.7     
3           2395.9     
5           3638.6     
7           1321.5     
8           1941.7     
15          1344.1     
17          1942.6     
19          1626.5     

-- El total de piezas en cada orden 
-- 11. Total items in each order
SELECT OrderDetails.OrderID, SUM(OrderDetails.Quantity) AS TotalPrices
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orderdetails.OrderID;
OrderID     TotalPrices
----------  -----------
1           90         
2           330        
3           240        
4           80         
5           380        
6           140        
7           210        
8           190        
9           60         
10          100        
11          180        
12          60         
13          50         
14          140        
15          110        
16          70         
17          200        
18          120        
19          130        
20          60         
