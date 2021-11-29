puts "Create some Restaurants"

Restaurant.create! name: "Amareleen", address: "Gloria"
Restaurant.create! name: "Verdeen", address: "Gloria"

meals = [
  {
    name: "Hamburger",
    price_in_cents: 123123
  },
  {
    name: "Cheeseburger",
    price_in_cents: 123123
  }
]

puts 'Create some meals'

Restaurant.all.each do |restaurant|
  meals.each do |meal|
    Meal.create! **meal, restaurant: restaurant
  end
end

puts 'Create one shopping cart'

order = ShoppingCart.new
# This creates a product in the cart
ProductCart.create!(meal: Meal.first, shopping_cart: order)
# This does exactly the same as above with another syntax for the second meal
order.meals << Meal.second
# Now, we should be able to check the shopping cart
p "Shopping cart = "
p order
puts "\n\n\n"
# And to check the products inside
p "Products in the shopping cart ="
p order.meals
puts "\n\n\n"

puts "Let's drink a beer"
puts %{
  .~~~~.
  i====i_
  |cccc|_)
  |cccc|
  `-==-'

}

puts "Done!"
