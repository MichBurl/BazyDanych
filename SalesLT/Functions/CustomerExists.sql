CREATE FUNCTION SalesLT.CustomerExists (
    @EmailAddress NVARCHAR(50)
) 
RETURNS BIT
AS
BEGIN
    DECLARE @Res BIT = 0;
    IF EXISTS (SELECT * FROM [233648].[Customer] WHERE EmailAddress = @EmailAddress)
    BEGIN
        SET @Res = 1;
    END
    RETURN @Res;
END;