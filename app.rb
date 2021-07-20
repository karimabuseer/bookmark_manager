require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark_list.rb'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  before do
    @bookmarklist = BookmarkList.instance
  end

  get '/' do
    erb(:index)
  end

  get '/bookmark' do
    erb(:bm) 
  end
end