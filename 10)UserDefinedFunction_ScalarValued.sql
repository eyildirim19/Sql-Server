Use Northwind

select 
	ProductName,
	UnitPrice,
	UnitsInStock,
	case when UnitsInStock < 20 then 'Stok Az'
		 when UnitsInStock between 20 and 40 then 'Stok Normal'
		 when UnitsInStock > 40 then 'Stok �yi'
	end as StokDurum
from Products

select GETDATE()
--scalar-valued Functions => geriye tek sat�r, tek s�tun d�nen fonksiyonlard�r..
go
create function FnMesaj()
returns nvarchar(500) -- d�n�� tipi
as
begin -- {
	return 'Merhaba' -- d�nen de�er
end -- }
go
-- Scalar-valued Functions �a�r�l�rken schema name ile �a�r�l�r..
select dbo.FnMesaj()
go
create function FnMesaj2
(
	@Isim nvarchar(50) -- parameter
)
returns nvarchar(500)
as
begin
	return 'Merhaba ' + @Isim 
end
go

select dbo.FnMesaj2('Ekrem') as KarsilamaMesaji
select dbo.FnMesaj2('Kaan') as KarsilamaMesaji

go

create function FnTopla
(
	@Sayi1 int,
	@Sayi2 int
)
returns int
as
begin
	declare @result int-- = @Sayi1 + @Sayi2
	set @result = @Sayi1 + @Sayi2
	return @result
end
go
select dbo.FnTopla(1,5)

declare @s1 int=3,@s2 int= 5,@result int,@durum nvarchar(50)
set @result = dbo.FnTopla(@s1,@s2)  -- fonksiyonun de�erini de�i�kene ata...
select @result

-- if => karar yap�s�d�r. case when yap�s�da bir karar yap�s�d�r ancak case when sorgu i�erisinde kullan�labilir. if sorgu i�erisinde kullan�lamaz..

declare @n1 int= 5,@n2 int =3
if @n1 > @n2
	begin
		select 'Say�1 b�y�k'
	end
else
	begin
		select 'Say�2 b�y�k'
	end