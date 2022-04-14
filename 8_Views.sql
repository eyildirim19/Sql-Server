/*
	VÝEWS => SQL'DEKÝ SANAL TABLOLARDIR.. SORGU SONUCU OLUÞTURULAN TABLOLAR GÝBÝ DÜÞENEBÝLÝRSÝNÝZ. DERIVED TABLE'DAN FARKI VÝEWLAR SQL SERVER'DA OLUÞTURULUR DAHA SONRA KULLANILIR. YANÝ ÖNEMLÝ QUERYLERÝ  TEKRAR TEKRAR YAZMAK YERÝNE BÝR KERE YAZ SÜREKLÝ KULLAN MANTIÐI VARDIR..

    CREATE VIEW ViewAdi
	as
	query

	
*/
create view OgrenciListesi
as
	select 
		ID,
	   CONCAT(Adi,' ',SoyAdi) as FullName,
	   Cinsiyet
	from Ogrenci
go
--oluþturduðumuz viewlarý veritabaný>Views sekmesinde bulabilirz..
-- buradan view'a sað týk yapýp delete ile viewý silebiliriz. veya;
-- drop view ViewAdý 

-- viewý düzenlemek için Views sekmesinden view'a sað týk yapýp design seçeneðinden viewý düenleyebilirsiniz..

select * from OgrenciListesi

-- diðer bir yol ile view oluþutmak için view sekmesini kullanabiliriz. View sekmesine sað týk yapýp new view ile design'dan da view oluþturabiliriz...
go
select * from OgrenciNotListesi


insert OgrenciListesi
(FullName,Cinsiyet)
values
('Alp Yýldýrým','E')

go
create view OgrenciListesiv2
as
	select * from Ogrenci
go
insert OgrenciListesiv2
(Adi,Cinsiyet,SoyAdi)
values
('Alp','E','Yýldýrým')


-- viewlar parametre alan varlýklar deðildirler. View'a filtre (where) view üzerinden veya içindeki sorgu üzerindne yapýlabilir..

select * from OgrenciListesiv2
where Adi = 'Alp'

go
create view OgrenciListesiV3
as
	select * from Ogrenci
	where Adi = 'Alp'

go
-- içeride where uyguladýðým için sadece alp ismindeki satýrý getirir
select * from OgrenciListesiV3
where Adi = 'Ekrem'
