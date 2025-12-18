
create function Student_8.ufn_CalcAdjustedPrices
(
    @ListPrice money
)
returns table
as
return
(
    select
        @ListPrice - (@ListPrice * 0.08) AS AdjustedPrice
);