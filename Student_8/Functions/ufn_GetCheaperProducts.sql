
create function Student_8.ufn_GetCheaperProducts
(
    @maxprice money
)
returns table
as
return
(
    select 
        p.productid,
        p.name,
        p.productnumber,
        p.listprice
    from 
        saleslt.product as p
    where
        Student_8.ufn_IsPriceHigherThanCurrent(
            concat(
                '{"ProductID": ',
                cast(p.productid as nvarchar(20)),
                ', "Price": ',
                cast(@maxprice as nvarchar(20)),
                '}'
            )
        ) = 1
);