
create function Student_8.ufn_GetEmployeesByDept (@DeptName NVARCHAR(50))

returns table
as
return
(
    select
        EmpID, FirstName, LastName, HireDate
    from
        Student_8.Employees
    where
        Department = @DeptName
);