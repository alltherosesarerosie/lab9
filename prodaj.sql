
DECLARE @r INT


SELECT @r = id_zakaz 
FROM zakaz
WHERE id_sostoyanie	= (SELECT id_sostoyanie FROM sostoyanie WHERE sostoyanie = 'выполнен') and data >= '2023-02-11' and data <= '2023-02-13'

SELECT id_tovar, kolichestvo
FROM spisok_tovarov
WHERE id_zakaz = @r



SELECT *
FROM zakaz
WHERE id_klient in (SELECT id_klient FROM klient WHERE id_klient = 1) and data BETWEEN ('2023-02-11')and('2023-02-12')



UPDATE price_list SET cena = 111
WHERE data >= '2022-09-01' and data <= '2022-12-01';



SELECT *
FROM price_list;



SELECT id_oplata, summa, id_zakaz
FROM oplata
WHERE data >= '2022-01-01' and data <= '2022-03-01'



SELECT summa
FROM oplata
WHERE id_vid_oplaty = (SELECT id_vid_oplaty from vid_oplaty WHERE vid_oplaty = 'безналичный') and data >= '2022-01-01' and data <= '2022-03-01'



SELECT *
FROM zakaz
WHERE id_sotrudnik  = 1



SELECT *
FROM zakaz
WHERE id_klient in (SELECT id_klient FROM klient WHERE id_rayon in (SELECT id_rayon FROM rayon WHERE rayon = 'Октябрьский'))



SELECT kontakty
FROM kontakty
WHERE id_klient = (SELECT id_klient FROM klient WHERE id_klient = 2)



SELECT id_zakaz, id_tip_prodaj
FROM zakaz



SELECT id_zakaz, id_tip_zakaza
FROM zakaz



DECLARE @k INT
SELECT @k = kolichestvo
FROM spisok_tovarov
WHERE id_spisok_postavki = 1;

DECLARE @koll INT
SELECT @koll = kol_vo
FROM spisok_postavki
WHERE id_spisok_postavki = 1;

print (@koll - @k) 