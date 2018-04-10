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

get '/custom_pizza' do
  debug_in_terminal
  puts """
  #{menu_return["custom"]}
  ****************************************************
  """
  erb :custom_pizza, locals: {menu:menu_return}
end

get '/sides' do
  debug_in_terminal
  category = params[:category]
  erb :sides, locals: {menu:menu_return, selection:category}
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

post '/add_custom' do
  debug_in_terminal
  input = convert_input(params[:selection])
  puts """
  input data: #{input}
  input class: #{input.class}
  ***************************************************
  """
  add_custom(input, params[:ingreds], session[:master_order])

  redirect '/menu'
end

get '/checkout' do
  cost = calc_total(session[:master_order])
  erb :cart, locals: {order:session[:master_order], cost: cost}
end

get '/delivery' do
  erb :deliver, locals: {order:session{:master_order}}
end

get '/pickup' do
  erb :pickup, locals: {order:session{:master_order}}
end

# This section used for debugging.
post '/placeholder' do
  debug_in_terminal
  erb :debug, locals: {params:params}
end
