use Northwind

-- distinct => benzer(ayný) kayýtlarý elimine etmek için kulanýlýr
select distinct Country from Customers
select distinct Country,ContactTitle from Customers

--group by => ayný kayýtlarý gruplamak için kullanýlýr...
select Country from Customers
group by Country

-- ülkeye göre customer sayýsý
-- eðer group by kullanýmýnda aggregate function kullanýlýrsa, gruplanan eleman üzerinde iþlem yapar...
select Country,COUNT(*) from Customers
group by Country

select Country,ContactTitle from Customers
group by Country,ContactTitle

select ShipCountry,COUNT(*) from Orders
group by ShipCountry

select OrderID,
		COUNT(*) UrunSayisi,
		SUM(UnitPrice * Quantity) as ToplamKazanc,
		SUM(Quantity) as ToplamAdet
from [Order Details]
group by OrderID

select *,UnitPrice* Quantity from [Order Details]
where OrderID = 10248


