require 'pg'
require 'sequel'
Sequel.connect("postgres://localhost:5432/pop_up_video_app")


# id                 serial PRIMARY KEY,
# name               varchar(256) NOT NULL,
# genre              varchar(128) NOT NULL
class Band < Sequel::Model
  one_to_many(:music_videos)
end
