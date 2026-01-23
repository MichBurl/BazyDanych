CREATE TABLE [233648].[QuarterlyStats] (
    [StatID]     INT             IDENTITY (1, 1) NOT NULL,
    [FiscalYear] INT             NULL,
    [Quarter]    CHAR (2)        NULL,
    [Revenue]    DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([StatID] ASC)
);

