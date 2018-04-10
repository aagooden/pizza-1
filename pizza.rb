master_order = Array.new

 def debug_in_terminal
   puts """
   ***************************************************
   Session order class: #{session[:master_order].class}
   Session order data: #{session[:master_order]}
   Current params: #{params}
   ***************************************************
   """
 end

def convert_input(input)
  # Converts params from ERB (string) into a usable array.
  # ["item name", 5.99(cost), quantity, ingreds if custom_pizza]

  if input[0].include? ","
    b = input.shift.split(",")
    b[1] = b[1].to_f
    input.unshift b[1]
    input.unshift b[0]
  end

  input[1] = input[1].to_f #This index will be used to show cost of item.
  input[2] = input[2].to_i #quanity of item
  return input
end

def add_to_order(params, order)
  # push the item into a master order hash; item => [item name, [array of ingredients], price];
  # iterate over master hash to determine price for subtotal
  # order = { "items" => [item1, item2, item3], "price" = [price1, price2, price3], "quantity" => [quanity1, quanity2, quantity3]}

  # order["items"].push params[0]
  # order["price"].push params[1]
  # order["quantity"] << pararms[2]
  change = false
  
  order.each do |index|
    if params[0] === index[0]
      index[2] += params[2]
      change = true
    end
  end

  if change == false
    order.push params
  end

  return order
end

def menu_return()
  menu = {
    "pizza" => {
      "pepperoni" => 5.00,
      "cheese" => 4.00,
      "supreme" => 10.00,
    },
    "size" => {
      "small" => 9.99,
      "medium" => 12.24,
      "large" => 16.99,
      "extra large" => 18.74
    },
    "custom" => {
      "meats" => ["pepperoni","sausage", "italian sausage", "bacon", "ham", "beef"],
      "veggies" => ["peppers", "banana peppers", "olives", "pineapple", "mushrooms"],
      "crusts" => ["regular", "stuffed", "pretzel", "bacon wrapped"],
      "sauce" => ["regular", "cheese", "ranch", "BBQ"],
      "special" => ["three cheese blend", "toothpaste", "legos"],
    },
    "sides" => {
      "Cheesesticks" => 6.50,
      "Breadsticks" => 6.50,
      "Wings" => 8.00
    },
    "drinks" => {
      "Coke (2L)" => 2.99,
      "Pepsi (2L)" => 2.99
    },
    "deserts" => {
      "Cookie" => 7.00,
      "Brownie" => 7.00
    },
    "extras" => {
      "Garlic Sauce" => 0.50,
      "Pizza Sauce" => 0.50,
      "Ranch Sauce" => 0.50,
      "Jalapeno peppers" => 0.50,
      "Anchovies" => 0.50
    },
  }
  return menu
end

=begin
Nest hashes of hashes. Iterate over it in erb to display options; use this for multiple pages. Start with sides for simplicity and build up from there.
=end

=begin
def calc_total(params)
  money_hash = {
    "delivery_fee" => 0.0,
    "subtotal" => 0.0,
    "tax" => 0.0,
    "total" => 0.0,
    "tip" => 0.0
  }

  #Cost
  subtotal = 0.00.to_f
  tax_rate = 0.06
  subtotal = subtotal.to_f
  delivery_fee = 2.50

  order.length times do
    puts "$#{sprintf("%.02f", order[counter][0])} #{order[counter][1]}"
    subtotal += order[counter][0]
  end

  puts "\nDelivery Fee: $#{sprintf("%.02f", delivery_fee)}"
  puts "Subtotal: $#{sprintf("%.02f", subtotal)}"
  puts "Tax: $#{sprintf("%.02f", subtotal * tax_rate)}"
  puts "Total: $#{sprintf("%.02f", subtotal * (1 + tax_rate) + delivery_fee)}"
  puts "\nSuggested Tip: $#{sprintf("%.02f", subtotal * 0.10)}"

  return money_hash
end
=end
