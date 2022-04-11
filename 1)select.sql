
-- yorum sat�r�
/*
	�oklu yorum sat�r�
SQL(Structered Query Language) => Yap�sal Sorgulama Dili

	1) DML (Data Manupaliton Language) => Veriyi manipule eden sql ifadeleridir.
		INSERT => VER� EKLEMEK
		UPDATE => VER� G�NCELLEMEK
		DELETE => VER� S�LMEK
		SELECT => VER� SE�MEK

	2) DDL (Data Defination Language) => Veri tan�mlama ifaderidir. Sql objererini y�netmek i�in kullan�l�r
		CREATE => OLU�TUR
		ALTER => D�ZENLE
		DROP => S�L

	3) DCL (Data Control Language) => Veri kontrol ifadeleridir. Veri g�venli�i i�in kullan�l�r.
		GRANT  => �Z�N VERMEK
		DENY   => �Z�N VERMEMEK
		REVOKE => �Z�N �PTAL ETMEK (KISITLAMAK)

T-Sql (Transact Sql) (MSSQLSERVER)
Pl-Sql  (Oracle)

*/

-- NOT : SQL D�L�NDE B�Y�K K���K HARF DUYARLILI�I YOKTUR...



-- * SQL D�L�NDE TABLODAK� B�T�N ALANLARI �FADE EDER..
-- NOT => MSSQL'DE �ALI�TIRMAK �STED���M�Z SORGU SE��L�P �ALI�TIRILMALIDIR. AMAN D�KKAT...

-- cATEGOR�ES TABLOSUNDAK� B�T�N KAYITLARI GET�REN SORGU
SELECT * FROM Categories

-- CATEGOR�ES TABLOSUNDAN CategoryName ve Description alanlar�n� se�elim..
select CategoryName,Description from Categories

-- ' sql dilinde stringi ifade eder...
-- Description alan� bir sql ifadesi oldu�u i�in sql ifadeleri gibi renklendirilir. Ancak sorguyu �al��t�rd���m�zda bizim ifademiz gibi �al���r..
select 
	CategoryName, Description  
from Categories


-- ALIASES (TAKMA �S�MLER)
-- ALIASES COLUMN => RESULTTA ALAN �S�MLER�NE YEN�DEN �S�MLEND�RMEK ���N KULLANILIR...
-- V1
select 
	CategoryName as KategoriAd�,
	CategoryName as [Kategori Ad�], -- K��EL� PARANTEZLER ARAYA BO�LUK ATILD�INDA HATA VERMEMES� ���N KULLANILIR
	CategoryName as 'Category Name', -- ' ile de takma isim verilebilir...
	Description as A��klama
from Categories

--V2 -- as ifadesi kullan�lmadanda as gibi �al���r...
select 
	CategoryName KategoriAd�,
	CategoryName [Kategori Ad�],
	CategoryName 'CategoryName',
	Description  A��klama
from Categories

-- Table aliases => tablolara takma isim vermek i�in kullan�l�r. (KUllan�n)
select  c.CategoryName,
		c.Description
from Categories as c
-- veya �oklu tablolar ile �al���l�rken kullan�l�r. olduk�a kolayl�k sa�lar

select Products.ProductName,Products.UnitPrice,Products.UnitsInStock from Products 
select p.ProductName,p.UnitPrice,p.UnitsInStock from Products as p



-- sorgular�m�z� execute edece�imiz veritaban�m�z� belirtiyoruz..
use Northwind -- �al��aca��m�z veritabann� se�iyoruz..

--order by => resultta sonu� s�ralamak ii�n kullan�l�r;
-- asc veya desc olarak kullan�r�z.. order by kolon asc/desc. E�er bir�ey belirttemezsek default asc s�ralama yapacakt�r...

select 
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock
from Products as p
order by UnitsInStock asc

select 
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock
from Products as p
order by UnitsInStock desc

-- sipari�leri sipari� tarihine g�re artan s�ralayal�m...
select * from Orders 
order by OrderDate asc


-- top n => sat�r se�mek i�in kullan�r. N adet sat�r getir..
--select top n * from table
select 
top 10
	*
from Products

-- fiyat� en pahal� 10 �r�n
select 
top 10
	*
from Products
order by UnitPrice desc

-- fiyat� en ucuz 10 �r�n
select 
top 10
	*
from Products
order by UnitPrice asc


--not : aliases alanlar order by ifadelerinde kullan�labilir... ��nk� order by kaynaktan veri �ekilirken s�ralan�r...

-- case when  -- if yap�s� gibidir. sadece sorgu i�erisinde kullan�l�r... 
select 
	ProductName,
	UnitPrice,
	UnitsInStock,
    case Discontinued when 0 then 'Sat�� durmu�' 
					  when 1 then 'Sat�� Devam Ediyor'
	end as SatisDurumu
from Products
--order by SatisDurumu desc,UnitPrice desc

-- between and ifadesi...
select 
	--top 10
	ProductName,
	UnitPrice,
	UnitsInStock,
	case when UnitsInStock < 20 then 'Stok Az'
		-- when UnitsInStock >= 20  and UnitsInStock <= 39 then 'Stok Normal'
		 when UnitsInStock between 20 and 39 then 'Stok Normal'
		-- when UnitsInStock > 50 then 'Stok �yi'
		else 'Stok �yi'
	end as StokDurumu
from Products
--order by UnitPrice desc


-- ka� farkl� �lke var ???
-- distinct => ayn� kay�tlar� elimine (ay�klamak) eder..
select distinct Country from Customers
select distinct Country,ContactTitle from Customers


