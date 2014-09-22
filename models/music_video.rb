require 'pg'
require 'sequel'
Sequel.connect("postgres://localhost:5432/pop_up_video_app")

# id              serial PRIMARY KEY,
# song_title      varchar(128) NOT NULL,
# band_id         integer REFERENCES bands(id),
# video_embed_url text NOT NULL

class MusicVideo < Sequel::Model
  many_to_one(:band)
end
