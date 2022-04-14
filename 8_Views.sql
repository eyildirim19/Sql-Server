/*
	V�EWS => SQL'DEK� SANAL TABLOLARDIR.. SORGU SONUCU OLU�TURULAN TABLOLAR G�B� D��ENEB�L�RS�N�Z. DERIVED TABLE'DAN FARKI V�EWLAR SQL SERVER'DA OLU�TURULUR DAHA SONRA KULLANILIR. YAN� �NEML� QUERYLER�  TEKRAR TEKRAR YAZMAK YER�NE B�R KERE YAZ S�REKL� KULLAN MANTI�I VARDIR..

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
--olu�turdu�umuz viewlar� veritaban�>Views sekmesinde bulabilirz..
-- buradan view'a sa� t�k yap�p delete ile view� silebiliriz. veya;
-- drop view ViewAd� 

-- view� d�zenlemek i�in Views sekmesinden view'a sa� t�k yap�p design se�ene�inden view� d�enleyebilirsiniz..

select * from OgrenciListesi

-- di�er bir yol ile view olu�utmak i�in view sekmesini kullanabiliriz. View sekmesine sa� t�k yap�p new view ile design'dan da view olu�turabiliriz...
go
select * from OgrenciNotListesi


insert OgrenciListesi
(FullName,Cinsiyet)
values
('Alp Y�ld�r�m','E')

go
create view OgrenciListesiv2
as
	select * from Ogrenci
go
insert OgrenciListesiv2
(Adi,Cinsiyet,SoyAdi)
values
('Alp','E','Y�ld�r�m')


-- viewlar parametre alan varl�klar de�ildirler. View'a filtre (where) view �zerinden veya i�indeki sorgu �zerindne yap�labilir..

select * from OgrenciListesiv2
where Adi = 'Alp'

go
create view OgrenciListesiV3
as
	select * from Ogrenci
	where Adi = 'Alp'

go
-- i�eride where uygulad���m i�in sadece alp ismindeki sat�r� getirir
select * from OgrenciListesiV3
where Adi = 'Ekrem'
