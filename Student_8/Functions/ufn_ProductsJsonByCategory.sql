
create function Student_8.ufn_ProductsJsonByCategory
(
    @categoryname nvarchar(50)
)
returns nvarchar(max)
as
begin
    declare @jsonresult nvarchar(max);

    set @jsonresult = (
        select 
            p.productid,
            p.name as productname,
            p.productnumber,
            p.listprice,
            p.color,
            pc.name as category
        from 
            saleslt.product as p
        inner join 
            saleslt.productcategory as pc on p.productcategoryid = pc.productcategoryid
        where 
            pc.name = @categoryname
        for json auto
    );

    return @jsonresult;
end;