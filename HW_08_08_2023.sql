-- 2. Вывести ко-во заказов от клиентов из Germany
SELECT COUNT (*) AS Order_Quantity 
FROM 
Orders
JOIN Customers ON Customers.CustomerID=Orders.CustomerID
WHERE
	Customers.Country='Germany'
	
-- 3. Вывести среднюю стоимость проданного в Germany товара
SELECT AVG (Products.Price) AS AVG_price
FROM 
Orders
JOIN Customers ON Customers.CustomerID=Orders.CustomerID
JOIN Products ON Products.ProductID=OrderDetails.ProductID
JOIN OrderDetails ON Customers.CustomerID=Orders.CustomerID
WHERE
	Customers.Country='Germany'
	
-- 4. Вывести ко-во и сред/стоимость товаров из `USA``
SELECT 
	COUNT (*) AS Order_Quantity,
	AVG (Products.Price) AS AVG_price
FROM 
	Products
JOIN Suppliers ON Suppliers.SupplierID=Products.SupplierID
WHERE
	Suppliers.Country='USA'

-- 5. Вывести стоимость и название двух самых дешевых товаров из `Germany``
SELECT 
	Products.Price,
	Products.ProductName
FROM 
	Products
JOIN Suppliers ON Suppliers.SupplierID=Products.SupplierID
WHERE
	Suppliers.Country='Germany'
ORDER BY Price ASC
LIMIT 2

-- 6. Применить наценку в 15% ко всем товарам из категории `4``
UPDATE Products
SET
	Price=Price*1.15
WHERE
	CategoryID=4
