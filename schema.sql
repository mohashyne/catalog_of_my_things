CREATE TABLE genres (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE music_albums (
    id INTEGER PRIMARY KEY,
    publish_date DATE NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    label_id INTEGER,
    genre_id INTEGER,
    author_id INTEGER,
    FOREIGN KEY (label_id) REFERENCES labels(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

