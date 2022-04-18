create function FnStokDurumu
(
	@ProductId int
)
returns nvarchar(50)
as
begin

	declare @stok int
	declare @stokDurum nvarchar(50)

	set @stok = (select UnitsInStock from Products
		where ProductID = @ProductId)

    if @stok < 20
		begin
			set @stokDurum = 'Stok Kötü'
		end
	else if @stok between 20 and 40
		begin
			set @stokDurum = 'Stok Ýyi'
		end
	else if @stok > 40
		begin
			set @stokDurum = 'Stok Normal'
		end

return @stokDurum
end

go



select 
	ProductName,
	UnitPrice,
	UnitsInStock,
	case when UnitsInStock < 20 then 'Stok Az'
		 when UnitsInStock between 20 and 40 then 'Stok Normal'
		 when UnitsInStock > 40 then 'Stok Ýyi'
	end as StokDurum
from Products


select 
	ProductName,
	UnitPrice,
	UnitsInStock,
	dbo.FnStokDurumu(ProductID) -- productId parametre olarak fonksiyona gönderilir...
from Products
