CREATE DATABASE pop_up_video_app;

\c pop_up_video_app;

DROP TABLE IF EXISTS bands CASCADE;
DROP TABLE IF EXISTS music_videos CASCADE;

CREATE TABLE bands (
  id                 serial PRIMARY KEY,
  name               varchar(256) NOT NULL,
  genre              varchar(128) NOT NULL
);

CREATE TABLE music_videos (
  id              serial PRIMARY KEY,
  song_title      varchar(128) NOT NULL,
  band_id         integer REFERENCES bands(id),
  video_embed_url text NOT NULL
);
