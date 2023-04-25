INSERT INTO genre(id, name)
VALUES(1, 'Поп');

INSERT INTO genre(id, name)
VALUES(2, 'Рок');

INSERT INTO genre(id, name)
VALUES(3, 'Хеви-метал');

INSERT INTO genre(id, name)
VALUES(4, 'Хип-хоп');

INSERT INTO genre(id, name)
VALUES(5, 'Шансон');


INSERT INTO performer(id, name)
VALUES(1, 'Палина Гагарина');

INSERT INTO performer(id, name)
VALUES(2, 'Альянс');

INSERT INTO performer(id, name)
VALUES(3, 'Ария');

INSERT INTO performer(id, name)
VALUES(4, 'Дельфин');

INSERT INTO performer(id, name)
VALUES(5, 'Елена Ваенга');

INSERT INTO performer(id, name)
VALUES(6, 'Баста');

INSERT INTO performer(id, name)
VALUES(7, 'Григорий Лепс');

INSERT INTO performer(id, name)
VALUES(8, 'Моральный кодекс');


INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(1, '1', '1');

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(2, '1', '5');
--
INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(3, '1', '6');

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(4, '1', '7');
--
INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(5, '2', '2');

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(6, '2', '6');

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(7, '2', '7');

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(8, '2', '8');

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(9, '3', '3');

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(10, '4', '4');

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(11, '4', '6');

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(12, '5', '5');

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(13, '5', '7');

SELECT * FROM Genre;
SELECT * FROM Performer;
SELECT * FROM GenrePerformer;

--DELETE FROM genreperformer;