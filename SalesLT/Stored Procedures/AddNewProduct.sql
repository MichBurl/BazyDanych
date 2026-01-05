
CREATE PROCEDURE SalesLT.AddNewProduct
    @Name NVARCHAR(50),
    @ProductNumber NVARCHAR(50),
    @ProductCategoryID INT,
    @ListPrice MONEY,
    @Quantity INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            IF @ListPrice <= 0
            BEGIN
                THROW 50001, 'Price cannot be zero or less.', 1;
            END

            IF @Quantity < 0
            BEGIN
                THROW 50002, 'Quantity cannot be negative', 1;
            END

            INSERT INTO SalesLT.Product (
                Name,
                ProductNumber,
                StandardCost,
                ListPrice,
                ProductCategoryID,
                SellStartDate,
                rowguid,
                ModifiedDate
            )
            VALUES (
                @Name,
                @ProductNumber,
                0,
                @ListPrice,
                @ProductCategoryID,
                GETDATE(),
                NEWID(),
                GETDATE()
            );

            DECLARE @NewProductID INT = SCOPE_IDENTITY();

            INSERT INTO SalesLT.ProductInventory(ProductID, Quantity)
            VALUES (
                @NewProductID,
                @Quantity
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