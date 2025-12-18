
create function Student_8.ufn_IsPriceHigherThanCurrent
(
    @jsondata nvarchar(max)
)
returns bit
as
begin
    declare @productid int;
    declare @jsonprice money;
    declare @currentprice money;
    declare @result bit;

    set @productid = cast(json_value(@jsondata, '$.ProductID') as int);
    set @jsonprice = cast(json_value(@jsondata, '$.Price') as money);

    select @currentprice = listprice
    from saleslt.product
    where productid = @productid;

    if @jsonprice > @currentprice
        set @result = 1;
    else
        set @result = 0;

    return @result;
end;