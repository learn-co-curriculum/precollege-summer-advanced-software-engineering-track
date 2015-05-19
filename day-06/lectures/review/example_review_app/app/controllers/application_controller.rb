require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  post '/list' do
    @list = List.find_by(:name => params[:list_name])
    if !@list
      @list = List.create(:name => params[:list_name])
    end
    erb :list
  end

  get '/list' do
    erb :list
  end

  post '/add_item' do
    @item = Item.create(:name => params[:item_name], :list_id => params[:list_name])
    redirect '/'
  end

  post '/view_list' do
    @list = List.find_by(:id => params[:list_id])
    erb :view_list
  end


end