/*
	Stored Procedure (Sakl� yordamlar)

	Sql server'in tablolardan sonraki en �nemli varl�klar�d�r. Daha performansl� �al���rlar. Di�er sorgular gibi parse, optimize, compile a�amal� ilk olu�turulduklar�n yap�l�r daha sonra sadece execute edilip result al�n�r. 

	Sp'ler b�t�n yazd���m�z objeler(View, tableFunction()) gibi �al��abilir.ek olarak g�vdelerine insert,update,delete ifadeleride yaz�l�r...

*/
use Northwind
go
Create procedure SpMesaj
as
begin
	select 'Merhaba'
end

-- olu�turulan prosedureler Veritaban�m�zda Programmability sekmesinde Stored Procedures i�erisinde bulunur....

-- sp'yi �al��t�rma
exec SpMesaj
execute SpMesaj

-- sp'de g�ncelleme yapmak i�in sp'ye sa� t�k yap�l�p modify se�ene�i ile alter edilebilir...

-- procedureler parametre alabilen varl�klard�r..
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

-- procedureler geriye de�er d�nd�rebilen varl�klard�r..SP'ler sadece int de�er d�nebilirler. E�er sp'de taraf�n�zdan bir de�er d�n�lmezse sp default de�er d�ner. Bu de�er 0'dir..

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
	return @result -- return ifadesi ile de�er d�n�l�r...
end
--
go
declare @r int;
exec @r =  SpTopla 5,6
select @r

--e�er procedure i�erisinde birden fazla de�er d�n�lecekse output parameter kullan�l�r...
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
exec SpIslem 3,2,@r output -- sp'nin g�vdesinden ��kacak parametre
select @r
