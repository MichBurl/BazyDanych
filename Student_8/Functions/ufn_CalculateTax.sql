
create function Student_8.ufn_CalculateTax (@GrossAmount decimal(10,2))
returns decimal(10,2)
as
begin
    return @GrossAmount * 0.19;
end;