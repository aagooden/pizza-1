crusts = ["regular", "stuffed", "pretzel", "bacon wrapped"] #array of crusts
meats = ["sausage", "pepperoni", "bacon", "ham", "beef"] #array of meats
veggies = ["peppers", "banana peppers", "olives", "pineapple"]#array of veggies
sauce = ["regular", "cheese"]#array of sauces
special = ["mushrooms", "three cheese blend"]#array of special toppings

def cheese
  if [true, false].sample == true
    "extra cheese, "
  end
end

def double_pepperoni
  if [true, false].sample == true
    "double pepperoni, "
  end
end

#ask user how many pizzas
puts "How many pizzas would you like?"
quantity = $stdin.gets.chomp.to_i

puts "Total cost for #{quantity} pizzas is $#{quantity * 12.99.to_f}."

while quantity > 0 do
  quantity -= 1
  puts "Pizza with #{double_pepperoni}#{meats.sample}, #{veggies.sample}, #{special.sample}, #{cheese}#{sauce.sample} sauce, and #{crusts.sample} crust."
end
