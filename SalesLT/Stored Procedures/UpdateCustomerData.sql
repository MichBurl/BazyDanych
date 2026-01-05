CREATE PROCEDURE SalesLT.UpdateCustomerData
    @EmailAddress NVARCHAR(50),
    @FirstName NVARCHAR(50),
    @LastName M8_burliga.Nazwisko,
    @CompanyName NVARCHAR(128),
    @Phone NVARCHAR(25) = NULL
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            IF SalesLT.CustomerExists(@EmailAddress) = 0
            BEGIN 
                THROW 50001, 'User with such an email does not exist', 1;
            END
            UPDATE [233648].[Customer]
            SET 
            FirstName = @FirstName,
            LastName = @LastName,
            CompanyName = @CompanyName,
            Phone = @Phone,
            ModifiedDate = GETDATE()
            WHERE EmailAddress = @EmailAddress;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
    END CATCH
END;