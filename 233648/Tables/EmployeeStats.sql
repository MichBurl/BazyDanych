CREATE TABLE [233648].[EmployeeStats] (
    [StatID]       INT             IDENTITY (1, 1) NOT NULL,
    [EmployeeName] NVARCHAR (50)   NULL,
    [Department]   NVARCHAR (50)   NULL,
    [ReportMonth]  DATE            NULL,
    [SalesAmount]  DECIMAL (12, 2) NULL,
    PRIMARY KEY CLUSTERED ([StatID] ASC)
);

