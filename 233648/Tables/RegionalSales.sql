CREATE TABLE [233648].[RegionalSales] (
    [SaleID]   INT             IDENTITY (1, 1) NOT NULL,
    [Region]   NVARCHAR (50)   NULL,
    [Category] NVARCHAR (50)   NULL,
    [Amount]   DECIMAL (12, 2) NULL,
    PRIMARY KEY CLUSTERED ([SaleID] ASC)
);

