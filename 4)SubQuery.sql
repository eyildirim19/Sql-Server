use Northwind

select * from Products

declare @ortStok int
select @ortStok = AVG(UnitsInStock) from Products
select * from Products 
where UnitsInStock < @ortStok
order by UnitsInStock desc


-- subquery = > önce subqury çalýþtýrýlýr, sonra query çalýþtýrýlýr
select * from Products
where UnitsInStock < (select AVG(UnitsInStock) from Products)



-- subquery in/not int kullanýmý....
select * from Customers
where CustomerID not in ( select distinct CustomerID from Orders)

select * from Customers
where CustomerID in ( select distinct CustomerID from Orders)

-- iliþkisel subquery
-- önce dýþ, sonra iç sorgu çalýþýrýlýr. iç sorgu her bir satýr için çalýþtýrýlýr.Bu yüzden subqueryler performans objeleri deðildirler. Yani sorgu içerisinde iliþkisel subquery kullanýmý sorgu performansýný düþerecektir...
select * from Products

select 
	*,
	(select COUNT(*) from Products where CategoryID = c.CategoryID) as UrunAdeti
from Categories c


select 
	s.CompanyName,
	s.ContactTitle,
	s.Phone,
	(select COUNT(*) from Products where SupplierID = s.SupplierID) as TedarikEdilenUrunAdeti
from Suppliers s