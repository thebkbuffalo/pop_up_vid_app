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
    @id = @band.id.to_s
    render(:erb, :'music_videos/new')
  end


  get('/bands/:id/music_videos') do
    @band = Band.find(id: params[:id])
    @mv = MusicVideo.find(id: params[:id])
    render(:erb, :'music_videos/show')
  end

  get('/music_videos') do
    @all_videos = MusicVideo.all
    render(:erb, :'music_videos/index')
  end




  ###############################
  # POST Routes
  ###########################

  put('/bands/:id/edit') do
    new_band = Band.find(id:params[:id])
    new_band.name = params["band"]["name"]
    new_band.genre = params["band"]["genre"]
    new_band.save
    redirect to('/bands')
  end

  post('/bands') do
    new_band = params["band"]
    b = Band.new(new_band)
    b.save
    redirect to('/bands')
  end


  post('/music_videos') do
    new_video = MusicVideo.create(params["video"])
    band_id = params["band_id"]
    band = Band.find(id:band_id)
    band.add_music_video(new_video)
    redirect to('/music_videos')
  end

# TODO get these working damnit!!!
  delete('/bands/:id') do
    @band = Band.find(id: params[:id])
    @band.delete
    redirect to('/bands')
  end

  delete('/bands/:id/music_videos') do
    @mv = MusicVideo.find(id: params[:id])
    @mv.delete
    redirect to('/music_videos')
  end




end # ends class
