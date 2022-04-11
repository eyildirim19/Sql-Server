
/*
	Aggregate functions=>  
*/

-- Count => satýr sayýsý döner...
select COUNT(*) as KategoriAdeti from Categories

select COUNT(*) as UrunSayisi from Products

-- Count fonksiyonunda (*) kullanýrsak bütün satýrý sayar...
select * from Customers

select 
	COUNT(*) as ToplamMusteriAdeti
from Customers

-- Count içerisine alan verirseniz null olmayanlarý sayar...
select  COUNT(Fax) from Customers -- Fax'ý null olmayanlarý say...

select COUNT(*) from Customers
where Fax is null

-- Sum belirtilen alana göre toplama yapar..
select SUM(UnitPrice) from Products -- fiyat toplamý...

select SUM(UnitsInStock) from Products -- stok toplamý...

select AVG(UnitPrice) from Products -- ortalama fiyat...

select MIN(UnitPrice) from Products -- min fiyat...

select MAX(UnitPrice) from Products -- max fiyat...

-- Bu fonksiyonlarýn ortak noktasý geriye tek satýr, tek sütun dönmeleridir...(Bir tablodan tek satýr, tek sütun elde eder)...

--select COUNT(*),ProductName from Products -- sorguyu çalýþtýrdýðýmýzda hata alýrýz...

-- Aggregate funcionlar group by ifadeleri ile daha anlamlý hale gelirler....
-- t-sqlde deðiþken tanýmlamak için declare ifadesi kullanýlýr...Deðiþken ve parametrelerimiz @ ifadesi ile baþlar.
declare @adSoyAd nvarchar(50)
-- deðiþkene deðer atama

-- yol 1
set @adSoyAd = 'Ekrem Yýldýrým'
select @adSoyAd

-- yol 2
select @adSoyAd = 'Kaan Turan'
select @adSoyAd

declare @OrtFiyat decimal
set @OrtFiyat = (select AVG(UnitPrice) from Products)
--select @OrtFiyat =  AVG(UnitPrice) from Products

-- Fiyatý ortalama fiyatýn üzerindeki ürünler...
select * from Products
where UnitPrice > @OrtFiyat


-- Bu yönteme subquery yöntemi denir...
select * from Products
where UnitPrice > (select AVG(UnitPrice) from Products)