require 'sinatra'
require 'sinatra/reloader'
require_relative 'pizza.rb'
enable :sessions

get '/' do
  session[:master_order] = Array.new
  erb :index
end

get '/menu' do
  erb :menu
end

get '/sides' do
  menu = menu_return
  erb :sides, locals: {menu:menu}
end

post '/add_to_order' do
  add_to_order(params[:selection], session[:master_order])
  redirect '/menu'
end
