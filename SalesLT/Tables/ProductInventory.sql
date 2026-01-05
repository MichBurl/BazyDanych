CREATE TABLE [SalesLT].[ProductInventory] (
    [ProductID] INT NOT NULL,
    [Quantity]  INT DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_PI_Product] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
);

