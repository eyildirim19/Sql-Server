
/*
	JOINS
	B�RDEN FAZLA TABLOYU RESULTTA B�RLE�T�RMEK ���N KULLANILIR... (e�le�en kay�tlar�)

	resulltta birden fazla tabloyu tek tablo gibi g�sterir..

	JONLER �K�YE AYRILIR
	1)�� JOIN (INNER JOIN)
	2)DI� JOIN (OUTER JOIN) -- LEFT,RIGHT,FULL
*/

select * from Products as p
inner join Suppliers as s
on p.SupplierID = s.SupplierID -- e�le�tirme yap�l�r

-- inner join kullan�m�nda inner ifadesi zorunlu de�ildir..
select * from Products as p
join Suppliers as s
on p.SupplierID = s.SupplierID -- e�le�tirme yap�l�r

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

-- left join => sol taraf�n tamam�, sa� taraf�n sadece e�le�enleri gelir...
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

-- left outer join yerine left join de yaz�labilir
select * from Categories as c
left join Products as p
on c.CategoryID = p.CategoryID

select * from Categories as c
right join Products as p
on c.CategoryID = p.CategoryID

--- e�le�en ve e�le�meyen b�t�n kay�tlar� getirir...
select * from Categories as c
full join Products as p
on c.CategoryID = p.CategoryID
