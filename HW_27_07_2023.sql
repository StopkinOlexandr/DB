Create new user - CREATE
Delete user - DELETE
Add users address - UPDATE
Find users from one city - READ
Find user by ID - READ

SELECT ProductName, Price FROM Products WHERE Price >= 20;

SELECT Country FROM [Suppliers]

SELECT ProductName, Price*0.91 FROM [Products] WHERE not SupplierID=1 ORDER BY Price ASC 

SELECT ContactName FROM [Customers] WHERE NOT Country="USA" and NOT Country="France"

