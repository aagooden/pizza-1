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
  # push the item into a master order hash; item => [item name, price, quanity, [array of ingredients]]
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

def add_custom(params, ingreds, order)
  params << ingreds
  ingreds.length.times do
    params[1] += 1
  end
  order.push params
  return order
end

def remove(index, order)
  order = order.delete_at(index)
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

def calc_total(params)
  money_hash = {
    "subtotal" => 0.0,
    "tax" => 0.0,
    "total" => 0.0,
  }

  tax_rate = 0.06
  params.each do |item|
    money_hash["subtotal"] += (item[1] * item[2])
  end
  money_hash["tax"] = money_hash["subtotal"] * tax_rate
  money_hash["total"] = money_hash["tax"] + money_hash["subtotal"]

  return money_hash
end
