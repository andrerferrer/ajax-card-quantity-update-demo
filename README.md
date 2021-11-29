# GOAL

This is a demo to show-case how to create models in a join table.

[You can also check my other demos](https://github.com/andrerferrer/dedemos/blob/master/README.md#ded%C3%A9mos).

## What needs to be done?

### This is the DB Schema
![Untitled (2)](https://user-images.githubusercontent.com/45776359/121184994-00af1800-c83c-11eb-8f80-9a17aa5345f7.png)

### How to Seed?
Check the [seeds](db/seeds.rb):

```ruby
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
```

### If you want to check it locally
```sh
repo_name="active-record-join-tables-demo"
gh_repository="git@github.com:andrerferrer/$repo_name.git"
git clone $gh_repository demo
cd demo
bundle install
yarn install
rails db:create db:migrate db:seed
rails s

# now you can go to http://localhost:3000/
```

And we're good to go 🤓

Good Luck and Have Fun
