CREATE TABLE [Student_8].[Employees] (
    [EmpID]      INT                     IDENTITY (1, 1) NOT NULL,
    [FirstName]  NVARCHAR (50)           NULL,
    [LastName]   [M8_burliga].[Nazwisko] NOT NULL,
    [Salary]     DECIMAL (10, 2)         NULL,
    [HireDate]   DATE                    NULL,
    [Department] NVARCHAR (50)           NULL,
    PRIMARY KEY CLUSTERED ([EmpID] ASC)
);

