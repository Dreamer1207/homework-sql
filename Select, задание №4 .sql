SELECT g.name, COUNT(p.name) 
FROM genreperformer gp 
JOIN genre g ON gp.genre_id = g.id
JOIN performer p ON gp.performer_id = p.id
GROUP BY g.name;

SELECT COUNT(t.id) 
FROM track t 
LEFT JOIN album a ON t.album_id = a.id
WHERE year_release BETWEEN 2019 AND 2020;

SELECT a.name, AVG(t.duration) 
FROM track t
LEFT JOIN album a ON t.album_id = a.id
GROUP BY a.name;

SELECT p.name 
FROM performer p
WHERE p.name NOT IN (
	SELECT p.name
	FROM performer p
	JOIN performeralbum pa ON p.id = pa.performer_id
	JOIN album a ON pa.album_id = a.id
	WHERE year_release = 2020);

SELECT c.name collection, p.name performer 
FROM collectiontrack ct
JOIN collection c ON ct.collection_id = c.id
JOIN track t ON ct.track_id = t.id
JOIN album a ON t.album_id = a.id
JOIN performeralbum pa ON a.id = pa.album_id 
JOIN performer p ON pa.performer_id = p.id
WHERE p.name = 'Альянс';

SELECT DISTINCT a.name 
FROM album a
JOIN performeralbum pa ON a.id = pa.album_id  
JOIN performer p ON pa.performer_id = p.id
JOIN genreperformer gp ON p.id = gp.performer_id
JOIN genre g ON gp.genre_id = g.id
GROUP BY a.name, gp.performer_id
HAVING COUNT(gp.genre_id) > 1;

SELECT t.name 
FROM track t
LEFT JOIN collectiontrack ct ON t.id = ct.track_id
WHERE ct.track_id IS NULL;

SELECT p.name
FROM performer p
JOIN performeralbum pa ON p.id = pa.performer_id
JOIN album a ON pa.album_id = a.id
JOIN track t ON a.id = t.album_id
WHERE duration = (
	SELECT MIN(duration) FROM track);

SELECT a.name
FROM album a
JOIN track t ON a.id = t.album_id
GROUP BY a.id
HAVING COUNT(t.id) = (
	SELECT COUNT(id) FROM track 
	GROUP BY album_id
	ORDER BY 1
	LIMIT 1);
