

CREATE PROCEDURE SalesLT.CreateCustomer
    @FirstName NVARCHAR(50),
    @LastName M8_burliga.Nazwisko,
    @EmailAddress NVARCHAR(50), 
    @CompanyName NVARCHAR(128) = NULL,
    @Phone NVARCHAR(25) = NULL
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
        IF @FirstName IS NULL OR @LastName IS NULL OR @EmailAddress IS NULL
        BEGIN
            THROW 50001, 'FirstName, LastName and EmailAddress fields cannot be null.', 1;
        END

        IF SalesLT.CustomerExists(@EmailAddress) = 1
        BEGIN
            THROW 50002, 'There already exist a customer with this email.', 1;
        END

        INSERT INTO [233648].[Customer] (FirstName, LastName, CompanyName, EmailAddress, Phone, PasswordHash, PasswordSalt, ModifiedDate, rowguid) VALUES (
        @FirstName,
        @LastName,
        @CompanyName,
        @EmailAddress,
        @Phone,
        'x',
        'x',
        GETDATE(),
        NEWID()
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
    END CATCH
END;