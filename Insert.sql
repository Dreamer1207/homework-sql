-- Жанр
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

-- Исполнитель
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
VALUES(7, 'Noize MC');

INSERT INTO performer(id, name)
VALUES(8, 'Сплин');

-- Жанр-исполнитель
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
VALUES(5, 2, 8);

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(6, 3, 3);

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(7, 4, 4);

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(8, 4, 7);

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(9, 5, 5);

INSERT INTO genreperformer(id, genre_id, performer_id)
VALUES(10, 5, 6);

-- Альбом
INSERT INTO album(id, name, year_release)
VALUES(1, 'Шоу "Обезоружена"', '2019');

INSERT INTO album(id, name, year_release)
VALUES(2, 'На заре', '1987');

INSERT INTO album(id, name, year_release)
VALUES(3, 'Штиль', '2002');

INSERT INTO album(id, name, year_release)
VALUES(4, 'Звезда', '2004');

INSERT INTO album(id, name, year_release)
VALUES(5, 'Клавиши', '2009');

INSERT INTO album(id, name, year_release)
VALUES(6, 'Посвящение', '2002');

INSERT INTO album(id, name, year_release)
VALUES(7, 'No Comments', '2018');

INSERT INTO album(id, name, year_release)
VALUES(8, 'Гранатовый альбом', '1998');

-- Исполнитель-альбом
INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(1, 1, 1);

INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(2, 2, 2);

INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(3, 3, 3);

INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(4, 4, 4);

INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(5, 5, 5);

INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(6, 6, 6);

INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(7, 7, 7);

INSERT INTO performeralbum(id, performer_id, album_id)
VALUES(8, 8, 8);

-- Трек
INSERT INTO track(id, album_id, name, duration)
VALUES(1, 1, 'Спектакль окончен', '05:30');

INSERT INTO track(id, album_id, name, duration)
VALUES(2, 1, 'Кукушка', '04:12');

INSERT INTO track(id, album_id, name, duration)
VALUES(3, 2, 'На заре', '05:37');

INSERT INTO track(id, album_id, name, duration)
VALUES(4, 3, 'Потерянный рай', '05:37');

INSERT INTO track(id, album_id, name, duration)
VALUES(5, 3, 'Дай руку мне', '05:05');

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
VALUES(13, 7, 'В темноте', '3:27');

INSERT INTO track(id, album_id, name, duration)
VALUES(14, 8, 'Орбит без сахара', '2:17');

INSERT INTO track(id, album_id, name, duration)
VALUES(15, 8, 'Выхода нет', '3:47');

-- Сборник
INSERT INTO collection(id, name, year_release)
VALUES(1, 'Top 100 Soundtracks (2023)', '2023');

INSERT INTO collection(id, name, year_release)
VALUES(2, 'Как Это Было... Хиты Времен СССР (2023)', '2023');

INSERT INTO collection(id, name, year_release)
VALUES(3, 'Мой Русский Рок (2023)', '2023');

INSERT INTO collection(id, name, year_release)
VALUES(4, 'Дельфин - Лучшие Песни', '2012');

INSERT INTO collection(id, name, year_release)
VALUES(5, 'Две звезды (Сборник песен любимых исполнителей)', '2012');

INSERT INTO collection(id, name, year_release)
VALUES(6, '50 лучших песен (Большая коллекция шансона)', '2013');

INSERT INTO collection(id, name, year_release)
VALUES(7, 'Noize MC - XV (2019). Сборник [MP3]', '2019');

INSERT INTO collection(id, name, year_release)
VALUES(8, 'Сборник Русский рок. 100 лучших хитов (2019 / MP3)', '2019');

-- Сборник-трек
INSERT INTO collectiontrack(id, collection_id, track_id)
VALUES(1, 1, 2);

INSERT INTO collectiontrack(id, collection_id, track_id)
VALUES(2, 1, 3);

INSERT INTO collectiontrack(id, collection_id, track_id)
VALUES(3, 2, 3);

INSERT INTO collectiontrack(id, collection_id, track_id)
VALUES(4, 3, 4);

INSERT INTO collectiontrack(id, collection_id, track_id)
VALUES(5, 4, 7);

INSERT INTO collectiontrack(id, collection_id, track_id)
VALUES(6, 5, 10);

INSERT INTO collectiontrack(id, collection_id, track_id)
VALUES(7, 6, 11);

INSERT INTO collectiontrack(id, collection_id, track_id)
VALUES(8, 6, 12);

INSERT INTO collectiontrack(id, collection_id, track_id)
VALUES(9, 7, 13);

INSERT INTO collectiontrack(id, collection_id, track_id)
VALUES(10, 8, 15);