-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE release_dates (
  id SERIAL PRIMARY KEY,
  rel_date DATE NOT NULL
);

INSERT INTO release_dates (rel_date)
VALUES
('04-15-1997'), --1
('10-31-1975'), --2
('11-14-1995'), --3
('09-27-2018'), --4
('08-21-2001'); --5

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  alb_name TEXT
);

INSERT INTO albums (alb_name)
VALUES
('Middle of Nowhere'), --1
('A Night at the Opera'), --2
('Daydream'), --3
('A Star Is Born'), --4
('Silver Side Up'); --5

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date INTEGER REFERENCES release_dates(id) ON DELETE SET NULL,
  album INTEGER REFERENCES albums(id) ON DELETE SET NULL
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '1', '1'),
  ('Bohemian Rhapsody', 355, '2', '2'),
  ('One Sweet Day', 282, '3', '3'),
  ('Shallow', 216, '4', '4'),
  ('How You Remind Me', 223, '5', '5');

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  art_name TEXT
);

INSERT INTO artists (art_name)
VALUES 
('Hanson'), --1
('Queen'), --2
('Mariah Cary'), --3
('Boyz II Men'), --4
('Lady Gaga'), --5
('Bradley Cooper'), --6
('Nickelback'); --7

CREATE TABLE artist_to_song (
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id) ON DELETE SET NULL,
  artist_id INTEGER REFERENCES artists(id) ON DELETE SET NULL
);

INSERT INTO artist_to_song (song_id, artist_id)
VALUES
('1','1'),
('2','2'),
('3','3'),
('3','4'),
('4','5'),
('4','6'),
('5','7');

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  prod_name TEXT
);

INSERT INTO producers (prod_name)
VALUES
('Dust Brothers'), --1
('Stephen Lironi'), --2
('Roy Thomas Baker'), --3
('Walter Afanasieff'), --4
('Benjamin Rice'), --5
('Rick Parashar'); --6

CREATE TABLE producers_to_song (
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id) ON DELETE SET NULL,
  prod_id INTEGER REFERENCES producers(id) ON DELETE SET NULL
);

INSERT INTO producers_to_song (song_id, prod_id)
VALUES
('1','1'),
('1','2'),
('2','3'),
('3','4'),
('4','5'),
('5','6');

SELECT songs.id, title, duration_in_seconds AS seconds, alb_name, rel_date, art_name, prod_name FROM songs 
JOIN albums 
ON songs.album = albums.id 
JOIN release_dates 
ON songs.release_date = release_dates.id
JOIN artist_to_song
ON songs.id = artist_to_song.song_id
JOIN artists
ON artist_to_song.artist_id = artists.id
JOIN producers_to_song
ON songs.id = producers_to_song.song_id
JOIN producers
ON producers_to_song.prod_id = producers.id
;

-- Testing to make sure we are getting the same data and we are.
  --  id |       title       | seconds |       alb_name       |  rel_date  |    art_name    |     prod_name
  -- ----+-------------------+---------+----------------------+------------+----------------+-------------------
  --   1 | MMMBop            |     238 | Middle of Nowhere    | 1997-04-15 | Hanson         | Stephen Lironi
  --   1 | MMMBop            |     238 | Middle of Nowhere    | 1997-04-15 | Hanson         | Dust Brothers
  --   2 | Bohemian Rhapsody |     355 | A Night at the Opera | 1975-10-31 | Queen          | Roy Thomas Baker
  --   3 | One Sweet Day     |     282 | Daydream             | 1995-11-14 | Mariah Cary    | Walter Afanasieff
  --   3 | One Sweet Day     |     282 | Daydream             | 1995-11-14 | Boyz II Men    | Walter Afanasieff
  --   4 | Shallow           |     216 | A Star Is Born       | 2018-09-27 | Lady Gaga      | Benjamin Rice
  --   4 | Shallow           |     216 | A Star Is Born       | 2018-09-27 | Bradley Cooper | Benjamin Rice
  --   5 | How You Remind Me |     223 | Silver Side Up       | 2001-08-21 | Nickelback     | Rick Parashar
  -- (8 rows)