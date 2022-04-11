/*
	where ifadesi => sat�r filtremelek i�in kullan�l�r. Sorguya filtre ekleyerek sonu� g�rmemizi sa�lar
*/ 
select  * from Customers
where ContactTitle = 'Sales Manager'

select  * from Customers
where ContactTitle != 'Sales Manager'

select * from Customers
where ContactTitle = 'Sales Manager' or ContactTitle = 'Owner' or ContactTitle = 'Sales Agent'

select * from Customers
where ContactTitle = 'Sales Manager' and Country = 'Austria'

-- in operat�r�
select * from Customers
where ContactTitle in ('Sales Manager','Owner','Sales Agent')

select * from Customers
where ContactTitle not in ('Sales Manager','Owner')

-- is null => null olan anlam�na gelir
-- is sadece null ve not null i�in kullan�l�r. Null bir dee�er de�ildir..
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
