-- insert tabloya veri eklemek i�in kullan�l�r..
insert Categories
(CategoryName,Description)
values
('Custom Cat','Haftan�n ilk g�n kategorisi')

insert Categories
(Description,CategoryName)
values
('deneme kategori','EY')

insert into Categories 
(CategoryName,Description) 
values
('A','B')

--multiple insert
insert Shippers
(CompanyName,Phone)
values
('Y�ld�r�m Ta��mac�l�k','12345'),
('Alp Nakliye','12345')
-- bir tablodan di�er tabloya da insert yap�labilir. (Tablo alanlar� ortak ise) tabi sadece ge�i� i�lemlerinde test ortam�ndan prod'a veya tam tersi transfer i�lemlerinde yap�l�r...
insert Shippers
(CompanyName,Phone)
select CategoryName,CategoryName from Categories



-- delete tablodan kay�t silmek i�in kullan�l�r...
-- e�er where ile kriter belirlenmezse tablodaki b�t�n kay�tlar� etkiler.. Delete ifadesi dikkat etmemiz gerek bir ifadedir. Ctrl + z ile i�lemler geri al�nmaz..
-- not => Delete ve Update i�lemlerinde PK alan�na filtre uygulan�r...
-- delete ile silininen kay�tlar�n logu tutulur..
-- truncate ile tutulmaz...
/*
	delete from Table
*/
-- truncate table => tablodankay�t siler

delete from Categories
where CategoryName = 'Ey'

select * from Shippers

delete from Shippers
where ShipperID > 7


insert Shippers
(CompanyName,Phone)
values
('mutlu','1')

-- update => veri g�ncellemek i�in kullan�l�r
-- tablonun tamam�n� etkiler. Where ile kullan�lmal�d�r...
update Shippers
	set CompanyName = 'Alp Ta��mac�l�k', 
	Phone = '(541) 351-00-19'
where ShipperID = 4

select * from Shippers

