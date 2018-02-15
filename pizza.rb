crusts = ["regular", "stuffed", "pretzel", "bacon wrapped"]
meats = ["sausage", "pepperoni", "bacon", "ham", "beef"]
veggies = ["peppers", "banana peppers", "olives", "pineapple", "mushrooms"]
sauce = ["regular", "cheese", "ranch", "BBQ"]
special = ["three cheese blend", "toothpaste", "legos"]
size = ["Small", "Medium", "Large", "Extra large"]

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

#ingredient_cost(array, cost)

#end

puts "How many pizzas would you like?"
quantity = gets.chomp.to_i

cost = 0.00.to_f #subtotal
tax_rate = 0.06
counter = 0
bake_pizza = quantity

while counter < quantity do
  counter += 1
  sizeofpizza = size.sample
  size_cost(sizeofpizza)

  puts "# #{counter}:  #{sizeofpizza} pizza with with #{double_pepperoni}#{meats.sample}, #{veggies.sample}, #{special.sample}, #{cheese}#{sauce.sample} sauce, and #{crusts.sample} crust."
  cost = cost + size_cost(sizeofpizza).to_f
end
puts "\n"

delivery_fee = quantity * 2
puts "Delivery Fee: $#{sprintf("%.02f", delivery_fee)}"
puts "Subtotal: $#{sprintf("%.02f", cost)}"
puts "Tax: $#{sprintf("%.02f", cost * tax_rate)}"#tax
puts "Total cost is $#{sprintf("%.02f", cost * (1 + tax_rate))}"
puts "\nSuggested Tip: #{sprintf("%.02f", cost * 0.10)}"
