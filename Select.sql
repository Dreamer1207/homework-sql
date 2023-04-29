SELECT name, year_release FROM album
WHERE year_release = 2018;

SELECT name, duration FROM track
ORDER BY duration DESC; 

SELECT name FROM track
WHERE duration >= 3.5;

SELECT name FROM collection
WHERE year_release BETWEEN 2018 AND 2020;

SELECT name FROM performer
WHERE NOT name LIKE '%% %%';

SELECT name FROM track
WHERE name LIKE '%мой%';