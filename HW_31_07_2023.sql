-- 1. Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT 
Products.ProductName, 
Products.Price * 1.1 as PriceUSD, 
FROM Products
JOIN OrderDetails ON Products.ProductID=OrderDetails.ProductID
ORDER BY Price DESC LIMIT 1

-- 2. Вывести два самых дорогих товара из категории Beverages из USA
SELECT 
Products.*
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN SUPPLIERS ON Products.SupplierID=Suppliers.SupplierID
WHERE Categories.CategoryName="Beverages" AND Suppliers.Country="USA"
LIMIT 2

-- 3. Удалить товары с ценой от 5 до 25 EUR
DELETE FROM Products
WHERE
	Price >= 5 AND Price <=25
	
-- 4. Вывести список стран, которые поставляют морепродукты
SELECT 
Suppliers.Country
FROM Suppliers
JOIN Products ON Suppliers.SupplierID=Products.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE Categories.CategoryName = "Seafood"

-- 5. Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET
	CustomerName='',
WHERE
	Country <> "China"

-- 6. Вывести информацию о товарах с ценой от 10 до 150 EUR, которые были поставлены из Japan:
--	название_товара
--	цена_товара
--	цена_со_скидкой_15_процентов
--	название_поставщика
	
SELECT 
	Products.ProductName,
	Products.Price,
	Products.Price * 0.85 AS Price_down15,
	Suppliers.SupplierName
FROM [Products]
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.Country="Japan"

-- 7. Вывести заказы клиентов из USA, Germany, UK:
--	номер_заказа
--	полное_имя_клиента
--	страна_клиента
--	имя_менеджера
--	фамилия_менеджера

SELECT 
Orders.OrderID,
Customers.CustomerName,
Customers.Country,
Employees.FirstName,
Employees.LastName
FROM [Orders]
JOIN Customers ON Orders.CustomerID = Customers.CustomerID

JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID

JOIN Products ON OrderDetails.ProductID=Products.ProductID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Customers.Country="USA" OR Customers.Country="Germany" OR Customers.Country="UK"

