CREATE PROCEDURE SalesLT.SearchCustomers
    @CustomerID INT = NULL,
    @FirstName NVARCHAR(50) = NULL,
    @LastName M8_burliga.Nazwisko = NULL,
    @EmailAddress NVARCHAR(50) = NULL
AS
BEGIN
    SELECT * FROM [233648].[Customer]
    WHERE
    (CustomerID = @CustomerID OR @CustomerID IS NULL)
    AND
    (FirstName = @FirstName OR @FirstName IS NULL)
    AND
    (LastName = @LastName OR @LastName IS NULL)
    AND
    (EmailAddress = @EmailAddress OR @EmailAddress IS NULL);
END;