

CREATE TABLE doljnost (
    id_doljnost INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    doljnost NVARCHAR(20) NOT NULL
);

CREATE TABLE sotrudnik (
    id_sotrudnik INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    fam NVARCHAR(20) NOT NULL,
	imya NVARCHAR(20) NOT NULL,
	otch NVARCHAR(20) NOT NULL,
	id_doljnost INT NOT NULL FOREIGN KEY REFERENCES doljnost(id_doljnost)
);


CREATE TABLE tip_tovara (
    id_tip_tovara INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tip_tovara NVARCHAR(20) NOT NULL
);

CREATE TABLE tovar (
    id_tovar INT IDENTITY(1,1) NOT NULL  PRIMARY KEY,
    tovar NVARCHAR(20) NOT NULL,
	comments NVARCHAR(100) NOT NULL,
	id_tip_tovara INT NOT NULL FOREIGN KEY REFERENCES tip_tovara(id_tip_tovara)
);

CREATE TABLE price_list (
    id_price_list INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	cena INT NOT NULL,
	data SMALLDATETIME NOT NULL,
	comments NVARCHAR(100) NOT NULL,
	id_tovar INT NOT NULL FOREIGN KEY REFERENCES tovar(id_tovar)
);


CREATE TABLE rayon (
    id_rayon INT IDENTITY(1,1) NOT NULL  PRIMARY KEY,
    rayon NVARCHAR(20) NOT NULL
);

CREATE TABLE tip_klienta (
    id_tip_klienta INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tip_klienta NVARCHAR(20) NOT NULL
);


CREATE TABLE klient (
    id_klient INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    fam NVARCHAR(20) NOT NULL,
	imya NVARCHAR(20) NOT NULL,
	otch NVARCHAR(20) NOT NULL,
	passport NVARCHAR(20) NOT NULL,
	passw NVARCHAR(20) NOT NULL,
	login_ NVARCHAR(20) NOT NULL,
	mesto_raboty NVARCHAR(20) NOT NULL,
	skidka INT NOT NULL,
	id_rayon INT NOT NULL FOREIGN KEY REFERENCES rayon(id_rayon),
	id_tip_klienta INT NOT NULL FOREIGN KEY REFERENCES tip_klienta(id_tip_klienta)
);


CREATE TABLE tip_kontaktov (
    id_tip_kontaktov INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tip_kontaktov NVARCHAR(20) NOT NULL
);

CREATE TABLE kontakty (
    id_kontakty INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    kontakty NVARCHAR(20) NOT NULL,
	id_klient INT NOT NULL FOREIGN KEY REFERENCES klient(id_klient),
	id_tip_kontaktov INT NOT NULL FOREIGN KEY REFERENCES tip_kontaktov(id_tip_kontaktov)
);


CREATE TABLE tip_postavshika (
    id_tip_postavshika INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tip_postavshika NVARCHAR(20) NOT NULL
);

CREATE TABLE postavshik (
    id_postavshik INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nazvaie NVARCHAR(20) NOT NULL,
	fam NVARCHAR(20) NOT NULL,
	imya NVARCHAR(20) NOT NULL,
	otch NVARCHAR(20) NOT NULL,
	id_tip_postavshika INT NOT NULL FOREIGN KEY REFERENCES tip_postavshika(id_tip_postavshika),
); 


CREATE TABLE tip_zakaza (
    id_tip_zakaza INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tip_zakaza NVARCHAR(20) NOT NULL
);

CREATE TABLE tip_prodaj (
    id_tip_prodaj INT IDENTITY(1,1) NOT NULL  PRIMARY KEY,
    tip_prodaj NVARCHAR(20) NOT NULL
);

CREATE TABLE sostoyanie (
    id_sostoyanie INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    sostoyanie NVARCHAR(20) NOT NULL
);

CREATE TABLE zakaz (
    id_zakaz INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	data SMALLDATETIME NOT NULL,
	nomer_doc INT NOT NULL,
    comments NVARCHAR(100) NOT NULL,
	id_klient INT NOT NULL FOREIGN KEY REFERENCES klient(id_klient),
	id_tip_zakaza INT NOT NULL FOREIGN KEY REFERENCES tip_zakaza(id_tip_zakaza),
	id_sostoyanie INT NOT NULL FOREIGN KEY REFERENCES sostoyanie(id_sostoyanie),
	id_tip_prodaj INT NOT NULL FOREIGN KEY REFERENCES tip_prodaj(id_tip_prodaj),
	id_sotrudnik INT NOT NULL FOREIGN KEY REFERENCES sotrudnik(id_sotrudnik),
);

CREATE TABLE vid_oplaty (
    id_vid_oplaty INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    vid_oplaty NVARCHAR(20) NOT NULL 
);

CREATE TABLE oplata (
    id_oplata INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	data SMALLDATETIME NOT NULL,
    summa INT NOT NULL,
    comments NVARCHAR(100) NOT NULL,
	id_zakaz INT NOT NULL FOREIGN KEY REFERENCES zakaz(id_zakaz),
	id_vid_oplaty INT NOT NULL FOREIGN KEY REFERENCES vid_oplaty(id_vid_oplaty),
);

CREATE TABLE tip_postavki (
    id_tip_postavki INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tip_postavki NVARCHAR(20) NOT NULL
);

CREATE TABLE postavki (
    id_postavki INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nomer_doc INT NOT NULL,
	data SMALLDATETIME NOT NULL,
	comments NVARCHAR(20) NOT NULL,
	id_postavshik INT NOT NULL FOREIGN KEY REFERENCES postavshik(id_postavshik),
	id_tip_postavki INT NOT NULL FOREIGN KEY REFERENCES tip_postavki(id_tip_postavki),
); 

CREATE TABLE oplaty (
    id_oplaty INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	data SMALLDATETIME NOT NULL,
	summa INT NOT NULL,
    comments NVARCHAR(100) NOT NULL,
	id_postavki INT NOT NULL FOREIGN KEY REFERENCES postavki(id_postavki)
);

CREATE TABLE spisok_postavki (
    id_spisok_postavki INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	id_postavki INT NOT NULL FOREIGN KEY REFERENCES postavki(id_postavki),
	cena INT NOT NULL,
	kol_vo INT NOT NULL,
	srok_godnosti SMALLDATETIME NOT NULL
);

CREATE TABLE spisok_tovarov (
    id_spisok_tovarov INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	cena INT NOT NULL,
	kolichestvo INT NOT NULL,
	id_zakaz INT NOT NULL FOREIGN KEY REFERENCES zakaz(id_zakaz),
	id_tovar INT NOT NULL FOREIGN KEY REFERENCES tovar(id_tovar),
	id_spisok_postavki INT NOT NULL FOREIGN KEY REFERENCES spisok_postavki(id_spisok_postavki),
);