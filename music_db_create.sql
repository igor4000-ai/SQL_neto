CREATE TABLE IF NOT EXISTS genres (
	genres_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
	name VARCHAR(100) NOT NULL 
);

COMMENT ON TABLE genres IS 'Музыкальные жанры';

CREATE TABLE IF NOT EXISTS artists (
	artists_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
	name VARCHAR(100) NOT NULL 
);

COMMENT ON TABLE artists IS 'Исполнители (музыканты, группы)';

CREATE TABLE IF NOT EXISTS albums (
	albums_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title VARCHAR(200) NOT NULL, 
	release_year INTEGER 
);

COMMENT ON TABLE albums IS 'Музыкальные альбомы';

CREATE TABLE IF NOT EXISTS tracks (
	tracks_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	albums_id INTEGER NOT NULL,
	title VARCHAR(200) NOT NULL,
	duration INTEGER CHECK (duration > 0),
	FOREIGN KEY (albums_id) REFERENCES albums(albums_id) ON DELETE CASCADE 
);

COMMENT ON TABLE tracks IS 'Треки (песни)';

CREATE TABLE IF NOT EXISTS collections (
	collections_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	release_year INTEGER
);

COMMENT ON TABLE collections IS 'Коллекции и сборники';

CREATE TABLE IF NOT EXISTS  artists_genres (
    genres_id INTEGER NOT NULL,
    artists_id INTEGER NOT NULL,
    PRIMARY KEY (artists_id, genres_id),
    FOREIGN KEY (artists_id) REFERENCES artists(artists_id) ON DELETE CASCADE,
    FOREIGN KEY (genres_id) REFERENCES genres(genres_id) ON DELETE CASCADE
);

COMMENT ON TABLE artists_genres IS 'Связь исполнителей с жанрами';

CREATE TABLE IF NOT EXISTS  artists_albums (
    albums_id INTEGER NOT NULL,
    artists_id INTEGER NOT NULL,
    PRIMARY KEY (artists_id, albums_id),
    FOREIGN KEY (artists_id) REFERENCES artists(artists_id) ON DELETE CASCADE,
    FOREIGN KEY (albums_id) REFERENCES albums(albums_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS collections_tracks (
	collections_id INTEGER NOT NULL,
	tracks_id INTEGER NOT NULL,
	PRIMARY KEY (collections_id, tracks_id),
	FOREIGN KEY (collections_id) REFERENCES collections(collections_id) ON DELETE CASCADE,
	FOREIGN KEY (tracks_id) REFERENCES tracks(tracks_id) ON DELETE CASCADE
);


