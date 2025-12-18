create function [SalesLT].[ufn_ProductPriceDiff](@json nvarchar(max))
returns table as return (
    select 
        p.ProductID, 
        p.Name, 
        p.ListPrice as CurrentPrice, 
        j.NewPrice as PlannedPrice,
        j.NewPrice - p.ListPrice as Diff
    from openjson(@json) with (ProductID int, NewPrice money) j
    join [SalesLT].[Product] p on j.ProductID = p.ProductID
);