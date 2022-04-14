
/*
	DDL(Data Defination Language)
	sql server objeleri oluþturmak, düzenlemek ve silmek için kullanýlýr.
	Create,
	Alter
	Drop

	Oluþturmak için;
	Create ObjeTipi ObjeIsmi

	Düzenlemek için
	Alter ObjeTipi ObjeIsmi

	Silmek için
	Drop ObjeTipi ObjeIsmi

	Objelerimiz;
	Table,
	View,
	Functions,
	Procedures,
	Trigger
*/
Create Table Kategori
(
	ID int identity(1,1),-- primary key,
	Adi nvarchar(50) not null,
	Aciklama nvarchar(MAX)

	constraint PK_Kategori  primary key(ID)
)

Alter Table Kategori
	add EklenmeTarihi datetime default getdate() -- default value

insert Kategori
(Adi,Aciklama)
values
('Giyim','Giyecekler')

select * from Kategori

insert Kategori
(Adi,Aciklama)
select CategoryName,Description from Categories

-- kategori tablosunu sil
drop table Kategori


create database DDLDatabase
go
use DDLDatabase 
go
create table Ogrenci
(
	ID int identity(1,1),
	Adi nvarchar(50),
	SoyAdi nvarchar(50),
	Cinsiyet nvarchar(1)

	constraint PK_Ogrenci primary Key(ID)
)
go
create table NotTipi
(
	ID tinyint identity(1,1),
	Adi nvarchar(50)

	constraint PK_NotTipi primary Key(ID)
)
go
create table Notlar
(
	ID int identity(1,1),
	Notu float,
	NotTipiId tinyint,
	OgrenciId int,
	Tarih datetime default getdate()

	constraint PK_Notlar primary Key(ID),
	constraint FK_NotTipi foreign key(NotTipiId) references NotTipi(ID),
	constraint FK_Ogrenci foreign key(OgrenciId) references Ogrenci(ID)
)



insert Ogrenci
(Adi,SoyAdi,Cinsiyet)
values
('Ekrem','Yýldýrým','E')

insert Ogrenci
(Adi,SoyAdi,Cinsiyet)
values
('Alper','Sonalp','E'),
('Bilal','Ümit','E'),
('Emre','Çakýral','E'),
('Recep','R','E')

insert Ogrenci
(Adi,SoyAdi,Cinsiyet)
Values
('Nursena','Bayar','K')


select * from Ogrenci

insert NotTipi
(Adi)
values
('Vize'),
('Final'),
('Bütünleme')


select * from NotTipi


insert Notlar
(Notu,NotTipiId,OgrenciId)
values
(50,1,1),
(60,1,2),
(90,2,1),
(75,2,2)

select * from Notlar

select GETDATE() - 1

insert Notlar
(Notu,NotTipiId,OgrenciId,Tarih)
values
(89,1,3,getdate()-1),
(60,2,3,GETDATE() + 44)


-- derived table => sorgu esnasýnda sorgudan türetilen tablolardýr. Sanal tablo gibi düþünebilirsiniz....

-- Bu tablolar sorgu esnasýnda oluþtuðu için baþka bir satýrda veya baþka bir zamanda (çalýþtýrýldýktan sonra) kullanýlamaz....
select * from (
		select	
			ID,
			--Adi + ' ' + SoyAdi
			CONCAT(Adi,' ',SoyAdi) as FullName
		from Ogrenci
) as result
where FullName = 'Recep R'
