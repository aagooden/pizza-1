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

#Add to pizza
# => puts "Do you want to add any toppings? (Y/N)"
# => IF yes then
# what would you like meats (1), veggies (2), etc.
#if input = 1, then X, if 2 then Y
#Add toppings to a new pizza array
#Would you like any more toppings? If y then repeat, if N then end.
#ingredient_cost(array, cost)
  #if array [0]
  #do nothing
  #else add +1 to cost use array[1,2,3].includes?
#end

#New idea:  Add ingredients to new pizza array, but add cost immediately. Could use first array slot [0] to determine cost.

#Menu
puts "What would you like to add to purchase? (Enter number)\n1: Pizza\n2: Sides\n3: Deserts\n4: Drinks\n5: Extras"
print "> "
select = gets.chomp

if select == 1
  #pizzas
elsif select == 2
  #Sides
elsif select == 3
  #Deserts
elsif select == 4
  #Drinks
elsif select == 5
  #Extras
else
  puts "Enter a valid selection. > "
  select = gets.chomp
end

puts "How many pizzas would you like?"
quantity = gets.chomp.to_i

cost = 0.00.to_f #subtotal
tax_rate = 0.06
counter = 0
bake_pizza = quantity

while counter < quantity do
  counter += 1
  sizeofpizza = size.sample #change to input
  size_cost(sizeofpizza)

  puts "# #{counter}:  #{sizeofpizza} pizza with with #{double_pepperoni}#{meats.sample}, #{veggies.sample}, #{special.sample}, #{cheese}#{sauce.sample} sauce, and #{crusts.sample} crust."
  cost = cost + size_cost(sizeofpizza).to_f
end
puts "\n"

delivery_fee = quantity * 2
puts "Delivery Fee: $#{sprintf("%.02f", delivery_fee)}"
puts "Subtotal: $#{sprintf("%.02f", cost)}"
puts "Tax: $#{sprintf("%.02f", cost * tax_rate)}"#tax
puts "Total cost is $#{sprintf("%.02f", cost * (1 + tax_rate) + delivery_fee)}"
puts "\nSuggested Tip: #{sprintf("%.02f", cost * 0.10)}"
