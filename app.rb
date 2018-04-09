require 'sinatra'
require 'sinatra/reloader'
require_relative 'pizza.rb'
enable :sessions

get '/' do
  if session[:master_order].class == NilClass
    session[:master_order] = {"items" => [], "price" => []}
  end
  debug_in_terminal
  erb :index
end

get '/menu' do
  debug_in_terminal
  erb :menu, locals: {order:session[:order]}
end

get '/sides' do
  menu = menu_return
  erb :sides, locals: {menu:menu}
end

post '/add_to_order' do
  debug_in_terminal
  input = convert_input(params[:selection])
  puts """
  input data: #{input}
  input class: #{input.class}
  ***************************************************
  """
  add_to_order(input, session[:master_order])

  redirect '/menu'
end

# This section used for debugging.
post '/placeholder' do
  debug_in_terminal
  erb :debug, locals: {params:params}
end
