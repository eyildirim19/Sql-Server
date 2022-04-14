
/*	
	User Defined Functions (Kullanýcý tanýmlý fonksiyonlar)

	Kullanýcý tanýmlý fonkisyonlar ikiye ayrýlýr;
	1) Scalar Valued Function (deðer dönen fonksiyon)
	2) Table Valued Function (tablo dönen fonksiyon)

	-- functionlarýn en önemli özellikleri parametre almalýrýdýr.. table valued functiýonlarda bu parametreler sayesinde sorgularýmaza dinamik filtreler uyguyabilirz. Buda viewlara göre daha performanslý sonuçlar elde etmemizi saðlar..

*/
use DDLDatabase
go
create function UserList()
returns table -- dönüþ tipini belirliyoruz...
as
	 return select * from Ogrenci
-- OLUTÞRULAN FONKSÝYONLAR VERÝTABANI SEKMESÝNDE Programmability sekmesinde Functions sekmesinde ilgili sekmede bulunur...
-- burada modify ile function'ý düzenleyebilir, delete ile silebilirsiniz..
go
select * from UserList()

go
create function UserListV2(@Name nvarchar(50))
returns table
as
	return select * from Ogrenci where Adi = @Name
go

select * from UserListV2('Bilal')



