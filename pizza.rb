crusts = ["regular", "stuffed", "pretzel", "bacon wrapped"]
meats = ["sausage", "pepperoni", "bacon", "ham", "beef"]
veggies = ["peppers", "banana peppers", "olives", "pineapple", "mushrooms"]
sauce = ["regular", "cheese", "ranch", "BBQ"]
special = ["three cheese blend", "toothpaste", "legos"]
size = ["Small", "Medium", "Large", "Extra large"]

order = Array.new

def cheese()
  if [true, false].sample == true
    return "extra cheese, "
  end
end

def double_pepperoni()
  if [true, false].sample == true
    return "double pepperoni, "
  end
end

def size_cost(size)
  if size[0]
    return 10.99
  elsif size[1]
    return 12.99
  elsif size[2]
    return 14.99
  elsif size[3]
    return 16.99
  end
end

def pizza_menu
  
end

def sides(order)
  puts "Select a side to add.\n1: Breadsticks\n2: Cheesesticks\n3: Chicken wings"
  print "> "
  select = gets.chomp.to_i
  if select == 1
    order.push ["Breadsticks", 6.50]
  elsif select == 2
    order.push ["Cheesesticks", 6.50]
  elsif select == 3
    order.push ["Wings", 6.50]
    print order
  else
  end
  #return to Menu
end

def deserts
  puts "Select a desert to add.\n1: Cookie\n2: Brownie"
  print "> "
  select = gets.chomp.to_i
  if select == 1
    order.push ["Cookie", 7.00]
  elsif select == 2
    order.push ["Brownie", 7.00]
  else
  end
  #return to Menu
end

def drinks
  puts "Select a soda to add. Sold as 2 liter bottles.\n1: Coke\n2: Pepsi"
  print "> "
  select = gets.chomp.to_i
  if select == 1
    order.push ["Coke (2L)", 2.99]
  elsif select == 2
    order.push ["Pepsi (2L)", 2.99]
  else
  end
  #return to Menu
end

def extras
  puts "Select an extra to add.\n1: Garlic Sauce\n2: Pizza Sauce\n3: Ranch Sauce\n4: Jalapeno peppers\n5: Anchovies"
  print prompt
  select = gets.chomp.to_i
  if select == 1
    order.push ""
  elsif select == 2
    order.push ""
  else
  end
  #return to Menu
end

#Menu
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
else
  puts "Enter a valid selection.\n> "
  select = gets.chomp
end

puts "\n\n"
#list items
def
  x = 0
  puts "$#{sprintf("%.02f", order[x][1])} #{order[x][0]}"
  subtotal = subtotal + order[x][1]
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
