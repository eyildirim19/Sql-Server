Use Northwind

select 
	ProductName,
	UnitPrice,
	UnitsInStock,
	case when UnitsInStock < 20 then 'Stok Az'
		 when UnitsInStock between 20 and 40 then 'Stok Normal'
		 when UnitsInStock > 40 then 'Stok Ýyi'
	end as StokDurum
from Products

select GETDATE()
--scalar-valued Functions => geriye tek satýr, tek sütun dönen fonksiyonlardýr..
go
create function FnMesaj()
returns nvarchar(500) -- dönüþ tipi
as
begin -- {
	return 'Merhaba' -- dönen deðer
end -- }
go
-- Scalar-valued Functions çaðrýlýrken schema name ile çaðrýlýr..
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
set @result = dbo.FnTopla(@s1,@s2)  -- fonksiyonun deðerini deðiþkene ata...
select @result

-- if => karar yapýsýdýr. case when yapýsýda bir karar yapýsýdýr ancak case when sorgu içerisinde kullanýlabilir. if sorgu içerisinde kullanýlamaz..

declare @n1 int= 5,@n2 int =3
if @n1 > @n2
	begin
		select 'Sayý1 büyük'
	end
else
	begin
		select 'Sayý2 büyük'
	end