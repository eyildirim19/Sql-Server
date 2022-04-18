/*
	Stored Procedure (Saklý yordamlar)

	Sql server'in tablolardan sonraki en önemli varlýklarýdýr. Daha performanslý çalýþýrlar. Diðer sorgular gibi parse, optimize, compile aþamalý ilk oluþturulduklarýn yapýlýr daha sonra sadece execute edilip result alýnýr. 

	Sp'ler bütün yazdýðýmýz objeler(View, tableFunction()) gibi çalýþabilir.ek olarak gövdelerine insert,update,delete ifadeleride yazýlýr...

*/
use Northwind
go
Create procedure SpMesaj
as
begin
	select 'Merhaba'
end

-- oluþturulan prosedureler Veritabanýmýzda Programmability sekmesinde Stored Procedures içerisinde bulunur....

-- sp'yi çalýþtýrma
exec SpMesaj
execute SpMesaj

-- sp'de güncelleme yapmak için sp'ye sað týk yapýlýp modify seçeneði ile alter edilebilir...

-- procedureler parametre alabilen varlýklardýr..
go
Create procedure SpMesaj1
(
	@Name nvarchar(50)
)
as
begin
	 select @Name
end
go
exec SpMesaj1 'Recep'
exec SpMesaj1 'Emre'

-- procedureler geriye deðer döndürebilen varlýklardýr..SP'ler sadece int deðer dönebilirler. Eðer sp'de tarafýnýzdan bir deðer dönülmezse sp default deðer döner. Bu deðer 0'dir..

declare @result int=10
exec @result = SpMesaj1 'Ekrem'
select @result

go
create procedure SpTopla
(
	@S1 int,
	@S2 int
)
as
begin
	declare @result int = @S1 + @s2
	return @result -- return ifadesi ile deðer dönülür...
end
--
go
declare @r int;
exec @r =  SpTopla 5,6
select @r

--eðer procedure içerisinde birden fazla deðer dönülecekse output parameter kullanýlýr...
go
create procedure SpIslem
(
	@S1 int,
	@S2 int,
	@result int output
)
as
begin
	set	@result = @S1 + @S2
	return 11; -- isterseniz return ifadesinide kullanabilirsiniz...
end
go
declare @r int
exec SpIslem 3,2,@r output -- sp'nin gövdesinden çýkacak parametre
select @r
