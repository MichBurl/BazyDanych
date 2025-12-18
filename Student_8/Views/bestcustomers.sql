
-- krok 2: tworzenie widoku
create view Student_8.bestcustomers as
select top 10
    c.customerid,
    c.firstname,
    c.lastname,
    c.companyname,
    count(soh.salesorderid) as liczbazamowien,
    sum(soh.totaldue) as sumawydatkow
from
    [233648].Customer as c
join
    saleslt.salesorderheader as soh on c.customerid = soh.customerid
group by
    c.customerid,
    c.firstname,
    c.lastname,
    c.companyname
order by
    sumawydatkow desc