crusts = ["regular", "stuffed", "pretzel", "bacon wrapped"]
meats = ["sausage", "pepperoni", "bacon", "ham", "beef"]
veggies = ["peppers", "banana peppers", "olives", "pineapple", "mushrooms"]
sauce = ["regular", "cheese", "ranch", "BBQ"]
special = ["three cheese blend", "toothpaste", "legos"]
size = ["Small", "Medium", "Large", "Extra large"]

order = [1]

# def size_cost(size)
#   if size[0]
#     return 9.99
#   elsif size[1]
#     return 12.24
#   elsif size[2]
#     return 16.99
#   elsif size[3]
#     return 18.74
#   end
# end

def pizza_menu
  puts "Select an option.\n1: Pepperoni Pizza\n2: Cheese Pizza\n3: Supreme Pizza\n4: Meat Lover's Pizza\n5: Custom Pizza"
  print "> "
  select = gets.chomp.to_i

  #build pizza
  #[price, name, size, toppings]

  if select == 1
    puts "What size?\n1: Small\n2: Medium\n3: Large\n4: Extra Large"
  elsif select == 2
    order.push
  elsif select == 3
    #
  elsif select == 4
    #
  elsif select == 5
    #Custom pizza Menu
    #add $1.00 for each additional topping
  else
  end
  main_menu
end

def sides(order)
  puts "Select a side to add.\n1: Breadsticks\n2: Cheesesticks\n3: Chicken wings"
  print "> "
  select = gets.chomp.to_i
  if select == 1
    order.push [6.50, "Breadsticks"]
  elsif select == 2
    order.push [6.50, "Cheesesticks", 6.50]
  elsif select == 3
    order.push [8.00, "Wings"]
  else
  end
  main_menu
end

def deserts
  puts "Select a desert to add.\n1: Cookie\n2: Brownie"
  print "> "
  select = gets.chomp.to_i
  if select == 1
    order.push [7.00, "Cookie"]
  elsif select == 2
    order.push [7.00, "Brownie"]
  else
  end
  main_menu
end

def drinks
  puts "Select a soda to add. Sold as 2 liter bottles.\n1: Coke\n2: Pepsi\n3: Root Beer"
  print "> "
  select = gets.chomp.to_i
  if select == 1
    order.push [2.99, "Coke (2L)"]
  elsif select == 2
    order.push [2.99, "Pepsi (2L)"]
  elsif select == 3
    order.push [2.99, "Root Beer"]
  else
  end
  main_menu
end

def extras()
  puts "Select an extra to add.\n1: Garlic Sauce\n2: Pizza Sauce\n3: Ranch Sauce\n4: Jalapeno peppers\n5: Anchovies"
  print prompt
  select = gets.chomp.to_i
  if select == 1
    order.push [0.49, "Garlic Sauce"]
  elsif select == 2
    order.push [0.49, "Pizza Sauce"]
  elsif select == 3
    order.push [0.49, "Ranch Sauce"]
  elsif select == 4
    order.push [0.49, "Jalapeno Peppers"]
  elsif select == 5
    order.push [0.49, "Anchovies"]
  else
  end
  main_menu
end

def main_menu(order)
puts "What would you like to add to purchase? (Enter number)\n1: Pizza\n2: Sides\n3: Deserts\n4: Drinks\n5: Extras"
print "> "
select = gets.chomp.to_i

  if select == 1
    pizza_menu
  elsif select == 2
    sides(order)
  elsif select == 3
    deserts
  elsif select == 4
    drinks
  elsif select == 5
    extras
  else main_menu
  end
end

main_menu(order)

puts "\n\n"
#list items[]
counter = 0
for counter in (0..order.length)
  puts "$#{sprintf("%.02f", order[counter][1])} #{order[counter][0]}"
  subtotal = subtotal + order[counter][1]
  puts "\n\n"
end

#Cost
subtotal = 0.00.to_f
tax_rate = 0.06
subtotal = subtotal.to_f
delivery_fee = 2.50
puts "Delivery Fee: $#{sprintf("%.02f", delivery_fee)}"
puts "Subtotal: $#{sprintf("%.02f", subtotal)}"
puts "Tax: $#{sprintf("%.02f", subtotal * tax_rate)}"
puts "Total: $#{sprintf("%.02f", subtotal * (1 + tax_rate) + delivery_fee)}"
puts "\nSuggested Tip: #{sprintf("%.02f", subtotal * 0.10)}"
