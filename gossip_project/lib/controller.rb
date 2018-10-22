#fichier et programmes nécéssaires :
require 'gossips.rb'
#----------------------------------


class ApplicationController < Sinatra::Base
    get '/' do
      erb :index, locals: {gossips: Gossip.all, counter: Gossip.all.count}
    end

    get '/gossips/:id' do
      Gossip.all.each do |page|
        page = params[:id]
      end
      erb :read_gossip, locals: {gossip: Gossip.all, page: params[:id]}
    end

    get '/gossips/new/' do
      erb :new_gossips
    end

    post '/gossips/new/' do
      Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
      redirect '/'
    end
    
  end
