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

def add_to_order(params, order)
  name_price = params["name_price"].split(",")
  if params["size_price"] != nil
    size_price = params["size_price"].split(",")
    size = size_price[0]
  end

  item_final = {
    "item_name" => name_price[0],
    "price" => name_price[1].to_f,
    "size" => size,
    "qty" => params["qty"].to_i
  }

  if size_price != nil
    item_final["price"] += size_price[1].to_f
    item_final["item_name"] = item_final["size"].capitalize + " " + item_final["item_name"]
  end

  item_final.delete_if {|key, value| value == nil}

  order.push item_final
  return order
end

def add_custom(params, order)
  if params["ingreds"] == nil
    params["ingreds"] = []
  end

  size_price = params["size_price"].split(",")
  params["size"] = size_price[0]
  params["price"] = size_price[1].to_f + (params["ingreds"].length - 1)
  params["item_name"] = params["size"] + " " + params["item_name"]
  params.delete("size_price")

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
    money_hash["subtotal"] += (item["qty"] * item["price"])
  end
  money_hash["tax"] = money_hash["subtotal"] * tax_rate
  money_hash["total"] = money_hash["tax"] + money_hash["subtotal"]

  return money_hash
end
