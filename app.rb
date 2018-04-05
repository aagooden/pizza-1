require 'sinatra'
require 'sinatra/reloader'
require_relative 'pizza.rb'
enable :sessions

get '/' do
  erb :index
end

get '/menu' do
  erb :menu
end
