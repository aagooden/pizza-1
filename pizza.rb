crusts = ["regular", "stuffed", "pretzel", "bacon wrapped"]
meats = ["sausage", "pepperoni", "bacon", "ham", "beef"]
veggies = ["peppers", "banana peppers", "olives", "pineapple"]
sauce = ["regular", "cheese", "ranch", "BBQ"]
special = ["mushrooms", "three cheese blend"]

def cheese
  if [true, false].sample == true
    "extra cheese, "
  end
end

def double_pepperoni
  if [true, false].sample == true
    $total_cost += 1
    "double pepperoni, "
  end
end

def size_selection
  size = ["Small", "Medium", "Large", "Extra large"]
  return size.sample #Note:  returned string is displayed properly, but not total cost
  if size[1] #if larger than small (index 0) add 1 for each size larger
    $total_cost += 1
  elsif size[2]
    $total_cost += 2
  elsif size[3]
    $total_cost += 3
  end
end

puts "How many pizzas would you like?"
quantity = $stdin.gets.chomp.to_i

$total_cost = quantity * 14.99

bake_pizza = quantity

while bake_pizza > 0 do
  bake_pizza -= 1
  puts "#{size_selection} pizza with #{double_pepperoni}#{meats.sample}, #{veggies.sample}, #{special.sample}, #{cheese}#{sauce.sample} sauce, and #{crusts.sample} crust."
end
print "#{quantity} pizzas at #{$total_cost}."
