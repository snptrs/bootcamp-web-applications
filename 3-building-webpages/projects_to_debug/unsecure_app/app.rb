require 'sinatra/base'
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  post '/hello' do
    @name = params[:name]
    if @name.length > 50
      status 400
      return 'Name must be less than 50 characters'
    end
    
    @name.gsub!(/[&\/#,+()$~%.^'":*?!<>{}]=/, '')
    return erb(:hello)
  end
end
