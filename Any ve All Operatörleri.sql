--Merhabalar,

--Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.



--film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
--film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.




--Kolay Gelsin.

SELECT COUNT(*) 
FROM film 
WHERE film.length > 
(SELECT AVG(film.length) 
FROM film);

SELECT COUNT(*) 
FROM film 
WHERE film.rental_rate = ANY 
(SELECT MAX(film.rental_rate) 
FROM film);

SELECT * 
FROM film 
WHERE film.rental_rate = ALL 
(SELECT MIN(film.rental_rate) 
FROM film) 
AND film.replacement_cost = ALL 
(SELECT MIN(film.replacement_cost) 
FROM film) 
ORDER BY film.title 
ASC;

SELECT * 
FROM payment 
WHERE amount = ANY 
(SELECT MAX(amount) 
FROM payment);