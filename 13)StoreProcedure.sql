-- not => proc veya procedure ikiside ayný þey...
create proc spProductDetail
as
begin
	select 
		p.ProductName,
		p.UnitPrice,
		p.UnitsInStock,
		dbo.FnStokDurumu(ProductID) as StokDurumu,
		c.CategoryName
	from Categories as c
	inner join Products as p
	on c.CategoryID = p.CategoryID
end
go
exec spProductDetail

go
create proc spAddCategory
(
	@CategoryName nvarchar(50),
	@Description nvarchar(MAX)
)
as
begin
	
	insert Categories
	(CategoryName,Description)
	values
	(@CategoryName,@Description)

end
go
exec spAddCategory 'Kat1','Deneme Denemeeee'
exec spAddCategory 'Kat2','Deneme Denemeeee'