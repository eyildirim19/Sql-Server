use Northwind

-- distinct => benzer(ayn�) kay�tlar� elimine etmek i�in kulan�l�r
select distinct Country from Customers
select distinct Country,ContactTitle from Customers

--group by => ayn� kay�tlar� gruplamak i�in kullan�l�r...
select Country from Customers
group by Country

-- �lkeye g�re customer say�s�
-- e�er group by kullan�m�nda aggregate function kullan�l�rsa, gruplanan eleman �zerinde i�lem yapar...
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


