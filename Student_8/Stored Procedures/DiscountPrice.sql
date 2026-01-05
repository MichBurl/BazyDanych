
CREATE PROCEDURE Student_8.DiscountPrice
AS
BEGIN
    SELECT ProductID, Name, ListPrice AS OldPrice, (ListPrice - (ListPrice * 0.08)) AS NewPrice FROM #TopProducts;
END;