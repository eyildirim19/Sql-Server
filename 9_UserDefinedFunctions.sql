
/*	
	User Defined Functions (Kullan�c� tan�ml� fonksiyonlar)

	Kullan�c� tan�ml� fonkisyonlar ikiye ayr�l�r;
	1) Scalar Valued Function (de�er d�nen fonksiyon)
	2) Table Valued Function (tablo d�nen fonksiyon)

	-- functionlar�n en �nemli �zellikleri parametre almal�r�d�r.. table valued functi�onlarda bu parametreler sayesinde sorgular�maza dinamik filtreler uyguyabilirz. Buda viewlara g�re daha performansl� sonu�lar elde etmemizi sa�lar..

*/
use DDLDatabase
go
create function UserList()
returns table -- d�n�� tipini belirliyoruz...
as
	 return select * from Ogrenci
-- OLUT�RULAN FONKS�YONLAR VER�TABANI SEKMES�NDE Programmability sekmesinde Functions sekmesinde ilgili sekmede bulunur...
-- burada modify ile function'� d�zenleyebilir, delete ile silebilirsiniz..
go
select * from UserList()

go
create function UserListV2(@Name nvarchar(50))
returns table
as
	return select * from Ogrenci where Adi = @Name
go

select * from UserListV2('Bilal')



