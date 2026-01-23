CREATE TABLE [233648].[Product] (
    [ProductID]              INT              IDENTITY (1, 1) NOT NULL,
    [Name]                   [dbo].[Name]     NOT NULL,
    [ProductNumber]          NVARCHAR (25)    NOT NULL,
    [Color]                  NVARCHAR (15)    NULL,
    [StandardCost]           MONEY            NOT NULL,
    [ListPrice]              MONEY            NOT NULL,
    [Size]                   NVARCHAR (5)     NULL,
    [Weight]                 DECIMAL (8, 2)   NULL,
    [ProductCategoryID]      INT              NULL,
    [ProductModelID]         INT              NULL,
    [SellStartDate]          DATETIME         NOT NULL,
    [SellEndDate]            DATETIME         NULL,
    [DiscontinuedDate]       DATETIME         NULL,
    [ThumbNailPhoto]         VARBINARY (MAX)  NULL,
    [ThumbnailPhotoFileName] NVARCHAR (50)    NULL,
    [rowguid]                UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]           DATETIME         NOT NULL
);


GO

-- 3. Tworzymy trigger
CREATE   TRIGGER [233648].trg_PreventHighPriceRaise
ON [233648].Product
INSTEAD OF UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- A. Logujemy próbę błędnej zmiany (> 20%)
    INSERT INTO [233648].PriceErrorLog (ProductID, OldPrice, NewPrice, Message)
    SELECT 
        i.ProductID, 
        d.ListPrice, 
        i.ListPrice, 
        'Próba podwyżki o ponad 20% zablokowana'
    FROM inserted i
    JOIN deleted d ON i.ProductID = d.ProductID
    WHERE i.ListPrice > d.ListPrice * 1.20;

    -- B. Aktualizujemy tylko poprawne rekordy (<= 20% lub brak zmiany ceny)
    UPDATE p
    SET 
        p.ListPrice = i.ListPrice,
        p.ModifiedDate = GETDATE(),
        p.Name = i.Name,             -- Aktualizacja innych kolumn
        p.ProductNumber = i.ProductNumber,
        p.Color = i.Color,
        p.StandardCost = i.StandardCost,
        p.Size = i.Size,
        p.Weight = i.Weight
        -- W triggerach INSTEAD OF trzeba jawnie wymienić kolumny do aktualizacji
    FROM [233648].Product p
    JOIN inserted i ON p.ProductID = i.ProductID
    JOIN deleted d ON p.ProductID = d.ProductID
    WHERE i.ListPrice <= d.ListPrice * 1.20;
END;