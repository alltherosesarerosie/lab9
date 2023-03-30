SELECT * 
FROM spisok_postavki
WHERE id_spisok_postavki in (SELECT id_spisok_postavki FROM spisok_tovarov WHERE id_tovar in (SELECT id_tovar FROM tovar WHERE id_tovar in 
(SELECT id_tovar FROM price_list WHERE data = '2022-06-01')))


SELECT *
FROM spisok_tovarov
WHERE id_spisok_postavki in (SELECT id_spisok_postavki FROM spisok_postavki WHERE id_postavki in (SELECT id_postavki FROM postavki
WHERE id_postavshik in (SELECT id_postavshik FROM postavshik WHERE nazvaie = 'GoFAst')))



SELECT *
FROM spisok_postavki
WHERE id_spisok_postavki in (SELECT id_spisok_postavki FROM spisok_tovarov WHERE id_tovar in (SELECT id_tovar FROM tovar WHERE tovar = 'Book'))


SELECT *
FROM postavki
WHERE id_postavki in (SELECT id_postavki FROM spisok_postavki WHERE id_spisok_postavki in (SELECT id_spisok_postavki FROM spisok_tovarov WHERE id_tovar in (SELECT id_tovar FROM tovar WHERE tovar = 'Car')) )


UPDATE price_list SET cena = 111
WHERE data >= '2022-09-01 00:00:00' and data <= '2022-12-01 00:00:00';


SELECT *
FROM oplata
WHERE id_zakaz in (SELECT id_zakaz FROM zakaz WHERE id_zakaz in (SELECT id_zakaz FROM spisok_tovarov WHERE id_spisok_postavki IN (
SELECT id_spisok_postavki FROM spisok_postavki WHERE id_postavki in (SELECT id_postavki FROM postavki WHERE data BETWEEN ('2022-01-01')and('2022-03-01')))))


