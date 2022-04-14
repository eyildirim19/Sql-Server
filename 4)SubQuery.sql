use Northwind

select * from Products

declare @ortStok int
select @ortStok = AVG(UnitsInStock) from Products
select * from Products 
where UnitsInStock < @ortStok
order by UnitsInStock desc


-- subquery = > �nce subqury �al��t�r�l�r, sonra query �al��t�r�l�r
select * from Products
where UnitsInStock < (select AVG(UnitsInStock) from Products)



-- subquery in/not int kullan�m�....
select * from Customers
where CustomerID not in ( select distinct CustomerID from Orders)

select * from Customers
where CustomerID in ( select distinct CustomerID from Orders)

-- ili�kisel subquery
-- �nce d��, sonra i� sorgu �al���r�l�r. i� sorgu her bir sat�r i�in �al��t�r�l�r.Bu y�zden subqueryler performans objeleri de�ildirler. Yani sorgu i�erisinde ili�kisel subquery kullan�m� sorgu performans�n� d��erecektir...
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