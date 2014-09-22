require 'sequel'
require_relative '../models/band'
require_relative '../models/music_video'

b1 = Band.create({name: "Tool", genre: "metal", currently_relevant: true})
b2 = Band.create({name: "Jibbs", genre: "rap", currently_relevant: false})
b3 = Band.create({name: "Toto", genre: "pop", currently_relevant: false})

m1 = MusicVideo.create({song_title: "Sober", video_embed_url: "hglVqACd1C8"})
m2 = MusicVideo.create({song_title: "Chain Hang Low", video_embed_url: "4SBN_ikibtg"})
m3 = MusicVideo.create({song_title: "Africa", video_embed_url: "FTQbiNvZqaY"})


b1.add_music_video(m1)
b2.add_music_video(m2)
b3.add_music_video(m3)
