crusts = ["regular", "stuffed", "pretzel", "bacon wrapped"] #array of crusts
meats = ["sausage", "pepperoni", "bacon", "ham", "beef"] #array of meats
veggies = ["peppers", "banana peppers", "olives", "pineapple"]#array of veggies
sauce = ["regular", "cheese",]#array of sauces
special = ["mushrooms", ]#array of special toppings
#boolean double cheese
#cheese = #random boolean
#boolean double pepperoni
#pepperoni = #random boolean

#ask user how many pizzas
puts "How many pizzas would you like?"
quantity = $stdin.gets.chomp.to_i

puts "Total cost for #{quantity} pizzas is $#{quantity * 12.99.to_f}."

while quantity > 0 do
  quantity -= 1
  puts "Pizza with #{meats.sample}, #{veggies.sample}, #{sauce.sample} sauce, and #{crusts.sample} crust."
end
