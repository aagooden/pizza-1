crusts = ["regular", "stuffed", "pretzel", "bacon wrapped"]
meats = ["sausage", "pepperoni", "bacon", "ham", "beef"]
veggies = ["peppers", "banana peppers", "olives", "pineapple", "mushrooms"]
sauce = ["regular", "cheese", "ranch", "BBQ"]
special = ["three cheese blend", "toothpaste", "legos"]
size = ["Small", "Medium", "Large", "Extra large"]

def cheese(cost)
  if [true, false].sample == true
    return "extra cheese, "
    cost += 1
  end
end

def double_pepperoni(cost)
  if [true, false].sample == true
    return "double pepperoni, "
    cost += 1
  end
end

def size_cost(size, cost)
  if size[0]
    cost += 10.99
  elsif size[1]
    cost += 12.99
  elsif size[2]
    cost += 14.99
  elsif size[3]
    cost += 16.99
  end
end

#ingredients_cost(array, cost)

#end

puts "How many pizzas would you like?"
quantity = $stdin.gets.chomp.to_i


counter = 0
bake_pizza = quantity

while counter < quantity do
  counter += 1
  cost = 0
  sizeofpizza = size.sample
  size_cost(sizeofpizza, cost)

  puts "# #{counter}:  #{sizeofpizza} pizza with with #{double_pepperoni(cost)}#{meats.sample}, #{veggies.sample}, #{special.sample}, #{cheese(cost)}#{sauce.sample} sauce, and #{crusts.sample} crust."

end

puts "Total cost is $#{sprintf("%.02f", cost)}"
