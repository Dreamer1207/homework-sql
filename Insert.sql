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
VALUES(1, 'Полина Гагарина');

INSERT INTO performer(id, name)
VALUES(2, 'Альянс');

INSERT INTO performer(id, name)
VALUES(3, 'Ария');

INSERT INTO performer(id, name)
VALUES(4, 'Дельфин');

INSERT INTO performer(id, name)
VALUES(5, 'Елена Ваенга');

INSERT INTO performer(id, name)
VALUES(6, 'Михаил Круг');

INSERT INTO performer(id, name)
VALUES(7, 'Борис Гребенщиков');

INSERT INTO performer(id, name)
VALUES(8, 'Моральный кодекс');


INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(1, 1, 1);

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(2, 1, 2);
--
INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(3, 1, 5);
--
INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(4, 2, 2);

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(5, 2, 7);

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(6, 2, 8);

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(7, 3, 3);

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(8, 4, 4);

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(9, 5, 5);

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(10, 5, 6);


INSERT INTO album(id, name, year_release)
VALUES(1, 'Обезоружена', '2017');

INSERT INTO album(id, name, year_release)
VALUES(2, 'На Заре', '2019');

INSERT INTO album(id, name, year_release)
VALUES(3, 'Кровь за кровь', '1991');

INSERT INTO album(id, name, year_release)
VALUES(4, 'Звезда', '2004');

INSERT INTO album(id, name, year_release)
VALUES(5, 'Клавиши', '2009');

INSERT INTO album(id, name, year_release)
VALUES(6, 'Посвящение', '2002');

INSERT INTO album(id, name, year_release)
VALUES(7, 'Время N', '2018');

INSERT INTO album(id, name, year_release)
VALUES(8, 'Славянские танцы', '2007');


INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(1, 1, 1);

INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(2, 2, 2);
--
INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(3, 3, 3);

INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(4, 4, 4);
--
INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(5, 5, 5);

INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(6, 6, 6);

INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(7, 7, 7);

INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(8, 8, 8);


INSERT INTO track(id, album_id, name, duration)
VALUES(1, 1, 'Спектакль окончен', '05:30');

INSERT INTO track(id, album_id, name, duration)
VALUES(2, 1, 'Кукушка', '04:12');

INSERT INTO track(id, album_id, name, duration)
VALUES(3, 2, 'На Заре', '05:45');

INSERT INTO track(id, album_id, name, duration)
VALUES(4, 3, 'Прощай норфолк!', '05:20');

INSERT INTO track(id, album_id, name, duration)
VALUES(5, 3, 'Антихрист', '05:04');

INSERT INTO track(id, album_id, name, duration)
VALUES(6, 4, 'Серебро', '04:01');

INSERT INTO track(id, album_id, name, duration)
VALUES(7, 4, 'Весна', '04:51');

INSERT INTO track(id, album_id, name, duration)
VALUES(8, 4, 'Романс', '03:48');

INSERT INTO track(id, album_id, name, duration)
VALUES(9, 5, 'Не Любил', '04:09');

INSERT INTO track(id, album_id, name, duration)
VALUES(10, 5, 'Клавиши', '03:45');

INSERT INTO track(id, album_id, name, duration)
VALUES(11, 6, 'Магадан', '4:26');

INSERT INTO track(id, album_id, name, duration)
VALUES(12, 6, 'Приходите в мой дом', '3:41');

INSERT INTO track(id, album_id, name, duration)
VALUES(13, 7, 'На ржавом ветру', '3:01');

INSERT INTO track(id, album_id, name, duration)
VALUES(14, 8, 'В твоих глазах', '3:54');

INSERT INTO track(id, album_id, name, duration)
VALUES(15, 8, 'Первый снег', '4:00');




SELECT * FROM track;
SELECT * FROM PerformerAlbum;
SELECT * FROM GenrePerformer;


DELETE FROM track
WHERE id = ;

UPDATE performer  
SET name = 'Борис Гребенщиков'
WHERE id = 7;