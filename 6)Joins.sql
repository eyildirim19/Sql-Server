
/*
	JOINS
	BÝRDEN FAZLA TABLOYU RESULTTA BÝRLEÞTÝRMEK ÝÇÝN KULLANILIR... (eþleþen kayýtlarý)

	resulltta birden fazla tabloyu tek tablo gibi gösterir..

	JONLER ÝKÝYE AYRILIR
	1)ÝÇ JOIN (INNER JOIN)
	2)DIÞ JOIN (OUTER JOIN) -- LEFT,RIGHT,FULL
*/

select * from Products as p
inner join Suppliers as s
on p.SupplierID = s.SupplierID -- eþleþtirme yapýlýr

-- inner join kullanýmýnda inner ifadesi zorunlu deðildir..
select * from Products as p
join Suppliers as s
on p.SupplierID = s.SupplierID -- eþleþtirme yapýlýr

select 
	p.ProductName,
	p.UnitPrice,
	s.CompanyName,
	s.ContactTitle
from Products as p
join Suppliers as s
on p.SupplierID = s.SupplierID 


select * from Customers as c
join Orders as o
on c.CustomerID = o.CustomerID

-- left join => sol tarafýn tamamý, sað tarafýn sadece eþleþenleri gelir...
select * from Customers as c 
left outer join Orders as o
on c.CustomerID = o.CustomerID

select c.* from Customers as c 
left outer join Orders as o
on c.CustomerID = o.CustomerID
where o.CustomerID is null

-- right join left tam tersidir...
select * from Categories as c
join Products as p
on c.CategoryID = p.CategoryID

-- left outer join yerine left join de yazýlabilir
select * from Categories as c
left join Products as p
on c.CategoryID = p.CategoryID

select * from Categories as c
right join Products as p
on c.CategoryID = p.CategoryID

--- eþleþen ve eþleþmeyen bütün kayýtlarý getirir...
select * from Categories as c
full join Products as p
on c.CategoryID = p.CategoryID
