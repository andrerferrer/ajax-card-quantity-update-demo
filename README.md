# GOAL

This is a demo to show-case how to update and delete cart products with AJAX using stimulus.

[You can also check my other demos](https://github.com/andrerferrer/dedemos/blob/master/README.md#ded%C3%A9mos).

## What needs to be done?

### This is the DB Schema
![Untitled (2)](https://user-images.githubusercontent.com/45776359/121184994-00af1800-c83c-11eb-8f80-9a17aa5345f7.png)

### The Flow (for the update)

- A click on the button triggers the AJAX request
```erb
<!-- app/views/shopping_cart/_product_card.html.erb -->
<li data-controller='product-card' data-product-card-id-value='<%= product_cart.id %>'>
  <a data-offset="-1" data-action='click->product-card#update'>-</a>
</li>
```

- The AJAX request triggers the route
```js
// app/javascript/controllers/product_card_controller.js
update(event) {
  // prevent the default behavior of the link_to
  event.preventDefault();
  // create a body to send in the request (with the offset)
  const formData = new FormData;
  formData.append('offset', event.currentTarget.dataset.offset);
  // send the request
  fetch(`/product_carts/${this.idValue}`, {
    method: 'PATCH',
    headers: { 'Accept': 'text/plain', 'X-CSRF-Token': csrfToken() },
    body: formData
  })
}
```

- The route triggers the controller#action (ProductCartsController#Update)
```ruby
def update
  # when the request is triggered, we find the product_cart by the params[:id]
  @product_cart = ProductCart.find params[:id]
  # then, we check the new quantity
  new_quantity = @product_cart.quantity + params[:offset].to_i
  # we update the quantity
  @product_cart.update quantity: new_quantity

  # Then, we render the html partial -> app/views/shopping_cart/_product_card.html.erb
  render(
    partial: 'shopping_cart/product_card',
    locals: { product_cart: @product_cart },
    formats: [ :html ]
  )
end
```

- The action renders the partial again with the new values
```erb
<!-- app/views/shopping_cart/_product_card.html.erb -->
  <span id="counter"><%= product_cart.quantity %></span>
  <a class="btn round-bordered incrementer" data-offset="1" data-action='click->product-card#update'>+</a>
```

- The JS updates the DOM with the new partial
```js
// app/javascript/controllers/product_card_controller.js
    // send the request
    fetch(`/product_carts/${this.idValue}`, {
      method: 'PATCH',
      headers: { 'Accept': 'text/plain', 'X-CSRF-Token': csrfToken() },
      body: formData
    })
      // transform response to text
      .then(res => res.text())
      // call it and update the HTML with the response
      .then((data) => {
        this.element.outerHTML = data;
        // this response comes from the product_carts_controller on the update action
      })
```

### The Flow (for the destroy)

- A click on the button triggers the AJAX request
- The AJAX request triggers the route
- The route triggers the controller#action (ProductCartsController#Update)
- The action renders the partial
- The JS updates the DOM removing the element

### If you want to check it locally
```sh
repo_name="ajax-card-quantity-update-demo"
gh_repository="git@github.com:andrerferrer/$repo_name.git"
git clone $gh_repository demo
cd demo
bundle install
yarn install
rails db:create db:migrate db:seed
rails s

# now you can go to http://localhost:3000/shopping_cart/1
```

And we're good to go 🤓

Good Luck and Have Fun
