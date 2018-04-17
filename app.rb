# Overall, I would like to see some more aesthetically pleasing background with Open Sans or some other nice looking font.
# I would like to create a bit more spacing between buttons.
# Change the nav bar looking menu and have each button on a new line.

require 'sinatra'
# require 'sinatra/reloader'
require_relative 'pizza.rb'
enable :sessions

get '/' do
  erb :index
end

get '/menu' do
  if session[:master_order].class == NilClass
    session[:master_order] = Array.new
  end
  # This method just prints out the class, data, then the params it woud return in Sinatra to the terminal.
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

  selection = {
    "name_price" => params[:name_price],
    "qty" => params[:quantity].to_i,
    "size_price" => params[:size_price],
  }

  add_to_order(selection, session[:master_order])

  redirect '/menu'
end

post '/add_custom' do
  debug_in_terminal

  selection = {
    "item_name" => params[:item_name],
    # "price" => params[:price].to_f,
    "qty" => params[:quantity].to_i,
    "size_price" => params[:size_price],
    "ingreds" => params[:ingreds]
  }

  add_custom(selection, session[:master_order])

  redirect '/menu'
end

# Removes the order from the list of orders
get '/remove' do
  session[:master_order] = remove(params[:item].to_i, session[:master_order])
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
