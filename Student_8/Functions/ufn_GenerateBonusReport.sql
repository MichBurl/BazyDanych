
create function Student_8.ufn_GenerateBonusReport ()
returns @BonusTable table (
    EmpName NVARCHAR(100),
    BonusAmount DECIMAL(10,2),
    EmpStatus NVARCHAR(20)
)
as
begin
    insert into @BonusTable (EmpName, BonusAmount, EmpStatus)
    select
        LastName + ' ' + FirstName,
        case
            when DATEDIFF(YEAR, HireDate, GETDATE()) < 2 then 0
            when DATEDIFF(YEAR, HireDate, GETDATE()) BETWEEN 2 AND 4 then Salary * 0.10
            else Salary * 0.20
        end,
        case
            when DATEDIFF(YEAR, HireDate, GETDATE()) > 4 then 'Weteran'
            else 'Standard'
        end
    from
        Student_8.Employees;
    return;
end;