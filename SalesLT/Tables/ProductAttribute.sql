CREATE TABLE [SalesLT].[ProductAttribute] (
    [AttrID]    INT                                         IDENTITY (1, 1) NOT NULL,
    [ProductID] INT                                         NOT NULL,
    [Data]      XML(CONTENT [SalesLT].[ProductAttrsSchema]) NOT NULL,
    PRIMARY KEY CLUSTERED ([AttrID] ASC),
    FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
);

