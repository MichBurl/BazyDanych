CREATE TABLE [233648].[ProjectTasks] (
    [TaskID]       INT            IDENTITY (1, 1) NOT NULL,
    [TaskName]     NVARCHAR (100) NOT NULL,
    [CustomerID]   INT            NOT NULL,
    [ParentTaskID] INT            NULL,
    PRIMARY KEY CLUSTERED ([TaskID] ASC)
);

