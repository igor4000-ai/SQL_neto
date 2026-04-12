--Название и продолжительность самого длительного трека.

SELECT title, duration
FROM tracks
WHERE duration = (SELECT MAX(duration) FROM tracks);

--Название треков, продолжительность которых не менее 3,5 минут.

SELECT t.title, t.duration
FROM tracks t
WHERE duration >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.

SELECT c.name, c.release_year
FROM collections c 
WHERE c.release_year BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова.

SELECT a.name
FROM artists a 
WHERE a.name NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my».

SELECT t.title 
FROM tracks t 
WHERE t.title ILIKE 'my %' 
OR t.title ILIKE '% my'
OR t.title ILIKE '% my %'
OR t.title ILIKE 'my';

--Количество исполнителей в каждом жанре.

SELECT g.name AS Жанр, COUNT(ag.artists_id) AS Количество_исполнителей
FROM genres g
LEFT JOIN artists_genres ag ON g.genres_id = ag.genres_id
GROUP BY g.genres_id, g.name
ORDER BY g.name;

--Количество треков, вошедших в альбомы 2019–2020 годов.

SELECT count(DISTINCT t.title) Количество 
FROM tracks t  
JOIN albums a ON t.albums_id = a.albums_id
WHERE a.release_year BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому.

SELECT a.title AS Альбом, ROUND(AVG(t.duration), 2) AS Средняя_длительность
FROM albums a
JOIN tracks t ON a.albums_id = t.albums_id
GROUP BY a.albums_id, a.title;

--Все исполнители, которые не выпустили альбомы в 2020 году.

SELECT DISTINCT a.name
FROM artists a
WHERE a.name NOT IN (
    SELECT DISTINCT a2.name
    FROM artists a2
    JOIN artists_albums aa ON a2.artists_id = aa.artists_id
    JOIN albums al ON aa.albums_id = al.albums_id
    WHERE al.release_year != 2020
);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).

SELECT DISTINCT c.name
FROM collections c
JOIN collections_tracks ct ON c.collections_id = ct.collections_id
JOIN tracks t ON ct.tracks_id = t.tracks_id
JOIN albums a ON t.albums_id = a.albums_id
JOIN artists_albums aa ON a.albums_id = aa.albums_id   
JOIN artists ar ON aa.artists_id = ar.artists_id       
WHERE ar.name = 'КИНО';

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.

SELECT DISTINCT a.title
FROM albums a
JOIN artists_albums aa ON a.albums_id = aa.albums_id
WHERE aa.artists_id IN (
    SELECT artists_id
    FROM artists_genres
    GROUP BY artists_id
    HAVING COUNT(genres_id) > 1
);

--Наименования треков, которые не входят в сборники.

SELECT t.title 
FROM tracks t 
LEFT JOIN collections_tracks ct ON t.tracks_id = ct.tracks_id  
WHERE ct.tracks_id IS NULL;   

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, 
--— теоретически таких треков может быть несколько.

SELECT a.name, t.duration
FROM artists a
JOIN artists_albums aa ON a.artists_id = aa.artists_id
JOIN tracks t ON aa.albums_id = t.albums_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks)
ORDER BY t.duration;

--Названия альбомов, содержащих наименьшее количество треков.

SELECT a.title, COUNT(t.tracks_id) AS track_count
FROM albums a
JOIN tracks t ON a.albums_id = t.albums_id
GROUP BY a.albums_id, a.title
HAVING COUNT(t.tracks_id) = (
    SELECT MIN(track_count)
    FROM (
        SELECT COUNT(*) AS track_count
        FROM tracks
        GROUP BY albums_id
    ) AS counts
);












