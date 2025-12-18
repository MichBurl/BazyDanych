
create view Student_8.v_PublicDirectory as
select
    FirstName,
    LastName,
    Department,

    DATEDIFF(YEAR, HireDate, GETDATE()) as YearsInCompany
from 
    Student_8.Employees;