
/*
	Aggregate functions=>  
*/

-- Count => sat�r say�s� d�ner...
select COUNT(*) as KategoriAdeti from Categories

select COUNT(*) as UrunSayisi from Products

-- Count fonksiyonunda (*) kullan�rsak b�t�n sat�r� sayar...
select * from Customers

select 
	COUNT(*) as ToplamMusteriAdeti
from Customers

-- Count i�erisine alan verirseniz null olmayanlar� sayar...
select  COUNT(Fax) from Customers -- Fax'� null olmayanlar� say...

select COUNT(*) from Customers
where Fax is null

-- Sum belirtilen alana g�re toplama yapar..
select SUM(UnitPrice) from Products -- fiyat toplam�...

select SUM(UnitsInStock) from Products -- stok toplam�...

select AVG(UnitPrice) from Products -- ortalama fiyat...

select MIN(UnitPrice) from Products -- min fiyat...

select MAX(UnitPrice) from Products -- max fiyat...

-- Bu fonksiyonlar�n ortak noktas� geriye tek sat�r, tek s�tun d�nmeleridir...(Bir tablodan tek sat�r, tek s�tun elde eder)...

--select COUNT(*),ProductName from Products -- sorguyu �al��t�rd���m�zda hata al�r�z...

-- Aggregate funcionlar group by ifadeleri ile daha anlaml� hale gelirler....
-- t-sqlde de�i�ken tan�mlamak i�in declare ifadesi kullan�l�r...De�i�ken ve parametrelerimiz @ ifadesi ile ba�lar.
declare @adSoyAd nvarchar(50)
-- de�i�kene de�er atama

-- yol 1
set @adSoyAd = 'Ekrem Y�ld�r�m'
select @adSoyAd

-- yol 2
select @adSoyAd = 'Kaan Turan'
select @adSoyAd

declare @OrtFiyat decimal
set @OrtFiyat = (select AVG(UnitPrice) from Products)
--select @OrtFiyat =  AVG(UnitPrice) from Products

-- Fiyat� ortalama fiyat�n �zerindeki �r�nler...
select * from Products
where UnitPrice > @OrtFiyat


-- Bu y�nteme subquery y�ntemi denir...
select * from Products
where UnitPrice > (select AVG(UnitPrice) from Products)