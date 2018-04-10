require 'sinatra'
require 'sinatra/reloader'
require_relative 'pizza.rb'
enable :sessions

get '/' do
  if session[:master_order].class == NilClass
    session[:master_order] = Array.new
  end
  debug_in_terminal
  erb :index
end

get '/menu' do
  debug_in_terminal
  erb :menu, locals: {menu:menu_return, order:session[:master_order]}
end

get '/pizza' do
  erb :pizza, locals: {menu:menu_return}
end

get '/custom_pizza' do
  erb :custom_pizza, locals: {menu:menu_return}
end

post '/sides_selection' do
  selection = params[:selection]
  redirect '/sides?menu_select=' + selection
end

get '/sides' do
  menu_select = params[:menu_select]
  erb :sides, locals: {menu:menu_return, selection:menu_select}
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
