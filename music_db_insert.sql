INSERT INTO albums (title, release_year) 
VALUES 
    ('Акустический альбом', 2018),          
    ('Колхозный панк', 2019),               
    ('Hajime, pt. 1', 2019),                
    ('Чёрный альбом', 2020);                

INSERT INTO artists (name) 
VALUES 
    ('Король и Шут'),
    ('Сектор Газа'),
    ('MiyaGi & Эндшпиль'),
    ('КИНО');

INSERT INTO genres (name) 
VALUES 
    ('Панк-рок'),
    ('Хоррор-панк'),
    ('Хип-хоп'),
    ('Пост-панк');

INSERT INTO collections (name, release_year ) 
VALUES 
    ('Дискотека 70-80-90-х', 2018),
    ('Лучшие русские хиты 80-90-х', 2020),
    ('The Best Of Rapsody 90-х', 2018),
    ('Back To The 80''s', 2021);            

INSERT INTO tracks (albums_id, title, duration) 
VALUES 
    (1, 'Give It Away', 160),
    (1, 'Кукла Колдуна', 201),
    (1, 'Наблюдатель', 280),
    (2, 'Колхозный панк', 217),
    (2, 'Там Ревели Горы', 210),
    (3, 'My Home', 194),
    (4, 'I''m OK', 281),
    (4, 'Звезда', 274);

INSERT INTO artists_genres (artists_id, genres_id) VALUES
    (1, 1),  
    (1, 2),  
    (2, 1),  
    (3, 3),  
    (4, 4);  

INSERT INTO artists_albums (albums_id, artists_id) VALUES
    (1, 1),  
    (2, 2),  
    (3, 3),  
    (4, 4);  

INSERT INTO collections_tracks (collections_id, tracks_id) VALUES
    (1, 1),  
    (1, 2),  
    (2, 3), 
    (3, 4),  
    (3, 5),
	(3, 6),
	(4, 7);

INSERT INTO tracks (albums_id, title, duration) 
VALUES 
    (1, 'mysels', 150),
    (1, 'by myself', 215),
    (1, 'bemy self', 270),
    (2, 'myself by', 245),
    (2, 'by myself by', 210),
    (3, 'beemy', 194),
    (4, 'premyne', 281),
    (4, 'Звезда', 274),
    (1, 'my own', 150),
    (1, 'own my', 190),
    (1, 'my', 150),
    (2, 'oh my god', 214);
    
    
    
    
    
    
    
    
    
    
    

