/*
	where ifadesi => satýr filtremelek için kullanýlýr. Sorguya filtre ekleyerek sonuç görmemizi saðlar
*/ 
select  * from Customers
where ContactTitle = 'Sales Manager'

select  * from Customers
where ContactTitle != 'Sales Manager'

select * from Customers
where ContactTitle = 'Sales Manager' or ContactTitle = 'Owner' or ContactTitle = 'Sales Agent'

select * from Customers
where ContactTitle = 'Sales Manager' and Country = 'Austria'

-- in operatörü
select * from Customers
where ContactTitle in ('Sales Manager','Owner','Sales Agent')

select * from Customers
where ContactTitle not in ('Sales Manager','Owner')

-- is null => null olan anlamýna gelir
-- is sadece null ve not null için kullanýlýr. Null bir deeðer deðildir..
select * from Customers
where Fax is null

select * from Customers
where Fax is not null

select * from Customers
where Fax is not null and ContactTitle  = 'Sales Manager'

select * from Products as p
--where p.UnitPrice >10 and p.UnitPrice < 20
where p.UnitPrice between 10 and 20
order by UnitsInStock desc
