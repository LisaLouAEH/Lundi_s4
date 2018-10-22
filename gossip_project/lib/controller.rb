#fichier et programmes nécéssaires :
require 'gossips.rb'
#----------------------------------


class ApplicationController < Sinatra::Base
    get '/' do
      erb :index 
    end
    get '/gossips/new/' do
      erb :new_gossips
    end
    post '/gossips/new/' do
      Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
      redirect '/'
    end
    
  end
