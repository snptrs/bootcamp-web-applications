# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end
  
  post '/albums' do
    repo = AlbumRepository.new
    album = Album.new
    album.title = params[:title]
    album.release_year = params[:release_year]
    album.artist_id = params['artist_id']
    
    repo.create(album)
    return ''
  end
  
  get '/albums' do
    repo = AlbumRepository.new
    result_set = repo.all
    
    albums = []
    result_set.each do |album|
      title = album.title
      albums << title
    end
    return albums.join(",")
  end
  
  get '/albums/:id' do
    album_id = params[:id]
    repo = AlbumRepository.new
    album = repo.find(album_id)
    @album_title = album.title
    @release_year = album.release_year
    artist_id = album.artist_id
    
    repo = ArtistRepository.new
    artist = repo.find(artist_id)
    @artist_name = artist.name
    
    return erb(:album)
  end
  
  get '/artists' do
    repo = ArtistRepository.new
    result_set = repo.all
    
    artists = []
    result_set.each do |artist|
      artists << artist.name
    end
    return artists.join(", ")
  end
  
  post '/artists' do
    repo = ArtistRepository.new
    artist = Artist.new
    artist.name = params[:name]
    artist.genre = params[:genre]
    
    repo.create(artist)
    return ''
  end
end
