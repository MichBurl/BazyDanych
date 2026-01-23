CREATE TABLE [SalesLT].[DeletedCustomersLog] (
    [LogID]       INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]  INT           NULL,
    [FirstName]   NVARCHAR (50) NULL,
    [LastName]    NVARCHAR (50) NULL,
    [AttemptDate] DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([LogID] ASC)
);

