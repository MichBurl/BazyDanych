CREATE TABLE [233648].[PriceErrorLog] (
    [LogID]       INT             IDENTITY (1, 1) NOT NULL,
    [ProductID]   INT             NULL,
    [OldPrice]    DECIMAL (12, 2) NULL,
    [NewPrice]    DECIMAL (12, 2) NULL,
    [AttemptDate] DATETIME        DEFAULT (getdate()) NULL,
    [Message]     NVARCHAR (255)  NULL,
    PRIMARY KEY CLUSTERED ([LogID] ASC)
);

