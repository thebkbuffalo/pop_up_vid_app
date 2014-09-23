require 'sinatra/base'
require 'pry'
require './models/band'
require './models/music_video'

class App < Sinatra::Base

# More will be done this weekend.  I want to get these videos to show damnit, and I will figure it out.

  ########################
  # Configuration
  ########################

  configure do
    enable :logging
    enable :method_override
    enable :sessions
  end

  before do
    logger.info "Request Headers: #{headers}"
    logger.warn "Params: #{params}"
  end

  after do
    logger.info "Response Headers: #{response.headers}"
  end

  ########################
  # Routes
  ########################

  get('/') do
    render(:erb, :index)
  end

  get('/bands/new') do
    render(:erb, :'bands/new')
  end

  get('/bands/:id') do
    @band = Band.find(id: params[:id])
    render(:erb, :'bands/show')
  end

  get('/bands') do
    @all_bands = Band.all
    render(:erb, :'bands/index')
  end

  get('/bands/:id/edit') do
    @band = Band.find(id: params[:id])
    @id = params["id"]
    render(:erb, :'bands/edit')
  end

  get('/bands/:id/music_videos/new') do
    @band = Band.find(id: params[:id])
    render(:erb, :'musicvideos/new')
  end


  get('/bands/:id/music_videos') do
    @band = Band.find(id: params[:id])
    render(:erb, :'musicvideos/show')
  end

  get('/musicvideos') do
    @all_videos = MusicVideo.all
    render(:erb, :'musicvideos/index')
  end




  ###############################
  # POST Routes
  ###########################

  put('/bands/:id/edit') do
    new_band = Band.find(id:params[:id])
    new_band.name = params["band"]["name"]
    new_band.genre = params["band"]["genre"]
    new_band.currently_relevant = params["band"]["currently_relevant"]
    new_band.save
    redirect to('/bands')
  end

  post('/bands') do
    new_band = params["band"]
    b = Band.new(new_band)
    b.save
    redirect to('/bands')
  end

# TODO -- FIX THIS SHIT!!!!!  Like for reals...fix this shit.
  post('/bands/:id/music_videos') do
    new_video = MusicVideo.create(song_title: params["music_video"]["song_title"], video_embed_url: params["music_video"]["video_embed_url"])
    band_id = params["band_id"]
    band = Band.find(id:band_id)
    redirect to('/musicvideos')
  end




end # ends class
