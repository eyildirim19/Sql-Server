-- insert tabloya veri eklemek için kullanýlýr..
insert Categories
(CategoryName,Description)
values
('Custom Cat','Haftanýn ilk gün kategorisi')

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
('Yýldýrým Taþýmacýlýk','12345'),
('Alp Nakliye','12345')
-- bir tablodan diðer tabloya da insert yapýlabilir. (Tablo alanlarý ortak ise) tabi sadece geçiþ iþlemlerinde test ortamýndan prod'a veya tam tersi transfer iþlemlerinde yapýlýr...
insert Shippers
(CompanyName,Phone)
select CategoryName,CategoryName from Categories



-- delete tablodan kayýt silmek için kullanýlýr...
-- eðer where ile kriter belirlenmezse tablodaki bütün kayýtlarý etkiler.. Delete ifadesi dikkat etmemiz gerek bir ifadedir. Ctrl + z ile iþlemler geri alýnmaz..
-- not => Delete ve Update iþlemlerinde PK alanýna filtre uygulanýr...
-- delete ile silininen kayýtlarýn logu tutulur..
-- truncate ile tutulmaz...
/*
	delete from Table
*/
-- truncate table => tablodankayýt siler

delete from Categories
where CategoryName = 'Ey'

select * from Shippers

delete from Shippers
where ShipperID > 7


insert Shippers
(CompanyName,Phone)
values
('mutlu','1')

-- update => veri güncellemek için kullanýlýr
-- tablonun tamamýný etkiler. Where ile kullanýlmalýdýr...
update Shippers
	set CompanyName = 'Alp Taþýmacýlýk', 
	Phone = '(541) 351-00-19'
where ShipperID = 4

select * from Shippers

