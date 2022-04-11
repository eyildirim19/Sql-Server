
-- yorum satýrý
/*
	çoklu yorum satýrý
SQL(Structered Query Language) => Yapýsal Sorgulama Dili

	1) DML (Data Manupaliton Language) => Veriyi manipule eden sql ifadeleridir.
		INSERT => VERÝ EKLEMEK
		UPDATE => VERÝ GÜNCELLEMEK
		DELETE => VERÝ SÝLMEK
		SELECT => VERÝ SEÇMEK

	2) DDL (Data Defination Language) => Veri tanýmlama ifaderidir. Sql objererini yönetmek için kullanýlýr
		CREATE => OLUÞTUR
		ALTER => DÜZENLE
		DROP => SÝL

	3) DCL (Data Control Language) => Veri kontrol ifadeleridir. Veri güvenliði için kullanýlýr.
		GRANT  => ÝZÝN VERMEK
		DENY   => ÝZÝN VERMEMEK
		REVOKE => ÝZÝN ÝPTAL ETMEK (KISITLAMAK)

T-Sql (Transact Sql) (MSSQLSERVER)
Pl-Sql  (Oracle)

*/

-- NOT : SQL DÝLÝNDE BÜYÜK KÜÇÜK HARF DUYARLILIÐI YOKTUR...



-- * SQL DÝLÝNDE TABLODAKÝ BÜTÜN ALANLARI ÝFADE EDER..
-- NOT => MSSQL'DE ÇALIÞTIRMAK ÝSTEDÝÐÝMÝZ SORGU SEÇÝLÝP ÇALIÞTIRILMALIDIR. AMAN DÝKKAT...

-- cATEGORÝES TABLOSUNDAKÝ BÜTÜN KAYITLARI GETÝREN SORGU
SELECT * FROM Categories

-- CATEGORÝES TABLOSUNDAN CategoryName ve Description alanlarýný seçelim..
select CategoryName,Description from Categories

-- ' sql dilinde stringi ifade eder...
-- Description alaný bir sql ifadesi olduðu için sql ifadeleri gibi renklendirilir. Ancak sorguyu çalýþtýrdýðýmýzda bizim ifademiz gibi çalýþýr..
select 
	CategoryName, Description  
from Categories


-- ALIASES (TAKMA ÝSÝMLER)
-- ALIASES COLUMN => RESULTTA ALAN ÝSÝMLERÝNE YENÝDEN ÝSÝMLENDÝRMEK ÝÇÝN KULLANILIR...
-- V1
select 
	CategoryName as KategoriAdý,
	CategoryName as [Kategori Adý], -- KÖÞELÝ PARANTEZLER ARAYA BOÞLUK ATILDÐINDA HATA VERMEMESÝ ÝÇÝN KULLANILIR
	CategoryName as 'Category Name', -- ' ile de takma isim verilebilir...
	Description as Açýklama
from Categories

--V2 -- as ifadesi kullanýlmadanda as gibi çalýþýr...
select 
	CategoryName KategoriAdý,
	CategoryName [Kategori Adý],
	CategoryName 'CategoryName',
	Description  Açýklama
from Categories

-- Table aliases => tablolara takma isim vermek için kullanýlýr. (KUllanýn)
select  c.CategoryName,
		c.Description
from Categories as c
-- veya çoklu tablolar ile çalýþýlýrken kullanýlýr. oldukça kolaylýk saðlar

select Products.ProductName,Products.UnitPrice,Products.UnitsInStock from Products 
select p.ProductName,p.UnitPrice,p.UnitsInStock from Products as p



-- sorgularýmýzý execute edeceðimiz veritabanýmýzý belirtiyoruz..
use Northwind -- çalýþacaðýmýz veritabanný seçiyoruz..

--order by => resultta sonuç sýralamak iiçn kullanýlýr;
-- asc veya desc olarak kullanýrýz.. order by kolon asc/desc. Eðer birþey belirttemezsek default asc sýralama yapacaktýr...

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

-- sipariþleri sipariþ tarihine göre artan sýralayalým...
select * from Orders 
order by OrderDate asc


-- top n => satýr seçmek için kullanýr. N adet satýr getir..
--select top n * from table
select 
top 10
	*
from Products

-- fiyatý en pahalý 10 ürün
select 
top 10
	*
from Products
order by UnitPrice desc

-- fiyatý en ucuz 10 ürün
select 
top 10
	*
from Products
order by UnitPrice asc


--not : aliases alanlar order by ifadelerinde kullanýlabilir... çünkü order by kaynaktan veri çekilirken sýralanýr...

-- case when  -- if yapýsý gibidir. sadece sorgu içerisinde kullanýlýr... 
select 
	ProductName,
	UnitPrice,
	UnitsInStock,
    case Discontinued when 0 then 'Satýþ durmuþ' 
					  when 1 then 'Satýþ Devam Ediyor'
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
		-- when UnitsInStock > 50 then 'Stok Ýyi'
		else 'Stok Ýyi'
	end as StokDurumu
from Products
--order by UnitPrice desc


-- kaç farklý ülke var ???
-- distinct => ayný kayýtlarý elimine (ayýklamak) eder..
select distinct Country from Customers
select distinct Country,ContactTitle from Customers


