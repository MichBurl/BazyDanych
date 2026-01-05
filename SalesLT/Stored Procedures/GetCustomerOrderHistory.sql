CREATE PROCEDURE SalesLT.GetCustomerOrderHistory
    @CustomerID INT
AS
BEGIN
    SELECT p.Name AS ProductName, h.OrderDate, d.OrderQty, d.LineTotal AS Price
    FROM SalesLT.SalesOrderHeader AS h 
    INNER JOIN SalesLT.SalesOrderDetail AS d
    ON h.SalesOrderID = d.SalesOrderID 
    INNER JOIN SalesLT.Product AS p 
    ON d.ProductID = p.ProductID;
END;