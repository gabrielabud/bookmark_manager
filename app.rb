require 'sinatra/base'
require './models/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :'links/index'
  end
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end
end
